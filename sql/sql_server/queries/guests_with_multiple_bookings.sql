
-- Query: Find guests with multiple bookings
-- Description: Retrieves guests who have made more than one booking by counting the number of bookings associated with each guest.
-- Use Case: Useful for identifying frequent customers, enabling targeted marketing, loyalty programs, or personalized services.
SELECT
    g.guestId,
    g.firstName,
    g.lastName,
    COUNT(bg.bookingId) AS bookingCount
FROM Guest g
JOIN BookingGuest bg ON g.guestId = bg.guestId
GROUP BY g.guestId, g.firstName, g.lastName
HAVING COUNT(bg.bookingId) > 1;
