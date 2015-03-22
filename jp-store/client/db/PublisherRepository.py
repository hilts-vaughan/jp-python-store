'''
Created on Mar 12, 2015

@author: Vaughan Hilts
'''
import client.db.Repository

"""
    A repository connected to a MySQL backend used for fetching: Publishers
"""
class PublisherRepository(client.db.Repository.Repository):

    # Get the super
    def __init__(self):
        super().__init__()
    
    
    """
        Returns a list of all known publisher in the database
    """    
    def get_all_publishers(self):
        #returns a list containing all a publishers data
        cursor = self._conn.cursor()            
        query = ("SELECT * FROM publisher;")
        cursor.execute(query)
        results = cursor.fetchall()
        
        # Clean up the cursor
        cursor.close()
        
        return results    
    
    """
        Edits a publisher given their ID, 'pid' and updates their name.
    """
    def edit_publisher(self,pid,name):
        #allows you to change the name of a publisher based on there ID
        cursor = self._conn.cursor()
        query = ("UPDATE publisher SET Name=%s WHERE PublisherId=%s")
        cursor.execute(query, (name,pid))
        cursor.close()