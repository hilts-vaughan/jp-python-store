'''
Created on Mar 19, 2015

@author: Brandon Smith
'''

import client.db.Repository

"""
    A repository connected to a MySQL backend used for fetching: Suppliers
"""
class SupplierRepository(client.db.Repository.Repository):

    # Get the super
    def __init__(self):
        super().__init__()
    
    
    def get_all_suppliers(self):
        #returns all information for the suppliers table
        cursor = self._conn.cursor()            
        query = ("SELECT * FROM supplier;")
        cursor.execute(query)
        results = cursor.fetchall()
        
        # Clean up the cursor
        cursor.close()
        
        return results
    
    def get_supplier_by_id(self, sid):
        #select a particular supplier by there id
        cursor = self._conn.cursor()
        
        query = ("SELECT * FROM supplier WHERE SupplierId={}".format(sid))
        cursor.execute(query)
        results = cursor.fetchall()
        
        cursor.close()
    
        return results[0]
    
    def edit_suppliers(self,sid,address,country,name,phone):
        #Allows you to change all the details of a particular supplier
        cursor = self._conn.cursor()
        query = ("UPDATE supplier SET Address=%s,Name=%s, Country=%s, PhoneNumber=%s WHERE SupplierId=%s")
        cursor.execute(query, (address,name,country,phone,sid))
        cursor.close()