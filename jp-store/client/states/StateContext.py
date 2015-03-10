"""
    Represents the context for a single state machine. In this application,
    the state machine is used to keep track of all the different possible
    menu implementations and flows available to the user.
"""
class StateContext:
    
    def __init__(self):
        
        # We default to no state, though we can set one
        self._currentState = None

    """
        Given a user command, passes the input along to the state that might care.
        If the state is not available, the input will be swallowed
    """
    def handle_request(self, user_command):
        self._currentState.handle_request(user_command)
    
    def set_state(self, state):
        self._currentState = state
        self._currentState.parent = self
        self._currentState.draw()
        print("State moving to: " + state.name)
    
    def get_state(self):
        return self._currentState