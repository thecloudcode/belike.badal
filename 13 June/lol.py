import mysql.connector
import json
from flask import jsonify

class user_model:
    def __init__(self):
        try:
            self.con = mysql.connector.connect(
                host="localhost",
                user="root",
                password="dadoflols",
                database="user"
            )
            self.con.autocommit = True 
            self.cur = self.con.cursor(dictionary=True)
            print("Connection Successful")
            self.create_table()
        except mysql.connector.Error as err:
            print(f"Error: {err}")

    def create_table(self):
        try:
            self.cur.execute("""
                CREATE TABLE IF NOT EXISTS user (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    name VARCHAR(255) NOT NULL,
                    email VARCHAR(255) NOT NULL,
                    phone VARCHAR(20),
                    role VARCHAR(50),
                    password VARCHAR(255)
                )
            """)
        except mysql.connector.Error as err:
            print(f"Error creating table: {err}")

    def user_getall_model(self):
        self.cur.execute("SELECT * FROM user")
        result = self.cur.fetchall()
        if result:
            return json.dumps(result)
        else:
            return "No Data Found"

    def user_addone_model(self, data):
        query = """
        INSERT INTO user (name, email, phone, role, password)
        VALUES (%s, %s, %s, %s, %s)
        """
        name = data.get('name', 'N/A')
        email = data.get('email', 'N/A')
        phone = data.get('phone', 'N/A')
        role = data.get('role', 'user')
        password = data.get('password', 'default_pass')

        try:
            self.cur.execute(query, (name, email, phone, role, password))
            self.con.commit()
            return jsonify({"message": "User Created Successfully"}), 201
        except mysql.connector.Error as e:
            self.con.rollback()
            return jsonify({"error": str(e)}), 500
