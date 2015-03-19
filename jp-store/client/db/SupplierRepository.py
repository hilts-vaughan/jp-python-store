'''
Created on Mar 19, 2015

@author: Brandon Smith
'''

import client.db.Repository

class SupplierRepository(client.db.Repository.Repository):

    # Get the super
    def __init__(self):
        super().__init__()
    
    
    def get_all_suppliers(self):
                    
        cursor = self._conn.cursor()            
        query = ("SELECT * FROM supplier;")
        cursor.execute(query)
        results = cursor.fetchall()
        
        # Clean up the cursor
        cursor.close()
        
        return results
    def edit_suppliers(self,sid,address,country,name,phone):
        cursor = self._conn.cursor()
        query = ("UPDATE supplier SET Address=%s WHERE SupplierId=%s")
        cursor.execute(query, (address,sid))
        query = ("UPDATE supplier SET Name=%s WHERE SupplierId=%s")
        cursor.execute(query, (name,sid))
        query = ("UPDATE supplier SET Country=%s WHERE SupplierId=%s")
        cursor.execute(query, (country,sid))
        query = ("UPDATE supplier SET PhoneNumber=%s WHERE SupplierId=%s")
        cursor.execute(query, (phone,sid))
        cursor.close()