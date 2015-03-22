'''
Created on Mar 12, 2015

@author: Vaughan Hilts
'''
import client.db.Repository

"""
    A repository connected to a MySQL backend used for fetching: Customers
"""
class CustomerRepository(client.db.Repository.Repository):

    # Get the super
    def __init__(self):
        super().__init__()
    
    
    """
        Given a customer ID, returns the row containing all their information
    """    
    def get_customer_by_id(self, cid):
        cursor = self._conn.cursor()
        #returns all information about a customer
        query = ("SELECT * FROM customeraccount WHERE CustomerId={}".format(cid))
        cursor.execute(query)
        results = cursor.fetchall()
        
        cursor.close()
    
        return results[0]

    """
        Given a customer ID, fetches their home mailing address
    """
    def get_customer_address_by_id(self, cid):
        #gets the mailing address for a given customer Used for orders
        cursor = self._conn.cursor()
        
        query = ("SELECT MailingAddress FROM customeraccount WHERE CustomerId={}".format(cid))
        cursor.execute(query)
        results = cursor.fetchone()
        
        cursor.close()
    
        return results[0]
    
    """
        Given a set of parameters and a customer ID, updates their profile with the given parameters.
    """
    def update_customer_by_id(self, cid, f_name, l_name, addr, phone):
        
        cursor = self._conn.cursor()
        
        query = ("UPDATE customeraccount SET FirstName='{}', LastName='{}', MailingAddress='{}', PhoneNumber='{}' WHERE CustomerId={}".format(f_name, l_name, addr, phone, cid))
        cursor.execute(query)
        
        cursor.close()
    
        return
    
    """
        Given a set of parameters, creates a new user and returns the unique ID for them
        that was just created.
    """
    def create_new_customer(self, f_name, l_name, addr, phone):
        cursor = self._conn.cursor()
        
        query = ("INSERT INTO customeraccount VALUES(NULL, %s, %s, %s, %s)")
        params = (f_name, l_name, addr, phone)        
        cursor.execute(query, params)
        lid = cursor.lastrowid
        
        cursor.close()
        
        return lid        
        
    """
        Fetches all available customers and returns them
    """
    def get_all_customers(self):
                    
        cursor = self._conn.cursor()            
        query = ("SELECT * FROM customeraccount;")
        cursor.execute(query)
        results = cursor.fetchall()
        
        # Clean up the cursor
        cursor.close()
        
        return results    
    
    """
        Fetches a tuple of customer ID's that
    """
    def get_top_ordering_customers(self):
        
        cursor = self._conn.cursor()
        query = ("SELECT CustomerAccount_CustomerId, COUNT(*) FROM `order` GROUP BY CustomerAccount_CustomerId;")
        cursor.execute(query)
        results = cursor.fetchall()
        
        cursor.close()
        
        return results