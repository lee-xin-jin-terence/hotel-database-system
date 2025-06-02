-- Query: Get payment history for a specific guest
-- Description: Lists all payments made by a guest, including payment dates, amounts, methods, and payment status.
-- Use Case: Useful for finance or customer service teams to track a guest's payment records and resolve billing inquiries.
SELECT
    g.guestId,
    g.firstName,
    g.lastName,
    p.paymentId,
    p.paymentDate,
    p.amount,
    p.paymentMethod,
    p.status
FROM Guest g
JOIN BookingGuest bg ON g.guestId = bg.guestId
JOIN Booking b ON bg.bookingId = b.bookingId
JOIN Payment p ON b.bookingId = p.bookingId
WHERE g.guestId = 2 -- Replace with desired guestId
ORDER BY p.paymentDate DESC;
