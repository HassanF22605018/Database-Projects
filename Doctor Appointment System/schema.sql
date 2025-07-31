-- Drop existing tables (for dev/testing purposes)
DROP TABLE IF EXISTS RescheduleQueue, Appointments, DoctorPatients, Doctors, Admins CASCADE;

-- Admins Table (to manage system if needed)
CREATE TABLE Admins (
    admin_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Doctors Table
CREATE TABLE Doctors (
    doctor_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    city VARCHAR(100),
    availability JSONB NOT NULL DEFAULT '{}',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- DoctorPatients Table (doctor-specific patient IDs)
CREATE TABLE DoctorPatients (
    doctor_id INT NOT NULL REFERENCES Doctors(doctor_id) ON DELETE CASCADE,
    patient_local_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    location VARCHAR(100),
    contact VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (doctor_id, patient_local_id)
);

-- Appointments Table (doctor + local patient ID based)
CREATE TABLE Appointments (
    appointment_id SERIAL PRIMARY KEY,
    doctor_id INT NOT NULL,
    patient_local_id INT NOT NULL,
    disease TEXT,
    documents TEXT,
    appointment_date DATE,
    appointment_time TIME,
    status VARCHAR(20) CHECK (status IN ('Booked', 'Completed', 'Cancelled')) DEFAULT 'Booked',
    rescheduled BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (doctor_id, patient_local_id)
        REFERENCES DoctorPatients(doctor_id, patient_local_id)
        ON DELETE CASCADE,
    FOREIGN KEY (doctor_id)
        REFERENCES Doctors(doctor_id)
        ON DELETE CASCADE
);

-- Reschedule Queue Table
CREATE TABLE RescheduleQueue (
    request_id SERIAL PRIMARY KEY,
    appointment_id INT NOT NULL,
    status VARCHAR(20) CHECK (status IN ('Pending', 'Resolved')) DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (appointment_id)
        REFERENCES Appointments(appointment_id)
        ON DELETE CASCADE
);

-- Indexes
CREATE INDEX idx_doctor_id ON Appointments(doctor_id);
CREATE INDEX idx_doctor_patient ON Appointments(doctor_id, patient_local_id);
CREATE INDEX idx_appointment_date ON Appointments(appointment_date);
