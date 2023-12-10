
WITH LowestRent AS (
  SELECT zipcode, AVG(rent) AS average_rent
  FROM historical_rents
  WHERE EXTRACT(MONTH FROM date) = 1 AND EXTRACT(YEAR FROM date) = 2023
  GROUP BY zipcode
  ORDER BY average_rent ASC
  LIMIT 5
),
HighestRent AS (
  SELECT zipcode, AVG(rent) AS average_rent
  FROM historical_rents
  WHERE EXTRACT(MONTH FROM date) = 1 AND EXTRACT(YEAR FROM date) = 2023
  GROUP BY zipcode
  ORDER BY average_rent DESC
  LIMIT 5
)
SELECT lr.zipcode, TO_CHAR(lr.average_rent, 'FM999,999,999.99') AS formatted_average_rent,
       COUNT(t.id) AS tree_count, COUNT(c.id) AS complaint_count
FROM LowestRent lr
JOIN trees t ON lr.zipcode = t.zipcode
LEFT JOIN complaints_311 c ON lr.zipcode = c.zipcode AND c.date BETWEEN '2023-01-01' AND '2023-01-31'
GROUP BY lr.zipcode, formatted_average_rent
UNION ALL
SELECT hr.zipcode, TO_CHAR(hr.average_rent, 'FM999,999,999.99') AS formatted_average_rent,
       COUNT(t.id) AS tree_count, COUNT(c.id) AS complaint_count
FROM HighestRent hr
JOIN trees t ON hr.zipcode = t.zipcode
LEFT JOIN complaints_311 c ON hr.zipcode = c.zipcode AND c.date BETWEEN '2023-01-01' AND '2023-01-31'
GROUP BY hr.zipcode, formatted_average_rent
ORDER BY formatted_average_rent DESC;
