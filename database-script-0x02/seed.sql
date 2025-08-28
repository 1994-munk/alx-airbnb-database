-- ================================
-- SEED DATA FOR ALX AIRBNB DATABASE
-- ================================

-- Insert Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
('u1', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw_1', '1234567890', 'guest'),
('u2', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '0987654321', 'host'),
('u3', 'Charlie', 'Brown', 'charlie@example.com', 'hashed_pw_3', '1122334455', 'host'),
('u4', 'Diana', 'Williams', 'diana@example.com', 'hashed_pw_4', '2233445566', 'guest'),
('u5', 'Ethan', 'Taylor', 'ethan@example.com', 'hashed_pw_5', '3344556677', 'admin');

-- Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night)
VALUES
('p1', 'u2', 'Cozy Apartment', '2-bedroom near the beach', 'Mombasa, Kenya', 50.00),
('p2', 'u2', 'Luxury Villa', 'Private pool and ocean view', 'Diani, Kenya', 200.00),
('p3', 'u3', 'City Studio', 'Modern studio in Nairobi CBD', 'Nairobi, Kenya', 40.00),
('p4', 'u3', 'Safari Lodge', 'Rustic lodge near Maasai Mara', 'Narok, Kenya', 120.00),
('p5', 'u2', 'Budget Room', 'Affordable stay for backpackers', 'Kisumu, Kenya', 20.00);

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, guest_id, start_date, end_date, status)
VALUES
('b1', 'p1', 'u1', '2025-09-01', '2025-09-05', 'confirmed'),
('b2', 'p2', 'u1', '2025-12-20', '2025-12-25', 'pending'),
('b3', 'p3', 'u4', '2025-08-15', '2025-08-18', 'confirmed'),
('b4', 'p4', 'u1', '2025-10-01', '2025-10-07', 'cancelled'),
('b5', 'p5', 'u4', '2025-11-02', '2025-11-04', 'confirmed');

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, status)
VALUES
('pay1', 'b1', 200.00, '2025-08-20', 'completed'),
('pay2', 'b2', 1000.00, '2025-08-22', 'pending'),
('pay3', 'b3', 120.00, '2025-08-10', 'completed'),
('pay4', 'b4', 840.00, '2025-09-15', 'refunded'),
('pay5', 'b5', 40.00, '2025-11-01', 'completed');

-- Insert Reviews
INSERT INTO Review (review_id, property_id, guest_id, rating, comment, created_at)
VALUES
('r1', 'p1', 'u1', 5, 'Amazing stay, very clean!', '2025-09-06'),
('r2', 'p2', 'u1', 4, 'Beautiful villa but expensive.', '2025-12-26'),
('r3', 'p3', 'u4', 5, 'Perfect location in the city center.', '2025-08-19'),
('r4', 'p4', 'u1', 3, 'Nice safari experience but too remote.', '2025-10-08'),
('r5', 'p5', 'u4', 4, 'Good for the price, simple and clean.', '2025-11-05');

-- Insert Messages
INSERT INTO Message (message_id, sender_id, receiver_id, content, sent_at)
VALUES
('m1', 'u1', 'u2', 'Hi, is the villa available in December?', '2025-08-25 10:00:00'),
('m2', 'u2', 'u1', 'Yes, but it is already partially booked.', '2025-08-25 10:15:00'),
('m3', 'u4', 'u3', 'Is the city studio near public transport?', '2025-08-12 09:30:00'),
('m4', 'u3', 'u4', 'Yes, it’s 5 mins from the bus station.', '2025-08-12 09:45:00'),
('m5', 'u1', 'u3', 'Can you offer a discount for the lodge?', '2025-09-20 11:00:00');
