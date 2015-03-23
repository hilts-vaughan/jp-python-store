"""     jp-python-store

@author: Vaughan Hilts, Brandon Smith
@status: A complete implementation given the specific of the project

@note: This is the main application runtime file. Almost no work is actually done directly
here, instead it is all done within the respective states that house the actions. If you want
to see logic for different tasks, consider viewing:

    states/admin/AdminMenuState.py
    states/customer/CustomerMenuState.py
    
For inner-workings of how states operate on a lower level, please visit states/BaseState.py

"""

import sys
import os

# Add to module path for OS problems
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from client.states.StateContext import StateContext
import client.states.StartMenuState


print("*** Application has begun. At any menu, simply type 'q' to quit the application. ***")

# Create our starting state context
context = StateContext()
context.set_state(client.states.StartMenuState.StartMenuState())

# While forever, ask for input.
while True:
    user_command = input("Choice: ")
    
    # If they typed 'q', simply terminate
    if user_command.lower() == 'q':
        sys.exit(0)
    
    context.handle_request(user_command)