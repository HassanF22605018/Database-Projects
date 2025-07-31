--CREATE DATABASE Blood_DonationSystem;
CREATE TABLE users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE admins (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL 
);

CREATE TABLE blood_banks (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL
);

CREATE TABLE blood_types (
    id INT IDENTITY(1,1) PRIMARY KEY,
    type VARCHAR(50) NOT NULL
);

CREATE TABLE blood_stocks (
    id  INT IDENTITY(1,1) PRIMARY KEY,
    blood_bank_id INT,
    blood_type_id INT,
    quantity INT,
    FOREIGN KEY (blood_bank_id) REFERENCES blood_banks(id),
    FOREIGN KEY (blood_type_id) REFERENCES blood_types(id)
);

CREATE TABLE donation_requests (
    id INT IDENTITY(1,1) PRIMARY KEY,
    donor_id INT,
    blood_bank_id INT,
    blood_type_id INT,
    status VARCHAR(50),
    age INT,
    mobile_number VARCHAR(15),
    disease VARCHAR(255),
    city VARCHAR(255),
    FOREIGN KEY (donor_id) REFERENCES users(id),
    FOREIGN KEY (blood_bank_id) REFERENCES blood_banks(id),
    FOREIGN KEY (blood_type_id) REFERENCES blood_types(id)
);

CREATE TABLE donors (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    blood_type_id INT,
    name VARCHAR(255),
    number_of_donations INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (blood_type_id) REFERENCES blood_types(id)
);

CREATE TABLE receive_requests (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    blood_bank_id INT,
    blood_type_id INT,
    status VARCHAR(50),
    age INT,
    mobile_number VARCHAR(15),
    city VARCHAR(255),
    quantity INT CHECK (quantity <= 2),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (blood_bank_id) REFERENCES blood_banks(id),
    FOREIGN KEY (blood_type_id) REFERENCES blood_types(id)
);

CREATE TABLE receivers (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    blood_type_id INT,
    name VARCHAR(255),
    quantity_received INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (blood_type_id) REFERENCES blood_types(id)
);
