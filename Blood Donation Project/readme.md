🩸 Blood Donation Management System - SQL Project
This project implements a Blood Donation Management System using SQL Server. It provides a structured database schema along with data population scripts and queries to simulate a blood bank ecosystem — including donors, receivers, admins, blood stocks, and request handling workflows.

📁 Project Files
Table Creation.sql: Contains all CREATE TABLE scripts to initialize the database schema.

Data Input and Queries.sql: Contains sample data insertions and queries to test and interact with the system.

🧱 Database Schema Overview
🧑‍🤝‍🧑 Users and Admins
users: Regular users who can donate or request blood.

admins: System administrators who can manage blood stocks, approve/reject requests, and manage banks.

🏥 Blood Management
blood_banks: Stores information about different blood banks and their locations.

blood_types: Standard blood types (A+, B−, etc.).

blood_stocks: Blood availability in various blood banks.

💉 Donation & Receiving Process
donation_requests: Tracks users' requests to donate blood.

receive_requests: Tracks users' requests to receive blood.

donors: Approved donors with donation count.

receivers: Approved receivers with the amount of blood received.

⚙️ Setup Instructions
Create Database

sql
Copy
Edit
CREATE DATABASE Blood_DonationSystem;
USE Blood_DonationSystem;
Run the Schema
Run the SQL statements from Table Creation.sql to create all tables.

Insert Data
Populate the database using insert queries from the Data Input and Queries section.

🧪 Sample Features and Queries
👤 User Functionalities
Request to Donate Blood

sql
Copy
Edit
INSERT INTO donation_requests (...) VALUES (...);
Request to Receive Blood

sql
Copy
Edit
INSERT INTO receive_requests (...) VALUES (...);
View Their Own Requests

sql
Copy
Edit
SELECT id, donor_id AS user_id, ... FROM donation_requests
UNION
SELECT id, user_id, ... FROM receive_requests;
🛠️ Admin Functionalities
View / Add / Update / Delete Donors

sql
Copy
Edit
SELECT * FROM donors;
INSERT INTO donors (...) VALUES (...);
UPDATE donors SET ...;
DELETE FROM donors WHERE ...;
Approve Donation Requests

Status updated to Approved

Quantity incremented in blood_stocks

Donor record updated or created in donors

Approve Receiving Requests

Status updated to Approved

Quantity decremented from blood_stocks

Receiver record updated or created in receivers

View Blood Banks and Stocks

sql
Copy
Edit
SELECT * FROM blood_banks;
SELECT b.name, bt.type, bs.quantity FROM blood_stocks bs
JOIN blood_banks b ON ...
JOIN blood_types bt ON ...;
Add or Delete Blood Bank

sql
Copy
Edit
INSERT INTO blood_banks (...) VALUES (...);
DELETE FROM blood_stocks WHERE blood_bank_id = ...;
DELETE FROM blood_banks WHERE id = ...;
📊 Sample Data
Admins: 1 admin

Users: 20 users (from Islamabad, Karachi, Lahore)

Blood Banks: 3 (can be extended)

Blood Types: 8 standard types

Stocks: Pre-populated for each bank and type

Requests: 10 sample donation and 10 receive requests

🔐 Notes
Passwords shown are placeholder values. In production, passwords must be securely hashed.

Quantity constraint: Users can only request up to 2 units of blood at a time.

Transactions are used to ensure consistency when approving/rejecting requests.

✅ Future Improvements
Add front-end interface or integrate with an application.

Implement role-based login (Admin/User).

Track donation history per user with timestamps.

Notifications for low stock levels.

📌 Author
Hassan Javed