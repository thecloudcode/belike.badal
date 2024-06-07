# Flask and MySQL Integration Guide 🐍🗄️

## Introduction 📖

This guide will help you understand how to set up a Flask application and connect it with a MySQL database. Flask is a lightweight WSGI web application framework in Python, while MySQL is a popular relational database management system.

## Prerequisites 📋

- Python 3.x installed 🐍
- MySQL installed and running 🗄️
- Basic knowledge of Python and SQL 👩‍💻

## Setting Up Flask 🚀

1. **Install Flask**: You can install Flask using pip:
    ```bash
    pip install Flask
    ```

2. **Create a Basic Flask App**: Create a new file called `app.py` and add the following code:
    ```python
    from flask import Flask

    app = Flask(__name__)

    @app.route('/')
    def hello_world():
        return 'Hello, World!'

    if __name__ == '__main__':
        app.run(debug=True)
    ```

3. **Run the Flask App**: Run your Flask application using the command:
    ```bash
    python app.py
    ```
   Open your browser and navigate to `http://127.0.0.1:5000` to see your app in action! 🌐

## Connecting Flask to MySQL 🔗

1. **Install MySQL Connector**: You can install the MySQL connector using pip:
    ```bash
    pip install mysql-connector-python
    ```

2. **Set Up Database Configuration**: Create a new file called `config.py` and add your database configuration:
    ```python
    MYSQL_HOST = 'localhost'
    MYSQL_USER = 'your_username'
    MYSQL_PASSWORD = 'your_password'
    MYSQL_DB = 'your_database'
    ```

3. **Integrate MySQL with Flask**:
    - Modify your `app.py` to include MySQL integration:
    ```python
    from flask import Flask, request, jsonify
    import mysql.connector
    from config import MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DB

    app = Flask(__name__)

    def get_db_connection():
        conn = mysql.connector.connect(
            host=MYSQL_HOST,
            user=MYSQL_USER,
            password=MYSQL_PASSWORD,
            database=MYSQL_DB
        )
        return conn

    @app.route('/')
    def hello_world():
        return 'Hello, World!'

    @app.route('/users', methods=['GET'])
    def get_users():
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute('SELECT * FROM users')
        users = cursor.fetchall()
        cursor.close()
        conn.close()
        return jsonify(users)

    if __name__ == '__main__':
        app.run(debug=True)
    ```

4. **Create a MySQL Table**: Ensure you have a table named `users` in your MySQL database:
    ```sql
    CREATE TABLE users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100),
        email VARCHAR(100)
    );
    ```

5. **Run Your Flask App**: Run your application again using:
    ```bash
    python app.py
    ```
   Navigate to `http://127.0.0.1:5000/users` to see the list of users from your database! 📜

## Conclusion 🎉

You've now set up a basic Flask application and connected it with a MySQL database. You can expand this further by adding more routes, handling different HTTP methods, and integrating with other services.

Happy coding! 🚀✨

## Resources 📚

- [Flask Documentation](https://flask.palletsprojects.com/)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [mysql-connector-python Documentation](https://dev.mysql.com/doc/connector-python/en/)
