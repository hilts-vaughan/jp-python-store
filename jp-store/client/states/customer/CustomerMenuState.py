import client.states.BaseState
import client.states.StartMenuState

class CustomerMenuState(client.states.BaseState.BaseState):
    
    def __init__(self):
        super().__init__()
        
        self.name = "Customer Menu"
        
        # Setup our handlers
        self.register_menu_item("Back to main", client.states.StartMenuState.StartMenuState, True)        