-- Query: Retrieve all cancelled bookings with associated guest and hotel information
-- Description: Shows bookings where the status is 'Cancelled', along with guest names, hotel name, room number, and booking dates.
-- Use Case: Useful for management to analyze cancellation patterns and identify potential issues or trends.

SELECT
    b.bookingId,
    g.firstName,
    g.lastName,
    h.name AS hotelName,
    r.roomNumber,
    b.checkingInDate,
    b.checkingOutDate,
    b.status
FROM Booking b
JOIN Room r ON b.roomId = r.roomId
JOIN Hotel h ON r.hotelId = h.hotelId
JOIN BookingGuest bg ON b.bookingId = bg.bookingId
JOIN Guest g ON bg.guestId = g.guestId
WHERE b.status = 'Cancelled'
  AND bg.isPrimary = 1
ORDER BY b.checkingInDate DESC;
