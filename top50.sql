#question 1 of top 50 

# Write a MySQL query to find the product_id of all products whose low_fats and recyclable attributes are both 'Y'.
select product_id
from Products
where low_fats ='Y'
and 
recyclable ='Y'


# 2nd question of top 50

# Write a MySQL query to find the name, population and area of all countries in the World database where the area is larger than 3 million or the population is larger than 25 million.
select name, population, area
from World
where area >= 3000000 or population >=25000000
 
 

 # 3rd question of top 50
 # Write a MySQL query to find the name of all customers who have not been referred by the customer with id 2.
SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;


# 4th question of top 50
# Write a MySQL query to find the id of all authors who have viewed their own articles
select distinct author_id as id
from Views
where author_id=viewer_id
order by id asc
#similar to above but with group by instead of distinct
#select author_id as id from Views where author_id=viewer_id group by author_id order by author_id


# 5th question of top 50
# Write a MySQL query to find the tweet_id of all tweets whose content is longer than
select tweet_id
from Tweets
where char_length(content)>15



# 6th question of top 50
# Write a MySQL query to find the unique_id and name of all employees in the Employees
-- select ui.unique_id, e.name
-- from employees e
-- left join EmployeeUni ui
-- on e.id=ui.id

select unique_id,name from 
employees as e left join employeeuni as eu
on e.id=eu.id;


# 7th question of top 50
# Write a MySQL query to find the product_name, year and price of all products in
select product_name,year, price 
from Sales s left join Product p on
p.product_id=s.product_id;



# 8th question of top 50
# Write a MySQL query to find the customer_id and count of visits for all customers who
-- select distinct v.customer_id, count(v.visit_id) as count_no_trans
-- from Visits v left join Transactions T
-- on v.visit_id =T.visit_id
-- where T.transaction_id is null
-- group by  v.customer_id

SELECT customer_id, COUNT(visit_id) AS count_no_trans
FROM Visits
WHERE visit_id NOT IN (SELECT visit_id FROM Transactions)
GROUP BY customer_id;



# 9th question of top 50
# Write a MySQL query to find the id of all weather records where the temperature is higher
SELECT 
    weather1.id
FROM 
    Weather AS weather1
JOIN 
    Weather AS weather2 
    ON DATEDIFF(weather1.recordDate, weather2.recordDate) = 1
    --  ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE 
    weather1.temperature > weather2.temperature;




 # 10th question of top 50
# Write a MySQL query to find the machine_id and the average processing time for all machines

SELECT 
    s.machine_id, 
    ROUND(AVG(e.timestamp - s.timestamp), 3) AS processing_time
FROM Activity s
JOIN Activity e 
    ON s.machine_id = e.machine_id 
    AND s.process_id = e.process_id
WHERE 
    s.activity_type = 'start' 
    AND e.activity_type = 'end'
GROUP BY s.machine_id;




# 11th question of top 50
# Write a MySQL query to find the name and bonus of all employees who have a bonus
select name,b.bonus
from Employee e
left join Bonus b on b.empId=e.empId
where b.bonus<1000 or b.bonus is null


# 12th question of top 50
# Write a MySQL query to find the student_id, student_name, subject_name and the
SELECT 
    s.student_id, 
    s.student_name, 
    sub.subject_name, 
    COUNT(e.student_id) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e 
    ON s.student_id = e.student_id 
    AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;



# 13th question of top 50
# Write a MySQL query to find the name of all employees who are managers of at least
SELECT name
FROM Employee
WHERE id IN (
    SELECT managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(id) >= 5
)

# 14th question of top 50
# Write a MySQL query to find the name and price of all products that are either in
select *
from Cinema 
where description <> 'boring' and id %2!=0
order by rating desc



# 15th question of top 50
# Write a MySQL query to find the product_id and the average price of all products in

select P.product_id, 
ifnull(round(sum(P.price*S.units) /sum(S.units),2),0) as  average_price
from Prices P
left join UnitsSold S 
on  S.product_id=P. product_id and S.purchase_date between P.start_date and  P.end_date 

group by product_id




# 16th question of top 50
# Write a MySQL query to find the project_id and the average experience years of all employees

select project_id ,
round(avg(e.experience_years),2) as average_years 
from Project p
left join Employee e on
p.employee_id=e. employee_id 
group by p.project_id




# 17th question of top 50
# Write a MySQL query to find the contest_id and the percentage of users who registered for
SELECT 
    contest_id, 
    ROUND(COUNT(user_id) * 100.0 / (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC;

# 18th question of top 50
# Write a MySQL query to find the query_name, quality and the percentage of poor queries
SELECT 
    query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;

# 19th question of top 50
# Write a MySQL query to find the user_id and the confirmation rate of all users in
select s.user_id,
round(ifnull(avg(c.action='confirmed'),0),2) as confirmation_rate 
from Signups s
left join Confirmations c on s.user_id = c.user_id
group by s.user_id;

# 20th question of top 50
# Write a MySQL query to find the month, country, number of transactions, number of

SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(id) AS trans_count,
    SUM(state = 'approved') AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY month, country;




# 21st question of top 50
# Write a MySQL query to find the customer_id and the percentage of orders that were delivered

SELECT 
    ROUND(
        SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100.0 / 
        COUNT(*), 
    2) AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) IN (

    SELECT customer_id, MIN(order_date)
    FROM Delivery
    GROUP BY customer_id
);


# 22nd question of top 50
# Write a MySQL query to find the player_id and the percentage of players who made their

SELECT 
    ROUND(COUNT(player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Activity
WHERE (player_id, DATE_SUB(event_date, INTERVAL 1 DAY)) IN (
    SELECT player_id, MIN(event_date)
    FROM Activity
    GROUP BY player_id
);


# 23rd question of top 50
# Write a MySQL query to find the teacher_id and the count of subjects taught by each

select teacher_id,
 count(DISTINCT subject_id) as cnt
from Teacher
 group by teacher_id




 # 24th question of top 50
# Write a MySQL query to find the day and the count of active users for each day

SELECT 
    activity_date AS day, 
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;



# 25th question of top 50
# Write a MySQL query to find the product_id, first_year, quantity and price of

select product_id ,
year as first_year ,
  quantity ,
   price 

   from Sales 
   where ( product_id, year ) in (select product_id, min(year) 
   from Sales
   group by product_id);




   # 26th question of top 50
# Write a MySQL query to find the class of all courses that have at least 5

select class

from Courses 
group by class
HAVING COUNT(student) >= 5;


# 27th question of top 50
# Write a MySQL query to find the user_id and the count of followers for all users

select  user_id, 
count(follower_id) as followers_count

from Followers
group by user_id
order by user_id asc




# 28th question of top 50
# Write a MySQL query to find the num of all unique numbers in MyNumbers

select  max(num) as num 
from(
    select num 
    from MyNumbers
    group by num
    having count(num)=1
) as unique_nums;


# 29th question of top 50
# Write a MySQL query to find the customer_id of all customers who have bought all products

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = 
(SELECT COUNT(*) FROM Product);


# 30th question of top 50
# Write a MySQL query to find the employee_id, name, count of reports and average

select 
  distinct(reports_to) as employee_id,
  (select name from Employees where employee_id=e.reports_to) as name ,
  count(reports_to) as reports_count, 
  Round(AVG(age)) as average_age

  from Employees e
  where reports_to <> 'null'
  group by reports_to
  order by employee_id asc ;



  # 31st question of top 50
# Write a MySQL query to find the employee_id and department_id of all employees who are

SELECT 
    employee_id, 
    department_id
FROM Employee
WHERE primary_flag = 'Y'

UNION

SELECT 
    employee_id, 
    department_id
FROM Employee
GROUP BY employee_id
HAVING COUNT(employee_id) = 1;



# 32nd question of top 50
# Write a MySQL query to find the x, y, z and whether they can form

select x, y, z, 
case when x+y>z and x+z>y and y+z>x then 'Yes' else 'No' end as triangle

from Triangle


# 33rd question of top 50
# Write a MySQL query to find the id of all logs that have the same num as

select distinct l2.num as ConsecutiveNums
from Logs l1
join Logs l2 on l1.id=l2.id-1
join Logs l3 on l1.id=l3.id-2

where l1.num =l2.num and l2.num =l3.num


# 34th question of top 50
# Write a MySQL query to find the product_id and price of all products in the Products

SELECT product_id, new_price AS price
FROM Products
WHERE (product_id, change_date) IN (
    SELECT product_id, MAX(change_date)
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)

UNION

SELECT DISTINCT product_id, 10 AS price
FROM Products
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16';



# 35th question of top 50
# Write a MySQL query to find the person_name of the person who is at the front

SELECT a.person_name
FROM Queue a 
JOIN Queue b ON a.turn >= b.turn
GROUP BY a.turn
HAVING SUM(b.weight) <= 1000
ORDER BY a.turn DESC
LIMIT 1;


# 36th question of top 50
# Write a MySQL query to find the category of all accounts based on their income


SELECT 'Low Salary' AS category, COUNT(*) AS accounts_count
FROM Accounts
WHERE income < 20000

UNION


SELECT 'Average Salary' AS category, COUNT(*) AS accounts_count
FROM Accounts
WHERE income >= 20000 AND income <= 50000

UNION

SELECT 'High Salary' AS category, COUNT(*) AS accounts_count
FROM Accounts
WHERE income > 50000;


# 37th question of top 50
# Write a MySQL query to find the employee_id of all employees who have a salary less

SELECT employee_id
FROM Employees
WHERE salary < 30000 
  AND manager_id NOT IN (
    SELECT employee_id 
    FROM Employees
  )
ORDER BY employee_id;


# 38th question of top 50
# Write a MySQL query to find the id of all seats that are adjacent to an occupied
select 
CASE
    WHEN id % 2 = 1 AND id != (SELECT MAX(id) FROM Seat) THEN id + 1
    WHEN id % 2 = 0 THEN id - 1
    ELSE id
END AS id, student
from Seat
order by id asc

# 39th question of top 50
# Write a MySQL query to find the name of the user who has rated the most movies
(SELECT name AS results
 FROM MovieRating 
 JOIN Users USING(user_id)
 GROUP BY user_id
 ORDER BY COUNT(*) DESC, name ASC
 LIMIT 1)

UNION ALL

(SELECT title AS results
 FROM MovieRating 
 JOIN Movies USING(movie_id)
 WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
 GROUP BY movie_id
 ORDER BY AVG(rating) DESC, title ASC
 LIMIT 1);