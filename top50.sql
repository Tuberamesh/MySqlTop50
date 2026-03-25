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
 
 