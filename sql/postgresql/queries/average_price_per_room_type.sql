-- Query: Calculate average price per night by room type
-- Description: Computes the average nightly price for each room type across all hotels, ordered from highest to lowest average price.
-- Use Case: Useful for pricing analysis, helping management understand which room types generate higher revenue and support competitive pricing strategies.
SELECT
    roomType,
    ROUND(AVG(pricePerNight), 2) AS avgPrice
FROM Room
GROUP BY roomType
ORDER BY avgPrice DESC;
