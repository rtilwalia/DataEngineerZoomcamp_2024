--Question1
--rm                             Automatically remove the container when it exits

--Question2
-- ritikatilwalia@Ritikas-MacBook-Pro WEEK1 % docker run -it python:3.9 bash
-- root@066d870a409c:/# pip list
-- Package    Version
-- ---------- -------
-- pip        23.0.1
-- setuptools 58.1.0
-- wheel      0.42.0


--Question-3
select count(*) from green_taxi_data
where date(lpep_pickup_datetime) = '2019-09-18'
and date(lpep_dropoff_datetime) = '2019-09-18';
--15612

--Question4
select max(trip_distance) as max_dist, lpep_pickup_datetime from green_taxi_data
group by 2
order by 1 desc
limit 1;
--341.64	"2019-09-26 19:32:52"

--Question5
select 
sum(g.total_amount) as total_sum, 
z."Borough"
from zones z
inner join green_taxi_data g
on z."LocationID" = g."PULocationID"
where date(g.lpep_pickup_datetime) = '2019-09-18'
and z."Borough" not in ('Unknown')
group by z."Borough"
having sum(g.total_amount) > 50000
;
-- 96333.2399999995	"Brooklyn"
-- 92271.29999999853	"Manhattan"
-- 78671.7099999989	"Queens"

--Question6
select
max(tip_amount),
z."Borough"
from zones z
inner join green_taxi_data g
on z."LocationID" = g."DOLocationID"
where date(g.lpep_dropoff_datetime) >= '2019-09-01' and date(g.lpep_dropoff_datetime) <= '2019-09-30'
and z."Zone" = 'Astoria'
group by 2
order by 1 desc;
--20	"Queens"


