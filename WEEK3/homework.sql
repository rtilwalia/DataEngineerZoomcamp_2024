SELECT
  *
FROM
  `homewrok-project.ny_taxi.green_taxi_data_2022`
LIMIT
  10;


  --Ques1
SELECT
  COUNT(*)
FROM
  `homewrok-project.ny_taxi.green_taxi_data_2022` ;


  --Ques2
  --Write a query to count the distinct number of PULocationIDs for the entire dataset on both the tables.
  --What is the estimated amount of data that will be read when this query is executed on the External Table and the Table?
SELECT
  COUNT(DISTINCT pu_location_id)
FROM
  `homewrok-project.ny_taxi.green_taxi_data_2022` ;

CREATE OR REPLACE TABLE `homewrok-project.ny_taxi.green_taxi_non_partitioned_data_2022`
AS SELECT * FROM `homewrok-project.ny_taxi.green_taxi_data_2022`;

SELECT
  COUNT(DISTINCT pu_location_id)
FROM
  `homewrok-project.ny_taxi.green_taxi_non_partitioned_data_2022` ;


  --Ques3
  --How many records have a fare_amount of 0?
SELECT
  COUNT(*)
FROM
  `homewrok-project.ny_taxi.green_taxi_data_2022`
WHERE
  fare_amount = 0;


--Ques4
--What is the best strategy to make an optimized table in Big Query if your query will always order the results by PUlocationID and filter based on lpep_pickup_datetime? (Create a new table with this strategy)
CREATE OR REPLACE TABLE `homewrok-project.ny_taxi.green_taxi_partitioned_data_2022`
PARTITION BY DATE(lpep_pickup_datetime)
CLUSTER BY pu_location_id AS (
  SELECT * FROM `homewrok-project.ny_taxi.green_taxi_data_2022`
);


--Ques5
-- Write a query to retrieve the distinct PULocationID between lpep_pickup_datetime 06/01/2022 and 06/30/2022 (inclusive)

-- Use the materialized table you created earlier in your from clause and note the estimated bytes. Now change the table in the from clause to the partitioned table you created for question 4 and note the estimated bytes processed. What are these values?
SELECT COUNT(DISTINCT pu_location_id) FROM `homewrok-project.ny_taxi.green_taxi_partitioned_data_2022` 
where date(lpep_pickup_datetime) >= '2022-06-01' and date(lpep_pickup_datetime) <= '2022-06-30';

--materialized - 12.82 mb
--partitioned - 1.12 mb




