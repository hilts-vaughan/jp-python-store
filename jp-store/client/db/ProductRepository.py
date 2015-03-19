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
    def get_all_products_cust(self):
                    
        cursor = self._conn.cursor()            
        query = ("SELECT ProductId, Name, Price FROM product;")
        cursor.execute(query)
        results = cursor.fetchall()
        # Clean up the cursor
        cursor.close()
        
        return results 
    
    def get_stock_by_pid(self,pid):
        cursor = self._conn.cursor()            
        query = ("SELECT Stock, Name FROM product WHERE ProductId={}".format(pid))
        cursor.execute(query)
        results = cursor.fetchall()
        # Clean up the cursor
        cursor.close()
        
        return results
    def update_stock(self, pid, stock):
        cursor = self._conn.cursor()
        #print("Updating stock against {} ID and new stock of {}".format(pid, stock))    
        query = ("UPDATE product SET Stock=%s WHERE ProductId=%s")
        cursor.execute(query, (stock, pid))
        
        cursor.close()
        
        return True
    """
    def increment_stock(self, pid, stock):
        cursor = self._conn.cursor()
        #print("Updating stock against {} ID and new stock of {}".format(pid, stock))    
        query = ("UPDATE product SET Stock=Stock + {} WHERE ProductId={}".format(stock,pid))
        cursor.execute(query)
        
        cursor.close()
        
        return True
        
    """
    def increment_stock(self, pid, stock):
        cursor = self._conn.cursor()
        #print("Updating stock against {} ID and new stock of {}".format(pid, stock))    
        query = ("UPDATE product SET Stock=Stock + %s WHERE ProductId=%s")
        cursor.execute(query,(stock,pid))
        
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
    def edit_media(self,pid, name, description, price, category, publisher):
        cursor = self._conn.cursor()
        query = ("UPDATE product SET name=%s, description=%s, price=%s, Category_CategoryId=%s, Publisher_PublisherId=%s WHERE ProductId=%s")
        cursor.execute(query, (name,description,price,category,publisher,pid))
        cursor.close()
        
    def get_product_by_id(self, pid):
        cursor = self._conn.cursor()
        
        query = ("SELECT * FROM product WHERE ProductId={}".format(pid))
        cursor.execute(query)
        results = cursor.fetchall()
        
        cursor.close()
    
        return results[0]
    