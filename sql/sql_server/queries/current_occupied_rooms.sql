
-- Query: Retrieve currently occupied rooms with guest and booking information
-- Description: Shows rooms with active bookings where status is 'Checked-in', including guest name, hotel, room number, and check-in/check-out dates.
-- Use Case: Useful for hotel staff to monitor current occupancy and manage guest services efficiently.
SELECT
    h.name AS hotelName,
    r.roomNumber,
    r.roomType,
    g.firstName,
    g.lastName,
    b.checkingInDate,
    b.checkingOutDate,
    b.status
FROM Booking b
JOIN Room r ON b.roomId = r.roomId
JOIN Hotel h ON r.hotelId = h.hotelId
JOIN BookingGuest bg ON b.bookingId = bg.bookingId AND bg.isPrimary = 1
JOIN Guest g ON bg.guestId = g.guestId
WHERE b.status = 'Checked-in'
ORDER BY h.name, r.roomNumber;
