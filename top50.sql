#question 1 of top 50 

# Write a MySQL query to find the product_id of all products whose low_fats and recyclable attributes are both 'Y'.
select product_id
from Products
where low_fats ='Y'
and 
recyclable ='Y'



 