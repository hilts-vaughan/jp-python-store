import client.states.StartMenuState
import client.states.BaseState


class AdminMenuState(client.states.BaseState.BaseState):
    
    def __init__(self):
        super().__init__()
                
        self.name = "Admin Menu"
        
        # Setup our handlers
        self.register_menu_item("Back to main", client.states.StartMenuState.StartMenuState, True)
        