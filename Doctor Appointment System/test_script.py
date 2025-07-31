from appointment_system import (
    add_doctor, update_doctor, delete_doctor,
    add_patient, book_appointment, doctor_schedule,
    update_doctor_availability, get_doctor_availability,
    request_reschedule, auto_reschedule, add_manual_appointment
)

# Test add_doctor
def test_add_doctor():
    print("➡️ Adding test doctor...")
    schedule = {
        "2025-08-05": ["10:00", "11:00"],
        "2025-08-06": ["09:00", "10:00"]
    }
    result = add_doctor("Dr. Test", "Neurologist", "Karachi", schedule)
    print("✅ Doctor added:", result)

# Test update_doctor
def test_update_doctor():
    print("➡️ Updating doctor specialization...")
    result = update_doctor(1, specialization="Heart Specialist")
    print("✅ Doctor updated:", result)

# Test add_patient
def test_add_patient():
    print("➡️ Adding patient to doctor_id=1...")
    new_id = add_patient(1, "Test Patient", "Other", "Islamabad", "0300-1122334")
    print("✅ New patient_local_id:", new_id)

# Test book_appointment
def test_book_appointment():
    print("➡️ Booking appointment for Dr. Ayesha...")
    appt_id = book_appointment(1, 2, "Chest Pain", "report123.pdf", "2025-08-02", "10:00")
    print("✅ Appointment ID:", appt_id)

# Test doctor_schedule
def test_doctor_schedule():
    print("➡️ Fetching Dr. Ayesha's schedule...")
    schedule = doctor_schedule(1)
    for row in schedule:
        print("🗓️", row)

# Test update_doctor_availability
def test_update_availability():
    print("➡️ Updating weekly availability for Dr. Usman...")
    weekly = {
        "Monday": ["09:00", "10:00"],
        "Wednesday": ["11:00", "12:00"]
    }
    result = update_doctor_availability(2, weekly)
    print("✅ Availability updated:", result)

# Test get_doctor_availability
def test_get_availability():
    print("➡️ Getting availability for Dr. Usman...")
    schedule = get_doctor_availability(2)
    for date, times in schedule.items():
        print(date, ":", times)

# Test manual appointment
def test_manual_appointment():
    print("➡️ Booking manual appointment for 'Ali Hassan' with Dr. Ayesha...")
    result = add_manual_appointment(1, "Ali Hassan", "Fever", "doc1.pdf", "2025-08-02", "09:00")
    print("✅ Manual appointment:", result)

# Test reschedule request
def test_reschedule():
    print("➡️ Requesting reschedule for appointment_id=1 (should already exist)...")
    result = request_reschedule(1)
    print("✅ Reschedule requested:", result)

# Test auto reschedule
def test_auto_reschedule():
    print("➡️ Running auto-reschedule...")
    result = auto_reschedule()
    print("✅ Auto-reschedule completed")

if __name__ == "__main__":
    test_add_doctor()
    test_update_doctor()
    test_add_patient()
    test_book_appointment()
    test_doctor_schedule()
    test_update_availability()
    test_get_availability()
    test_manual_appointment()
    test_reschedule()
    test_auto_reschedule()
