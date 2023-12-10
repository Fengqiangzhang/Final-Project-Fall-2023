
SELECT t.zipcode, COUNT(*) AS tree_count
FROM trees t
JOIN nyc_zip_codes z ON ST_Within(t.geometry, z.geometry)
GROUP BY t.zipcode
ORDER BY tree_count DESC
LIMIT 10;
