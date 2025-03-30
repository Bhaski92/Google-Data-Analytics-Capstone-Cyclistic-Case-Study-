-- Check to see if a combined data already exists

DROP TABLE IF EXISTS `industrial-silo-450608.2024_tripdata.combined_data`

-- combining the 3 months data tables into a single table containing data from Jan 2024 to Mar 2024.

CREATE TABLE IF NOT EXISTS `industrial-silo-450608.2024_tripdata.combined_data` AS
 (
  SELECT * FROM `industrial-silo-450608.2024_tripdata.202401_tripdata`
  UNION ALL
  SELECT * FROM `industrial-silo-450608.2024_tripdata.202402_tripdata`
  UNION ALL
  SELECT * FROM `industrial-silo-450608.2024_tripdata.202401_tripdata` 
 )
 
-- checking no of rows which are 512910
 
SELECT COUNT(*) AS total_rows
FROM `industrial-silo-450608.2024_tripdata.combined_data`
