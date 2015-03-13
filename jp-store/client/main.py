""" This is the main application runtime file. All of the bulk of work will be performed here. """
from client.states.StateContext import StateContext
import client.states.StartMenuState

# Create our intial state context
context = StateContext()
context.set_state(client.states.StartMenuState.StartMenuState())

# While forever, for now
while True:
    user_command = input("Choice: ")
    context.handle_request(user_command)