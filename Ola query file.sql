
create database ola;
use ola;


#-----Successful bookings-----
select * from Bookings where Booking_Status = "success";

#-------Avg ride distance-----
select Vehicle_Type AS vehicle_type,
AVG(Ride_Distance) AS avg_ride_distance
FROM bookings
GROUP BY Vehicle_Type;


#---Canceled rides by customer----
SELECT COUNT(*) FROM bookings
WHERE booking_Status = "canceled by customer";

#----Top 5 customer by booking----
SELECT Customer_ID ,COUNT(Booking_ID) AS `total_rides`
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;

#----rides canceled by drivers("Personal & Car related issue")-----
SELECT COUNT(*) FROM bookings
WHERE Canceled_Rides_by_Driver = "Personal & Car related issue";

#----max_min_driver_rating_prime_sedan---
SELECT Vehicle_Type,
MAX(Driver_Ratings) AS `max_rating`,
MIN(Driver_Ratings) AS `min_rating`
FROM bookings
WHERE Vehicle_Type = 'prime sedan';

#----avg_cust_rating----
SELECT Vehicle_type,
AVG(Customer_Rating) AS avg_rating
FROM bookings
GROUP BY Vehicle_Type;

#---ridespayment_by_upi---
select * from bookings
WHERE Payment_Method = "upi";

#----total_value_successfulrides----
SELECT SUM(Booking_Value) AS total_value_successfulrides
FROM bookings
WHERE Booking_Status = 'Success';

#---incomplete_rides----
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'yes';