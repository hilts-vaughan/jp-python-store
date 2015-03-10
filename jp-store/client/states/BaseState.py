from client.states.MenuItem import MenuItem

"""
    Represents a bare, abstract state that can be used to implement various menu
    options throughout the application.
"""
class BaseState:
    
    def __init__(self):
        self.name = "Default State"
        self.free_menu_id = 1
        self.menu_items = []
    
    """
        Performs logic required to change state or modify data within an application.
    """
    def handle_request(self, user_command):
        # The default is to simply handle the menu items. 
        try:
            menu_index = int(user_command) - 1
        except ValueError:
            print("The specified menu option could not be determined. Please enter a valid integer option.")
            return
        
        if menu_index > len(self.menu_items) - 1:
            print("Please enter a valid menu option")
            return
        
        # Fetch our menu item
        menu_item = self.menu_items[menu_index]
        
        
        # If it's a state class, begin a transition to it
        if menu_item.transition:
            self.parent.set_state(menu_item.action())
        else:
            # Otherwise, execute the function in the current context
            menu_item.action()
    
    """
        Draws the current state of the given state to the standard I/O stream
        so it can be presented.
    """
    def draw(self):
        print("\n")
        print(self.name)
        for menu_item in self.menu_items:
            print(menu_item.text)
    
    """
        Registers an item in a menu option based on
    """
    def register_menu_item(self, text, option, transition):
        text = str(self.free_menu_id) + ") " + text
        self.menu_items.append(MenuItem(text, option, transition))
        print("Adding item")
        self.free_menu_id = self.free_menu_id + 1