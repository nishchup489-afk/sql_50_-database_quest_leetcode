-- Table: Employee

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | salary      | int     |
-- | managerId   | int     |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.
 

-- Write a solution to find the employees who earn more than their managers.

-- Return the result table in any order.

-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- Employee table:
-- +----+-------+--------+-----------+
-- | id | name  | salary | managerId |
-- +----+-------+--------+-----------+
-- | 1  | Joe   | 70000  | 3         |
-- | 2  | Henry | 80000  | 4         |
-- | 3  | Sam   | 60000  | Null      |
-- | 4  | Max   | 90000  | Null      |
-- +----+-------+--------+-----------+
-- Output: 
-- +----------+
-- | Employee |
-- +----------+
-- | Joe      |
-- +----------+
-- Explanation: Joe is the only employee who earns more than his manager.




DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
    id INTEGER PRIMARY KEY,
    name VARCHAR(30),
    salary INTEGER,
    manager_id INTEGER REFERENCES employee(id)
);

INSERT INTO employee (id, name, salary, manager_id)
VALUES
    (3, 'Sam', 60000, NULL),
    (4, 'Max', 90000, NULL),
    (1, 'Joe', 70000, 3),
    (2, 'Henry', 80000, 4);



select e.name employee from employee e inner join employee m on e.manager_id = m.id where e.salary > m.salary;


 select e1.name employee from employee e1 where e1.salary >  ( select e2.salary from employee e2 where e2.id = e1.manager_id);