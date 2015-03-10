import client.states.BaseState
import client.states.admin.AdminMenuState
import client.states.customer.CustomerMenuState



class StartMenuState(client.states.BaseState.BaseState):
    
    def __init__(self):
        super().__init__()
        
        self.name = "Start Menu State"
        
        # Setup our handlers
        self.register_menu_item("Administration Mode", client.states.admin.AdminMenuState.AdminMenuState, True)
        self.register_menu_item("Customer Mode", client.states.customer.CustomerMenuState.CustomerMenuState, True)       
        self.register_menu_item("Do a flip!", self.do_a_flip, False) 
        
    def do_a_flip(self):
        print("I did a flip!")