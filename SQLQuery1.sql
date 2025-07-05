create database ola
use ola

select * from bookings


 #1. Retrieve all successful bookings:
 create view successful_bookings
 as
 select * from bookings 
 where
 Booking_Status = 'Success'


 select * from successful_bookings


 # 2. Find the average ride distance for each vehicle type:
 create view average_ride_distance 
 as
select Vehicle_Type,avg(Ride_Distance) as avg_ride_distance from bookings
 group by Vehicle_Type


 # 3. Get the total number of cancelled rides by customers:
 create view cancelled  as
 select count(*) from bookings
 where Booking_Status = 'Canceled by Customer'


 # 4. List the top 5 customers who booked the highest number of rides:
 create view highest_number_of_rides_per_customer 
 as
 select  Customer_ID, count(Booking_ID) as total_rides from bookings
 group by Customer_ID 
 order by total_rides desc 
 

 #5. Get the number of rides cancelled by drivers due to personal and car-related issues
 create view cancelled_rides_personal_car_related_issues as
 select count(*) from bookings
 where Canceled_Rides_by_Driver = 'Personal & Car related issue'


 #6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
 create view max_min_rating as
 select max(Driver_Ratings) as max_rating , min(Driver_Ratings) as min_rating from bookings
 where Vehicle_Type = 'Prime Sedan'

 # 7. Retrieve all rides where payment was made using UPI:
 select * from bookings
 where Payment_Method = 'UPI'


 #8. Find the average customer rating per vehicle type:
 SELECT Vehicle_Type, avg(Customer_Rating) as Customer_Rating FROM bookings
 group by Vehicle_Type 


 #9. Calculate the total booking value of rides completed successfully
 create view total_booking_value_success as
 select sum(Booking_Value) as total_sales from bookings
 where Booking_Status = 'Success'


 #  10. List all incomplete rides along with the reason:

 select Booking_ID , Incomplete_Rides_Reason from bookings
 where Incomplete_Rides = 'Yes' 



