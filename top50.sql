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