import mysql.connector

def create_db(cursor, database):
   cursor.execute(f"CREATE DATABASE IF NOT EXISTS {database}")
   print(f"Database '{database}' created or already exists.")
   
def mysql_connect():
   host = "localhost"
   user = "popcorn"
   password = "popcorn"

   try:
      connection = mysql.connector.connect(
         host=host,
         user=user,
         password=password,
         charset="utf8mb4",  # Specify a compatible character set
         collation="utf8mb4_general_ci"  # Use a supported collation
      )

      if connection.is_connected():
         print(f"Connected to MySQL as {user}")

         # Create and use the database
         cursor = connection.cursor()

         # Create a database
         database = "mkt_final"
         create_db(cursor, database)

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