--QUESTION 1

-- Create a materialized view to compute the average, min and max trip time between each taxi zone.

-- Note that we consider the do not consider a->b and b->a as the same trip pair. So as an example, you would consider the following trip pairs as different pairs:

-- Yorkville East -> Steinway
-- Steinway -> Yorkville East
-- From this MV, find the pair of taxi zones with the highest average trip time. You may need to use the dynamic filter pattern for this.

-- Bonus (no marks): Create an MV which can identify anomalies in the data. For example, if the average trip time between two zones is 1 minute, but the max trip time is 10 minutes and 20 minutes respectively.
CREATE MATERIALIZED VIEW avg_trip_time AS
select taxi_zone_pu.zone as pu_zone, taxi_zone_do.zone as do_zone, avg(tpep_dropoff_datetime -tpep_pickup_datetime) as time_diff
from trip_data
join taxi_zone as taxi_zone_pu on taxi_zone_pu.location_id = trip_data.pulocationid
join taxi_zone as taxi_zone_do on taxi_zone_do.location_id = trip_data.dolocationid 
where taxi_zone_pu.zone != taxi_zone_do.zone group by 1,2                                      
order by time_diff desc;

-- Question 2
-- Recreate the MV(s) in question 1, to also find the number of trips for the pair of taxi zones with the highest average trip time.
CREATE MATERIALIZED VIEW avg_trip_time_with_count AS
select taxi_zone_pu.zone as pu_zone, taxi_zone_do.zone as do_zone, avg(tpep_dropoff_datetime -tpep_pickup_datetime) as time_diff, count(*) as trip_count
from trip_data
join taxi_zone as taxi_zone_pu on taxi_zone_pu.location_id = trip_data.pulocationid
join taxi_zone as taxi_zone_do on taxi_zone_do.location_id = trip_data.dolocationid 
where taxi_zone_pu.zone != taxi_zone_do.zone group by 1,2                                      
order by time_diff desc;

-- Question 3
-- From the latest pickup time to 17 hours before, what are the top 3 busiest zones in terms of number of pickups? For example if the latest pickup time is 2020-01-01 17:00:00, then the query should return the top 3 busiest zones from 2020-01-01 00:00:00 to 2020-01-01 17:00:00.
select count(*), taxi_zone.zone from trip_data
join taxi_zone on trip_data.pulocationid = taxi_zone.location_id
where trip_data.tpep_pickup_datetime > (NOW() - INTERVAL '17' HOUR) 
group by taxi_zone.zone
order by count(*) desc;