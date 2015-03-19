'''
Created on Mar 12, 2015

@author: Vaughan Hilts
'''
import client.db.Repository

class PublisherRepository(client.db.Repository.Repository):

    # Get the super
    def __init__(self):
        super().__init__()
    
    
    def get_all_publishers(self):
                    
        cursor = self._conn.cursor()            
        query = ("SELECT * FROM publisher;")
        cursor.execute(query)
        results = cursor.fetchall()
        
        # Clean up the cursor
        cursor.close()
        
        return results    
    def edit_publisher(self,pid,name):
        cursor = self._conn.cursor()
        query = ("UPDATE publisher SET Name=%s WHERE PublisherId=%s")
        cursor.execute(query, (name,pid))
        cursor.close()