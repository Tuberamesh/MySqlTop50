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