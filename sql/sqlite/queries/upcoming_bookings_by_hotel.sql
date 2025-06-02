-- Query: Retrieve upcoming bookings for a specific hotel with guest and room details
-- Description: Lists all bookings with check-in dates in the future for a given hotel, showing guest names, room numbers, and booking status.
-- Use Case: Useful for front desk and hotel management to prepare for upcoming guest arrivals and manage room allocations effectively.

SELECT
    b.bookingId,
    g.firstName,
    g.lastName,
    r.roomNumber,
    b.checkingInDate,
    b.checkingOutDate,
    b.status
FROM Booking b
JOIN Room r ON b.roomId = r.roomId
JOIN Hotel h ON r.hotelId = h.hotelId
JOIN BookingGuest bg ON b.bookingId = bg.bookingId
JOIN Guest g ON bg.guestId = g.guestId
WHERE h.name = 'Grand Plaza Hotel'  -- Replace with desired hotel name
  AND bg.isPrimary = 1
  AND DATE(b.checkingInDate) > DATE('now')
ORDER BY b.checkingInDate;
