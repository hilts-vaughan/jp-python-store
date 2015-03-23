import mysql.connector

'''
Created on Mar 19, 2015

@author: Brandon
'''
from _overlapped import NULL
import types
import time

"""
    A repository connected to a MySQL backend used for fetching: Customer cart items
"""
class Repository():
    def __init__(self):
        # Try and get a connection
        self._conn = mysql.connector.connect(user='root', password='',
                                             host='127.0.0.1',
                                             database='mydb')

    def __enter__(self):
        return self

    def __exit__(self, type_, value, traceback):
        # can test for type and handle different situations
        self._close()

    
    """
        Closes the connection forcefully, comitting any changes required to be comitted
    """
    def _close(self):
        self._conn.commit()
        self._conn.close()


class CartRepository(Repository):

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
    """
       Gets all the cart items for a given customer but only the information needed for orders
    """
    def get_cart_items_for_orders(self,cid):
        #returns only the amount and the pid
        cursor = self._conn.cursor()            
        query = ("SELECT Amount,Product_ProductId FROM cartitem WHERE CustomerAccount_CustomerId={}".format(cid))
        cursor.execute(query)
        results = cursor.fetchall()        
        # Clean up the cursor
        cursor.close()
        return results
    """
    Creates a new cart item
    """
    def create_new_cart_item(self,amount,cid,pid):
        #makes a new cart item
        cursor = self._conn.cursor()  
        query = ("INSERT INTO cartitem VALUES(NULL, %s, %s, %s)")
        params = (amount, cid, pid)     
        cursor.execute(query, params)
        # Clean up the cursor
        cursor.close()
        
    """
       Makes an order for the current customer and makes order items out of the cart items
        This results in an order and items linked to it.
    """
    def checkout(self, cid):
        #This function takes a user cart and makes orders out of it
        #It does not clear the cart
        with CustomerRepository() as repo:
            customerAddress = repo.get_customer_address_by_id(cid)
        #make an order for the customer given there address
        with OrderRepository() as repo:
            ordernum = repo.create_new_order(customerAddress,time.strftime("%d/%m/%Y"),NULL,NULL,cid)
        
        #get the cart for a person        
        with CartRepository() as repo:
            results=repo.get_cart_items_for_orders(cid)
        #Create the order items
        with OrderItemRepository() as repo:
            repo.make_orders_from_cart(results,ordernum)
        return
    """
        Removes the customers cart fromt eh database
    """
    def emptyCart(self,cid):
        #delete everything in a given customers cart
        cursor = self._conn.cursor()            
        query = (" DELETE FROM cartitem WHERE CustomerAccount_CustomerId = {}".format(cid))
        cursor.execute(query)
        # Clean up the cursor
        cursor.close()
        
class CategoryRepository(Repository):

    # Get the super
    def __init__(self):
        super().__init__()
    
    
    """
        Fetches all the categories from a MySQL backed database with all their fields and returns them
    """
    def get_all_categories(self):
                    
        cursor = self._conn.cursor()            
        query = ("SELECT * FROM category;")
        cursor.execute(query)
        results = cursor.fetchall()
        
        # Clean up the cursor
        cursor.close()
        
        return results    
class CustomerRepository(Repository):

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
        Fetches all available customers and returns them as a list.
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
        Fetches a tuple of N customer ID's that have ordered the most stuff.
        If less than 'n' of these customers exist, then all of available
        customers will be returned.
    """
    def get_top_ordering_customers(self, n):
        
        cursor = self._conn.cursor()
        query = ("SELECT CustomerAccount_CustomerId, FirstName, COUNT(*) FROM `order` INNER JOIN `customeraccount` GROUP BY CustomerAccount_CustomerId LIMIT {};".format(n))
        cursor.execute(query)
        results = cursor.fetchall()
        
        cursor.close()
        
        return results
class OrderItemRepository(Repository):

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
        
class OrderRepository(Repository):

    # Get the super
    def __init__(self):
        super().__init__()
    
    
    """
        Returns a set of order data for a specific user, given their customer ID.
    """
    def get_orders_for(self, cid):
        #get all the orders from a given customer and return a list
        cursor = self._conn.cursor()            
        query = ("SELECT OrderNumber, Quantity, Product_ProductId FROM `order` JOIN `orderitem` ON `order`.OrderNumber = Order_OrderNumber WHERE CustomerAccount_CustomerId={} ORDER BY OrderNumber;".format(cid))
        cursor.execute(query)
        results = cursor.fetchall()
        
        # Clean up the cursor
        cursor.close()
        
        return results
    """
        Creates a new order object
    """
    def create_new_order(self, address, dateCreated, dateEstimated, dateDelivered,cid):
        #generates a new order and returns the autogenerated row number
        cursor = self._conn.cursor()
        query = ("INSERT INTO `order` VALUES(NULL, %s, %s, NULL, NULL, %s)")
        
        params = (address, dateCreated,cid)        
        cursor.execute(query, params)
        lid = cursor.lastrowid
        cursor.close()
        #return this so order items can identify the created order
        return lid
    
class ProductRepository(Repository):

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
        Given a product ID, 'pid', retrieves the full information for a product available
    """
    def get_complete_info_by_pid(self, pid):
        
        # Return a list of all products, Name, ID and Stock
        # A LEFT JOIN is required as there may be no suppliers, and we don't want to return nothing if a product is not supplied by anyone yet
        
        cursor = self._conn.cursor()            
        query = ("""SELECT product.ProductId, product.Name As ProductName, Stock, product.Description, Price, supplier.Name As SupplierName, UCASE(category.Name) as CategoryName FROM product 
                LEFT JOIN product_has_supplier ON (product.ProductId = product_has_supplier.Product_ProductId) 
                LEFT JOIN supplier ON (product_has_supplier.Supplier_SupplierId = supplier.SupplierId)

                LEFT JOIN category ON (product.Category_CategoryId = category.CategoryId)

                WHERE product.ProductId = {};""".format(pid))
        
        
        cursor.execute(query)

        result = cursor.fetchone()
                
        # Clean up the cursor
        cursor.close()

        
        # We still need genres and series... so go ahead and get that
        pgenres = self._get_product_genres(pid)
        pseries = self._get_product_series(pid)        
        
                
        # Create a dictionary of data
        product_info = types.SimpleNamespace(product=result, genres = pgenres, series = pseries)
        
        return product_info 
        
    
    def _get_product_genres(self, pid):

        cursor = self._conn.cursor()            
        
        query = ("SELECT genre.Type As Name FROM product_has_genre INNER JOIN genre ON (genre.Type = product_has_genre.Genre_Type) WHERE Product_ProductId = {};".format(pid))
        cursor.execute(query)
        results = cursor.fetchall()
        
        # Clean up the cursor
        cursor.close()
        
        return results
        
    def _get_product_series(self, pid):
        
        cursor = self._conn.cursor()            
        
        query = ("SELECT series.Name As Name FROM series_has_product INNER JOIN series ON (series.SeriesId = series_has_product.Series_SeriesId) WHERE Product_ProductId = {};".format(pid))
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
        #searches for anything that contains searchQuery
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
class PublisherRepository(Repository):

    # Get the super
    def __init__(self):
        super().__init__()
    
    
    """
        Returns a list of all known publisher in the database
    """    
    def get_all_publishers(self):
        #returns a list containing all a publishers data
        cursor = self._conn.cursor()            
        query = ("SELECT * FROM publisher;")
        cursor.execute(query)
        results = cursor.fetchall()
        
        # Clean up the cursor
        cursor.close()
        
        return results    
    
    """
        Edits a publisher given their ID, 'pid' and updates their name.
    """
    def edit_publisher(self,pid,name):
        #allows you to change the name of a publisher based on there ID
        cursor = self._conn.cursor()
        query = ("UPDATE publisher SET Name=%s WHERE PublisherId=%s")
        cursor.execute(query, (name,pid))
        cursor.close()
"""
    A repository connected to a MySQL backend used for fetching: Suppliers
"""
class SupplierRepository(Repository):

    # Get the super
    def __init__(self):
        super().__init__()
    
    
    """
        Returns a list of all known suppliers
    """
    def get_all_suppliers(self):
        #returns all information for the suppliers table
        cursor = self._conn.cursor()            
        query = ("SELECT * FROM supplier;")
        cursor.execute(query)
        results = cursor.fetchall()
        
        # Clean up the cursor
        cursor.close()
        
        return results
    
    """
        Given a supplier ID, 'sid', returns the supplier attributes to be used
    """
    def get_supplier_by_id(self, sid):
        #select a particular supplier by there id
        cursor = self._conn.cursor()
        
        query = ("SELECT * FROM supplier WHERE SupplierId={}".format(sid))
        cursor.execute(query)
        results = cursor.fetchall()
        
        cursor.close()
    
        return results[0]
    
    """
        Given the 'sid' of a supplier, updates their fields with the specified
        parameters given
    """
    def edit_suppliers(self,sid,address,country,name,phone):
        #Allows you to change all the details of a particular supplier
        cursor = self._conn.cursor()
        query = ("UPDATE supplier SET Address=%s,Name=%s, Country=%s, PhoneNumber=%s WHERE SupplierId=%s")
        cursor.execute(query, (address,name,country,phone,sid))
        cursor.close()
        
"""
    Represents a bare, abstract state that can be used to implement various menu
    options throughout the application. All states throughout the client application
    should derive from this so they can register with the state context.
    
    This base class provides utilities for handling inputs, transitioning between states,
    and drawing themselves
"""
class BaseState:
    
    def __init__(self):
        self.name = "Default State"
        self.free_menu_id = 1
        self.menu_items = []
    
    """
        Performs logic required to change state or modify data within an application.
    """
    def handle_request(self, user_command):
        # The default is to simply handle the menu items. 
        try:
            menu_index = int(user_command) - 1
        except ValueError:
            print("The specified menu option could not be determined. Please enter a valid integer option.")
            return
        
        if menu_index > len(self.menu_items) - 1:
            print("Please enter a valid menu option")
            return
        
        # Fetch our menu item
        menu_item = self.menu_items[menu_index]
        
        
        # If it's a state class, begin a transition to it
        if menu_item.transition:
            self.parent.set_state(menu_item.action())
        else:
            # Otherwise, execute the function in the current context
            menu_item.action()
            
            # Redraw, since we didn't transition away
            self.draw()
    
    """
        Draws the current state of the given state to the standard I/O stream
        so it can be presented.
    """
    def draw(self):
        print("\n")
        print(self.name)
        for menu_item in self.menu_items:
            print(menu_item.text)
    
    """
        Registers an item in a menu option based on
    """
    def register_menu_item(self, text, option, transition):
        text = str(self.free_menu_id) + ") " + text
        self.menu_items.append(MenuItem(text, option, transition))
        self.free_menu_id = self.free_menu_id + 1
"""
    A simple bare menu item class is used for storing some text
    and actions. These are used by states to represent the different
    menu options available to a user.
"""
class MenuItem:
    
    """
        text:        The text option that will be presented to the user
        
        action:      Either a function pointer reference, or class type of BaseState
                     which will be interpreted by a BaseState to perform an action
                     on itself.
                     
        t:           A helper flag that determines if the state will require transitioning
                     after 'action' has been executed.
    """
    def __init__(self, text, action, t):
        self.text = text
        self.action = action
        self.transition = t
        

class StartMenuState(BaseState):
    
    def __init__(self):
        super().__init__()
        
        self.name = "Start Menu State"
        
        # Setup our handlers
        self.register_menu_item("Administration Mode", AdminMenuState, True)
        self.register_menu_item("Customer Mode", CustomerMenuState, True)       
class StateContext:
    
    def __init__(self):
        
        # We default to no state, though we can set one
        self._currentState = None

    """
        Given a user command, passes the input along to the state that might care.
        If the state is not available, the input will be swallowed
    """
    def handle_request(self, user_command):
        self._currentState.handle_request(user_command)
    
    """
        Sets the current state in the state machine according to the 'state'
        passed into it.
    """
    def set_state(self, state):
        self._currentState = state
        self._currentState.parent = self
        self._currentState.draw()
    
    """
        Returns the currently executing state
    """
    def get_state(self):
        return self._currentState
class AdminMenuState(BaseState):
    
    def __init__(self):
        super().__init__()
                
        self.name = "Admin Menu"
        
        # Setup our handlers
        self.register_menu_item("Back to main", StartMenuState, True)
        self.register_menu_item("Add a new product", self.add_new_product, False)
        self.register_menu_item("Update stock for product", self.update_product_stock, False)
        #allows call of increment or decrement of stock
        self.register_menu_item("Increment stock for product", self.incerment_product_stock, False)
        #allows call to change the suppliers info
        self.register_menu_item("Edit Supplier", self.edit_supplier, False)
        #Allows call to change a products details
        self.register_menu_item("Edit A Product", self.edit_product, False)
        #allows call to change a publishers details
        self.register_menu_item("Edit Publisher", self.edit_publisher, False)
    
    """
        This function is responsible for adding new products to the database, through administrative means.
    """
    def add_new_product(self):
        
        # Request the data from the user before we start
        try:
            init_stock = int(input("Please enter the initial stock: "))
            init_name = input("Please enter the initial name: ")
            init_description = input("Please enter the initial description: ")
            init_price = float(input("Please enter the initial price: "))
            init_category_id = self._get_category_id()
            init_publisher_id = self._get_publisher_id()            
        except ValueError:
            print("A value provided was invalid. Aborting product creation")
        
        # Pass the information to a new repo and 
        with ProductRepository() as repo:
            lid = repo.insert_new_product(init_stock, init_name, init_description, init_price, init_category_id, init_publisher_id)
        
        print("Product has been added with no problems. ID: {}".format(lid))

    """
    Allows the user to change the amount of stock
    """
 
    def update_product_stock(self):
        
        try:
            prod_id = self._get_product_id()
            
            # Ask for the new stock
            new_stock = int(input("What is the new stock value?  "))
            
            with ProductRepository() as repo:
                repo.update_stock(prod_id, new_stock)                
            print("The amount of stock for the product has been updated") 
                       
        except Exception as e:
            print(str(e))
            print("A provided value was invalid.")
    
    """
    allows the user to increment the amount of stock
    """

    def incerment_product_stock(self):
        
        try:
            prod_id = self._get_product_id()
            
            # Ask for the stock increment
            new_stock = int(input("What is the increment?  "))
            
            with ProductRepository() as repo:
                repo.increment_stock(prod_id, new_stock)                
            print("The amount of stock for the product has been updated") 
                       
        except Exception as e:
            print(str(e))
            print("A provided value was invalid.")

    """
    Allows the admin to edit supplier information
    """

    def edit_supplier(self):
        try:
            #get a suppliers id number
            sid = self._get_supplier_id()

            with SupplierRepository() as repo:
                #get suppier info to maintain data
                old_supplier = repo.get_supplier_by_id(sid)
                print(old_supplier)                
                #get the new information from the user
                print("Leaving a feild blank will prevent it from being edited ")
                new_address = (input("What is the new address?  "))
                new_country = (input("What is the new country?  "))
                new_name = (input("What is the new name?  "))
                new_number = (input("What is the new phoneNumber?  "))
                
                #Maintain old data
                if not new_address:
                    new_address = old_supplier[1]
                if not new_country:
                    new_country = old_supplier[2]
                if not new_name:
                    new_name = old_supplier[3]
                if not new_number:
                    new_number = old_supplier[4]
            
            # Send an update to the DB
                repo.edit_suppliers(old_supplier[0], new_address, new_country, new_name, new_number)
            print("The supplier has been updated") 
        
            
        except Exception as e:
            print(str(e))
            print("A provided value was invalid.")
    """
    Allows a user to change all the details about a product 
    """

    def edit_product(self):
        try:
            pid = self._get_product_id()
            with ProductRepository() as repo:
                #get the data for blank inputs for when no change is made
                old_media = repo.get_product_by_id(pid)
                print(old_media)                
                #get the user input
                print("Leaving a feild blank will prevent it from being edited ")

                new_name = (input("What is the new name?  "))
                new_description = (input("What is the new description?  "))
                new_price = (input("What is the new price?  "))
                new_category = (input("What is the new category id?  "))
                new_publisher = (input("What is the new publisher id?  "))
                #save values from the retreived input
                if not new_name:
                    new_name = old_media[2]
                if not new_description:
                    new_description = old_media[3]
                if not new_price:
                    new_price = old_media[4]
                if not new_category:
                    new_category = old_media[5]
                if not new_publisher:
                    new_publisher = old_media[6]
                #do the update
                repo.edit_product(pid, new_name,new_description,new_price,new_category,new_publisher)
            print("The product has been updated")
        
        except Exception as e:
            print(str(e))
            print("A provided value was invalid.")     
    """
    Allows the user to change a publishers name
    """

    def edit_publisher(self):
        try:
            #list publishers and recover user input
            pub_id = self._get_publisher_id()
            #get the new name (only thing you can edit so dont need 
            new_pub = (input("What is the new name?  "))
            #have the repository do the update
            with PublisherRepository() as repo:
                repo.edit_publisher(pub_id, new_pub)
            
        except Exception as e:
            print(str(e))
            print("A provided value was invalid.")     
    
    """
    prints all items in the cart of a customer the number of the items
    """

    def _get_product_id(self):
        #lists out all of the products
        with ProductRepository() as repo:
            #Recovers the data from the repo
            products = repo.get_all_products()
            #print it in a readable format
            for(pid, stock, name) in products:
                print("{}) {} (Remaining: {})".format(pid, name, stock))
        #get the user input we need
        return int(input("Please enter a product ID: "))

    """
    Allows the user to select a category from a list
    """

    def _get_category_id(self):
        
        # Request some category and publisher data by invoking from the repo's
        repo = CategoryRepository()
        categories = repo.get_all_categories()
        #print categories in a readable format
        for(cid, name, description) in categories:
            print("{}) {} - {}".format(cid, name, description))
        
        # Retrieve an indexed value
        category_id = int(input("Please enter a category ID from the above list: "))
        
        return category_id

    """
    Prints a readable list of publishers and retrieves an id from the user
    """

    def _get_publisher_id(self):
        
        # Request some category and publisher data by invoking from the repo's
        repo = PublisherRepository()
        publishers = repo.get_all_publishers()
        
        for(pid, name) in publishers:
            print("{}) {}".format(pid, name))
        
        publisher_id = int(input("Please enter a publisher ID from the above list: "))
        
        return publisher_id

    """
    Prints a readable list of suppliers and retrieves an id from the user
    """
                
    def _get_supplier_id(self):
        
        # Request some category and publisher data by invoking from the repo's
        repo = SupplierRepository()
        suppliers = repo.get_all_suppliers()
        #Print out the Supplier info in a readable format
        for(sid,address,country, name,phonenumber) in suppliers:
            print("{}) {} {} {} {} ".format(sid,address,country, name,phonenumber))
        #get the input from the user
        sup_id = int(input("Please enter a Supplier ID from the above list: "))
        
        return sup_id
class CustomerMenuState(BaseState):
    
    def __init__(self):
        super().__init__()
        
        self.name = "Customer Menu"
        
        # Setup our handlers
        self.register_menu_item("Back to main", StartMenuState, True)
        self.register_menu_item("View my Orders", self.view_my_orders, False)
        self.register_menu_item("Update my Account", self.update_profile, False)
        self.register_menu_item("Check Stock", self.check_stock, False)
        self.register_menu_item("Purchase Items", self.purchase, False)
        self.register_menu_item("Search", self.search, False)
        self.register_menu_item("Add to Cart", self.add_cart, False)
        self.register_menu_item("See Cart", self.check_cart, False)
        self.register_menu_item("Clear Cart", self.clear_cart, False)
        self.register_menu_item("See full product details", self.show_full_product_info, False)
        
        # Attempt to authenticate a user, show them their options
        with CustomerRepository() as repo:
            results = repo.get_all_customers()
            
            for customer in results:
                print("{}) {} {}".format(customer[0], customer[1], customer[2]))
                
        
        # We will require some state, so let's try and get it here
        
        print("\nBefore we continue, we will need to authenticate under which user you are. Please select a user to operate as.")
        print("Alternatively, simply type 0 to register a new user.")
        
    
        choice = int(input("User ID Choice: "))
        
        # New user
        if choice is 0:
            self._customer = self.register_new_user()
        # Selected a user
        else:            
            self._customer = results[choice - 1]
        
        print("This user is now authenticated. All actions in this menu will be performed as this user.")
    
    
    """
        Given the currently authenticated users, displays their orders
    """
    def view_my_orders(self):
        
        # Check the orders of the active customer        
        with OrderRepository() as repo:
            # Fetch my orders
            # customer[0] is the customer id
            orders = repo.get_orders_for(self._customer[0])
        
            if len(orders) > 0:
                current_order_no = -1
                for (order_number, quantity, pid) in orders:
                    
                    # Print new heading if needed
                    if order_number is not current_order_no:
                        print("Order #{}".format(order_number))
                        current_order_no = order_number
                    
                    print("    Product #{}, ordered x{}".format(pid, quantity))
        
        return
    
    """
        Allows the user the ability to update a user conditionally; information about themselves
    """
    def update_profile(self):
        print("Note: All fields will be prompted. Leave the fields blank that you don't want to change.\n")
        
        with CustomerRepository() as repo:
            
            old_customer_data = repo.get_customer_by_id(self._customer[0])
            print(old_customer_data)        
        
            f_name = input("Please enter your FIRST name: ")
            l_name = input("Please enter your LAST name: ")
            addr = input("Please enter your address: ")
            phone = input("Please enter your phone number: ")        
            
            if not f_name:
                f_name = old_customer_data[1]
            if not l_name:
                l_name = old_customer_data[2]
            if not addr:
                addr = old_customer_data[3]
            if not phone:
                phone = old_customer_data[4]
            
            # Send an update to the DB
            repo.update_customer_by_id(old_customer_data[0], f_name, l_name, addr, phone)
        
        return
    
    
    """
        Takes care of the logic for registering a new user in the system
    """
    def register_new_user(self):
        print("We'll be needing some data first...")
        

        
        f_name = input("Please enter your FIRST name: ")
        l_name = input("Please enter your LAST name: ")
        addr = input("Please enter your address: ")
        phone = input("Please enter your phone number: ")
        
        print("Great! Generating user...")
        
        with CustomerRepository() as repo:
            lid = repo.create_new_customer(f_name, l_name, addr, phone)
        
        print("Your account is setup. Your user ID is #{}".format(lid))
        
        return (lid, f_name, l_name, addr, phone)
            
            
    """
    Checks the stock of a product by getting a product ID
    """
    def check_stock(self):
        #allows the user to check the stock of a product
        pid=self._get_product_id()
        with ProductRepository() as repo:
            product=repo.get_stock_by_pid(pid)
            print("{} {} are in stock".format(product[0], product[1]))
        return
    """
    Adds an item to a customer cart
    """
    def add_cart(self):
        #allows the user to add a new item to the cart 
        pid=self._get_product_id()
        amount=input("How many of that would you like? ")
        with CartRepository() as repo:
            repo.create_new_cart_item(amount,self._customer[0],pid)
        return
    """
    Take the current customers cart turn it into an order and then empty it
    """
    def purchase(self):
        #triggers the checkout option from cart repostiory which takes your current cart and makes an order
        with CartRepository() as repo:
            repo.checkout(self._customer[0])
        self.clear_cart()
        return
    """
    get the first few letters of a product from the user and print a list of
    products that start with the same name in readable format
    """
    def search(self):
        #Searches the database for products that contains a string obtained below
        productPortion=input("Enter a partial search query to look for in items: ")
        with ProductRepository() as repo:
            products = repo.get_all_products_key(productPortion)
            for(pid, name,price) in products:
                print("{}) {} (Costs: ${})".format(pid, name,price))

        return
    """
    give a readable list of all products for the customer and get a
    product id from the customer
    """
    def _get_product_id(self):
        #Presents a list of useful information to the customer about given products
        #with the purpose of getting a product id selected by the user
        with ProductRepository() as repo:
            products = repo.get_all_products_cust()
            #prints the list
            for(pid, name,price) in products:
                print("{}) {} (Costs: ${})".format(pid, name,price))
        #asks the user to select one
        return int(input("Please enter a product ID: "))
    """
    Print the current customers cart
    """
    def check_cart(self):
        #Shows the user what is in there cart
        with CartRepository() as repo:
            result=repo.get_cart_for(self._customer[0])
        print("Cart contains")
        for (cartItem,amount,cid,pid) in result:
            print("You have ordered {} of item {}".format(amount,pid))
    """
    Empty the current customers cart
    """
    def clear_cart(self):
        #empties the users cart
        with CartRepository() as repo:
            repo.emptyCart(self._customer[0])
            
    
    """
        Prompts for a product ID and shows the full information available for the product
    """
    def show_full_product_info(self):
        
        # Prompt for an ID
        pid = self._get_product_id()
        
        with ProductRepository() as repo:
            result = repo.get_complete_info_by_pid(pid)
            
            # Now display the data in a way that makes sense...
            print("Displaying product information\n======================================================\n")
            print("Name:            {}".format(result.product[1]))
            print("Description:     {}".format(result.product[3]))
            print("Stock:           {}".format(result.product[2]))
            print("Price:           ${}".format(result.product[4]))
            print("Supplier:        {}".format(result.product[5]))
            print("Category:        {}".format(result.product[6]))
            
            print("\nSeries: ")
            for series in result.series:
                print("\t" + series[0])
            
            print("\nGenres: ")
            for genre in result.genres:
                print("\t" + genre[0])
"""     jp-python-store

@author: Vaughan Hilts, Brandon Smith
@status: A complete implementation given the specific of the project

@note: This is the main application runtime file. Almost no work is actually done directly
here, instead it is all done within the respective states that house the actions. If you want
to see logic for different tasks, consider viewing:

    states/admin/AdminMenuState.py
    states/customer/CustomerMenuState.py
    
For inner-workings of how states operate on a lower level, please visit states/BaseState.py

"""

import sys
import os

# Add to module path for OS problems
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))




print("*** Application has begun. At any menu, simply type 'q' to quit the application. ***")

# Create our starting state context
context = StateContext()
context.set_state(StartMenuState())

# While forever, ask for input.
while True:
    user_command = input("Choice: ")
    
    # If they typed 'q', simply terminate
    if user_command.lower() == 'q':
        sys.exit(0)
    
    context.handle_request(user_command)
         