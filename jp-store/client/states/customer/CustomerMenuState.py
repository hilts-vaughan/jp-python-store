import client.states.BaseState
import client.states.StartMenuState
import client.db.CustomerRepository
import client.db.OrderRepository

class CustomerMenuState(client.states.BaseState.BaseState):
    
    def __init__(self):
        super().__init__()
        
        self.name = "Customer Menu"
        
        # Setup our handlers
        self.register_menu_item("Back to main", client.states.StartMenuState.StartMenuState, True)
        self.register_menu_item("View my orders", self.view_my_orders, False)
        #self.register_menu_item("Update my account profile", self.update_profile, transition)
        
        with client.db.CustomerRepository.CustomerRepository() as repo:
            results = repo.get_all_customers()
            
            for customer in results:
                print("{}) {} {}".format(customer[0], customer[1], customer[2]))
                
        
        # We will require some state, so let's try and get it here
        print("\nBefore we continue, we will need to authenticate under which user you are. Please select a user to operate as.")
        print("Alternatively, simply type 0 to register a new user.")
        
        choice = int(input("User ID Choice: "))
        
        if choice is 0:
            self._customer = self.register_new_user()
        else:            
            self._customer = results[choice - 1]
        
        print("This user is now authenticated. All actions in this menu will be performed as this user.")
    
    
    """
        Given the currently authenticated users, displays their orders
    """
    def view_my_orders(self):
        
        
        with client.db.OrderRepository.OrderRepository() as repo:
            # Fetch my orders
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
    
    def update_profile(self):
        return
    
    
    """
        Takes care of the logic for registering a new user in the system
    """
    def register_new_user(self):
        print("We'll be needing some data first...")
        

        
        f_name = input("Please enter your FIRST name: ")
        l_name = input("Please enter your LAST name: ")
        addr = input("Please enter your addresss: ")
        phone = input("Please enter your phone number: ")
        
        print("Great! Generating user...")
        
        with client.db.CustomerRepository.CustomerRepository() as repo:
            lid = repo.create_new_customer(f_name, l_name, addr, phone)
        
        print("Your account is setup. Your user ID is #{}".format(lid))
        
        return (lid, f_name, l_name, addr, phone)
            
