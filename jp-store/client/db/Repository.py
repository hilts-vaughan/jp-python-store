import mysql.connector

# base store class
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
