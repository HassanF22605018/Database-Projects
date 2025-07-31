-- Clean slate
TRUNCATE RescheduleQueue, Appointments, DoctorPatients, Doctors, Admins RESTART IDENTITY CASCADE;

-- Admin user
INSERT INTO Admins (name, email, password)
VALUES ('Admin User', 'admin@example.com', 'securepassword');

-- Doctors
INSERT INTO Doctors (name, specialization, city, availability)
VALUES
  ('Dr. Ayesha Khan', 'Cardiologist', 'Islamabad', '{
    "2025-08-01": ["10:00", "11:00", "12:00"],
    "2025-08-02": ["09:00", "10:00", "11:00"]
  }'::jsonb),
  ('Dr. Usman Raza', 'Dermatologist', 'Lahore', '{
    "2025-08-01": ["14:00", "15:00", "16:00"],
    "2025-08-02": ["13:00", "14:00", "15:00"]
  }'::jsonb);

-- Patients for Dr. Ayesha (doctor_id = 1)
INSERT INTO DoctorPatients (doctor_id, patient_local_id, name, gender, location, contact)
VALUES
  (1, 1, 'Ali Hassan', 'Male', 'Islamabad', '0311-1234567'),
  (1, 2, 'Sara Malik', 'Female', 'Rawalpindi', '0322-9876543'),
  (1, 3, 'Zainab Sheikh', 'Female', 'Lahore', '0300-5554321');

-- Patients for Dr. Usman (doctor_id = 2)
INSERT INTO DoctorPatients (doctor_id, patient_local_id, name, gender, location, contact)
VALUES
  (2, 1, 'Bilal Tariq', 'Male', 'Lahore', '0312-1122334'),
  (2, 2, 'Mehwish Bano', 'Female', 'Multan', '0333-4445566'),
  (2, 3, 'Hamza Butt', 'Male', 'Karachi', '0345-9988776');

-- Booked appointment for Dr. Ayesha (will remain as is)
INSERT INTO Appointments (doctor_id, patient_local_id, disease, documents, appointment_date, appointment_time, status)
VALUES
  (1, 1, 'High Blood Pressure', 'bp_report.pdf', '2025-08-01', '10:00', 'Booked');

-- Booked appointment for Dr. Usman (to be rescheduled later)
INSERT INTO Appointments (doctor_id, patient_local_id, disease, documents, appointment_date, appointment_time, status)
VALUES
  (2, 2, 'Skin Rash', 'rash_photo.jpg', '2025-08-01', '14:00', 'Booked');

-- Add a reschedule request for the second appointment
INSERT INTO RescheduleQueue (appointment_id, status)
VALUES
  (2, 'Pending');
 
