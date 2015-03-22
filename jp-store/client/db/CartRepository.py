'''
Created on Mar 19, 2015

@author: Brandon
'''
from _overlapped import NULL
import client.db.Repository
import time

"""
    A repository connected to a MySQL backend used for fetching: Customer cart items
"""
class CartRepository(client.db.Repository.Repository):

    # Get the super
    def __init__(self):
        super().__init__()
    
    
    """
        Returns a set of order data for a specific user
    """

    def get_cart_for(self, cid):
        #returns the entier cart for a customer given there id            
        cursor = self._conn.cursor()            
        query = ("SELECT * FROM cartitem WHERE CustomerAccount_CustomerId={}".format(cid))
        
        cursor.execute(query)
        results = cursor.fetchall()        
        # Clean up the cursor
        cursor.close()
        return results
    def create_new_cart_item(self,amount,cid,pid):
        #makes a new cart item
        cursor = self._conn.cursor()  
        query = ("INSERT INTO cartitem VALUES(NULL, %s, %s, %s)")
        params = (amount, cid, pid)     
        cursor.execute(query, params)
        # Clean up the cursor
        cursor.close()
        
    def checkout(self, cid):
        #This function takes a user cart and makes orders out of it
        #It does not clear the cart
        with client.db.CustomerRepository.CustomerRepository() as repo:
            customerAddress = repo.get_customer_address_by_id(cid)
        #make an order for the customer given there address
        with client.db.OrderRepository.OrderRepository() as repo:
            ordernum = repo.create_new_order(customerAddress,time.strftime("%d/%m/%Y"),NULL,NULL,cid)
        
        #get the cart for a person        
        with client.db.CartRepository.CartRepository() as repo:
            results=repo.get_cart_for(cid)
        #Create the order items
        with client.db.OrderItemRepository.OrderItemRepository() as repo:
            repo.make_orders_from_cart(results,ordernum)
        return
    def emptyCart(self,cid):
        #delete everything in a given customers cart
        cursor = self._conn.cursor()            
        query = (" DELETE FROM cartitem WHERE CustomerAccount_CustomerId = {}".format(cid))
        cursor.execute(query)
        # Clean up the cursor
        cursor.close()
