import psycopg2
import json
from datetime import datetime, timedelta
from Env_loader import DB_NAME, DB_USER, DB_PASSWORD, DB_HOST, DB_PORT

def get_connection():
    return psycopg2.connect(
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD,
        host=DB_HOST,
        port=DB_PORT
    )

def add_doctor(name, specialization, city, availability):
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                cur.execute("""
                    INSERT INTO Doctors (name, specialization, city, availability)
                    VALUES (%s, %s, %s, %s)
                """, (name, specialization, city, json.dumps(availability)))
                conn.commit()
                return True
    except Exception as e:
        print(f"Error adding doctor: {e}")
        return False

def update_doctor(doctor_id, name=None, specialization=None, city=None, availability=None):
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                fields = []
                values = []
                if name:
                    fields.append("name = %s")
                    values.append(name)
                if specialization:
                    fields.append("specialization = %s")
                    values.append(specialization)
                if city:
                    fields.append("city = %s")
                    values.append(city)
                if availability:
                    fields.append("availability = %s")
                    values.append(json.dumps(availability))
                if not fields:
                    return False
                values.append(doctor_id)
                cur.execute(f"UPDATE Doctors SET {', '.join(fields)} WHERE doctor_id = %s", tuple(values))
                conn.commit()
                return True
    except Exception as e:
        print(f"Error updating doctor: {e}")
        return False

def delete_doctor(doctor_id):
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                cur.execute("DELETE FROM Doctors WHERE doctor_id = %s", (doctor_id,))
                conn.commit()
                return True
    except Exception as e:
        print(f"Error deleting doctor: {e}")
        return False

def add_patient(doctor_id, name, gender, location, contact):
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                cur.execute("""
                    SELECT COALESCE(MAX(patient_local_id), 0) + 1
                    FROM DoctorPatients WHERE doctor_id = %s
                """, (doctor_id,))
                new_id = cur.fetchone()[0]
                cur.execute("""
                    INSERT INTO DoctorPatients (doctor_id, patient_local_id, name, gender, location, contact)
                    VALUES (%s, %s, %s, %s, %s, %s)
                """, (doctor_id, new_id, name, gender, location, contact))
                conn.commit()
                return new_id
    except Exception as e:
        print(f"Error adding patient: {e}")
        return None

def book_appointment(doctor_id, patient_local_id, disease, documents, date, time):
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                cur.execute("SELECT availability FROM Doctors WHERE doctor_id = %s", (doctor_id,))
                result = cur.fetchone()
                if not result or not result[0]:
                    raise Exception("Doctor not found or has no availability")

                availability_json = result[0]
                schedule = availability_json if isinstance(availability_json, dict) else json.loads(availability_json)

                if date not in schedule or time not in schedule[date]:
                    raise Exception("Requested time slot not available")

                cur.execute("""
                    INSERT INTO Appointments (doctor_id, patient_local_id, disease, documents, appointment_date, appointment_time)
                    VALUES (%s, %s, %s, %s, %s, %s)
                    RETURNING appointment_id
                """, (doctor_id, patient_local_id, disease, documents, date, time))
                appointment_id = cur.fetchone()[0]

                schedule[date].remove(time)
                cur.execute("UPDATE Doctors SET availability = %s WHERE doctor_id = %s", (json.dumps(schedule), doctor_id))

                conn.commit()
                return appointment_id
    except Exception as e:
        print(f"Error booking appointment: {e}")
        return None

def doctor_schedule(doctor_id):
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                cur.execute("""
                    SELECT appointment_date, appointment_time, dp.name
                    FROM Appointments a
                    JOIN DoctorPatients dp ON a.doctor_id = dp.doctor_id AND a.patient_local_id = dp.patient_local_id
                    WHERE a.doctor_id = %s AND a.status = 'Booked'
                    ORDER BY appointment_date, appointment_time
                """, (doctor_id,))
                return cur.fetchall()
    except Exception as e:
        print(f"Error fetching doctor schedule: {e}")
        return []

def add_manual_appointment(doctor_id, patient_name, disease, documents, date, time):
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                cur.execute("""
                    SELECT patient_local_id FROM DoctorPatients
                    WHERE doctor_id = %s AND name = %s
                """, (doctor_id, patient_name))
                patient = cur.fetchone()
                if not patient:
                    raise Exception("Patient not found")
                return book_appointment(doctor_id, patient[0], disease, documents, date, time)
    except Exception as e:
        print(f"Error in manual appointment: {e}")
        return None

def update_doctor_availability(doctor_id, weekly_schedule):
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                today = datetime.now().date()
                schedule = {}
                for i in range(30):
                    date = today + timedelta(days=i)
                    weekday = date.strftime("%A")
                    if weekday in weekly_schedule:
                        schedule[str(date)] = weekly_schedule[weekday]
                cur.execute("UPDATE Doctors SET availability = %s WHERE doctor_id = %s", (json.dumps(schedule), doctor_id))
                conn.commit()
                return True
    except Exception as e:
        print(f"Error updating doctor availability: {e}")
        return False

def get_doctor_availability(doctor_id):
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                cur.execute("SELECT availability FROM Doctors WHERE doctor_id = %s", (doctor_id,))
                result = cur.fetchone()
                if not result or not result[0]:
                    return {}
                return result[0] if isinstance(result[0], dict) else json.loads(result[0])
    except Exception as e:
        print(f"Error fetching doctor availability: {e}")
        return {}

def request_reschedule(appointment_id):
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                cur.execute("INSERT INTO RescheduleQueue (appointment_id) VALUES (%s)", (appointment_id,))
                conn.commit()
                return True
    except Exception as e:
        print(f"Error in reschedule request: {e}")
        return False

def auto_reschedule():
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                cur.execute("""
                    SELECT rq.request_id, a.appointment_id, a.doctor_id, a.patient_local_id,
                           a.appointment_date, d.city, dp.location
                    FROM RescheduleQueue rq
                    JOIN Appointments a ON rq.appointment_id = a.appointment_id
                    JOIN Doctors d ON a.doctor_id = d.doctor_id
                    JOIN DoctorPatients dp ON dp.doctor_id = a.doctor_id AND dp.patient_local_id = a.patient_local_id
                    WHERE rq.status = 'Pending'
                """)
                for req_id, appt_id, doc_id, pat_id, old_date, doc_city, pat_city in cur.fetchall():
                    cur.execute("SELECT availability FROM Doctors WHERE doctor_id = %s", (doc_id,))
                    result = cur.fetchone()
                    if not result or not result[0]:
                        print(f"No availability for doctor {doc_id}")
                        continue

                    schedule_json = result[0]
                    schedule = schedule_json if isinstance(schedule_json, dict) else json.loads(schedule_json)

                    # City-based delay rule
                    earliest_date = datetime.now().date() + timedelta(days=1 if doc_city == pat_city else 3)
                    found = False

                    for day in sorted(schedule.keys()):
                        slot_date = datetime.strptime(day, "%Y-%m-%d").date()
                        if slot_date >= earliest_date and schedule[day]:
                            new_time = schedule[day].pop(0)
                            cur.execute("""
                                UPDATE Appointments
                                SET appointment_date = %s, appointment_time = %s, rescheduled = TRUE
                                WHERE appointment_id = %s
                            """, (slot_date, new_time, appt_id))
                            cur.execute("UPDATE RescheduleQueue SET status = 'Resolved' WHERE request_id = %s", (req_id,))
                            cur.execute("UPDATE Doctors SET availability = %s WHERE doctor_id = %s", (json.dumps(schedule), doc_id))
                            conn.commit()
                            found = True
                            break

                    if not found:
                        print(f"No available slot found to reschedule appointment {appt_id}")
    except Exception as e:
        print(f"Error in auto_reschedule: {e}")
        return False
