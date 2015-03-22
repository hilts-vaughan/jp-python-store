import client.states.BaseState
import client.states.StartMenuState
import client.db.CustomerRepository
import client.db.OrderRepository
import client.db.CartRepository
import client.db.OrderItemRepository

class CustomerMenuState(client.states.BaseState.BaseState):
    
    def __init__(self):
        super().__init__()
        
        self.name = "Customer Menu"
        
        # Setup our handlers
        self.register_menu_item("Back to main", client.states.StartMenuState.StartMenuState, True)
        self.register_menu_item("View my orders", self.view_my_orders, False)
        self.register_menu_item("Update my account profile", self.update_profile, False)
        self.register_menu_item("check stock", self.check_stock, False)
        self.register_menu_item("purchase item", self.purchase, False)
        self.register_menu_item("Search", self.search, False)
        self.register_menu_item("Add to Cart", self.add_cart, False)
        self.register_menu_item("See cart", self.check_cart, False)
        self.register_menu_item("Clear cart", self.clear_cart, False)
        #when we enter the customer menu they must select a user
        with client.db.CustomerRepository.CustomerRepository() as repo:
            results = repo.get_all_customers()
            
            for customer in results:
                print("{}) {} {}".format(customer[0], customer[1], customer[2]))
                
        
        # We will require some state, so let's try and get it here
        print("\nBefore we continue, we will need to authenticate under which user you are. Please select a user to operate as.")
        print("Alternatively, simply type 0 to register a new user.")
        #pick a user
        choice = int(input("User ID Choice: "))
        #or make a new one
        if choice is 0:
            self._customer = self.register_new_user()
        else:            
            self._customer = results[choice - 1]
        
        print("This user is now authenticated. All actions in this menu will be performed as this user.")
    
    
    """
        Given the currently authenticated users, displays their orders
    """
    def view_my_orders(self):
        
        #Check the orders of the active customer        
        with client.db.OrderRepository.OrderRepository() as repo:
            # Fetch my orders
            # customer[0] is the customer id
            orders = repo.get_orders_for(self._customer[0])
        
            if len(orders) > 0:
                current_order_no = -1
                for (order_number, quantity, pid) in orders:
                    
                    # Print new heading if needed
                    if order_number is not current_order_no:
                        print("Order #{}".format(order_number))
                        current_order_no = order_number
                    
                    print("    Product #{}, ordered x{}".format(pid, quantity))
        
        return
    
    """
        Allows the user the ability to update a user conditionally; information about themselves
    """
    def update_profile(self):
        print("Note: All fields will be prompted. Leave the fields blank that you don't want to change.\n")
        
        with client.db.CustomerRepository.CustomerRepository() as repo:
            
            old_customer_data = repo.get_customer_by_id(self._customer[0])
            print(old_customer_data)        
        
            f_name = input("Please enter your FIRST name: ")
            l_name = input("Please enter your LAST name: ")
            addr = input("Please enter your address: ")
            phone = input("Please enter your phone number: ")        
            
            # Check for updates... something smells here but I don't know how to fix it off the top of my head
            if not f_name:
                f_name = old_customer_data[1]
            if not l_name:
                l_name = old_customer_data[2]
            if not addr:
                addr = old_customer_data[3]
            if not phone:
                phone = old_customer_data[4]
            
            # Send an update to the DB
            repo.update_customer_by_id(old_customer_data[0], f_name, l_name, addr, phone)
        
        return
    
    
    """
        Takes care of the logic for registering a new user in the system
    """
    def register_new_user(self):
        print("We'll be needing some data first...")
        

        
        f_name = input("Please enter your FIRST name: ")
        l_name = input("Please enter your LAST name: ")
        addr = input("Please enter your address: ")
        phone = input("Please enter your phone number: ")
        
        print("Great! Generating user...")
        
        with client.db.CustomerRepository.CustomerRepository() as repo:
            lid = repo.create_new_customer(f_name, l_name, addr, phone)
        
        print("Your account is setup. Your user ID is #{}".format(lid))
        
        return (lid, f_name, l_name, addr, phone)
            
    def check_stock(self):
        #allows the user to check the stock of a product
        pid=self._get_product_id()
        with client.db.ProductRepository.ProductRepository() as repo:
            product=repo.get_stock_by_pid(pid)
            print("{} {} are in stock".format(product[0], product[1]))
        return
    def add_cart(self):
        #allows the user to add a new item to the cart 
        pid=self._get_product_id()
        amount=input("how many of that would you like? ")
        with client.db.CartRepository.CartRepository() as repo:
            repo.create_new_cart_item(amount,self._customer[0],pid)
        return
    def purchase(self):
        #triggers the checkout option from cart repostiory which takes your current cart and makes an order
        with client.db.CartRepository.CartRepository() as repo:
            repo.checkout(self._customer[0])
        #This does not delete your cart
        return
    
    def search(self):
        #Searches the database for products that start with a string obtained below
        product_start=input("enter the starting characters of the item you want")
        with client.db.ProductRepository.ProductRepository() as repo:
            products = repo.get_all_products_key(product_start)
            for(pid, name,price) in products:
                print("{}) {} (Costs: {})".format(pid, name,price))

        return
    
    def _get_product_id(self):
        #Presents a list of useful information to the customer about given products
        #with the purpose of getting a product id selected by the user
        with client.db.ProductRepository.ProductRepository() as repo:
            products = repo.get_all_products_cust()
            #prints the list
            for(pid, name,price) in products:
                print("{}) {} (Costs: {})".format(pid, name,price))
        #asks the user to select one
        return int(input("Please enter a product ID: "))
    def check_cart(self):
        #Shows the user what is in there cart
        with client.db.CartRepository.CartRepository() as repo:
            result=repo.get_cart_for(self._customer[0])
        print("Cart contains")
        for (cartItem,amount,cid,pid) in result:
            print("You have ordered {} of item {}".format(amount,pid))
    
    def clear_cart(self):
        #empties the users cart
        with client.db.CartRepository.CartRepository() as repo:
            repo.emptyCart(self._customer[0])
        