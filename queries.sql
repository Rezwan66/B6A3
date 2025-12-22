-- Query 1: JOIN
-- Requirement: Retrieve booking information along with Customer name and Vehicle name.

select b.booking_id, u.name as customer_name, v.name as vehicle_name, b.start_date, b.end_date, b.status
from bookings as b
inner join users as u using(user_id)
inner join vehicles as v using(vehicle_id);

-- Query 2: EXISTS
-- Find all vehicles that have never been booked.

select *
from vehicles as v
where not exists (
  select 1 from bookings as b
  where b.vehicle_id = v.vehicle_id
);

-- Query 3: WHERE
-- Requirement: Retrieve all available vehicles of a specific type (e.g. cars).

select * from vehicles
where type = 'car';

-- Query 4: GROUP BY and HAVING
-- Requirement: Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.

select v.name as vehicle_name, count(*) as total_bookings from bookings as b
inner join vehicles as v using(vehicle_id)
group by v.name
having count(*) > 2;
