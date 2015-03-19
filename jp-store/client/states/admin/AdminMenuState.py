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
        self.register_menu_item("Increment stock for product", self.incerment_product_stock, False)
        self.register_menu_item("Edit Supplier", self.edit_supplier, False)
        self.register_menu_item("Edit Media", self.edit_media, False)
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
            
            # Ask for the new stock
            new_stock = int(input("What is the increment?  "))
            
            with client.db.ProductRepository.ProductRepository() as repo:
                repo.increment_stock(prod_id, new_stock)                
            print("The amount of stock for the product has been updated") 
                       
        except Exception as e:
            print(str(e))
            print("A provided value was invalid.")
    '''
    stuff im working on below
    '''    
    def edit_supplier(self):
        try:
            sup_id = self._get_supplier_id()
            new_address = (input("What is the new address?  "))
            new_country = (input("What is the new country?  "))
            new_name = (input("What is the new name?  "))
            new_number = (input("What is the new phoneNumber?  "))
            with client.db.SupplierRepository.SupplierRepository() as repo:
                repo.edit_suppliers(sup_id, new_address,new_country,new_name,new_number)
            print("The supplier has been updated") 
        except Exception as e:
            print(str(e))
            print("A provided value was invalid.")

    def edit_media(self):
        try:
            prod_id = self._get_product_id()
            new_name = (input("What is the new name?  "))
            new_description = (input("What is the new description?  "))
            new_price = (input("What is the new price?  "))
            new_category = (input("What is the new category id?  "))
            new_publisher = (input("What is the new publisher id?  "))
                        
            with client.db.ProductRepository.ProductRepository() as repo:
                repo.edit_media(prod_id, new_name,new_description,new_price,new_category,new_publisher)
            print("The product has been updated")
        
        except Exception as e:
            print(str(e))
            print("A provided value was invalid.")     
    
    def edit_publisher(self):
        try:
            pub_id = self._get_publisher_id()
            new_pub = (input("What is the new name?  "))
            with client.db.PublisherRepository.PublisherRepository() as repo:
                repo.edit_publisher(pub_id, new_pub)
            
        except Exception as e:
            print(str(e))
            print("A provided value was invalid.")     
        
    def _get_product_id(self):
        with client.db.ProductRepository.ProductRepository() as repo:
            products = repo.get_all_products()
            
            for(pid, stock, name) in products:
                print("{}) {} (Remaining: {})".format(pid, name, stock))
            
        return int(input("Please enter a product ID: "))

    def _get_category_id(self):
        
        # Request some category and publisher data by invoking from the repo's
        repo = client.db.CategoryRepository.CategoryRepository()
        categories = repo.get_all_categories()
        
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
        
        for(sid,address,country, name,phonenumber) in suppliers:
            print("{}) {} {} {} {} ".format(sid,address,country, name,phonenumber))
        
        publisher_id = int(input("Please enter a Supplier ID from the above list: "))
        
        return publisher_id
