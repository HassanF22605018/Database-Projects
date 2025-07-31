
---

## 🗄️ Database Schema Overview

| Table              | Description                                                                 |
|--------------------|-----------------------------------------------------------------------------|
| `Admins`           | Stores admin credentials who can add doctors                               |
| `Doctors`          | Stores doctor profiles, including JSON availability                        |
| `DoctorPatients`   | Stores patients for each doctor (local patient IDs reset per doctor)        |
| `Appointments`     | Stores scheduled appointments and links doctor + patient info               |
| `RescheduleQueue`  | Manages rescheduling requests & stores reason/status                        |

---

## ⚙️ Features

### 🧑‍⚕️ Admin & Doctor Features
- Admins can add doctors with name, specialization, location, and availability
- Doctors can have dynamic weekly availability via `JSONB` schedule
- Doctors cannot cancel appointments freely (location-based notice constraint)

### 👥 Patient Features
- Patients are linked to specific doctors (not global)
- Unique `patient_local_id` per doctor
- Can book appointments based on availability

### 📅 Availability System
- Availability is defined weekly (e.g., `{"Mon": ["09:00", "10:00"]}`)
- A utility function converts weekly JSON into actual upcoming slots

### 🔁 Rescheduling System
- Based on patient-doctor location proximity:
  - Same city: 1-day minimum notice
  - Different cities: 2–3 days
- If canceled, new appointment is automatically rescheduled in the next available slot

---

## 🧪 Testing

To run the full test suite:
```bash
python test_script.py
