import mysql.connector

from function.create_db import create_db, create_tables
from function.insert_data import insert_data
   
def mysql_connect():
   host = "localhost"
   user = "popcorn"
   password = "popcorn"

   try:
      # Connect to database
      connection = mysql.connector.connect(
         host=host,
         user=user,
         password=password,
         charset="utf8mb4",  # Specify a compatible character set
         collation="utf8mb4_general_ci"  # Use a supported collation
      )

      if connection.is_connected():
         print(f"Connected to MySQL as {user}")

         # Create cursor and define database
         cursor = connection.cursor()
         database = "mkt_final"

         # Create a database
         create_db(cursor, database)
         create_tables(cursor,'schema.sql',database)
         
         # Insert data to tables
         insert_data(connection)
         

   except mysql.connector.Error as err:
      print(f"Error: {err}")

   finally:
      if 'connection' in locals() and connection.is_connected():
         cursor.close()
         connection.close()
         print("MySQL connection closed.")

def main():   
   mysql_connect()
   
if __name__ == '__main__':
    main()