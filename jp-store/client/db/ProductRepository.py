'''
Created on Mar 12, 2015

@author: Vaughan Hilts
'''
import client.db.Repository

"""
    A repository connected to a MySQL backend used for fetching: Products
"""
class ProductRepository(client.db.Repository.Repository):

    # Get the super
    def __init__(self):
        super().__init__()
    
    
    def get_all_products(self):
        #Return a list of all products, Name, ID and Stock
        cursor = self._conn.cursor()            
        query = ("SELECT ProductId, Stock, Name FROM product;")
        cursor.execute(query)
        results = cursor.fetchall()
        
        # Clean up the cursor
        cursor.close()
        
        return results    
    def get_all_products_cust(self):
        #the call for the customer to get a general look at the merchandise         
        cursor = self._conn.cursor()            
        query = ("SELECT ProductId, Name, Price FROM product;")
        cursor.execute(query)
        results = cursor.fetchall()
        # Clean up the cursor
        cursor.close()
        
        return results 
    def get_all_products_key(self,start):
        # Returns the product Name Id and price to show the customer
        #takes in a series of character to filter results
        #searches from the start
        cursor = self._conn.cursor()            
        query = ("SELECT ProductId, Name, Price FROM product WHERE Name LIKE '{}%'".format(start))
        cursor.execute(query)
        results = cursor.fetchall()
        # Clean up the cursor
        cursor.close()
        return results 
    
    
    def get_stock_by_pid(self,pid):
        #returns the current stock of an item given its pid
        cursor = self._conn.cursor()            
        query = ("SELECT Stock, Name FROM product WHERE ProductId={}".format(pid))
        cursor.execute(query)
        results = cursor.fetchall()
        # Clean up the cursor
        cursor.close()
        
        return results[0]
    def update_stock(self, pid, stock):
        #allows the user to change the stock to a specific figure
        #the user passes in the new stock value and the pid
        cursor = self._conn.cursor()
        query = ("UPDATE product SET Stock=%s WHERE ProductId=%s")
        cursor.execute(query, (stock, pid))
        
        cursor.close()
        
        return True
    def increment_stock(self, pid, stock):
        #allows the user to increment or decrement (by typing negative values)
        #the stock of a product by given its pid and the increment
        cursor = self._conn.cursor()
        #print("Updating stock against {} ID and new stock of {}".format(pid, stock))    
        query = ("UPDATE product SET Stock=Stock + %s WHERE ProductId=%s")
        cursor.execute(query,(stock,pid))
        
        cursor.close()
        
        return True    
    
    def insert_new_product(self, stock, name, description, price, category, publisher):
        #allows you to create a new product
        cursor = self._conn.cursor()
        
        query = ("INSERT INTO product VALUES(NULL, %s, %s, %s, %s, %s, %s)")
        params = (stock, name, description, price, category, publisher)        
        cursor.execute(query, params)
        #returns the last row id incase it needs to be refrenced later
        lid = cursor.lastrowid
        
        cursor.close()
        
        return lid
    def edit_product(self,pid, name, description, price, category, publisher):
        #allows you to change any and all the details of a product except stock which is handled seperately
        cursor = self._conn.cursor()
        query = ("UPDATE product SET name=%s, description=%s, price=%s, Category_CategoryId=%s, Publisher_PublisherId=%s WHERE ProductId=%s")
        cursor.execute(query, (name,description,price,category,publisher,pid))
        cursor.close()
        
    def get_product_by_id(self, pid):
        #Returns a product from the database from the id
        cursor = self._conn.cursor()
        
        query = ("SELECT * FROM product WHERE ProductId={}".format(pid))
        cursor.execute(query)
        results = cursor.fetchall()
        
        cursor.close()    
        return results[0]