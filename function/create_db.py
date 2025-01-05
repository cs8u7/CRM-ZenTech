def create_db(cursor, database):
   cursor.execute(f"CREATE DATABASE IF NOT EXISTS {database}")
   print(f"Database '{database}' created or already exists.")
   
def create_tables(cursor, file_path, database):
    # Use the database before executing commands
    cursor.execute(f"USE {database}")
    print(f"Using database '{database}'")

    # Read and execute SQL commands
    with open(file_path, 'r') as file:
        sql = file.read()

    # Split SQL into individual commands
    commands = sql.split(';')
    for command in commands:
        if command.strip():  # Skip empty commands
            cursor.execute(command)
    print("Tables created")