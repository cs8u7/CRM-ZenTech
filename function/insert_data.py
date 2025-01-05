import csv

def insert_sales_teams_table(connection):
    try:
        # Open the CSV file
        with open('database/sales-teams.csv', 'r') as file:
            csv_file = csv.reader(file, delimiter=',')  # Ensure delimiter is correct
            
            # Skip the header row
            next(csv_file)
            
            # Loop through each row
            for lines in csv_file:
               sales_team_id = int(lines[0])
               manager = lines[1]
               regional_office = lines[2]
               manager_status = lines[3]
                
               # Construct SQL Query
               query = """
               INSERT INTO sales_teams (sales_team_id, manager, regional_office, manager_status)
               VALUES (%s, %s, %s, %s)
               """
                
               cursor = connection.cursor() 
               cursor.execute(query, (sales_team_id, manager, regional_office, manager_status))
        
        # Commit changes
        connection.commit()
    except Exception as e:
        print(f"Error occurred sales_teams_table: {e}")

def insert_employee_table(connection):
    try:
        # Open the CSV file
        with open('database/employees.csv', 'r') as file:
            csv_file = csv.reader(file, delimiter=',')  # Ensure delimiter is correct
            
            # Skip the header row
            next(csv_file)
            
            # Loop through each row
            for lines in csv_file:
               employee_id = int(lines[0])
               employee_name = lines[1]
               employee_email = lines[2]
               regional_office = lines[3]
               employee_status = lines[4]
               sales_team_id = lines[5]
                
               # Construct SQL Query
               query = """
               INSERT INTO employees (employee_id,employee_name,employee_email,regional_office,employee_status,sales_team_id)
               VALUES (%s, %s, %s, %s, %s, %s)
               """
                
               cursor = connection.cursor() 
               cursor.execute(query, (employee_id,employee_name,employee_email,regional_office,employee_status,sales_team_id))
        
        # Commit changes
        connection.commit()
    except Exception as e:
        print(f"Error occurred employee_table: {e}")
        
def insert_products_table(connection):
    try:
        # Open the CSV file
        with open('database/products.csv', 'r') as file:
            csv_file = csv.reader(file, delimiter=',')  # Ensure delimiter is correct
            
            # Skip the header row
            next(csv_file)
            
            # Loop through each row
            for lines in csv_file:
               product_id = int(lines[0])
               product_name = lines[1]
               product_sale_price = lines[2]
                
               # Construct SQL Query
               query = """
               INSERT INTO products (product_id,product_name,product_sale_price)
               VALUES (%s, %s, %s)
               """
                
               cursor = connection.cursor() 
               cursor.execute(query, (product_id,product_name,product_sale_price))
        
        # Commit changes
        connection.commit()
    except Exception as e:
        print(f"Error occurred products_table: {e}")

def insert_data(connection):
   insert_sales_teams_table(connection)
   insert_employee_table(connection)
   insert_products_table(connection)