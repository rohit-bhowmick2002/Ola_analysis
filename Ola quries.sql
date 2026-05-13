CREATE TABLE ride_bookings (
    Date TIMESTAMP,
    Booking_ID TEXT PRIMARY KEY,
    Booking_Status TEXT,
    Customer_ID TEXT,
    Vehicle_Type TEXT,
    Pickup_Location TEXT,
    Drop_Location TEXT,
    V_TAT FLOAT,
    C_TAT FLOAT,
    Canceled_Rides_by_Customer TEXT,
    Canceled_Rides_by_Driver TEXT,
    Incomplete_Rides TEXT,
    Incomplete_Rides_Reason TEXT,
    Booking_Value INT,
    Payment_Method TEXT,
    Ride_Distance FLOAT,
    Driver_Ratings FLOAT,
    Customer_Rating FLOAT
   
);


select * from ride_bookings;


-- 1. Retrieve all successful bookings:
select * from ride_bookings
where Booking_Status = 'Success';


-- 2. Find the average ride distance for each vehicle type:
SELECT Vehicle_Type, AVG(Ride_Distance) as avg_distance 
FROM ride_bookings 
GROUP BY
Vehicle_Type;



-- 3. Get the total number of cancelled rides by customers:
select count (*) from ride_bookings
where Booking_Status = 'canceled_rides_by_customer';


-- 4. List the top 5 customers who booked the highest number of rides:
select Customer_ID,count (Booking_ID) as total_rides from ride_bookings
group by Customer_ID
ORDER BY total_rides DESC LIMIT 5;


-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT COUNT(*) FROM ride_bookings 
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating 
FROM ride_bookings
WHERE Vehicle_Type = 'Prime Sedan';



-- 7. Retrieve all rides where payment was made using UPI:
SELECT * FROM ride_bookings
WHERE Payment_Method = 'UPI';



-- 8. Find the average customer rating per vehicle type:
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating 
FROM ride_bookings
GROUP BY Vehicle_Type;



-- 9. Calculate the total booking value of rides completed successfully:
SELECT SUM(Booking_Value) as total_successful_value 
FROM ride_bookings 
WHERE Booking_Status = 'Success';


-- 10. List all incomplete rides along with the reason:
SELECT Booking_ID, Incomplete_Rides_Reason
FROM ride_bookings
WHERE Incomplete_Rides ='Yes';

























