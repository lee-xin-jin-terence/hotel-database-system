-- Insert Hotels
INSERT INTO Hotel (name, address, phoneNumber, emailAddress) VALUES
('Sunset Paradise Hotel', '123 Beachside Ave, Miami, FL 33139', '+1-305-555-0101', 'contact@sunsetparadise.com'),
('Mountain View Inn', '456 Alpine Rd, Denver, CO 80202', '+1-720-555-0202', 'info@mountainviewinn.com'),
('City Central Suites', '789 Downtown St, New York, NY 10001', '+1-212-555-0303', 'reservations@citycentralsuites.com');

-- Insert Rooms
INSERT INTO Room (hotelId, roomNumber, roomType, capacity, pricePerNight) VALUES
(1, '101', 'Standard', 2, 150.00),
(1, '102', 'Deluxe', 3, 220.00),
(1, '201', 'Suite', 5, 450.00),

(2, '10', 'Standard', 2, 130.00),
(2, '11', 'Deluxe', 4, 210.00),
(2, '20', 'Suite', 6, 400.00),

(3, '501', 'Standard', 2, 180.00),
(3, '502', 'Deluxe', 3, 250.00),
(3, '503', 'Suite', 4, 420.00);

-- Insert Guests
INSERT INTO Guest (firstName, lastName, phoneNumber, emailAddress, address) VALUES
('Alice', 'Johnson', '+1-305-555-1010', 'alice.johnson@example.com', '321 Palm St, Miami, FL'),
('Bob', 'Smith', '+1-720-555-2020', 'bob.smith@example.com', '654 Mountain Dr, Denver, CO'),
('Charlie', 'Brown', '+1-212-555-3030', 'charlie.brown@example.com', '987 Park Ave, New York, NY'),
('Diana', 'Evans', '+1-305-555-1111', 'diana.evans@example.com', '123 Ocean Blvd, Miami, FL'),
('Ethan', 'Wilson', '+1-720-555-2222', 'ethan.wilson@example.com', '456 Hill Rd, Denver, CO');

-- Insert Bookings
INSERT INTO Booking (roomId, checkingInDate, checkingOutDate, bookingDate, status) VALUES
(1, '2025-07-01', '2025-07-05', '2025-06-15', 'Confirmed'),
(2, '2025-07-10', '2025-07-15', '2025-06-20', 'Checked-in'),
(3, '2025-08-01', '2025-08-07', '2025-07-01', 'Cancelled'),

(4, '2025-07-05', '2025-07-08', '2025-06-25', 'Confirmed'),
(5, '2025-07-12', '2025-07-18', '2025-07-01', 'Confirmed'),

(7, '2025-07-20', '2025-07-25', '2025-07-10', 'Checked-out'),
(8, '2025-07-22', '2025-07-28', '2025-07-15', 'Confirmed');

-- Insert BookingGuest
INSERT INTO BookingGuest (bookingId, guestId, isPrimary) VALUES
(1, 1, 1),
(1, 4, 0),

(2, 2, 1),

(3, 3, 1),

(4, 5, 1),

(5, 2, 1),
(5, 1, 0),

(6, 4, 1),

(7, 5, 1);

-- Insert Payments
INSERT INTO Payment (bookingId, paymentDate, amount, paymentMethod, status) VALUES
(1, '2025-06-15', 600.00, 'Credit Card', 'Paid'),
(2, '2025-06-20', 1100.00, 'PayPal', 'Paid'),
(3, '2025-07-01', 0.00, 'N/A', 'Cancelled'),

(4, '2025-06-25', 390.00, 'Credit Card', 'Paid'),
(5, '2025-07-01', 1260.00, 'Debit Card', 'Paid'),

(6, '2025-07-10', 900.00, 'Credit Card', 'Paid'),
(7, '2025-07-15', 1500.00, 'PayPal', 'Pending');
