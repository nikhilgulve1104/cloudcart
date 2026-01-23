from flask import Flask
import pymysql

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello from Docker container!"

@app.route("/db")
def db_check():
    try:
        conn = pymysql.connect(
            host="db",
            user="root",
            password="rootpassword",
            database="cloudcartdb"
        )
        return "Database connected successfully!"
    except Exception as e:
        return f"Database connection failed: {e}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

