'''
Created on Mar 19, 2015

@author: Brandon
'''
from _overlapped import NULL
import client.db.Repository
import time

class CartRepository(client.db.Repository.Repository):

    # Get the super
    def __init__(self):
        super().__init__()
    
    
    """
        Returns a set of order data for a specific user
    """

    def get_cart_for(self, cid):
                    
        cursor = self._conn.cursor()            
        query = ("SELECT CartItemID, Amount, Product_ProductId,  FROM cartItem WHERE CustomerAccount_CustomerId={} ORDER BY OrderNumber;".format(cid))
        cursor.execute(query)
        results = cursor.fetchall()        
        # Clean up the cursor
        cursor.close()
        return results
    def create_new_cart_item(self,amount,cid,pid):
        cursor = self._conn.cursor()  
        query = ("INSERT INTO cartitem VALUES(NULL, %s, %s, %s)")
        params = (amount, cid, pid)     
        cursor.execute(query, params)
        # Clean up the cursor
        cursor.close()
        
    def checkout(self, cid):
        #make an order and get its ID
        with client.db.CustomerRepository.CustomerRepository() as repo:
                customerAddress = repo.get_customer_address_by_id()
        #make an order
        with client.db.OrderRepository.OrderRepository() as repo:
                ordernum = repo.make_order(customerAddress,time.strftime("%d/%m/%Y"),NULL,NULL,cid)
        
        #get the items to push up        
        cursor = self._conn.cursor()
        query = ("SELECT CartItemID, Amount, Product_ProductId,  FROM cartitem WHERE CustomerAccount_CustomerId={}".format(cid))
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        #populate orders from cart items
        for(amount, pid) in results:
            # Clean up the cursor
            with client.db.OrderRepository.OrderRepository() as repo:
                repo.make_order_item(ordernum, amount, pid)
        return
    def emptyCart(self,cid):
        return
        