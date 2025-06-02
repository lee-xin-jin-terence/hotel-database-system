
-- Insert Hotels
INSERT INTO Hotel (name, address, phoneNumber, emailAddress) VALUES
('Sunset Paradise Hotel', '123 Beachside Ave, Miami, FL 33139', '+1-305-555-0101', 'contact@sunsetparadise.com');
INSERT INTO Hotel (name, address, phoneNumber, emailAddress) VALUES
('Mountain View Inn', '456 Alpine Rd, Denver, CO 80202', '+1-720-555-0202', 'info@mountainviewinn.com');
INSERT INTO Hotel (name, address, phoneNumber, emailAddress) VALUES
('City Central Suites', '789 Downtown St, New York, NY 10001', '+1-212-555-0303', 'reservations@citycentralsuites.com');

-- Insert Rooms
INSERT INTO Room (hotelId, roomNumber, roomType, capacity, pricePerNight) VALUES
(1, '101', 'Standard', 2, 150.00);
INSERT INTO Room (hotelId, roomNumber, roomType, capacity, pricePerNight) VALUES
(1, '102', 'Deluxe', 3, 220.00);
INSERT INTO Room (hotelId, roomNumber, roomType, capacity, pricePerNight) VALUES
(1, '201', 'Suite', 5, 450.00);

INSERT INTO Room (hotelId, roomNumber, roomType, capacity, pricePerNight) VALUES
(2, '10', 'Standard', 2, 130.00);
INSERT INTO Room (hotelId, roomNumber, roomType, capacity, pricePerNight) VALUES
(2, '11', 'Deluxe', 4, 210.00);
INSERT INTO Room (hotelId, roomNumber, roomType, capacity, pricePerNight) VALUES
(2, '20', 'Suite', 6, 400.00);

INSERT INTO Room (hotelId, roomNumber, roomType, capacity, pricePerNight) VALUES
(3, '501', 'Standard', 2, 180.00);
INSERT INTO Room (hotelId, roomNumber, roomType, capacity, pricePerNight) VALUES
(3, '502', 'Deluxe', 3, 250.00);
INSERT INTO Room (hotelId, roomNumber, roomType, capacity, pricePerNight) VALUES
(3, '503', 'Suite', 4, 420.00);

-- Insert Guests
INSERT INTO Guest (firstName, lastName, phoneNumber, emailAddress, address) VALUES
('Alice', 'Johnson', '+1-305-555-1010', 'alice.johnson@example.com', '321 Palm St, Miami, FL');
INSERT INTO Guest (firstName, lastName, phoneNumber, emailAddress, address) VALUES
('Bob', 'Smith', '+1-720-555-2020', 'bob.smith@example.com', '654 Mountain Dr, Denver, CO');
INSERT INTO Guest (firstName, lastName, phoneNumber, emailAddress, address) VALUES
('Charlie', 'Brown', '+1-212-555-3030', 'charlie.brown@example.com', '987 Park Ave, New York, NY');
INSERT INTO Guest (firstName, lastName, phoneNumber, emailAddress, address) VALUES
('Diana', 'Evans', '+1-305-555-1111', 'diana.evans@example.com', '123 Ocean Blvd, Miami, FL');
INSERT INTO Guest (firstName, lastName, phoneNumber, emailAddress, address) VALUES
('Ethan', 'Wilson', '+1-720-555-2222', 'ethan.wilson@example.com', '456 Hill Rd, Denver, CO');

-- Insert Bookings
INSERT INTO Booking (roomId, checkingInDate, checkingOutDate, bookingDate, status) VALUES
(1, TO_DATE('2025-07-01', 'YYYY-MM-DD'), TO_DATE('2025-07-05', 'YYYY-MM-DD'), TO_DATE('2025-06-15', 'YYYY-MM-DD'), 'Confirmed');
INSERT INTO Booking (roomId, checkingInDate, checkingOutDate, bookingDate, status) VALUES
(2, TO_DATE('2025-07-10', 'YYYY-MM-DD'), TO_DATE('2025-07-15', 'YYYY-MM-DD'), TO_DATE('2025-06-20', 'YYYY-MM-DD'), 'Checked-in');
INSERT INTO Booking (roomId, checkingInDate, checkingOutDate, bookingDate, status) VALUES
(3, TO_DATE('2025-08-01', 'YYYY-MM-DD'), TO_DATE('2025-08-07', 'YYYY-MM-DD'), TO_DATE('2025-07-01', 'YYYY-MM-DD'), 'Cancelled');

INSERT INTO Booking (roomId, checkingInDate, checkingOutDate, bookingDate, status) VALUES
(4, TO_DATE('2025-07-05', 'YYYY-MM-DD'), TO_DATE('2025-07-08', 'YYYY-MM-DD'), TO_DATE('2025-06-25', 'YYYY-MM-DD'), 'Confirmed');
INSERT INTO Booking (roomId, checkingInDate, checkingOutDate, bookingDate, status) VALUES
(5, TO_DATE('2025-07-12', 'YYYY-MM-DD'), TO_DATE('2025-07-18', 'YYYY-MM-DD'), TO_DATE('2025-07-01', 'YYYY-MM-DD'), 'Confirmed');

INSERT INTO Booking (roomId, checkingInDate, checkingOutDate, bookingDate, status) VALUES
(7, TO_DATE('2025-07-20', 'YYYY-MM-DD'), TO_DATE('2025-07-25', 'YYYY-MM-DD'), TO_DATE('2025-07-10', 'YYYY-MM-DD'), 'Checked-out');
INSERT INTO Booking (roomId, checkingInDate, checkingOutDate, bookingDate, status) VALUES
(8, TO_DATE('2025-07-22', 'YYYY-MM-DD'), TO_DATE('2025-07-28', 'YYYY-MM-DD'), TO_DATE('2025-07-15', 'YYYY-MM-DD'), 'Confirmed');

-- Insert BookingGuest
INSERT INTO BookingGuest (bookingId, guestId, isPrimary) VALUES (1, 1, 1);
INSERT INTO BookingGuest (bookingId, guestId, isPrimary) VALUES (1, 4, 0);
INSERT INTO BookingGuest (bookingId, guestId, isPrimary) VALUES (2, 2, 1);
INSERT INTO BookingGuest (bookingId, guestId, isPrimary) VALUES (3, 3, 1);
INSERT INTO BookingGuest (bookingId, guestId, isPrimary) VALUES (4, 5, 1);
INSERT INTO BookingGuest (bookingId, guestId, isPrimary) VALUES (5, 2, 1);
INSERT INTO BookingGuest (bookingId, guestId, isPrimary) VALUES (5, 1, 0);
INSERT INTO BookingGuest (bookingId, guestId, isPrimary) VALUES (6, 4, 1);
INSERT INTO BookingGuest (bookingId, guestId, isPrimary) VALUES (7, 5, 1);

-- Insert Payments
INSERT INTO Payment (bookingId, paymentDate, amount, paymentMethod, status) VALUES
(1, TO_DATE('2025-06-15', 'YYYY-MM-DD'), 600.00, 'Credit Card', 'Paid');
INSERT INTO Payment (bookingId, paymentDate, amount, paymentMethod, status) VALUES
(2, TO_DATE('2025-06-20', 'YYYY-MM-DD'), 1100.00, 'PayPal', 'Paid');
INSERT INTO Payment (bookingId, paymentDate, amount, paymentMethod, status) VALUES
(3, TO_DATE('2025-07-01', 'YYYY-MM-DD'), 0.00, 'N/A', 'Cancelled');
INSERT INTO Payment (bookingId, paymentDate, amount, paymentMethod, status) VALUES
(4, TO_DATE('2025-06-25', 'YYYY-MM-DD'), 390.00, 'Credit Card', 'Paid');
INSERT INTO Payment (bookingId, paymentDate, amount, paymentMethod, status) VALUES
(5, TO_DATE('2025-07-01', 'YYYY-MM-DD'), 1260.00, 'Debit Card', 'Paid');
INSERT INTO Payment (bookingId, paymentDate, amount, paymentMethod, status) VALUES
(6, TO_DATE('2025-07-10', 'YYYY-MM-DD'), 900.00, 'Credit Card', 'Paid');
INSERT INTO Payment (bookingId, paymentDate, amount, paymentMethod, status) VALUES
(7, TO_DATE('2025-07-15', 'YYYY-MM-DD'), 1500.00, 'PayPal', 'Pending');
