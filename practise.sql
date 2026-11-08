# Write your MySQL query statement below
#select the second highest salary from the Employee table. If there is no second highest salary, return null.

select (
    select distinct salary
    from Employee
    order by salary desc
    limit 1 offset 1
    )AS SecondHighestSalary


#Nth highest salary problem
#problem: Write a SQL query to get the nth highest salary from the Employee table. If there is no nth highest salary, return null.
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    DECLARE offset_value INT;
    SET offset_value = N - 1;

    RETURN (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT offset_value, 1
    );
END


#combine the Person and Address tables to get the first name, last name, city, and state of each person. If a person does not have an address, still include them in the result set with null values for city and state.
SELECT
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a
ON p.personId = a.personId;


# Find the rank of each score
SELECT 
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS `rank`
FROM Scores;



# Find the employees whose salary is greater than their manager's salary
select e.name as Employee
from Employee e
join Employee m
on m.id=e.managerId

where e.salary>m.salary


# Find the duplicate emails in the Person table
select email as Email
from Person
group by email
having count(email)>1;

# Find the customers who have not placed any orders

select name Customers 
from Customers 
where id not in(select CustomerId from Orders);


# Find the employees with the highest salary in each department
select d.name as Department,
e.name as Employee ,
e.salary as Salary

from Employee e
join  Department d
on e.departmentId =d.id

WHERE (e.departmentId, e.salary) IN (
    SELECT departmentId, MAX(salary)
    FROM Employee
    GROUP BY departmentId
);



# Find the cancellation rate for each day between October 1, 2013, and October 3, 2013, for trips where both the client and driver are not banned. The cancellation rate is defined as the number of trips that were not completed divided by the total number of trips for that day.
SELECT
    Request_at AS Day,
    ROUND(
        SUM(CASE
            WHEN Status != 'completed' THEN 1
            ELSE 0
        END) * 1.0 / COUNT(*),
        2
    ) AS `Cancellation Rate`

FROM Trips

WHERE Request_at BETWEEN '2013-10-01' AND '2013-10-03'

AND Client_Id IN (
    SELECT Users_Id
    FROM Users
    WHERE Banned = 'No'
)

AND Driver_Id IN (
    SELECT Users_Id
    FROM Users
    WHERE Banned = 'No'
)

GROUP BY Request_at;



# Find the first login date for each player in the Activity table
select 
player_id,
min(event_date) as first_login
from Activity
group by player_id


# Find the names of all salespeople who have not made any sales to the company named 'RED'.
SELECT name
FROM SalesPerson
WHERE sales_id NOT IN (
    SELECT o.sales_id
    FROM Orders o
    JOIN Company c
        ON o.com_id = c.com_id
    WHERE c.name = 'RED'
);



SELECT
    id,
    CASE
        WHEN p_id IS NULL THEN 'Root'
        WHEN id IN (
            SELECT p_id
            FROM Tree
        ) THEN 'Inner'
        ELSE 'Leaf'
    END AS type
FROM Tree;
