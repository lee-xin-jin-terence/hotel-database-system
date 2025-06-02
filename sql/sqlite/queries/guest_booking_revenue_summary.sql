
-- Query: Calculate total bookings and total amount paid by each guest
-- Description: Lists each guest along with the count of their bookings and the sum of all payments made for those bookings.
-- Use Case: Useful for customer relationship management to identify high-value guests and tailor rewards or marketing efforts accordingly.
SELECT
    g.guestId,
    g.firstName,
    g.lastName,
    COUNT(DISTINCT b.bookingId) AS totalBookings,
    COALESCE(SUM(p.amount), 0) AS totalSpent
FROM Guest g
LEFT JOIN BookingGuest bg ON g.guestId = bg.guestId
LEFT JOIN Booking b ON bg.bookingId = b.bookingId
LEFT JOIN Payment p ON b.bookingId = p.bookingId AND p.status = 'Paid'
GROUP BY g.guestId, g.firstName, g.lastName
ORDER BY totalSpent DESC, totalBookings DESC;
