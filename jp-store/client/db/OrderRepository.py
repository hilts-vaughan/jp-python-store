'''
Created on Mar 12, 2015

@author: Vaughan Hilts
'''
import client.db.Repository

class OrderRepository(client.db.Repository.Repository):

    # Get the super
    def __init__(self):
        super().__init__()
    
    
    """
        Returns a set of order data for a specific user
    """
    def get_orders_for(self, cid):
                    
        cursor = self._conn.cursor()            
        query = ("SELECT OrderNumber, Quantity, Product_ProductId FROM `order` JOIN `orderitem` ON `order`.OrderNumber = Order_OrderNumber WHERE CustomerAccount_CustomerId={} ORDER BY OrderNumber;".format(cid))
        cursor.execute(query)
        results = cursor.fetchall()
        
        # Clean up the cursor
        cursor.close()
        
        return results

    def create_new_order(self, address, dateCreated, dateEstimated, dateDelivered,cid):
        cursor = self._conn.cursor()
        
        query = ("INSERT INTO order VALUES(NULL, %s, %s, %s, %s, %s)")
        params = (address, dateCreated, dateEstimated, dateDelivered,cid)        
        cursor.execute(query, params)
        lid = cursor.lastrowid
        cursor.close()
        
        return lid
    
            