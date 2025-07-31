# 📂 Database Projects

This repository contains a collection of **database-driven systems** developed in **SQL** and **Python**, demonstrating real-world database design, queries, and backend integration. Each project is structured as a standalone unit with its own schema, scripts, and documentation.

---

## 📌 Contents

| Project                     | Description                                                                 |
|-----------------------------|-----------------------------------------------------------------------------|
| **Doctor Appointment System** | A patient-doctor management system built with PostgreSQL and Python. It supports admin-controlled doctor registration, appointment scheduling, patient management, rescheduling logic, and automated availability generation. Ideal for clinical/healthcare workflows. |
| **Blood Donation Management System** | A database system to manage blood donors, recipients, inventory, and donation history. Includes SQL queries to track availability, match donor compatibility, and manage hospital/donation center logistics. |

---

## 🛠 Technologies Used

- **PostgreSQL / MySQL**
- **SQL** (DDL + DML + Views + Joins + Procedures)
- **Python** (for systems with backend logic)
- **JSONB** (used in availability management)
- **psycopg2** (for PostgreSQL interaction in Python)

---

## 📂 Folder Structure

Database-Projects/
│
├── Blood Donation Project/
│ ├── Table Creation.sql
│ ├── Data Input and Queries for Output.sql
│ └── README.md
│
└── Doctor Appointment System/
├── appointment_system.py
├── schema.sql
├── Sample_data.sql
├── test_script.py
└── README.md

yaml
Copy
Edit

---

## 🚀 How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/Database-Projects.git
   cd Database-Projects
Navigate to any subproject and follow the instructions in its README.md.

For Python-based projects, ensure PostgreSQL is running and required libraries are installed:

bash
Copy
Edit
pip install psycopg2
📈 Purpose
These projects were created as part of my academic coursework and personal learning in Database Systems and Backend Integration. They demonstrate:

Strong understanding of relational modeling

Writing efficient SQL queries

Designing normalized schemas

Implementing real-world business rules and constraints

👨‍💻 Author
Hassan Javed
BS Computer Science, NUTECH University
Focus: Data Analytics & Cybersecurity
GitHub: @your-username

📜 License
These projects are for educational use only.
Feel free to fork and adapt them for learning or demonstration purposes.