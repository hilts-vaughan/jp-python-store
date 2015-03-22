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
    
    """
        Fetches all products from the MySQL backed database and returns them.
    """
    def get_all_products(self):
        
        #Return a list of all products, Name, ID and Stock
        cursor = self._conn.cursor()            
        query = ("SELECT ProductId, Stock, Name FROM product;")
        cursor.execute(query)
        results = cursor.fetchall()
        
        # Clean up the cursor
        cursor.close()
        
        return results    
    
    """
        Fetches all products from the database with only their ID's, name and price.
    """
    def get_all_products_cust(self):
        #the call for the customer to get a general look at the merchandise         
        cursor = self._conn.cursor()            
        query = ("SELECT ProductId, Name, Price FROM product;")
        cursor.execute(query)
        results = cursor.fetchall()
        
        # Clean up the cursor
        cursor.close()
        
        return results 
    
    """
        Given a specific query, 'searchQuery', finds a product that matches
        the names of the search query at all and returns them
    """
    def get_all_products_key(self,searchQuery):
        # Returns the product Name Id and price to show the customer
        #takes in a series of character to filter results
        #searches from the start
        cursor = self._conn.cursor()            
        query = ("SELECT ProductId, Name, Price FROM product WHERE Name LIKE '%{}%'".format(searchQuery))
        cursor.execute(query)
        results = cursor.fetchall()
        
        # Clean up the cursor
        cursor.close()
        return results 
    
    
    """
        Given a specific product ID ('pid'), returns the remaining stock and name for a product.
    """
    def get_stock_by_pid(self,pid):
        #returns the current stock of an item given its pid
        cursor = self._conn.cursor()            
        query = ("SELECT Stock, Name FROM product WHERE ProductId={}".format(pid))
        cursor.execute(query)
        results = cursor.fetchall()
        # Clean up the cursor
        cursor.close()
        
        return results[0]
    
    """
        Updates the stock for a product given by the specified 'pid'
        to reflect the new value as specified by 'stock'
    """
    def update_stock(self, pid, stock):
        #allows the user to change the stock to a specific figure
        #the user passes in the new stock value and the pid
        cursor = self._conn.cursor()
        query = ("UPDATE product SET Stock=%s WHERE ProductId=%s")
        cursor.execute(query, (stock, pid))
        
        cursor.close()
        
        return True
    
    """
        Increments (or decrements, in the case that 'stock' is negative) the stock
        for a product given by the specified pid by 'stock' and updates the database
        to reflect this new change.
    """
    def increment_stock(self, pid, stock):
        #allows the user to increment or decrement (by typing negative values)
        #the stock of a product by given its pid and the increment
        cursor = self._conn.cursor()
        #print("Updating stock against {} ID and new stock of {}".format(pid, stock))    
        query = ("UPDATE product SET Stock=Stock + %s WHERE ProductId=%s")
        cursor.execute(query,(stock,pid))
        
        cursor.close()
        
        return True    
    
    """
        Given some attributes of a new product, inserts a new entry for it into the database
    """
    def insert_new_product(self, stock, name, description, price, category, publisher):
        #allows you to create a new product
        cursor = self._conn.cursor()
        
        query = ("INSERT INTO product VALUES(NULL, %s, %s, %s, %s, %s, %s)")
        params = (stock, name, description, price, category, publisher)        
        cursor.execute(query, params)
        
        # Get's the row ID that was inserted for reference
        lid = cursor.lastrowid
        
        cursor.close()
        
        return lid
    
    """
        Given a product ID and some fields, updates the product to reflect the changes in the fields.
    """
    def edit_product(self,pid, name, description, price, category, publisher):
        #allows you to change any and all the details of a product except stock which is handled seperately
        cursor = self._conn.cursor()
        query = ("UPDATE product SET name=%s, description=%s, price=%s, Category_CategoryId=%s, Publisher_PublisherId=%s WHERE ProductId=%s")
        cursor.execute(query, (name,description,price,category,publisher,pid))
        cursor.close()
    
    """
        Given a product ID, returns the attributes assosciated with the product.
    """
    def get_product_by_id(self, pid):
        #Returns a product from the database from the id
        cursor = self._conn.cursor()
        
        query = ("SELECT * FROM product WHERE ProductId={}".format(pid))
        cursor.execute(query)
        results = cursor.fetchall()
        
        cursor.close()    
        return results[0]