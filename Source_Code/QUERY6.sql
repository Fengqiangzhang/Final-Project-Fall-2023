
WITH target_point AS (
  SELECT ST_SetSRID(ST_MakePoint(-73.96253174434912, 40.80737875669467), 4326) AS geom
)
SELECT t.tree_id, t.spc_common, t.health, t.status, ST_AsText(t.geometry) AS coordinate_location
FROM trees t
JOIN target_point tp ON ST_DWithin(t.geometry, tp.geom, 0.5 * 1609.34)  -- 0.5 mile in meters
LIMIT 5;
