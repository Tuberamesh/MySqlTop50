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