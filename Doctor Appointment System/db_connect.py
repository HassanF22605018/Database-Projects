import psycopg2
from dotenv import load_dotenv
import os

# Load .env variables
load_dotenv()

# Get variables from .env
DB_NAME = os.getenv("DB_NAME")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT")

# Connect to PostgreSQL
try:
    conn = psycopg2.connect(
        dbname=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD,
        host=DB_HOST,
        port=DB_PORT
    )
    print("✅ Connected to the PostgreSQL database successfully!")
    conn.close()

except Exception as e:
    print("❌ Unable to connect to the database")
    print(e)
