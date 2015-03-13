import client.states.StartMenuState
import client.states.BaseState
import client.db.CategoryRepository
import client.db.PublisherRepository

class AdminMenuState(client.states.BaseState.BaseState):
    
    def __init__(self):
        super().__init__()
                
        self.name = "Admin Menu"
        
        # Setup our handlers
        self.register_menu_item("Back to main", client.states.StartMenuState.StartMenuState, True)
        self.register_menu_item("Add a new product", self.add_new_product, False)
    
    
    """
        This function is responsible for adding new products to the database, through administrative means.
    """
    def add_new_product(self):
        
        # Request the data from the user before we start
        try:
            init_stock = int(input("Please enter the initial stock: "))
            init_name = input("Please enter the initial name: ")
            init_description = input("Please enter the initial description: ")
            init_price = float(input("Please enter the initial price"))
            init_category_id = self._get_category_id()
            init_publisher_id = self._get_publisher_id()            
        except ValueError:
            print("A value provided was invalid. Aborting product creation")
        
        print("Is that all?")

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
                