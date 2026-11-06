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