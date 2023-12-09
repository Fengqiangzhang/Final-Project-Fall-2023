
SELECT t.zipcode, TO_CHAR(AVG(r.rent), 'FM999,999,999.99') AS average_rent
FROM trees t
JOIN historical_rents r ON t.zipcode = r.zipcode AND EXTRACT(MONTH FROM r.date) = 8 AND EXTRACT(YEAR FROM r.date) = 2023
GROUP BY t.zipcode
ORDER BY COUNT(*) DESC
LIMIT 10;
