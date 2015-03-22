'''
Created on Mar 12, 2015

@author: Vaughan Hilts
'''
import client.db.Repository

"""
    A repository connected to a MySQL backend used for fetching: Categories
"""
class CategoryRepository(client.db.Repository.Repository):

    # Get the super
    def __init__(self):
        super().__init__()
    
    
    """
        Fetches all the categories from a MySQL backed database with all their fields and returns them
    """
    def get_all_categories(self):
                    
        cursor = self._conn.cursor()            
        query = ("SELECT * FROM category;")
        cursor.execute(query)
        results = cursor.fetchall()
        
        # Clean up the cursor
        cursor.close()
        
        return results    
            