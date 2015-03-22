import client.states.StartMenuState
import client.states.BaseState
import client.db.CategoryRepository
import client.db.PublisherRepository
import client.db.ProductRepository
import client.db.SupplierRepository
import traceback
from _ast import Str

class AdminMenuState(client.states.BaseState.BaseState):
    
    def __init__(self):
        super().__init__()
                
        self.name = "Admin Menu"
        
        # Setup our handlers
        self.register_menu_item("Back to main", client.states.StartMenuState.StartMenuState, True)
        self.register_menu_item("Add a new product", self.add_new_product, False)
        self.register_menu_item("Update stock for product", self.update_product_stock, False)
        #allows call of increment or decrement of stock
        self.register_menu_item("Increment stock for product", self.incerment_product_stock, False)
        #allows call to change the suppliers info
        self.register_menu_item("Edit Supplier", self.edit_supplier, False)
        #Allows call to change a products details
        self.register_menu_item("Edit Media", self.edit_media, False)
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
        with client.db.ProductRepository.ProductRepository() as repo:
            lid = repo.insert_new_product(init_stock, init_name, init_description, init_price, init_category_id, init_publisher_id)
        
        print("Product has been added with no problems. ID: {}".format(lid))

    def update_product_stock(self):
        
        try:
            prod_id = self._get_product_id()
            
            # Ask for the new stock
            new_stock = int(input("What is the new stock value?  "))
            
            with client.db.ProductRepository.ProductRepository() as repo:
                repo.update_stock(prod_id, new_stock)                
            print("The amount of stock for the product has been updated") 
                       
        except Exception as e:
            print(str(e))
            print("A provided value was invalid.")
    #untested
    def incerment_product_stock(self):
        
        try:
            prod_id = self._get_product_id()
            
            # Ask for the stock increment
            new_stock = int(input("What is the increment?  "))
            
            with client.db.ProductRepository.ProductRepository() as repo:
                repo.increment_stock(prod_id, new_stock)                
            print("The amount of stock for the product has been updated") 
                       
        except Exception as e:
            print(str(e))
            print("A provided value was invalid.")

    def edit_supplier(self):
        try:
            #get a suppliers id number
            sid = self._get_supplier_id()

            with client.db.SupplierRepository.SupplierRepository() as repo:
                #get suppier info to maintain data
                old_supplier = repo.get_supplier_by_id(sid)
                print(old_supplier)                
                #get the new information from the user
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

    def edit_media(self):
        try:
            pid = self._get_product_id()
            with client.db.ProductRepository.ProductRepository() as repo:
                #get the data for blank inputs for when no change is made
                old_media = repo.get_product_by_id(pid)
                print(old_media)                
                #get the user input
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
                repo.edit_media(pid, new_name,new_description,new_price,new_category,new_publisher)
            print("The product has been updated")
        
        except Exception as e:
            print(str(e))
            print("A provided value was invalid.")     
    
    def edit_publisher(self):
        try:
            #list publishers and recover user input
            pub_id = self._get_publisher_id()
            #get the new name (only thing you can edit so dont need 
            new_pub = (input("What is the new name?  "))
            #have the repository do the update
            with client.db.PublisherRepository.PublisherRepository() as repo:
                repo.edit_publisher(pub_id, new_pub)
            
        except Exception as e:
            print(str(e))
            print("A provided value was invalid.")     
        
    def _get_product_id(self):
        #lists out all of the products
        with client.db.ProductRepository.ProductRepository() as repo:
            #Recovers the data from the repo
            products = repo.get_all_products()
            #print it in a readable format
            for(pid, stock, name) in products:
                print("{}) {} (Remaining: {})".format(pid, name, stock))
        #get the user input we need
        return int(input("Please enter a product ID: "))

    def _get_category_id(self):
        
        # Request some category and publisher data by invoking from the repo's
        repo = client.db.CategoryRepository.CategoryRepository()
        categories = repo.get_all_categories()
        #print categories in a readable format
        for(cid, name, description) in categories:
            print("{}) {} - {}".format(cid, name, description))
        
        # Retrieve an indexed value
        category_id = int(input("Please enter a category ID from the above list: "))
        
        return category_id

    def _get_publisher_id(self):
        
        # Request some category and publisher data by invoking from the repo's
        repo = client.db.PublisherRepository.PublisherRepository()
        publishers = repo.get_all_publishers()
        
        for(pid, name) in publishers:
            print("{}) {}".format(pid, name))
        
        publisher_id = int(input("Please enter a publisher ID from the above list: "))
        
        return publisher_id
                
    def _get_supplier_id(self):
        
        # Request some category and publisher data by invoking from the repo's
        repo = client.db.SupplierRepository.SupplierRepository()
        suppliers = repo.get_all_suppliers()
        #Print out the Supplier info in a readable format
        for(sid,address,country, name,phonenumber) in suppliers:
            print("{}) {} {} {} {} ".format(sid,address,country, name,phonenumber))
        #get the input from the user
        sup_id = int(input("Please enter a Supplier ID from the above list: "))
        
        return sup_id
