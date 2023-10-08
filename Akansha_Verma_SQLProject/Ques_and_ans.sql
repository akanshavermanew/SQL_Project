
--Q1)Write a query to get Profile ID, Full Name and Contact Number of the tenant who has stayed 
--with us for the longest time period in the past

SELECT profile_id, first_name +' '+ last_name AS FullName, phone AS ContactNumber
FROM Profiles 
WHERE profile_id IN (
    SELECT TOP 1 profile_id
    FROM Tenancy_histories 
    ORDER BY DATEDIFF(Day, move_in_date, move_out_date) DESC 
);

--OR

SELECT TOP 1 P.profile_id, first_name +' '+ last_name AS FullName, 
phone AS ContactNumber,email_id,move_in_date,move_out_date,
DATEDIFF(Day, move_in_date, move_out_date) AS Date_Difference
FROM Profiles P
JOIN Tenancy_histories T ON P.profile_id=T.profile_id
    ORDER BY Date_Difference DESC 

-----------------------------------------------------------------------------------------------------------------------------------------------

--Q2)Write a query to get the Full name, email id, phone of tenants who are married and paying rent > 9000 using subqueries

SELECT first_name +' '+ last_name AS FullName, email_id, phone
FROM Profiles
WHERE martial_status = 'Y'
AND profile_id IN (
    SELECT profile_id
    FROM Tenancy_histories
    WHERE rent > 9000
);

--OR

SELECT first_name +' '+ last_name AS FullName, t.email_id, t.phone
FROM Profiles t
JOIN
    Tenancy_histories m ON t.profile_id = m.profile_id
WHERE
    t.martial_status = 'Y'
    AND m.rent > 9000;

---------------------------------------------------------------------------------------------------------------------------------------------

--Q3)write a query to display profile id, full name, phone, email id, city , house id, move_in_date , 
--move_out date, rent, total number of referrals made, latest employer and the occupational 
--category of all the tenants living in Bangalore or Pune in the time period of jan 2015 to jan 
--2016 sorted by their rent in descending order

SELECT
    t.profile_id,
    CONCAT(first_name,'  ',last_name) as FullName,
    t.Phone,
    t.email_id,
    t.City,
    h.house_id,
    h.move_in_date,
    h.move_out_date,
    h.rent,
    COUNT(r.ref_id) AS 'Total Referrals',
    e.latest_employer AS 'Latest Employer',
    e.occupational_category
FROM
    Profiles t
 LEFT JOIN
    Referrals r ON t.profile_id = r.referrer_id
 LEFT JOIN
    Employment_details e ON t.profile_id = e.profile_id
 LEFT JOIN
	Tenancy_histories h ON t.profile_id = h.profile_id
WHERE
    t.City IN ('Bangalore', 'Pune')
    AND h.move_in_date BETWEEN '2015-01-01' AND '2016-01-31'	
GROUP BY
    t.profile_id,
    CONCAT(first_name,'  ',last_name),
    t.Phone,
    t.email_id,
    t.City,
    h.house_id,
    h.move_in_date,
    h.move_out_date,
    h.rent,
    e.latest_employer,
    e.occupational_category
ORDER BY
    h.rent DESC;

---------------------------------------------------------------------------------------------------------------------------------------------

--Q4)write a sql snippet to find the full_name, email_id, phone number and referral code of all the tenants who have referred more than once. 
 --Also find the total bonus amount they should receive given that the bonus gets calculated 
--only for valid referrals.

--Using the HAVING clause, we filter only those tenants who have been referred more than once (COUNT(t2.referrer_id) > 1).
--Using the HAVING clause, we filter only those tenants who have been referred more than once (COUNT(t2.referrer_id) > 0).
--Using the HAVING clause, we filter only those tenants who have been referred more than 2 products (COUNT(t2.referrer_id) > 2).

SELECT 
    CONCAT(first_name,'  ',last_name) as FullName,
    t1.email_id,
    t1.Phone,
    t1.referral_code,
    SUM(t2.referrer_bonus_amount) AS total_bonus_amount
FROM Profiles t1
 JOIN Referrals t2 ON t1.profile_id = t2.referrer_id
WHERE t2.referral_valid = 1
GROUP BY t1.profile_id, CONCAT(first_name,'  ',last_name), t1.email_id, t1.Phone, t1.referral_code
HAVING COUNT(t2.referrer_id) > 1;


--code divide kiya hai to check
--you can check referrer id in referrals table ,you will get values/ids as '5,20' are referred 2 times i.e. it is 2 times in referrer_id column
select referrer_id
from Referrals
where referral_valid=1
group by referrer_id
HAVING COUNT(referrer_id) > 1;

--------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q5) Write a query to find the rent generated from each city and also the total of all cities.
--worng ansSELECT rent
FROM Tenancy_histories
WHERE profile_id IN (
    SELECT count(profile_id)
    FROM Profiles
    group by city 
);--right ansselect SUM(T.rent) AS Rent,P.cityfrom Tenancy_histories Tjoin Profiles P ON T.profile_id = P.profile_idgroup by P.city;SELECT SUM(T.rent) AS total_rent_of_all_cities
FROM Tenancy_histories T
JOIN Profiles P ON T.profile_id = P.profile_id--OR--right ansselect SUM(T.rent) AS Rent,P.cityfrom Tenancy_histories Tjoin Profiles P ON T.profile_id = P.profile_idgroup by P.city WITH ROLLUP;
----------------------------------------------------------------------------------------------------------------------------------------------------
--Q6)Create a view 'vw_tenant' find profile_id,rent,move_in_date,house_type,beds_vacant,description and city of tenants who 
--shifted on/after 30th april 2015 and are living in houses having vacant beds and its address.CREATE VIEW vw_tenant 
AS
SELECT
    c.profile_id,
    c.rent,
    c.move_in_date,
    t.house_type,
    t.beds_vacant,
    h.description,
    h.city
FROM
    Houses t
 JOIN
    Addresses h ON t.house_id = h.house_id
 JOIN
    Tenancy_histories c ON t.house_id = c.house_id
WHERE
    c.move_in_date >= '2015-04-30'
    AND t.beds_vacant > 0;
--to check view select * from vw_tenant--divided the code for checking the outputselect beds_vacant,house_id
from Houses
where beds_vacant > 0;   --finfing the beds_vacantselect move_in_date,house_idfrom Tenancy_historieswhere move_in_date >= '2015-04-30'

-----------------------------------------------------------------------------------------------------------------------------------------------------

--Q7)Write a code to extend the valid_till date for a month of tenants who have referred more than two times

SELECT referrer_id,DATEADD(MM, 1, valid_till) as Valid_Till_Date_extended_by_1_month
FROM   Referrals
WHERE  referrer_id IN (SELECT   referrer_id
                       FROM     referrals
                       GROUP BY referrer_id
                       HAVING   COUNT(*) > 2)

--OR

--but dont do update it will change original values in column 
UPDATE referrals 
SET    valid_till = DATEADD(MM, 1, valid_till) 
WHERE  referrer_id IN (SELECT   referrer_id
                       FROM     referrals
                       GROUP BY referrer_id
                       HAVING   COUNT(*) > 2)


-------------------------------------------------------------------------------------------------------------------------------------------

--Q8) Write a query to get Profile ID, Full Name , Contact Number of the tenants along with a new 
--column 'Customer Segment' wherein if the tenant pays rent greater than 10000, tenant falls 
--in Grade A segment, if rent is between 7500 to 10000, tenant falls in Grade B else in Grade C


--The CROSS APPLY ensures that the subquery is executed for each row in the "Profiles" table, and the result is joined back to the main query based on the matching ProfileID.

--wrong ans
select profile_id,first_name +' '+ last_name AS FullName,phone as Contact
FROM Profiles
WHERE profile_id EXISTS (
select profile_id,iif(rent > 10000,'Grade A',iif(rent between 7500 and 10000,'Grade B','Grade C')) AS Customer_Segment
from Tenancy_histories
)


--right ans
SELECT T.profile_id, first_name +' '+ last_name AS FullName, T.phone, CA.CustomerSegment AS 'Customer Segment'
FROM Profiles AS T
CROSS APPLY (
    SELECT IIF(rent > 10000, 'Grade A', IIF(rent BETWEEN 7500 AND 10000, 'Grade B', 'Grade C')) AS CustomerSegment
    FROM Tenancy_histories AS RP
    WHERE RP.profile_id = T.profile_id
) CA;

--------------------------------------------------------------------------------------------------------------------------------------------------------
--Q9) Write a query to get Fullname, Contact, City and House Details of the tenants who have not referred even once--wrong ansSELECT first_name +' '+ last_name AS FullName, phone as Contact,city
FROM Profiles
WHERE profile_id IN (
    SELECT DISTINCT referrer_id
    FROM Referrals
    WHERE referrer_id IS NULL
);

--right ans
--(not referred even once means you have to find out the values/ids which are not there or present in referrer_id column) 
SELECT t.first_name +' '+ t.last_name AS FullName, t.phone, t.city
FROM Profiles t
LEFT JOIN (
    SELECT DISTINCT referrer_id
    FROM Referrals
) r ON t.profile_id = r.referrer_id
WHERE r.referrer_id IS NULL;

--OR
--right ans (in this house details is also there
SELECT t.first_name +' '+ t.last_name AS FullName, t.city,t.phone,h.house_id,h.house_type,h.bhk_details,h.furnishing_type,h.bed_count,h.Beds_vacant,a.name,a.description,a.pincode,a.city
FROM Profiles t
LEFT JOIN (
    SELECT DISTINCT referrer_id
    FROM Referrals
) r ON t.profile_id = r.referrer_id
JOIN Tenancy_histories th ON t.profile_id = th.profile_id
JOIN Addresses a ON th.house_id = a.house_id
JOIN Houses h ON th.house_id = h.house_id
WHERE r.referrer_id IS NULL;


------------------------------------------------------------------------------------------------------------------------------------------

--Q10) Write a query to get the house details of the house having highest occupancy

select  a.house_id, a.name , h.house_type, h.bhk_details, h.furnishing_type, (h.bed_count - h.Beds_vacant) AS TOTAT_OCC 
from Addresses a
     INNER JOIN Houses h ON 
         a.house_id= h.house_id 
ORDER BY TOTAT_OCC DESC 


-------------------------------------------------------------------------------------------------------------------------------------------------