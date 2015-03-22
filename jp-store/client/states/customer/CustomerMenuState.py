import client.states.BaseState
import client.states.StartMenuState
import client.db.CustomerRepository
import client.db.OrderRepository
import client.db.CartRepository

class CustomerMenuState(client.states.BaseState.BaseState):
    
    def __init__(self):
        super().__init__()
        
        self.name = "Customer Menu"
        
        # Setup our handlers
        self.register_menu_item("Back to main", client.states.StartMenuState.StartMenuState, True)
        self.register_menu_item("View my Orders", self.view_my_orders, False)
        self.register_menu_item("Update my Account", self.update_profile, False)
        self.register_menu_item("Check Stock", self.check_stock, False)
        self.register_menu_item("Purchase Item", self.purchase, False)
        self.register_menu_item("Search", self.search, False)
        self.register_menu_item("Add to Cart", self.add_cart, False)
        self.register_menu_item("See Cart", self.check_cart, False)
        self.register_menu_item("Clear Cart", self.clear_cart, False)
        self.register_menu_item("See full product details", self.show_full_product_info, False)
        
        # Attempt to authenticate a user, show them their options
        with client.db.CustomerRepository.CustomerRepository() as repo:
            results = repo.get_all_customers()
            
            for customer in results:
                print("{}) {} {}".format(customer[0], customer[1], customer[2]))
                
        
        # We will require some state, so let's try and get it here
        
        print("\nBefore we continue, we will need to authenticate under which user you are. Please select a user to operate as.")
        print("Alternatively, simply type 0 to register a new user.")
        
    
        choice = int(input("User ID Choice: "))
        
        # New user
        if choice is 0:
            self._customer = self.register_new_user()
        # Selected a user
        else:            
            self._customer = results[choice - 1]
        
        print("This user is now authenticated. All actions in this menu will be performed as this user.")
    
    
    """
        Given the currently authenticated users, displays their orders
    """
    def view_my_orders(self):
        
        # Check the orders of the active customer        
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
            
            
    """
    Checks the stock of a product by getting a product ID
    """
    def check_stock(self):
        #allows the user to check the stock of a product
        pid=self._get_product_id()
        with client.db.ProductRepository.ProductRepository() as repo:
            product=repo.get_stock_by_pid(pid)
            print("{} {} are in stock".format(product[0], product[1]))
        return
    """
    Adds an item to a customer cart
    """
    def add_cart(self):
        #allows the user to add a new item to the cart 
        pid=self._get_product_id()
        amount=input("How many of that would you like? ")
        with client.db.CartRepository.CartRepository() as repo:
            repo.create_new_cart_item(amount,self._customer[0],pid)
        return
    """
    Take the current customers cart turn it into an order and then empty it
    """
    def purchase(self):
        #triggers the checkout option from cart repostiory which takes your current cart and makes an order
        with client.db.CartRepository.CartRepository() as repo:
            repo.checkout(self._customer[0])
        self.clear_cart()
        return
    """
    get the first few letters of a product from the user and print a list of
    products that start with the same name in readable format
    """
    def search(self):
        #Searches the database for products that start with a string obtained below
        product_start=input("Enter a partial search query to look for in items: ")
        with client.db.ProductRepository.ProductRepository() as repo:
            products = repo.get_all_products_key(product_start)
            for(pid, name,price) in products:
                print("{}) {} (Costs: ${})".format(pid, name,price))

        return
    """
    give a readable list of all products for the customer and get a
    product id from the customer
    """
    def _get_product_id(self):
        #Presents a list of useful information to the customer about given products
        #with the purpose of getting a product id selected by the user
        with client.db.ProductRepository.ProductRepository() as repo:
            products = repo.get_all_products_cust()
            #prints the list
            for(pid, name,price) in products:
                print("{}) {} (Costs: ${})".format(pid, name,price))
        #asks the user to select one
        return int(input("Please enter a product ID: "))
    """
    Print the current customers cart
    """
    def check_cart(self):
        #Shows the user what is in there cart
        with client.db.CartRepository.CartRepository() as repo:
            result=repo.get_cart_for(self._customer[0])
        print("Cart contains")
        for (cartItem,amount,cid,pid) in result:
            print("You have ordered {} of item {}".format(amount,pid))
    """
    Empty the current customers cart
    """
    def clear_cart(self):
        #empties the users cart
        with client.db.CartRepository.CartRepository() as repo:
            repo.emptyCart(self._customer[0])
            
    
    """
        Prompts for a product ID and shows the full information available for the product
    """
    def show_full_product_info(self):
        
        # Prompt for an ID
        pid = self._get_product_id()
        
        with client.db.ProductRepository.ProductRepository() as repo:
            result = repo.get_complete_info_by_pid(pid)
            
            # Now display the data in a way that makes sense...
            print("Displaying product information\n======================================================\n")
            print("Name:            {}".format(result.product[1]))
            print("Description:     {}".format(result.product[3]))
            print("Stock:           {}".format(result.product[2]))
            print("Price:           ${}".format(result.product[4]))
            print("Supplier:        {}".format(result.product[5]))
            
            print("\nSeries: ")
            for series in result.series:
                print("\t" + series[0])
            
            print("\nGenres: ")
            for genre in result.genres:
                print("\t" + genre[0])
                