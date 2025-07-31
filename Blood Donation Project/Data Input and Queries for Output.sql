INSERT INTO admins (name, email, password) VALUES 
('Hassan Javed', 'hassan@gmail.com', 'hassan18');

-- Insert 20 users with genuine names and using only the cities Islamabad, Lahore, and Karachi
INSERT INTO users (name, email, password) VALUES 
('Ali Khan', 'ali.khan@example.com', 'hashed_password1'),
('Aisha Ahmed', 'aisha.ahmed@example.com', 'hashed_password2'),
('Bilal Siddiqui', 'bilal.siddiqui@example.com', 'hashed_password3'),
('Zainab Qureshi', 'zainab.qureshi@example.com', 'hashed_password4'),
('Usman Ali', 'usman.ali@example.com', 'hashed_password5'),
('Hira Riaz', 'hira.riaz@example.com', 'hashed_password6'),
('Fahad Mehmood', 'fahad.mehmood@example.com', 'hashed_password7'),
('Sara Malik', 'sara.malik@example.com', 'hashed_password8'),
('Hamza Tariq', 'hamza.tariq@example.com', 'hashed_password9'),
('Sana Iqbal', 'sana.iqbal@example.com', 'hashed_password10'),
('Arslan Javed', 'arslan.javed@example.com', 'hashed_password11'),
('Maryam Shah', 'maryam.shah@example.com', 'hashed_password12'),
('Rehan Aslam', 'rehan.aslam@example.com', 'hashed_password13'),
('Noor Fatima', 'noor.fatima@example.com', 'hashed_password14'),
('Waleed Hassan', 'waleed.hassan@example.com', 'hashed_password15'),
('Ayesha Anwar', 'ayesha.anwar@example.com', 'hashed_password16'),
('Daniyal Saeed', 'daniyal.saeed@example.com', 'hashed_password17'),
('Iqra Khan', 'iqra.khan@example.com', 'hashed_password18'),
('Shahid Nadeem', 'shahid.nadeem@example.com', 'hashed_password19'),
('Farah Munir', 'farah.munir@example.com', 'hashed_password20');

-- Insert blood banks
INSERT INTO blood_banks (name, location) VALUES 
('Blood Bank 1', 'Islamabad'),
('Blood Bank 2', 'Karachi'),
('Blood Bank 3', 'Lahore');

-- Insert blood types
INSERT INTO blood_types (type) VALUES 
('A+'), ('A-'), ('B+'), ('B-'), ('AB+'), ('AB-'), ('O+'), ('O-');

-- Insert blood stocks
INSERT INTO blood_stocks (blood_bank_id, blood_type_id, quantity) VALUES
(1, 1, 100), (1, 2, 50), (1, 3, 80), (1, 4, 30),
(1, 5, 40), (1, 6, 20), (1, 7, 70), (1, 8, 60),
(2, 1, 90), (2, 2, 40), (2, 3, 60), (2, 4, 20),
(2, 5, 30), (2, 6, 10), (2, 7, 50), (2, 8, 40),
(3, 1, 90), (3, 2, 40), (3, 3, 60), (3, 4, 20),
(3, 5, 30), (3, 6, 10), (3, 7, 50), (3, 8, 40);

--User Queries
-- Query 1 to request to donate blood 
 
INSERT INTO donation_requests (donor_id, blood_bank_id, blood_type_id, status, age, mobile_number, disease, city)
VALUES (2, 1, 3, 'Pending', 22, '0303-5678910', 'No disease', 'Islamabad');

INSERT INTO donation_requests (donor_id, blood_bank_id, blood_type_id, status, age, mobile_number, disease, city)
VALUES (1, 2, 2, 'Pending', 29, '0321-1234567', 'No disease', 'Karachi');

INSERT INTO donation_requests (donor_id, blood_bank_id, blood_type_id, status, age, mobile_number, disease, city)
VALUES (3, 3, 1, 'Rejected', 35, '0345-6789123', 'Anemia', 'Lahore');

INSERT INTO donation_requests (donor_id, blood_bank_id, blood_type_id, status, age, mobile_number, disease, city)
VALUES (4, 1, 4, 'Pending', 28, '0301-1122334', 'No disease', 'Islamabad');

INSERT INTO donation_requests (donor_id, blood_bank_id, blood_type_id, status, age, mobile_number, disease, city)
VALUES (5, 2, 3, 'Approved', 32, '0333-2233445', 'No disease', 'Karachi');

INSERT INTO donation_requests (donor_id, blood_bank_id, blood_type_id, status, age, mobile_number, disease, city)
VALUES (6, 3, 2, 'Pending', 26, '0302-3344556', 'Diabetes', 'Lahore');

INSERT INTO donation_requests (donor_id, blood_bank_id, blood_type_id, status, age, mobile_number, disease, city)
VALUES (7, 1, 1, 'Rejected', 30, '0312-4455667', 'No disease', 'Islamabad');

INSERT INTO donation_requests (donor_id, blood_bank_id, blood_type_id, status, age, mobile_number, disease, city)
VALUES (8, 2, 4, 'Pending', 24, '0322-5566778', 'No disease', 'Karachi');

INSERT INTO donation_requests (donor_id, blood_bank_id, blood_type_id, status, age, mobile_number, disease, city)
VALUES (9, 3, 3, 'Approved', 27, '0341-6677889', 'No disease', 'Lahore');

INSERT INTO donation_requests (donor_id, blood_bank_id, blood_type_id, status, age, mobile_number, disease, city)
VALUES (10, 1, 2, 'Pending', 33, '0331-7788990', 'No disease', 'Islamabad');

-- Query 2 to request to receive blood
    INSERT INTO receive_requests (user_id, blood_bank_id, blood_type_id, status, age, mobile_number, city, quantity)
VALUES (1, 1, 1, 'Pending', 25, '0301-2345678', 'Islamabad', 1);

INSERT INTO receive_requests (user_id, blood_bank_id, blood_type_id, status, age, mobile_number, city, quantity)
VALUES (3, 2, 2, 'Pending', 27, '0334-5436789', 'Karachi', 2);

INSERT INTO receive_requests (user_id, blood_bank_id, blood_type_id, status, age, mobile_number, city, quantity)
VALUES (5, 3, 3, 'Approved', 29, '0302-3456789', 'Lahore', 1);

INSERT INTO receive_requests (user_id, blood_bank_id, blood_type_id, status, age, mobile_number, city, quantity)
VALUES (7, 1, 4, 'Pending', 31, '0333-4567890', 'Islamabad', 2);

INSERT INTO receive_requests (user_id, blood_bank_id, blood_type_id, status, age, mobile_number, city, quantity)
VALUES (9, 2, 1, 'Approved', 33, '0322-5678901', 'Karachi', 1);

INSERT INTO receive_requests (user_id, blood_bank_id, blood_type_id, status, age, mobile_number, city, quantity)
VALUES (11, 3, 2, 'Pending', 35, '0311-6789012', 'Lahore', 2);

INSERT INTO receive_requests (user_id, blood_bank_id, blood_type_id, status, age, mobile_number, city, quantity)
VALUES (13, 1, 3, 'Approved', 37, '0300-7890123', 'Islamabad', 1);

INSERT INTO receive_requests (user_id, blood_bank_id, blood_type_id, status, age, mobile_number, city, quantity)
VALUES (15, 2, 4, 'Pending', 39, '0321-8901234', 'Karachi', 2);

INSERT INTO receive_requests (user_id, blood_bank_id, blood_type_id, status, age, mobile_number, city, quantity)
VALUES (17, 3, 1, 'Approved', 41, '0330-9012345', 'Lahore', 1);

INSERT INTO receive_requests (user_id, blood_bank_id, blood_type_id, status, age, mobile_number, city, quantity)
VALUES (19, 1, 2, 'Pending', 43, '0309-0123456', 'Islamabad', 2);

-- Queriey3 to see record
   SELECT id, donor_id AS user_id, blood_bank_id, blood_type_id, status, age, mobile_number, city, 'Donation' AS request_type
FROM donation_requests
WHERE donor_id = 3
UNION
SELECT id, user_id, blood_bank_id, blood_type_id, status, age, mobile_number, city, 'Receive' AS request_type
FROM receive_requests
WHERE user_id = 3;

-- Admin Queries :

--1.See all donors:
    SELECT * FROM donors;
--2.Add, update, or delete a donor:
    --Add a donor:
    
      INSERT INTO donors (user_id, blood_type_id, name, number_of_donations)
      VALUES (1,5, 'Ali Khan', 1);
     
    --Update a donor:
      
      UPDATE donors SET number_of_donations = number_of_donations + 1 WHERE user_id = 1;
      
    -- Delete a donor:
      
      DELETE FROM donors WHERE user_id = 1;

 --3.Receive request by a user to donate blood and on the response of Admin (Approved or Rejected)
 --the blood of that specific type mentioned is incremented in the blood bank of the city mentioned 
 --and is shown as approved or rejected in the donation requests table:**
    -- Approve request:
      
      -- Approve request:
-- Declare variables
DECLARE @request_id INT = 1;  
DECLARE @bank_id INT = 1;     
DECLARE @type_id INT = 1;     
DECLARE @donor_id INT = 1;    
DECLARE @user_name VARCHAR(255) = 'Ali Khan'; 

-- Start a transaction
BEGIN TRANSACTION;

-- Approve the request
UPDATE donation_requests
SET status = 'Approved'
WHERE id = @request_id;

-- Increment the quantity in the blood_stocks table
UPDATE blood_stocks
SET quantity = quantity + 1
WHERE blood_bank_id = @bank_id AND blood_type_id = @type_id;

-- Check if the user is already a donor for the specified blood type
IF EXISTS (SELECT 1 FROM donors WHERE user_id = @donor_id AND blood_type_id = @type_id)
BEGIN
    UPDATE donors
    SET number_of_donations = number_of_donations + 1
    WHERE user_id = @donor_id AND blood_type_id = @type_id;
END
ELSE
BEGIN
    -- If the user is not already a donor, insert a new record in the donors table
    INSERT INTO donors (user_id, blood_type_id, name, number_of_donations)
    VALUES (@donor_id, @type_id, @user_name, 1);
END;

-- Commit the transaction
COMMIT TRANSACTION;
-- Reject the request
UPDATE donation_requests 
SET status = 'Rejected' 
WHERE id = 1;  -- Replace with actual request ID



--4. Receive request by a user to receive blood and on the response of Admin (Approved or Rejected)
--the blood of that specific type mentioned is decremented from the blood bank of the city mentioned.
--When a received request is approved by admin, the user is registered in the receivers table and the
--column quantity received is incremented if the user is already a receiver and again requests to receive
--blood so that it is not saved again as a new receiver but only the quantity received is incremented:
    -- Approve request:
      
     -- Approve request:

-- Declare variables
DECLARE @quantity INT;
DECLARE @blood_bank_id INT;
DECLARE @blood_type_id INT;
DECLARE @user_id INT;

-- Start a transaction
BEGIN TRANSACTION;

-- Approve the request
UPDATE receive_requests
SET status = 'Approved'
WHERE id = 1;

-- Get the necessary details from the receive_requests table
SELECT @quantity = quantity, 
       @blood_bank_id = blood_bank_id, 
       @blood_type_id = blood_type_id, 
       @user_id = user_id
FROM receive_requests
WHERE id = 1;

-- Decrement the quantity from the blood_stocks table
UPDATE blood_stocks
SET quantity = quantity - @quantity
WHERE blood_bank_id = @blood_bank_id AND blood_type_id = @blood_type_id;

-- Check if the user is already a receiver for the specified blood type
IF EXISTS (SELECT 1 FROM receivers WHERE user_id = @user_id AND blood_type_id = @blood_type_id)
BEGIN
    UPDATE receivers
    SET quantity_received = quantity_received + @quantity
    WHERE user_id = @user_id AND blood_type_id = @blood_type_id;
END
ELSE
BEGIN
    -- If the user is not already a receiver, insert a new record in the receivers table
    INSERT INTO receivers(user_id, blood_type_id, name, quantity_received)
    VALUES (@user_id, @blood_type_id, (SELECT name FROM users WHERE id = @user_id), @quantity);
END;

-- Commit the transaction
COMMIT TRANSACTION;
-- Reject the request
UPDATE receive_requests 
SET status = 'Rejected' 
WHERE id = 3;

--View all the blood banks and can add or delete a blood bank and can also input the volumes for blood available in a blood bank:**
    --View all blood banks:
      
      SELECT * FROM blood_banks ;
     
    --Add a blood bank:
      
      INSERT INTO blood_banks (name, location)
      VALUES ('BloodBank4', 'Multan');
      
    -- Delete a blood bank:
     
      BEGIN TRANSACTION;

-- Delete related records in blood_stocks
DELETE FROM blood_stocks WHERE blood_bank_id = 4;

-- Delete the blood bank
DELETE FROM blood_banks WHERE id = 4;

COMMIT TRANSACTION;

      
    -- Input volumes for blood available:
      
      INSERT INTO blood_stocks (blood_bank_id, blood_type_id, quantity)
      VALUES (4, 1, 10);
      

--6. Query to view the volume of blood available in the blood bank:
    
    SELECT b.name AS blood_bank_name, bt.type AS blood_type, bs.quantity AS quantity_available
    FROM blood_stocks bs
    INNER JOIN blood_banks b ON bs.blood_bank_id = b.id
    INNER JOIN blood_types bt ON bs.blood_type_id = bt.id

    


	






