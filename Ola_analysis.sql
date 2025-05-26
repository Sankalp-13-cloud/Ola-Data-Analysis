show databases;
create database ola_data;
use ola_data;
show tables;
select * from dataset;
select count(*) from dataset;
desc dataset;

-- Change the data type of Date and Time column
alter table dataset modify column Date Date;
alter table dataset modify column Time time;

 -- 1. Retrieve all successful bookings:
 select * from dataset where booking_status like "Success";
 
 -- 2. Find the average ride distance for each vehicle type:
 select vehicle_type, avg(ride_distance) as avg_ride_distance from dataset group by vehicle_type;
 
 -- 3. Get the total number of cancelled rides by customers:
 select count(*) from dataset where booking_status = "Canceled by Customer"; 
 
 -- 4. List the top 5 customers who booked the highest number of rides:
 select customer_id, count(customer_id) as number_of_rides from dataset group by customer_id order by number_of_rides desc limit 5;
 
 
 -- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select count(*) from dataset where canceled_rides_by_driver like "personal & car related issue";
 
-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select max(driver_ratings) as Max_driver_rating, min(driver_ratings) as Min_driver_rating from dataset where vehicle_type like "Prime sedan";


-- 7. Retrieve all rides where payment was made using UPI:
select * from dataset where payment_method like "UPI";

-- 8. Find the average customer rating per vehicle type:
select vehicle_type, round(avg(customer_rating),2) as Avg_customer_rating from dataset group by vehicle_type;

-- 9. Calculate the total booking value of rides completed successfully:
select sum(booking_value) as total_booking_value from dataset where booking_status like "success";

-- 10. List all incomplete rides along with the reason:
select * from dataset;
select booking_id, incomplete_rides_reason from dataset where incomplete_rides like "yes";
