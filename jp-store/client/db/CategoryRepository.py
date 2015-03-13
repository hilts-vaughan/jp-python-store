'''
Created on Mar 12, 2015

@author: Vaughan Hilts
'''
import client.db.Repository

class CategoryRepository(client.db.Repository.Repository):

    # Get the super
    def __init__(self):
        super().__init__()
    
    
    def get_all_categories(self):
                    
        cursor = self._conn.cursor()            
        query = ("SELECT * FROM category;")
        cursor.execute(query)
        results = cursor.fetchall()
        
        # Clean up the cursor
        cursor.close()
        
        return results    
            