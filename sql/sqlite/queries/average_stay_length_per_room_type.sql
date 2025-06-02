-- Query: Calculate average length of stay (in days) for each room type
-- Description: Computes the average duration between checking-in and checking-out dates grouped by room type.
-- Use Case: Useful for hotel operations to understand guest stay patterns and optimize room turnover strategies.

SELECT
    r.roomType,
    AVG(JULIANDAY(b.checkingOutDate) - JULIANDAY(b.checkingInDate)) AS avgStayLength
FROM Booking b
JOIN Room r ON b.roomId = r.roomId
WHERE b.status IN ('Checked-out', 'Completed', 'Checked-in')
GROUP BY r.roomType
ORDER BY avgStayLength DESC;
