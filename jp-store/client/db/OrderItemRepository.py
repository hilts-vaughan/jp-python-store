'''
Created on Mar 20, 2015

@author: Brandon Smith
'''
import client.db.Repository

"""
    A repository connected to a MySQL backend used for fetching: Order item details
"""
class OrderItemRepository(client.db.Repository.Repository):

    # Get the super
    def __init__(self):
        super().__init__()
    """
        Creates a new order item and puts it in the database
    """
    def make_order_item(self,ordernum,amount,pid):
        #this generates a new order item and puts it in the table
        cursor = self._conn.cursor()
        query = ("INSERT INTO orderitem VALUES(NULL, %s, %s, %s)")
        params = (ordernum, amount, pid)        
        cursor.execute(query, params)
        lid = cursor.lastrowid
        cursor.close()
        return lid
    
    """
        Makes a bunch of order items and puts them in the database given cart amounts and pids
        as well as an order number to be linked to
    """
    def make_orders_from_cart(self,cartStuff,ordernum):
        #taking a customers cart (takes all information) 
        #generates an order item for each of them
        for(amount, pid) in cartStuff:
            cursor = self._conn.cursor()
            query = ("INSERT INTO orderitem VALUES(NULL, %s, %s, %s)")
            params = (amount, pid,ordernum)        
            cursor.execute(query, params)
            cursor.close()
        return 
        
    