-- Data Exploration

-- checking the data types of all columns

SELECT column_name, data_type
FROM `industrial-silo-450608.2024_tripdata.combined_data_distinct`
WHERE table_name = 'combined_data';


-- checking for number of null values in all columns

SELECT 
 COUNT(*) - COUNT(ride_id) ride_id,
 COUNT(*) - COUNT(rideable_type) rideable_type,
 COUNT(*) - COUNT(started_at) started_at,
 COUNT(*) - COUNT(ended_at) ended_at,
 COUNT(*) - COUNT(start_station_name) start_station_name,
 COUNT(*) - COUNT(start_station_id) start_station_id,
 COUNT(*) - COUNT(end_station_name) end_station_name,
 COUNT(*) - COUNT(end_station_id) end_station_id,
 COUNT(*) - COUNT(start_lat) start_lat,
 COUNT(*) - COUNT(start_lng) start_lng,
 COUNT(*) - COUNT(end_lat) end_lat,
 COUNT(*) - COUNT(end_lng) end_lng,
 COUNT(*) - COUNT(member_casual) member_casual
FROM `industrial-silo-450608.2024_tripdata.combined_data_distinct`

-- started_at, ended_at - TIMESTAMP - YYYY-MM-DD hh:mm:ss UTC

SELECT started_at, ended_at
FROM `industrial-silo-450608.2024_tripdata.combined_data_distinct`


SELECT COUNT(*) AS longer_than_a_day
FROM `industrial-silo-450608.2024_tripdata.combined_data_distinct`
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) >= 1440; -- longer than a day - total rows = 697


SELECT COUNT(*) AS less_than_a_minute
FROM `industrial-silo-450608.2024_tripdata.combined_data_distinct`
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) <= 1; -- less than a minute - total rows = 8404


-- 1123 unique start_station_name

SELECT DISTINCT start_station_name
FROM `industrial-silo-450608.2024_tripdata.combined_data_distinct`
WHERE start_station_name IS NOT NULL
ORDER BY start_station_name;


-- 42583 rows with missing start_station_name or start_station_id

SELECT COUNT(ride_id) AS rows_with_start_station_null
FROM `industrial-silo-450608.2024_tripdata.combined_data_distinct`
WHERE start_station_name IS NULL OR start_station_id IS NULL;

Total of 42583 rows have both start_station_name and start_station_id missing which needs to be removed.

 
-- 1129 rows with unique end station name

SELECT DISTINCT end_station_name
FROM `industrial-silo-450608.2024_tripdata.combined_data_distinct`
WHERE end_station_name IS NOT NULL
ORDER BY end_station_name;


-- 45900 rows with missing end_station_name or end_station_id

SELECT COUNT(ride_id) AS rows_with_null_end_station
FROM `industrial-silo-450608.2024_tripdata.combined_data_distinct`
WHERE end_station_name IS NULL OR end_station_id IS NULL;

Total of 45900 rows have both end_station_name and end_station_id missing which needs to be removed.


-- end_lat, end_lng - total 606 rows with both missing

SELECT COUNT(ride_id) AS rows_with_null_end_loc
FROM `industrial-silo-450608.2024_tripdata.combined_data_distinct`
WHERE end_lat IS NULL OR end_lng IS NULL;

Total of 606 rows have both end_lat and end_lng missing which needs to be removed.
