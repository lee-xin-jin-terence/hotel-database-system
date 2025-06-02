-- Query: Calculate total revenue per hotel from paid bookings
-- Description: Aggregates the total amount paid for all bookings that have a payment status of 'Paid', grouped by each hotel's name.
-- Use Case: Useful for hotel management and finance teams to evaluate revenue performance by hotel location and monitor income from confirmed bookings.

SELECT
    h.name AS hotelName,
    SUM(p.amount) AS totalRevenue
FROM Payment p
JOIN Booking b ON p.bookingId = b.bookingId
JOIN Room r ON b.roomId = r.roomId
JOIN Hotel h ON r.hotelId = h.hotelId
WHERE p.status = 'Paid'
GROUP BY h.name
ORDER BY totalRevenue DESC;
