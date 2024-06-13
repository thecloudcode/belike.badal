import mysql.connector
from mysql.connector import Error

def connect_to_database():
    try:
        connection = mysql.connector.connect(
            host='localhost',
            user='root',     
            password='dadoflols',
            database='user' 
        )

        if connection.is_connected():
            print("Successfully connected to the database")
            return connection

    except Error as e:
        print(f"Error: {e}")
        return None

    return None

if __name__ == "__main__":
    db_connection = connect_to_database()

    if db_connection:
        db_connection.close()
