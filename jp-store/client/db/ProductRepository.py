'''
Created on Mar 12, 2015

@author: Vaughan Hilts
'''
import client.db.Repository

class ProductRepository(client.db.Repository.Repository):

    # Get the super
    def __init__(self):
        super().__init__()
    
    
    def get_all_products(self):
                    
        cursor = self._conn.cursor()            
        query = ("SELECT ProductId, Stock, Name FROM product;")
        cursor.execute(query)
        results = cursor.fetchall()
        
        # Clean up the cursor
        cursor.close()
        
        return results    
    
    
    def update_stock(self, pid, stock):
        cursor = self._conn.cursor()
        query = ("UPDATE product SET stock=%s WHERE ProductId=%s")
        cursor.execute(query, stock, pid)
        
        cursor.close()
        
        return True
        
    def insert_new_product(self, stock, name, description, price, category, publisher):
        cursor = self._conn.cursor()
        
        query = ("INSERT INTO product VALUES(NULL, %s, %s, %s, %s, %s, %s)")
        params = (stock, name, description, price, category, publisher)        
        cursor.execute(query, params)
        lid = cursor.lastrowid
        
        cursor.close()
        
        return lid