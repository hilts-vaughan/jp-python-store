"""
    A simple bare menu item class is used for storing some text
    and actions. These are used by states to represent the different
    menu options available to a user.
"""
class MenuItem:
    
    """
        text:        The text option that will be presented to the user
        
        action:      Either a function pointer reference, or class type of BaseState
                     which will be interpreted by a BaseState to perform an action
                     on itself.
                     
        t:           A helper flag that determines if the state will require transitioning
                     after 'action' has been executed.
    """
    def __init__(self, text, action, t):
        self.text = text
        self.action = action
        self.transition = t