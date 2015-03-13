import client.states.BaseState
import client.states.StartMenuState
import client.db.CustomerRepository

class CustomerMenuState(client.states.BaseState.BaseState):
    
    def __init__(self):
        super().__init__()
        
        self.name = "Customer Menu"
        
        # Setup our handlers
        self.register_menu_item("Back to main", client.states.StartMenuState.StartMenuState, True)
        
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
            
