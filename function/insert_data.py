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
               print(f"Inserting row: {lines}")  # Debugging: Show the row being processed
               sales_team_id = lines[0]
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
        print(f"Error occurred: {e}")


def insert_data(connection):
   insert_sales_teams_table(connection)