'''
Created on Mar 20, 2015

@author: Brandon
'''
import client.db.Repository

class OrderItemRepository(client.db.Repository.Repository):

    # Get the super
    def __init__(self):
        super().__init__()
    
    def make_order_item(self,ordernum,amount,pid):
        cursor = self._conn.cursor()
        query = ("INSERT INTO orderitem VALUES(NULL, %s, %s, %s)")
        params = (ordernum, amount, pid)        
        cursor.execute(query, params)
        lid = cursor.lastrowid
        cursor.close()
        return lid
    def make_orders_from_cart(self,cartStuff):
        return
    def hey(self):
        print("hey")
        return
    