import mysql.connector


"""
    A repository is a base class responsible for fetching data via the database. 
    It maintains the connection state and handles cleaning up the database after
    changes have been made provided it is used with a 'with' construct.
    
    It provides an abstraction for the data access from the client code.
    
    Otherwise, the repository guarantees that changes will be committed and the 
    connection closed when it goes out of scope and is garbage collected.
    
    
"""
class Repository():
    def __init__(self):
        # Try and get a connection
        self._conn = mysql.connector.connect(user='root', password='',
                                             host='127.0.0.1',
                                             database='mydb')

    def __enter__(self):
        return self

    def __exit__(self, type_, value, traceback):
        # can test for type and handle different situations
        self._close()

    
    """
        Closes the connection forcefully, comitting any changes required to be comitted
    """
    def _close(self):
        self._conn.commit()
        self._conn.close()
