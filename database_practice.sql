1.--(HackerRank)Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

-- Equilateral: It's a triangle with  sides of equal length.
-- Isosceles: It's a triangle with  sides of equal length.
-- Scalene: It's a triangle with  sides of differing lengths.
-- Not A Triangle: The given values of A, B, and C don't form a triangle.

--SOLUTION
-- Using case expression to check statement and return the value

SELECT  
CASE WHEN (a + b <= c) OR (b + c <= a) OR (a + c <= b) THEN 'Not A Triangle' 
     WHEN (a = b) AND (b = c) THEN 'Equilateral' 
     WHEN (a = b) OR (b = c) OR (a = c) THEN 'Isosceles' 
     ELSE 'Scalene' 
END AS TriangleType FROM triangles;

2. --(LeetCode) Game Play Analysis I
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | player_id    | int     |
-- | device_id    | int     |
-- | event_date   | date    |
-- | games_played | int     |
-- +--------------+---------+
-- (player_id, event_date) is the primary key of this table.
-- This table shows the activity of players of some games.
-- Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.

-- Write an SQL query to report the first login date for each player.

-- Return the result table in any order.

-- The query result format is in the following example.
-- Input: 
-- Activity table:
-- +-----------+-----------+------------+--------------+
-- | player_id | device_id | event_date | games_played |
-- +-----------+-----------+------------+--------------+
-- | 1         | 2         | 2016-03-01 | 5            |
-- | 1         | 2         | 2016-05-02 | 6            |
-- | 2         | 3         | 2017-06-25 | 1            |
-- | 3         | 1         | 2016-03-02 | 0            |
-- | 3         | 4         | 2018-07-03 | 5            |
-- +-----------+-----------+------------+--------------+
-- Output: 
-- +-----------+-------------+
-- | player_id | first_login |
-- +-----------+-------------+
-- | 1         | 2016-03-01  |
-- | 2         | 2017-06-25  |
-- | 3         | 2016-03-02  |
-- +-----------+-------------+
--SOLUTION
--Using Min function to find out the minimum number of date from player they used to get login 

SELECT player_id, min(event_date) As first_login
from Activity
GROUP BY player_id;

3. --(Leet Code) Customer placing the largest number of Orders

-- Write an SQL query to find the customer_number for the customer who has placed the largest number of orders.
-- The test cases are generated so that exactly one customer will have placed more orders than any other customer.
-- The query result format is in the following example.
-- Input: 
-- Orders table:
-- +--------------+-----------------+
-- | order_number | customer_number |
-- +--------------+-----------------+
-- | 1            | 1               |
-- | 2            | 2               |
-- | 3            | 3               |
-- | 4            | 3               |
-- +--------------+-----------------+
-- Output: 
-- +-----------------+
-- | customer_number |
-- +-----------------+
-- | 3               |
-- +-----------------+
-- Explanation: 
-- The customer with number 3 has two orders, which is greater than either customer 1 or 2 because each of them only has one order. 
-- So the result is customer_number 3.
-- Follow up: What if more than one customer has the largest number of orders, can you find all the customer_number in this case?

--SOLUTION
-- Using GROUP BY, ORDER BY  function to find the order number 

SELECT customer_number from Orders
GROUP BY customer_number --It creates distinct groups of orders for each customer number.
ORDER BY customer_name DESC
LIMIT 1

4.--(LeetCode) Customer placing the largest number of orders
--  Write an SQL query to report the names of all the salespersons who did not have any orders related to the company with the name "RED".

-- Return the result table in any order.

-- The query result format is in the following example.

-- Input: 
-- SalesPerson table:
-- +----------+------+--------+-----------------+------------+
-- | sales_id | name | salary | commission_rate | hire_date  |
-- +----------+------+--------+-----------------+------------+
-- | 1        | John | 100000 | 6               | 4/1/2006   |
-- | 2        | Amy  | 12000  | 5               | 5/1/2010   |
-- | 3        | Mark | 65000  | 12              | 12/25/2008 |
-- | 4        | Pam  | 25000  | 25              | 1/1/2005   |
-- | 5        | Alex | 5000   | 10              | 2/3/2007   |
-- +----------+------+--------+-----------------+------------+
-- Company table:
-- +--------+--------+----------+
-- | com_id | name   | city     |
-- +--------+--------+----------+
-- | 1      | RED    | Boston   |
-- | 2      | ORANGE | New York |
-- | 3      | YELLOW | Boston   |
-- | 4      | GREEN  | Austin   |
-- +--------+--------+----------+
-- Orders table:
-- +----------+------------+--------+----------+--------+
-- | order_id | order_date | com_id | sales_id | amount |
-- +----------+------------+--------+----------+--------+
-- | 1        | 1/1/2014   | 3      | 4        | 10000  |
-- | 2        | 2/1/2014   | 4      | 5        | 5000   |
-- | 3        | 3/1/2014   | 1      | 1        | 50000  |
-- | 4        | 4/1/2014   | 1      | 4        | 25000  |
-- +----------+------------+--------+----------+--------+
-- Output: 
-- +------+
-- | name |
-- +------+
-- | Amy  |
-- | Mark |
-- | Alex |
-- +------+
-- Explanation: 
-- According to orders 3 and 4 in the Orders table, it is easy to tell that only salesperson John and Pam have sales to company RED, so we report all the other names in the table salesperson.

--SOLUTION 
-- Using Subqery to get the name who have sales to company red and then using NOT IN function to check who has not sales to compnmay red.

SELECT SalesPerson.name FROM SalesPerson
WHERE SalesPerson.name NOT IN (
     SELECT SalesPerson.name FROM SalesPerson
          LEFT JOIN Orders
               ON SalesPerson.sales_id = Orders.sales_id
          LEFT JOIN Company
               on Orders.com_id = Company.com_id
WHERE Company.name = 'RED')


5. --(LeetCode) > Triangle Judgement
-- Write an SQL query to report for every three line segments whether they can form a triangle.
-- Return the result table in any order.
-- The query result format is in the following example.

-- Input: 
-- Triangle table:
-- +----+----+----+
-- | x  | y  | z  |
-- +----+----+----+
-- | 13 | 15 | 30 |
-- | 10 | 20 | 15 |
-- +----+----+----+
-- Output: 
-- +----+----+----+----------+
-- | x  | y  | z  | triangle |
-- +----+----+----+----------+
-- | 13 | 15 | 30 | No       |
-- | 10 | 20 | 15 | Yes      |
-- +----+----+----+----------+


--SOLUTION
-- using CASE expression to find out that by given measurement triangle can be made or not.

SELECT x,y,z,
CASE WHEN (x+y<=z) OR (y+z<=x) OR (x+z<=y) THEN 'No'
     ELSE 'Yes'
END AS triangle from Triangle

6.--(LeetCode) Actors and Directors Who Cooperated At Least Three Times
-- Write a SQL query for a report that provides the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.

-- Return the result table in any order.

-- The query result format is in the following example.

-- Input: 
-- ActorDirector table:
-- +-------------+-------------+-------------+
-- | actor_id    | director_id | timestamp   |
-- +-------------+-------------+-------------+
-- | 1           | 1           | 0           |
-- | 1           | 1           | 1           |
-- | 1           | 1           | 2           |
-- | 1           | 2           | 3           |
-- | 1           | 2           | 4           |
-- | 2           | 1           | 5           |
-- | 2           | 1           | 6           |
-- +-------------+-------------+-------------+
-- Output: 
-- +-------------+-------------+
-- | actor_id    | director_id |
-- +-------------+-------------+
-- | 1           | 1           |
-- +-------------+-------------+
-- Explanation: The only pair is (1, 1) where they cooperated exactly 3 times.

-- Solution 
-- I am using group by and having function to find out the pairs

SELECT actor_id, director_id From ActorDirector
group by actor_id,director_id
having count(timestamp)>=3


7 --(Leetcode) Product Sales Analysis I

-- Write an SQL query that reports the product_name, year, and price for each sale_id in the Sales table.

-- Return the resulting table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Sales table:
-- +---------+------------+------+----------+-------+
-- | sale_id | product_id | year | quantity | price |
-- +---------+------------+------+----------+-------+ 
-- | 1       | 100        | 2008 | 10       | 5000  |
-- | 2       | 100        | 2009 | 12       | 5000  |
-- | 7       | 200        | 2011 | 15       | 9000  |
-- +---------+------------+------+----------+-------+
-- Product table:
-- +------------+--------------+
-- | product_id | product_name |
-- +------------+--------------+
-- | 100        | Nokia        |
-- | 200        | Apple        |
-- | 300        | Samsung      |
-- +------------+--------------+
-- Output: 
-- +--------------+-------+-------+
-- | product_name | year  | price |
-- +--------------+-------+-------+
-- | Nokia        | 2008  | 5000  |
-- | Nokia        | 2009  | 5000  |
-- | Apple        | 2011  | 9000  |
-- +--------------+-------+-------+
-- Explanation: 
-- From sale_id = 1, we can conclude that Nokia was sold for 5000 in the year 2008.
-- From sale_id = 2, we can conclude that Nokia was sold for 5000 in the year 2009.
-- From sale_id = 7, we can conclude that Apple was sold for 9000 in the year 2011.

-- Solution 
--  I have used left join on product table

SELECT Product.product_name, Sales.year, Sales.price From Sales
LEFT JOIN Product ON Sales.product_id = Product.product_id


8 --(Leetcode) Project Employees 1

-- Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

-- Return the result table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Project table:
-- +-------------+-------------+
-- | project_id  | employee_id |
-- +-------------+-------------+
-- | 1           | 1           |
-- | 1           | 2           |
-- | 1           | 3           |
-- | 2           | 1           |
-- | 2           | 4           |
-- +-------------+-------------+
-- Employee table:
-- +-------------+--------+------------------+
-- | employee_id | name   | experience_years |
-- +-------------+--------+------------------+
-- | 1           | Khaled | 3                |
-- | 2           | Ali    | 2                |
-- | 3           | John   | 1                |
-- | 4           | Doe    | 2                |
-- +-------------+--------+------------------+
-- Output: 
-- +-------------+---------------+
-- | project_id  | average_years |
-- +-------------+---------------+
-- | 1           | 2.00          |
-- | 2           | 2.50          |
-- +-------------+---------------+
-- Explanation: The average experience years for the first project is (3 + 2 + 1) / 3 = 2.00 and for the second project is (3 + 2) / 2 = 2.50

-- Solution 
--  I am using Inne join and round function 

SELECT Project.project_id, Round(AVG(Employee.experience_years),2) as 'average_years' from Employee
INNER JOIN Project ON Project.employee_id = Employee.employee_id
group by Project.project_id

9. --(Leetcode) Write an SQL query that reports the products that were only sold in the first quarter of 2019. That is, between 2019-01-01 and 2019-03-31 inclusive.

-- Return the result table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Product table:
-- +------------+--------------+------------+
-- | product_id | product_name | unit_price |
-- +------------+--------------+------------+
-- | 1          | S8           | 1000       |
-- | 2          | G4           | 800        |
-- | 3          | iPhone       | 1400       |
-- +------------+--------------+------------+
-- Sales table:
-- +-----------+------------+----------+------------+----------+-------+
-- | seller_id | product_id | buyer_id | sale_date  | quantity | price |
-- +-----------+------------+----------+------------+----------+-------+
-- | 1         | 1          | 1        | 2019-01-21 | 2        | 2000  |
-- | 1         | 2          | 2        | 2019-02-17 | 1        | 800   |
-- | 2         | 2          | 3        | 2019-06-02 | 1        | 800   |
-- | 3         | 3          | 4        | 2019-05-13 | 2        | 2800  |
-- +-----------+------------+----------+------------+----------+-------+
-- Output: 
-- +-------------+--------------+
-- | product_id  | product_name |
-- +-------------+--------------+
-- | 1           | S8           |
-- +-------------+--------------+
-- Explanation: 
-- The product with id 1 was only sold in the spring of 2019.
-- The product with id 2 was sold in the spring of 2019 but was also sold after the spring of 2019.
-- The product with id 3 was sold after spring 2019.
-- We return only product 1 as it is the product that was only sold in the spring of 2019.


--Solution
--I am using Left Join, group by and having function with min and max

SELECT Product.product_id, product_name as 'product_name' from Sales
LEFT JOIN Product ON Product.product_id = Sales.product_id
Group by Sales.product_id
Having min(Sales.sale_date) >= '2019-01-01' and max(Sales.sale_date) <= '2019-03-31'


10. --(LeetCode) User Activity for the Past 30 Days I

-- Write an SQL query to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on someday if they made at least one activity on that day.

-- Return the result table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Activity table:
-- +---------+------------+---------------+---------------+
-- | user_id | session_id | activity_date | activity_type |
-- +---------+------------+---------------+---------------+
-- | 1       | 1          | 2019-07-20    | open_session  |
-- | 1       | 1          | 2019-07-20    | scroll_down   |
-- | 1       | 1          | 2019-07-20    | end_session   |
-- | 2       | 4          | 2019-07-20    | open_session  |
-- | 2       | 4          | 2019-07-21    | send_message  |
-- | 2       | 4          | 2019-07-21    | end_session   |
-- | 3       | 2          | 2019-07-21    | open_session  |
-- | 3       | 2          | 2019-07-21    | send_message  |
-- | 3       | 2          | 2019-07-21    | end_session   |
-- | 4       | 3          | 2019-06-25    | open_session  |
-- | 4       | 3          | 2019-06-25    | end_session   |
-- +---------+------------+---------------+---------------+
-- Output: 
-- +------------+--------------+ 
-- | day        | active_users |
-- +------------+--------------+ 
-- | 2019-07-20 | 2            |
-- | 2019-07-21 | 2            |
-- +------------+--------------+ 
-- Explanation: Note that we do not care about days with zero active users.

--Solution
SELECT activity_date as 'day', count(distinct(user_id)) as 'active_users' From Activity
where activity_date >='2019-06-28' AND activity_date <='2019-07-27'
group by activity_date



11. --(LeetCode) Article Views I
-- Write an SQL query to find all the authors that viewed at least one of their own articles.

-- Return the result table sorted by id in ascending order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Views table:
-- +------------+-----------+-----------+------------+
-- | article_id | author_id | viewer_id | view_date  |
-- +------------+-----------+-----------+------------+
-- | 1          | 3         | 5         | 2019-08-01 |
-- | 1          | 3         | 6         | 2019-08-02 |
-- | 2          | 7         | 7         | 2019-08-01 |
-- | 2          | 7         | 6         | 2019-08-02 |
-- | 4          | 7         | 1         | 2019-07-22 |
-- | 3          | 4         | 4         | 2019-07-21 |
-- | 3          | 4         | 4         | 2019-07-21 |
-- +------------+-----------+-----------+------------+
-- Output: 
-- +------+
-- | id   |
-- +------+
-- | 4    |
-- | 7    |
-- +------+


-- Solution
-- I have used distinct function to get the unique value from views

select distinct(author_id) as id from Views
where author_id = viewer_id
order by author_id Asc


12. --(Leetcode) Average Selling Price
-- Write an SQL query to find the average selling price for each product. average_price should be rounded to 2 decimal places.

-- Return the result table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Prices table:
-- +------------+------------+------------+--------+
-- | product_id | start_date | end_date   | price  |
-- +------------+------------+------------+--------+
-- | 1          | 2019-02-17 | 2019-02-28 | 5      |
-- | 1          | 2019-03-01 | 2019-03-22 | 20     |
-- | 2          | 2019-02-01 | 2019-02-20 | 15     |
-- | 2          | 2019-02-21 | 2019-03-31 | 30     |
-- +------------+------------+------------+--------+
-- UnitsSold table:
-- +------------+---------------+-------+
-- | product_id | purchase_date | units |
-- +------------+---------------+-------+
-- | 1          | 2019-02-25    | 100   |
-- | 1          | 2019-03-01    | 15    |
-- | 2          | 2019-02-10    | 200   |
-- | 2          | 2019-03-22    | 30    |
-- +------------+---------------+-------+
-- Output: 
-- +------------+---------------+
-- | product_id | average_price |
-- +------------+---------------+
-- | 1          | 6.96          |
-- | 2          | 16.96         |
-- +------------+---------------+
-- Explanation: 
-- Average selling price = Total Price of Product / Number of products sold.
-- Average selling price for product 1 = ((100 * 5) + (15 * 20)) / 115 = 6.96
-- Average selling price for product 2 = ((200 * 15) + (30 * 30)) / 230 = 16.96

--Solution 
--I have used Distinct, Round, Left Join, Between and Group by function to find the average of the selling price

SELECT DISTINCT(Prices.product_id), round(sum(price * units) / sum(units), 2) as 'average_price' FROM Prices
LEFT JOIN UnitsSold ON UnitsSold.product_id = Prices.product_id
WHERE UnitsSold.purchase_date Between Prices.start_date and Prices.end_date
GROUP BY Prices.product_id



15. --(Leetcode) Students and Examinations
-- Write an SQL query to find the number of times each student attended each exam.

-- Return the result table ordered by student_id and subject_name.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Students table:
-- +------------+--------------+
-- | student_id | student_name |
-- +------------+--------------+
-- | 1          | Alice        |
-- | 2          | Bob          |
-- | 13         | John         |
-- | 6          | Alex         |
-- +------------+--------------+
-- Subjects table:
-- +--------------+
-- | subject_name |
-- +--------------+
-- | Math         |
-- | Physics      |
-- | Programming  |
-- +--------------+
-- Examinations table:
-- +------------+--------------+
-- | student_id | subject_name |
-- +------------+--------------+
-- | 1          | Math         |
-- | 1          | Physics      |
-- | 1          | Programming  |
-- | 2          | Programming  |
-- | 1          | Physics      |
-- | 1          | Math         |
-- | 13         | Math         |
-- | 13         | Programming  |
-- | 13         | Physics      |
-- | 2          | Math         |
-- | 1          | Math         |
-- +------------+--------------+
-- Output: 
-- +------------+--------------+--------------+----------------+
-- | student_id | student_name | subject_name | attended_exams |
-- +------------+--------------+--------------+----------------+
-- | 1          | Alice        | Math         | 3              |
-- | 1          | Alice        | Physics      | 2              |
-- | 1          | Alice        | Programming  | 1              |
-- | 2          | Bob          | Math         | 1              |
-- | 2          | Bob          | Physics      | 0              |
-- | 2          | Bob          | Programming  | 1              |
-- | 6          | Alex         | Math         | 0              |
-- | 6          | Alex         | Physics      | 0              |
-- | 6          | Alex         | Programming  | 0              |
-- | 13         | John         | Math         | 1              |
-- | 13         | John         | Physics      | 1              |
-- | 13         | John         | Programming  | 1              |
-- +------------+--------------+--------------+----------------+
-- Explanation: 
-- The result table should contain all students and all subjects.
-- Alice attended the Math exam 3 times, the Physics exam 2 times, and the Programming exam 1 time.
-- Bob attended the Math exam 1 time, the Programming exam 1 time, and did not attend the Physics exam.
-- Alex did not attend any exams.
-- John attended the Math exam 1 time, the Physics exam 1 time, and the Programming exam 1 time.


-- SOLUTION
-- I have used JOIN Clause , Left Join, GROUP BY and ORDER BY 

SELECT Students.student_id, Students.student_name, Subjects.subject_name, count(Examinations.student_id) as 'attended_exams' From Students
JOIN Subjects LEFT JOIN Examinations ON Examinations.student_id = Students.student_id
AND Subjects.subject_name = Examinations.subject_name
GROUP BY Students.student_id, Subjects.subject_name --creates unique combination
ORDER BY student_id ASC, subject_name ASC



14. --(Leetcode) List the Products Ordered in a Period
-- Write an SQL query to get the names of products that have at least 100 units ordered in February 2020 and their amount.

-- Return result table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Products table:
-- +-------------+-----------------------+------------------+
-- | product_id  | product_name          | product_category |
-- +-------------+-----------------------+------------------+
-- | 1           | Leetcode Solutions    | Book             |
-- | 2           | Jewels of Stringology | Book             |
-- | 3           | HP                    | Laptop           |
-- | 4           | Lenovo                | Laptop           |
-- | 5           | Leetcode Kit          | T-shirt          |
-- +-------------+-----------------------+------------------+
-- Orders table:
-- +--------------+--------------+----------+
-- | product_id   | order_date   | unit     |
-- +--------------+--------------+----------+
-- | 1            | 2020-02-05   | 60       |
-- | 1            | 2020-02-10   | 70       |
-- | 2            | 2020-01-18   | 30       |
-- | 2            | 2020-02-11   | 80       |
-- | 3            | 2020-02-17   | 2        |
-- | 3            | 2020-02-24   | 3        |
-- | 4            | 2020-03-01   | 20       |
-- | 4            | 2020-03-04   | 30       |
-- | 4            | 2020-03-04   | 60       |
-- | 5            | 2020-02-25   | 50       |
-- | 5            | 2020-02-27   | 50       |
-- | 5            | 2020-03-01   | 50       |
-- +--------------+--------------+----------+
-- Output: 
-- +--------------------+---------+
-- | product_name       | unit    |
-- +--------------------+---------+
-- | Leetcode Solutions | 130     |
-- | Leetcode Kit       | 100     |
-- +--------------------+---------+
-- Explanation: 
-- Products with product_id = 1 is ordered in February a total of (60 + 70) = 130.
-- Products with product_id = 2 is ordered in February a total of 80.
-- Products with product_id = 3 is ordered in February a total of (2 + 3) = 5.
-- Products with product_id = 4 was not ordered in February 2020.
-- Products with product_id = 5 is ordered in February a total of (50 + 50) = 100.

-- SOLUTION
-- I have used Left Join, Group by and having function to find out the products ordered in period

SELECT Products.product_name, sum(Orders.unit) as 'unit' from Products
LEFT JOIN Orders On Orders.product_id = Products.product_id
WHERE Orders.order_date  >= '2020-02-01' and Orders.order_date <= '2020-02-29' 
Group by Products.product_name
having sum(Orders.unit) >= 100


15. --(Leetcode) Replace Employee ID With The Unique Identifier
-- Write an SQL query to show the unique ID of each user, If a user does not have a unique ID replace just show null.

-- Return the result table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Employees table:
-- +----+----------+
-- | id | name     |
-- +----+----------+
-- | 1  | Alice    |
-- | 7  | Bob      |
-- | 11 | Meir     |
-- | 90 | Winston  |
-- | 3  | Jonathan |
-- +----+----------+
-- EmployeeUNI table:
-- +----+-----------+
-- | id | unique_id |
-- +----+-----------+
-- | 3  | 1         |
-- | 11 | 2         |
-- | 90 | 3         |
-- +----+-----------+
-- Output: 
-- +-----------+----------+
-- | unique_id | name     |
-- +-----------+----------+
-- | null      | Alice    |
-- | null      | Bob      |
-- | 2         | Meir     |
-- | 3         | Winston  |
-- | 1         | Jonathan |
-- +-----------+----------+
-- Explanation: 
-- Alice and Bob do not have a unique ID, We will show null instead.
-- The unique ID of Meir is 2.
-- The unique ID of Winston is 3.
-- The unique ID of Jonathan is 1.

-- SOLUTION
-- I have used LEFT JOIN for unique Identifier

SELECT EmployeeUNI.unique_id , Employees.name from Employees
LEFT JOIN EmployeeUNI ON EmployeeUNI.id = Employees.id

16. --(LeetCode) Top Travellers
-- Write an SQL query to report the distance traveled by each user.

-- Return the result table ordered by travelled_distance in descending order, if two or more users traveled the same distance, order them by their name in ascending order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Users table:
-- +------+-----------+
-- | id   | name      |
-- +------+-----------+
-- | 1    | Alice     |
-- | 2    | Bob       |
-- | 3    | Alex      |
-- | 4    | Donald    |
-- | 7    | Lee       |
-- | 13   | Jonathan  |
-- | 19   | Elvis     |
-- +------+-----------+
-- Rides table:
-- +------+----------+----------+
-- | id   | user_id  | distance |
-- +------+----------+----------+
-- | 1    | 1        | 120      |
-- | 2    | 2        | 317      |
-- | 3    | 3        | 222      |
-- | 4    | 7        | 100      |
-- | 5    | 13       | 312      |
-- | 6    | 19       | 50       |
-- | 7    | 7        | 120      |
-- | 8    | 19       | 400      |
-- | 9    | 7        | 230      |
-- +------+----------+----------+
-- Output: 
-- +----------+--------------------+
-- | name     | travelled_distance |
-- +----------+--------------------+
-- | Elvis    | 450                |
-- | Lee      | 450                |
-- | Bob      | 317                |
-- | Jonathan | 312                |
-- | Alex     | 222                |
-- | Alice    | 120                |
-- | Donald   | 0                  |
-- +----------+--------------------+
-- Explanation: 
-- Elvis and Lee traveled 450 miles, Elvis is the top traveler as his name is alphabetically smaller than Lee.
-- Bob, Jonathan, Alex, and Alice have only one ride and we just order them by the total distances of the ride.
-- Donald did not have any rides, the distance traveled by him is 0.

-- SOLUTION
-- I have used COALESCE function to handle the cases wher a user has no associated rides and replacing the NULL values with 0

SELECT Users.name, COALESCE(Sum(Rides.distance),0) as 'travelled_distance' From Users
LEFT JOIN Rides ON Users.id = Rides.user_id
Group BY user_id
ORDER BY travelled_distance DESC, Users.name ASC

17.--(LeetCode) Group Sold Products By The Date
-- Write an SQL query to find for each date the number of different products sold and their names.

-- The sold products names for each date should be sorted lexicographically.

-- Return the result table ordered by sell_date.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Activities table:
-- +------------+------------+
-- | sell_date  | product     |
-- +------------+------------+
-- | 2020-05-30 | Headphone  |
-- | 2020-06-01 | Pencil     |
-- | 2020-06-02 | Mask       |
-- | 2020-05-30 | Basketball |
-- | 2020-06-01 | Bible      |
-- | 2020-06-02 | Mask       |
-- | 2020-05-30 | T-Shirt    |
-- +------------+------------+
-- Output: 
-- +------------+----------+------------------------------+
-- | sell_date  | num_sold | products                     |
-- +------------+----------+------------------------------+
-- | 2020-05-30 | 3        | Basketball,Headphone,T-shirt |
-- | 2020-06-01 | 2        | Bible,Pencil                 |
-- | 2020-06-02 | 1        | Mask                         |
-- +------------+----------+------------------------------+
-- Explanation: 
-- For 2020-05-30, Sold items were (Headphone, Basketball, T-shirt), we sort them lexicographically and separate them by a comma.
-- For 2020-06-01, Sold items were (Pencil, Bible), we sort them lexicographically and separate them by a comma.
-- For 2020-06-02, the Sold item is (Mask), we just return it.

--SOLUTION 
-- I have used Distinct, Count function to get the unique value from the table and to get the produts according to sell date I have used group_concat()

SELECT DISTINCT(sell_date) as 'sell_date', Count(Distinct(product)) as 'num_sold', 
group_concat(Distinct(product) order by product) as 'products' 
From Activities
GROUP BY sell_date
ORDER BY sell_date

18. --(Leetcode)
-- Write an SQL query to find the users who have valid emails.
-- A valid e-mail has a prefix name and a domain where:

-- The prefix name is a string that may contain letters (upper or lower case), digits, underscore '_', period '.', and/or dash '-'. The prefix name must start with a letter.
-- The domain is '@leetcode.com'.
-- Return the result table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Users table:
-- +---------+-----------+-------------------------+
-- | user_id | name      | mail                    |
-- +---------+-----------+-------------------------+
-- | 1       | Winston   | winston@leetcode.com    |
-- | 2       | Jonathan  | jonathanisgreat         |
-- | 3       | Annabelle | bella-@leetcode.com     |
-- | 4       | Sally     | sally.come@leetcode.com |
-- | 5       | Marwan    | quarz#2020@leetcode.com |
-- | 6       | David     | david69@gmail.com       |
-- | 7       | Shapiro   | .shapo@leetcode.com     |
-- +---------+-----------+-------------------------+
-- Output: 
-- +---------+-----------+-------------------------+
-- | user_id | name      | mail                    |
-- +---------+-----------+-------------------------+
-- | 1       | Winston   | winston@leetcode.com    |
-- | 3       | Annabelle | bella-@leetcode.com     |
-- | 4       | Sally     | sally.come@leetcode.com |
-- +---------+-----------+-------------------------+
-- Explanation: 
-- The mail of user 2 does not have a domain.
-- The mail of user 5 has the # sign which is not allowed.
-- The mail of user 6 does not have the leetcode domain.
-- The mail of user 7 starts with a period.

-- SOLUTION
-- I used regular expression (REGEXP) to find out the valid emails

select * from Users
WHERE mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\\.com$'

19. --(LeetCode) Recyclable and low fat products
--Write an SQL query to find the ids of products that are both low fat and recyclable.

-- Return the result table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Products table:
-- +-------------+----------+------------+
-- | product_id  | low_fats | recyclable |
-- +-------------+----------+------------+
-- | 0           | Y        | N          |
-- | 1           | Y        | Y          |
-- | 2           | N        | Y          |
-- | 3           | Y        | Y          |
-- | 4           | N        | N          |
-- +-------------+----------+------------+
-- Output: 
-- +-------------+
-- | product_id  |
-- +-------------+
-- | 1           |
-- | 3           |
-- +-------------+
-- Explanation: Only products 1 and 3 are both low fat and recyclable.

-- SOLUTION
-- Simple solution using where clause

SELECT product_id from Products
WHERE low_fats = 'Y' and recyclable = 'Y'

20. --(Leetcode) Find Customer referee
-- Write an SQL query to report the names of the customer that are not referred by the customer with id = 2.

-- Return the result table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Customer table:
-- +----+------+------------+
-- | id | name | referee_id |
-- +----+------+------------+
-- | 1  | Will | null       |
-- | 2  | Jane | null       |
-- | 3  | Alex | 2          |
-- | 4  | Bill | null       |
-- | 5  | Zack | 1          |
-- | 6  | Mark | 2          |
-- +----+------+------------+
-- Output: 
-- +------+
-- | name |
-- +------+
-- | Will |
-- | Jane |
-- | Bill |
-- | Zack |
-- +------+

--SOLUTION 
-- Simple where clause

SELECT name FROM Customer
Where referee_id !='2' OR referee_id is null

21. --(LeetCode) Big Countries
-- A country is big if:

-- it has an area of at least three million (i.e., 3000000 km2), or
-- it has a population of at least twenty-five million (i.e., 25000000).
-- Write an SQL query to report the name, population, and area of the big countries.

-- Return the result table in any order.

-- The query result format is in the following example.


-- Example 1:

-- Input: 
-- World table:
-- +-------------+-----------+---------+------------+--------------+
-- | name        | continent | area    | population | gdp          |
-- +-------------+-----------+---------+------------+--------------+
-- | Afghanistan | Asia      | 652230  | 25500100   | 20343000000  |
-- | Albania     | Europe    | 28748   | 2831741    | 12960000000  |
-- | Algeria     | Africa    | 2381741 | 37100000   | 188681000000 |
-- | Andorra     | Europe    | 468     | 78115      | 3712000000   |
-- | Angola      | Africa    | 1246700 | 20609294   | 100990000000 |
-- +-------------+-----------+---------+------------+--------------+
-- Output: 
-- +-------------+------------+---------+
-- | name        | population | area    |
-- +-------------+------------+---------+
-- | Afghanistan | 25500100   | 652230  |
-- | Algeria     | 37100000   | 2381741 |
-- +-------------+------------+---------+


--SOLUTION 
--Simple where clause 
SELECT name, population, area from World
where area >= '3000000' or population >= '25000000'


22. --(LeetCode) Invalid tweets
-- Write an SQL query to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

-- Return the result table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Tweets table:
-- +----------+----------------------------------+
-- | tweet_id | content                          |
-- +----------+----------------------------------+
-- | 1        | Vote for Biden                   |
-- | 2        | Let us make America great again! |
-- +----------+----------------------------------+
-- Output: 
-- +----------+
-- | tweet_id |
-- +----------+
-- | 2        |
-- +----------+
-- Explanation: 
-- Tweet 1 has length = 14. It is a valid tweet.
-- Tweet 2 has length = 32. It is an invalid tweet.

-- SOLUTION
--  I have used length fucntion to count the content.

SELECT tweet_id from Tweets
WHERE LENGTH(content) > '15'


23. --(LeetCode) Customer Who Visited but Did Not Make Any Transactions
-- Write a SQL query to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.

-- Return the result table sorted in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Visits
-- +----------+-------------+
-- | visit_id | customer_id |
-- +----------+-------------+
-- | 1        | 23          |
-- | 2        | 9           |
-- | 4        | 30          |
-- | 5        | 54          |
-- | 6        | 96          |
-- | 7        | 54          |
-- | 8        | 54          |
-- +----------+-------------+
-- Transactions
-- +----------------+----------+--------+
-- | transaction_id | visit_id | amount |
-- +----------------+----------+--------+
-- | 2              | 5        | 310    |
-- | 3              | 5        | 300    |
-- | 9              | 5        | 200    |
-- | 12             | 1        | 910    |
-- | 13             | 2        | 970    |
-- +----------------+----------+--------+
-- Output: 
-- +-------------+----------------+
-- | customer_id | count_no_trans |
-- +-------------+----------------+
-- | 54          | 2              |
-- | 30          | 1              |
-- | 96          | 1              |
-- +-------------+----------------+
-- Explanation: 
-- Customer with id = 23 visited the mall once and made one transaction during the visit with id = 12.
-- Customer with id = 9 visited the mall once and made one transaction during the visit with id = 13.
-- Customer with id = 30 visited the mall once and did not make any transactions.
-- Customer with id = 54 visited the mall three times. During 2 visits they did not make any transactions, and during one visit they made 3 transactions.
-- Customer with id = 96 visited the mall once and did not make any transactions.
-- As we can see, users with IDs 30 and 96 visited the mall one time without making any transactions. Also, user 54 visited the mall twice and did not make any transactions.

--SOLUTION 
-- I have used subquery to check the customer who didnt make any Transactions

SELECT customer_id, count(*) AS 'count_no_trans' from Visits
WHERE visit_id NOT IN (
  SELECT visit_id FROM Transactions
)
GROUP BY customer_id
ORDER BY count_no_trans


24. --(LeetCode) Rising Temperature
-- Write an SQL query to find all dates Id with higher temperatures compared to its previous dates (yesterday).

-- Return the result table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Weather table:
-- +----+------------+-------------+
-- | id | recordDate | temperature |
-- +----+------------+-------------+
-- | 1  | 2015-01-01 | 10          |
-- | 2  | 2015-01-02 | 25          |
-- | 3  | 2015-01-03 | 20          |
-- | 4  | 2015-01-04 | 30          |
-- +----+------------+-------------+
-- Output: 
-- +----+
-- | id |
-- +----+
-- | 2  |
-- | 4  |
-- +----+
-- Explanation: 
-- In 2015-01-02, the temperature was higher than the previous day (10 -> 25).
-- In 2015-01-04, the temperature was higher than the previous day (20 -> 30).

--SOLUTION
--I have used INNER JOIN and DATEDIFF to find the id of the rising temperature

SELECT Weather.id as 'id' FROM Weather
INNER JOIN Weather as joinedWeather ON DATEDIFF(Weather.recordDate, joinedWeather.recordDate) = 1
AND Weather.temperature > joinedWeather.temperature


25. --(LeetCode) Average Time of Process per Machine
-- There is a factory website that has several machines each running the same number of processes. Write an SQL query to find the average time each machine takes to complete a process.

-- The time to complete a process is the 'end' timestamp minus the 'start' timestamp. The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.

-- The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.

-- Return the result table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Activity table:
-- +------------+------------+---------------+-----------+
-- | machine_id | process_id | activity_type | timestamp |
-- +------------+------------+---------------+-----------+
-- | 0          | 0          | start         | 0.712     |
-- | 0          | 0          | end           | 1.520     |
-- | 0          | 1          | start         | 3.140     |
-- | 0          | 1          | end           | 4.120     |
-- | 1          | 0          | start         | 0.550     |
-- | 1          | 0          | end           | 1.550     |
-- | 1          | 1          | start         | 0.430     |
-- | 1          | 1          | end           | 1.420     |
-- | 2          | 0          | start         | 4.100     |
-- | 2          | 0          | end           | 4.512     |
-- | 2          | 1          | start         | 2.500     |
-- | 2          | 1          | end           | 5.000     |
-- +------------+------------+---------------+-----------+
-- Output: 
-- +------------+-----------------+
-- | machine_id | processing_time |
-- +------------+-----------------+
-- | 0          | 0.894           |
-- | 1          | 0.995           |
-- | 2          | 1.456           |
-- +------------+-----------------+
-- Explanation: 
-- There are 3 machines running 2 processes each.
-- Machine 0's average time is ((1.520 - 0.712) + (4.120 - 3.140)) / 2 = 0.894
-- Machine 1's average time is ((1.550 - 0.550) + (1.420 - 0.430)) / 2 = 0.995
-- Machine 2's average time is ((4.512 - 4.100) + (5.000 - 2.500)) / 2 = 1.456

-- SOLUTION
-- I have used INNER JOIN, ROUND and AVG to find the processing time.

SELECT Activity.machine_id as 'machine_id', ROUND(AVG(Activity.timestamp - act.timestamp), 3) as 'processing_time' FROM Activity
INNER JOIN Activity as Act 
ON Activity.process_id = Act.process_id AND Activity.machine_id = Act.machine_id AND Activity.timestamp > Act.timestamp
GROUP BY Activity.machine_id


26. --(LeetCode) Employee Bonus
-- Write an SQL query to report the name and bonus amount of each employee with a bonus less than 1000.

-- Return the result table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Employee table:
-- +-------+--------+------------+--------+
-- | empId | name   | supervisor | salary |
-- +-------+--------+------------+--------+
-- | 3     | Brad   | null       | 4000   |
-- | 1     | John   | 3          | 1000   |
-- | 2     | Dan    | 3          | 2000   |
-- | 4     | Thomas | 3          | 4000   |
-- +-------+--------+------------+--------+
-- Bonus table:
-- +-------+-------+
-- | empId | bonus |
-- +-------+-------+
-- | 2     | 500   |
-- | 4     | 2000  |
-- +-------+-------+
-- Output: 
-- +------+-------+
-- | name | bonus |
-- +------+-------+
-- | Brad | null  |
-- | John | null  |
-- | Dan  | 500   |
-- +------+-------+

--SOLUTION
--I have used LEFT JOIN to find out the bonus less than 1000

SELECT Employee.name, Bonus.bonus FROM Employee
LEFT JOIN Bonus ON Employee.empId = Bonus.empId  
WHERE Bonus.bonus < '1000' OR Bonus.bonus is null


27. --(LeetCode) Managers with at least 5 Direct Reports
-- Write an SQL query to report the managers with at least five direct reports.

-- Return the result table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Employee table:
-- +-----+-------+------------+-----------+
-- | id  | name  | department | managerId |
-- +-----+-------+------------+-----------+
-- | 101 | John  | A          | None      |
-- | 102 | Dan   | A          | 101       |
-- | 103 | James | A          | 101       |
-- | 104 | Amy   | A          | 101       |
-- | 105 | Anne  | A          | 101       |
-- | 106 | Ron   | B          | 101       |
-- +-----+-------+------------+-----------+
-- Output: 
-- +------+
-- | name |
-- +------+
-- | John |
-- +------+


-- SOLUTION
-- I have used INNER JOIN, GROUP BY, and HAVING function to find least 5 direct reports
SELECT Distinct(Employee.name) as 'name' FROM Employee
INNER JOIN Employee as Emp ON Employee.id = Emp.managerId 
GROUP BY Employee.id, Employee.managerId
having count(*)>=5


28. --(LeetCode) Not Boring Movies
-- Write an SQL query to report the movies with an odd-numbered ID and a description that is not "boring".

-- Return the result table ordered by rating in descending order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Cinema table:
-- +----+------------+-------------+--------+
-- | id | movie      | description | rating |
-- +----+------------+-------------+--------+
-- | 1  | War        | great 3D    | 8.9    |
-- | 2  | Science    | fiction     | 8.5    |
-- | 3  | irish      | boring      | 6.2    |
-- | 4  | Ice song   | Fantacy     | 8.6    |
-- | 5  | House card | Interesting | 9.1    |
-- +----+------------+-------------+--------+
-- Output: 
-- +----+------------+-------------+--------+
-- | id | movie      | description | rating |
-- +----+------------+-------------+--------+
-- | 5  | House card | Interesting | 9.1    |
-- | 1  | War        | great 3D    | 8.9    |
-- +----+------------+-------------+--------+
-- Explanation: 
-- We have three movies with odd-numbered IDs: 1, 3, and 5. The movie with ID = 3 is boring so we do not include it in the answer.

-- SOLUTION
-- I have used where clause and order by function to find the boring

SELECT * FROM Cinema
WHERE id % 2 != 0 AND description != 'boring'
ORDER BY rating DESC


29.--(LeetCode) Percentage of Users Attended as Contest
-- Write an SQL query to find the percentage of the users registered in each contest rounded to two decimals.

-- Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.

-- The query result format is in the following example.

 

-- Example 1:

-- Input: 
-- Users table:
-- +---------+-----------+
-- | user_id | user_name |
-- +---------+-----------+
-- | 6       | Alice     |
-- | 2       | Bob       |
-- | 7       | Alex      |
-- +---------+-----------+
-- Register table:
-- +------------+---------+
-- | contest_id | user_id |
-- +------------+---------+
-- | 215        | 6       |
-- | 209        | 2       |
-- | 208        | 2       |
-- | 210        | 6       |
-- | 208        | 6       |
-- | 209        | 7       |
-- | 209        | 6       |
-- | 215        | 7       |
-- | 208        | 7       |
-- | 210        | 2       |
-- | 207        | 2       |
-- | 210        | 7       |
-- +------------+---------+
-- Output: 
-- +------------+------------+
-- | contest_id | percentage |
-- +------------+------------+
-- | 208        | 100.0      |
-- | 209        | 100.0      |
-- | 210        | 100.0      |
-- | 215        | 66.67      |
-- | 207        | 33.33      |
-- +------------+------------+
-- Explanation: 
-- All the users registered in contests 208, 209, and 210. The percentage is 100% and we sort them in the answer table by contest_id in ascending order.
-- Alice and Alex registered in contest 215 and the percentage is ((2/3) * 100) = 66.67%
-- Bob registered in contest 207 and the percentage is ((1/3) * 100) = 33.33%

--SOLUTION
--I Have used round function with left join and subquery to calculate the percentage
SELECT contest_id, ROUND(COUNT(Distinct(Register.user_id))/(SELECT COUNT(*) FROM Users) * 100, 2) as 'percentage' FROM Users
LEFT JOIN Register ON Users.user_id = Register.user_id
WHERE Register.user_id IS NOT NULL
GROUP BY Register.contest_id
ORDER BY percentage DESC, contest_id ASC


30.--(LeetCode) Queries Quality and percentage

-- We define query quality as:

-- The average of the ratio between query rating and its position.

-- We also define poor query percentage as:

-- The percentage of all queries with rating less than 3.

-- Write an SQL query to find each query_name, the quality and poor_query_percentage.

-- Both quality and poor_query_percentage should be rounded to 2 decimal places.

-- Return the result table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Queries table:
-- +------------+-------------------+----------+--------+
-- | query_name | result            | position | rating |
-- +------------+-------------------+----------+--------+
-- | Dog        | Golden Retriever  | 1        | 5      |
-- | Dog        | German Shepherd   | 2        | 5      |
-- | Dog        | Mule              | 200      | 1      |
-- | Cat        | Shirazi           | 5        | 2      |
-- | Cat        | Siamese           | 3        | 3      |
-- | Cat        | Sphynx            | 7        | 4      |
-- +------------+-------------------+----------+--------+
-- Output: 
-- +------------+---------+-----------------------+
-- | query_name | quality | poor_query_percentage |
-- +------------+---------+-----------------------+
-- | Dog        | 2.50    | 33.33                 |
-- | Cat        | 0.66    | 33.33                 |
-- +------------+---------+-----------------------+
-- Explanation: 
-- Dog queries quality is ((5 / 1) + (5 / 2) + (1 / 200)) / 3 = 2.50
-- Dog queries poor_ query_percentage is (1 / 3) * 100 = 33.33

-- Cat queries quality equals ((2 / 5) + (3 / 3) + (4 / 7)) / 3 = 0.66
-- Cat queries poor_ query_percentage is (1 / 3) * 100 = 33.33

--SOLUTION
-- I have used round and avg function to find out the percentage

SELECT query_name, ROUND(AVG(rating/position),2) as 'quality', ROUND(AVG(rating<3) * 100, 2) as 'poor_query_percentage' FROM Queries
GROUP BY query_name


31. --(LeetCode) Number of unique subjects taught by each teacher
-- Write an SQL query to report the number of unique subjects each teacher teaches in the university.

-- Return the result table in any order.

-- The query result format is shown in the following example.

-- Example 1:

-- Input: 
-- Teacher table:
-- +------------+------------+---------+
-- | teacher_id | subject_id | dept_id |
-- +------------+------------+---------+
-- | 1          | 2          | 3       |
-- | 1          | 2          | 4       |
-- | 1          | 3          | 3       |
-- | 2          | 1          | 1       |
-- | 2          | 2          | 1       |
-- | 2          | 3          | 1       |
-- | 2          | 4          | 1       |
-- +------------+------------+---------+
-- Output:  
-- +------------+-----+
-- | teacher_id | cnt |
-- +------------+-----+
-- | 1          | 2   |
-- | 2          | 4   |
-- +------------+-----+
-- Explanation: 
-- Teacher 1:
--   - They teach subject 2 in departments 3 and 4.
--   - They teach subject 3 in department 3.
-- Teacher 2:
--   - They teach subject 1 in department 1.
--   - They teach subject 2 in department 1.
--   - They teach subject 3 in department 1.
--   - They teach subject 4 in department 1.

--SOLUTION
-- I have used simple count, distinct and group by function
SELECT teacher_id, count(distinct(subject_id)) as 'cnt' from Teacher
group by teacher_id


32. --(LeetCode) Classes More Than 5 Students
-- Write an SQL query to report all the classes that have at least five students.

-- Return the result table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Courses table:
-- +---------+----------+
-- | student | class    |
-- +---------+----------+
-- | A       | Math     |
-- | B       | English  |
-- | C       | Math     |
-- | D       | Biology  |
-- | E       | Math     |
-- | F       | Computer |
-- | G       | Math     |
-- | H       | Math     |
-- | I       | Math     |
-- +---------+----------+
-- Output: 
-- +---------+
-- | class   |
-- +---------+
-- | Math    |
-- +---------+
-- Explanation: 
-- - Math has 6 students, so we include it.
-- - English has 1 student, so we do not include it.
-- - Biology has 1 student, so we do not include it.
-- - Computer has 1 student, so we do not include it.


--SOLUTION
-- I have used INNER JOIN, Group by and having function to find the classes that have at least five students.
SELECT Distinct(Courses.class) as 'class' FROM Courses
INNER JOIN Courses as Cour ON Courses.class = Cour.class
GROUP BY Courses.class,Courses.student
having count(*)>=5



33. --(LeetCode) Find Followers count
-- Write an SQL query that will, for each user, return the number of followers.

-- Return the result table ordered by user_id in ascending order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Followers table:
-- +---------+-------------+
-- | user_id | follower_id |
-- +---------+-------------+
-- | 0       | 1           |
-- | 1       | 0           |
-- | 2       | 0           |
-- | 2       | 1           |
-- +---------+-------------+
-- Output: 
-- +---------+----------------+
-- | user_id | followers_count|
-- +---------+----------------+
-- | 0       | 1              |
-- | 1       | 1              |
-- | 2       | 2              |
-- +---------+----------------+
-- Explanation: 
-- The followers of 0 are {1}
-- The followers of 1 are {0}
-- The followers of 2 are {0,1}

--SOLUTION
--I have use Distinct and group by to find followers count
SELECT Distinct(user_id) as 'user_id', Count(DISTINCT(follower_id)) as 'followers_count' from Followers
GROUP BY user_id


34. --(LeetCode) Biggest Single Number
-- A single number is a number that appeared only once in the MyNumbers table.

-- Write an SQL query to report the largest single number. If there is no single number, report null.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- MyNumbers table:
-- +-----+
-- | num |
-- +-----+
-- | 8   |
-- | 8   |
-- | 3   |
-- | 3   |
-- | 1   |
-- | 4   |
-- | 5   |
-- | 6   |
-- +-----+
-- Output: 
-- +-----+
-- | num |
-- +-----+
-- | 6   |
-- +-----+
-- Explanation: The single numbers are 1, 4, 5, and 6.
-- Since 6 is the largest single number, we return it.
-- Example 2:

-- Input: 
-- MyNumbers table:
-- +-----+
-- | num |
-- +-----+
-- | 8   |
-- | 8   |
-- | 7   |
-- | 7   |
-- | 3   |
-- | 3   |
-- | 3   |
-- +-----+
-- Output: 
-- +------+
-- | num  |
-- +------+
-- | null |
-- +------+
-- Explanation: There are no single numbers in the input table so we return null.

--SOLUTION
-- I have used max and subquery to find out the biggest single number

SELECT max(num) as num FROM
(SELECT num FROM MyNumbers 
GROUP BY num
HAVING count(num)=1) as num


35. --(LeetCode) Customers Who Bought All Products
-- Write an SQL query to report the customer ids from the Customer table that bought all the products in the Product table.

-- Return the result table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Customer table:
-- +-------------+-------------+
-- | customer_id | product_key |
-- +-------------+-------------+
-- | 1           | 5           |
-- | 2           | 6           |
-- | 3           | 5           |
-- | 3           | 6           |
-- | 1           | 6           |
-- +-------------+-------------+
-- Product table:
-- +-------------+
-- | product_key |
-- +-------------+
-- | 5           |
-- | 6           |
-- +-------------+
-- Output: 
-- +-------------+
-- | customer_id |
-- +-------------+
-- | 1           |
-- | 3           |
-- +-------------+
-- Explanation: 
-- The customers who bought all the products (5 and 6) are customers with IDs 1 and 3.

--SOLUTION 
-- I have used group by and having function with subquery.

SELECT customer_id FROM Customer
GROUP BY customer_id
HAVING count(DISTINCT(product_key)) = (SELECT count(product_key) FROM Product)


36. --(LeetCode) The Number of Employees Which Report to Each Employee
-- For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.

-- Write an SQL query to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.

-- Return the result table ordered by employee_id.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Employees table:
-- +-------------+---------+------------+-----+
-- | employee_id | name    | reports_to | age |
-- +-------------+---------+------------+-----+
-- | 9           | Hercy   | null       | 43  |
-- | 6           | Alice   | 9          | 41  |
-- | 4           | Bob     | 9          | 36  |
-- | 2           | Winston | null       | 37  |
-- +-------------+---------+------------+-----+
-- Output: 
-- +-------------+-------+---------------+-------------+
-- | employee_id | name  | reports_count | average_age |
-- +-------------+-------+---------------+-------------+
-- | 9           | Hercy | 2             | 39          |
-- +-------------+-------+---------------+-------------+
-- Explanation: Hercy has 2 people report directly to him, Alice and Bob. Their average age is (41+36)/2 = 38.5, which is 39 after rounding it to the nearest integer.


-- SOLUTION
-- I have use self join and group by function to get the number of employees which reports to each employee

SELECT 
Employees.employee_id as 'employee_id',
Employees.name as 'name',
count(Emp.reports_to) as 'reports_count',
round(avg(Emp.age), 0) as 'average_age'
FROM Employees
JOIN Employees as Emp ON Employees.employee_id = Emp.reports_to
GROUP BY Employees.employee_id
ORDER BY Employees.employee_id

37. --(LeetCode) Primary Department for each Employee
-- Employees can belong to multiple departments. When the employee joins other departments, they need to decide which department is their primary department. 
-- Note that when an employee belongs to only one department, their primary column is 'N'.
-- Write an SQL query to report all the employees with their primary department. For employees who belong to one department, report their only department.
-- Return the result table in any order.
-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Employee table:
-- +-------------+---------------+--------------+
-- | employee_id | department_id | primary_flag |
-- +-------------+---------------+--------------+
-- | 1           | 1             | N            |
-- | 2           | 1             | Y            |
-- | 2           | 2             | N            |
-- | 3           | 3             | N            |
-- | 4           | 2             | N            |
-- | 4           | 3             | Y            |
-- | 4           | 4             | N            |
-- +-------------+---------------+--------------+
-- Output: 
-- +-------------+---------------+
-- | employee_id | department_id |
-- +-------------+---------------+
-- | 1           | 1             |
-- | 2           | 1             |
-- | 3           | 3             |
-- | 4           | 3             |
-- +-------------+---------------+
-- Explanation: 
-- - The Primary department for employee 1 is 1.
-- - The Primary department for employee 2 is 1.
-- - The Primary department for employee 3 is 3.
-- - The Primary department for employee 4 is 3.

-- SOLUTION 
-- I have used UNION and group by, having function to find out the primary department

SELECT employee_id, department_id FROM Employee
WHERE primary_flag = 'Y'
UNION
SELECT employee_id, department_id FROM Employee
GROUP BY employee_id
HAVING count(employee_id) = 1
ORDER BY employee_id

38. --(LeetCode) Employees Whose Manager Left the Company
-- Write an SQL query to report the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company. When a manager leaves the company, their information is deleted from the Employees table, but the reports still have their manager_id set to the manager that left.

-- Return the result table ordered by employee_id.

-- The query result format is in the following example.

-- Example 1:

-- Input:  
-- Employees table:
-- +-------------+-----------+------------+--------+
-- | employee_id | name      | manager_id | salary |
-- +-------------+-----------+------------+--------+
-- | 3           | Mila      | 9          | 60301  |
-- | 12          | Antonella | null       | 31000  |
-- | 13          | Emery     | null       | 67084  |
-- | 1           | Kalel     | 11         | 21241  |
-- | 9           | Mikaela   | null       | 50937  |
-- | 11          | Joziah    | 6          | 28485  |
-- +-------------+-----------+------------+--------+
-- Output: 
-- +-------------+
-- | employee_id |
-- +-------------+
-- | 11          |
-- +-------------+

-- Explanation: 
-- The employees with a salary less than $30000 are 1 (Kalel) and 11 (Joziah).
-- Kalel's manager is employee 11, who is still in the company (Joziah).
-- Joziah's manager is employee 6, who left the company because there is no row for employee 6 as it was deleted.

--SOLUTION
--I have used subquery to find employees whose manager left the company

Select Emp.employee_id From Employees Emp
WHERE salary < 30000 and manager_id NOT IN (Select employee_id FROM Employees)
ORDER by Emp.employee_id
-------
Select employee_id From Employees 
WHERE salary < 30000 and manager_id NOT IN (Select employee_id FROM Employees)
ORDER by employee_id


39. --(LeetCode) Fix Names in a Table
-- Write an SQL query to fix the names so that only the first character is uppercase and the rest are lowercase.

-- Return the result table ordered by user_id.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Users table:
-- +---------+-------+
-- | user_id | name  |
-- +---------+-------+
-- | 1       | aLice |
-- | 2       | bOB   |
-- +---------+-------+
-- Output: 
-- +---------+-------+
-- | user_id | name  |
-- +---------+-------+
-- | 1       | Alice |
-- | 2       | Bob   |
-- +---------+-------+


--SOLUTION
--I have used concat function with UCASE which will upper the case and LCASE which will lower the case and Substring as we have to give the position of the letter.

SELECT user_id, CONCAT(UCASE(SUBSTRING(name,1,1)), LCASE(SUBSTRING(name,2))) as name from Users
ORDER BY user_id


40.--(LeetCode) Patients with a condition
-- Write an SQL query to report the patient_id, patient_name and conditions of the patients who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix.

-- Return the result table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Patients table:
-- +------------+--------------+--------------+
-- | patient_id | patient_name | conditions   |
-- +------------+--------------+--------------+
-- | 1          | Daniel       | YFEV COUGH   |
-- | 2          | Alice        |              |
-- | 3          | Bob          | DIAB100 MYOP |
-- | 4          | George       | ACNE DIAB100 |
-- | 5          | Alain        | DIAB201      |
-- +------------+--------------+--------------+
-- Output: 
-- +------------+--------------+--------------+
-- | patient_id | patient_name | conditions   |
-- +------------+--------------+--------------+
-- | 3          | Bob          | DIAB100 MYOP |
-- | 4          | George       | ACNE DIAB100 | 
-- +------------+--------------+--------------+
-- Explanation: Bob and George both have a condition that starts with DIAB1.

--SOLUTIONS 
--For this query we can use LIKE operator or REGEXP 

SELECT * from Patients
WHERE conditions REGEXP '\\bDIAB1.' 
-------------------------
SELECT * from Patients
WHERE conditions LIKE 'DIAB1%' OR conditions LIKE '% DIAB1%'

41. --(LeetCode) Delete Duplicate email
-- Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id. Note that you are supposed to write a DELETE statement and not a SELECT one.

-- After running your script, the answer shown is the Person table. The driver will first compile and run your piece of code and then show the Person table. The final order of the Person table does not matter.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Person table:
-- +----+------------------+
-- | id | email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- | 3  | john@example.com |
-- +----+------------------+
-- Output: 
-- +----+------------------+
-- | id | email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- +----+------------------+
-- Explanation: john@example.com is repeated two times. We keep the row with the smallest Id = 1.

--Solution
-- here we have to use delete function instead of select in terms of removing the duplicate email.

DELETE p1 FROM Person p1
INNER JOIN Person AS p2 
WHERE p1.id > p2.id AND p1.email = p2.email

42. --(LeetCode)  Second Highest Salary
-- Write an SQL query to report the second highest salary from the Employee table. If there is no second highest salary, the query should report null.

-- The query result format is in the following example.
-- Example 1:

-- Input: 
-- Employee table:
-- +----+--------+
-- | id | salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
-- Output: 
-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | 200                 |
-- +---------------------+

-- Example 2:

-- Input: 
-- Employee table:
-- +----+--------+
-- | id | salary |
-- +----+--------+
-- | 1  | 100    |
-- +----+--------+
-- Output: 
-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | null                |
-- +---------------------+

--SOLUTION
--I have used Max function and subquery to find out the second highest salary

SELECT Max(salary) as 'SecondHighestSalary' FROM Employee
WHERE salary < (SELECT Max(salary) FROM Employee) OR salary is NULL

43. --(LeetCode) Consecutive Numbers
-- Write an SQL query to find all numbers that appear at least three times consecutively.

-- Return the result table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Logs table:
-- +----+-----+
-- | id | num |
-- +----+-----+
-- | 1  | 1   |
-- | 2  | 1   |
-- | 3  | 1   |
-- | 4  | 2   |
-- | 5  | 1   |
-- | 6  | 2   |
-- | 7  | 2   |
-- +----+-----+
-- Output: 
-- +-----------------+
-- | ConsecutiveNums |
-- +-----------------+
-- | 1               |
-- +-----------------+
-- Explanation: 1 is the only number that appears consecutively for at least three times.

--SOLUTION
-- I have used INNER join to find out consecutive number
SELECT DISTINCT(l1.num) as ConsecutiveNums FROM Logs l1
INNER JOIN Logs l2 ON l1.id = l2.id+1 and l1.num = l2.num
INNER JOIN Logs l3 ON l2.id = l3.id+1 and l2.num = l3.num


44.--(LeetCode) Product Sales Analysis III
-- Write an SQL query that selects the product id, year, quantity, and price for the first year of every product sold.

-- Return the resulting table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Sales table:
-- +---------+------------+------+----------+-------+
-- | sale_id | product_id | year | quantity | price |
-- +---------+------------+------+----------+-------+ 
-- | 1       | 100        | 2008 | 10       | 5000  |
-- | 2       | 100        | 2009 | 12       | 5000  |
-- | 7       | 200        | 2011 | 15       | 9000  |
-- +---------+------------+------+----------+-------+
-- Product table:
-- +------------+--------------+
-- | product_id | product_name |
-- +------------+--------------+
-- | 100        | Nokia        |
-- | 200        | Apple        |
-- | 300        | Samsung      |
-- +------------+--------------+
-- Output: 
-- +------------+------------+----------+-------+
-- | product_id | first_year | quantity | price |
-- +------------+------------+----------+-------+ 
-- | 100        | 2008       | 10       | 5000  |
-- | 200        | 2011       | 15       | 9000  |
-- +------------+------------+----------+-------+

--SOLUTION
-- I have used INNER join and Subquery to find the Sales analysis
SELECT s1.product_id, s1.year as 'first_year', s1.quantity, s1.price FROM Sales s1
INNER JOIN (SELECT s.product_id, min(s.year) as 'year' FROM Sales s GROUP BY s.product_id) s2 ON s1.product_id = s2.product_id AND s1.year = s2.year


45.--(LeetCode) Confirmation Rate
-- The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages. The confirmation rate of a user that did not request any confirmation messages is 0. Round the confirmation rate to two decimal places.

-- Write an SQL query to find the confirmation rate of each user.

-- Return the result table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Signups table:
-- +---------+---------------------+
-- | user_id | time_stamp          |
-- +---------+---------------------+
-- | 3       | 2020-03-21 10:16:13 |
-- | 7       | 2020-01-04 13:57:59 |
-- | 2       | 2020-07-29 23:09:44 |
-- | 6       | 2020-12-09 10:39:37 |
-- +---------+---------------------+
-- Confirmations table:
-- +---------+---------------------+-----------+
-- | user_id | time_stamp          | action    |
-- +---------+---------------------+-----------+
-- | 3       | 2021-01-06 03:30:46 | timeout   |
-- | 3       | 2021-07-14 14:00:00 | timeout   |
-- | 7       | 2021-06-12 11:57:29 | confirmed |
-- | 7       | 2021-06-13 12:58:28 | confirmed |
-- | 7       | 2021-06-14 13:59:27 | confirmed |
-- | 2       | 2021-01-22 00:00:00 | confirmed |
-- | 2       | 2021-02-28 23:59:59 | timeout   |
-- +---------+---------------------+-----------+
-- Output: 
-- +---------+-------------------+
-- | user_id | confirmation_rate |
-- +---------+-------------------+
-- | 6       | 0.00              |
-- | 3       | 0.00              |
-- | 7       | 1.00              |
-- | 2       | 0.50              |
-- +---------+-------------------+
-- Explanation: 
-- User 6 did not request any confirmation messages. The confirmation rate is 0.
-- User 3 made 2 requests and both timed out. The confirmation rate is 0.
-- User 7 made 3 requests and all were confirmed. The confirmation rate is 1.
-- User 2 made 2 requests where one was confirmed and the other timed out. The confirmation rate is 1 / 2 = 0.5.

--SOLUTION
-- I have use CASE function and LEFT JOIN to find out the confirmation rates
SELECT Signups.user_id,
ROUND(AVG(CASE WHEN Confirmations.action = 'confirmed' THEN 1 ELSE 0 END),2) as confirmation_rate
FROM Signups
LEFT JOIN Confirmations ON Signups.user_id = Confirmations.user_id
GROUP BY Signups.user_id

46.--(LeetCode) Exchange seats
-- Write an SQL query to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.
-- Return the result table ordered by id in ascending order.
-- The query result format is in the following example.

-- Example 1:
-- Input: 
-- Seat table:
-- +----+---------+
-- | id | student |
-- +----+---------+
-- | 1  | Abbot   |
-- | 2  | Doris   |
-- | 3  | Emerson |
-- | 4  | Green   |
-- | 5  | Jeames  |
-- +----+---------+
-- Output: 
-- +----+---------+
-- | id | student |
-- +----+---------+
-- | 1  | Doris   |
-- | 2  | Abbot   |
-- | 3  | Green   |
-- | 4  | Emerson |
-- | 5  | Jeames  |
-- +----+---------+

-- Explanation: 

-- Note that if the number of students is odd, there is no need to change the last one's seat.

--SOLUTION
--I have use subquery and CASE function 
SELECT 
      CASE 
         WHEN s.id % 2 = 0 THEN s.id - 1
         WHEN s.id % 2 != 0 AND s.id = (SELECT MAX(s1.id) FROM Seat s1) THEN s.id
         WHEN s.id % 2 != 0 THEN s.id + 1
         ELSE s.id
    END  id,s.student
FROM 
Seat s 
ORDER BY id

47.--(LeetCode) Movie Rating
-- Write an SQL query to:
-- Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
-- Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.
-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Movies table:
-- +-------------+--------------+
-- | movie_id    |  title       |
-- +-------------+--------------+
-- | 1           | Avengers     |
-- | 2           | Frozen 2     |
-- | 3           | Joker        |
-- +-------------+--------------+
-- Users table:
-- +-------------+--------------+
-- | user_id     |  name        |
-- +-------------+--------------+
-- | 1           | Daniel       |
-- | 2           | Monica       |
-- | 3           | Maria        |
-- | 4           | James        |
-- +-------------+--------------+
-- MovieRating table:
-- +-------------+--------------+--------------+-------------+
-- | movie_id    | user_id      | rating       | created_at  |
-- +-------------+--------------+--------------+-------------+
-- | 1           | 1            | 3            | 2020-01-12  |
-- | 1           | 2            | 4            | 2020-02-11  |
-- | 1           | 3            | 2            | 2020-02-12  |
-- | 1           | 4            | 1            | 2020-01-01  |
-- | 2           | 1            | 5            | 2020-02-17  | 
-- | 2           | 2            | 2            | 2020-02-01  | 
-- | 2           | 3            | 2            | 2020-03-01  |
-- | 3           | 1            | 3            | 2020-02-22  | 
-- | 3           | 2            | 4            | 2020-02-25  | 
-- +-------------+--------------+--------------+-------------+
-- Output: 
-- +--------------+
-- | results      |
-- +--------------+
-- | Daniel       |
-- | Frozen 2     |
-- +--------------+
-- Explanation: 
-- Daniel and Monica have rated 3 movies ("Avengers", "Frozen 2" and "Joker") but Daniel is smaller lexicographically.
-- Frozen 2 and Joker have a rating average of 3.5 in February but Frozen 2 is smaller lexicographically.

-- SOLUTION
-- I have used UNION ALL function with avg and group by function
(SELECT u.name as results
FROM Users u
LEFT JOIN MovieRating mr 
ON u.user_id = mr.user_id
GROUP BY u.user_id
ORDER BY COUNT(mr.user_id) DESC, u.name ASC
LIMIT 1)

UNION ALL
 
(SELECT m.title FROM Movies m
LEFT JOIN MovieRating mr ON m.movie_id = mr.movie_id
where mr.created_at >='2020-02-01' and mr.created_at <= '2020-02-29'
GROUP BY m.movie_id
ORDER BY AVG(mr.rating) DESC, m.title ASC
LIMIT 1)


48.--(LeetCode) Count Salary Categories
-- Calculate the number of bank accounts of each salary category. The salary categories are:

-- "Low Salary": All the salaries strictly less than $20000.
-- "Average Salary": All the salaries in the inclusive range [$20000, $50000].
-- "High Salary": All the salaries strictly greater than $50000.
-- The result table must contain all three categories. If there are no accounts in a category, then report 0.

-- Return the result table in any order.

-- The result format is in the following example.

-- Example 1:

-- Input: 
-- Accounts table:
-- +------------+--------+
-- | account_id | income |
-- +------------+--------+
-- | 3          | 108939 |
-- | 2          | 12747  |
-- | 8          | 87709  |
-- | 6          | 91796  |
-- +------------+--------+
-- Output: 
-- +----------------+----------------+
-- | category       | accounts_count |
-- +----------------+----------------+
-- | Low Salary     | 1              |
-- | Average Salary | 0              |
-- | High Salary    | 3              |
-- +----------------+----------------+
-- Explanation: 
-- Low Salary: Account 2.
-- Average Salary: No accounts.
-- High Salary: Accounts 3, 6, and 8.

--SOLUTION
--I have used UNION Function to find and calculate the highest salary categories amongst the salary
SELECT 'Low Salary' as category, count(account_id) as accounts_count FROM Accounts
WHERE income IN (SELECT income FROM Accounts WHERE income < 20000)
UNION
SELECT 'Average Salary' as category, count(account_id) as accounts_count FROM Accounts
WHERE income IN (SELECT income FROM Accounts WHERE income >= 20000 && income <= 50000)
UNION
SELECT 'High Salary' as category, count(account_id) as accounts_count FROM Accounts
WHERE income IN (SELECT income FROM Accounts WHERE income > 50000)
ORDER BY accounts_count DESC

49.--(LeetCode) Monthly Transactions I
-- Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

-- Return the result table in any order.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Transactions table:
-- +------+---------+----------+--------+------------+
-- | id   | country | state    | amount | trans_date |
-- +------+---------+----------+--------+------------+
-- | 121  | US      | approved | 1000   | 2018-12-18 |
-- | 122  | US      | declined | 2000   | 2018-12-19 |
-- | 123  | US      | approved | 2000   | 2019-01-01 |
-- | 124  | DE      | approved | 2000   | 2019-01-07 |
-- +------+---------+----------+--------+------------+
-- Output: 
-- +----------+---------+-------------+----------------+--------------------+-----------------------+
-- | month    | country | trans_count | approved_count | trans_total_amount | approved_total_amount |
-- +----------+---------+-------------+----------------+--------------------+-----------------------+
-- | 2018-12  | US      | 2           | 1              | 3000               | 1000                  |
-- | 2019-01  | US      | 1           | 1              | 2000               | 2000                  |
-- | 2019-01  | DE      | 1           | 1              | 2000               | 2000                  |
-- +----------+---------+-------------+----------------+--------------------+-----------------------+

--SOLUTION 
-- I have used SUM, COUNT and Case function to find the monthly transactions.
SELECT DATE_FORMAT(trans_date, '%Y-%m') as month, country, COUNT(id) as trans_count, SUM(state = 'approved') as approved_count, SUM(amount) as trans_total_amount, 
SUM(
    CASE WHEN state = 'approved' THEN amount
    ELSE 0
    END
    ) as approved_total_amount 
FROM Transactions
GROUP BY month,country


50.--(LeetCode) Immediate Food Delivery II
-- Write an SQL query to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.

-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Delivery table:
-- +-------------+-------------+------------+-----------------------------+
-- | delivery_id | customer_id | order_date | customer_pref_delivery_date |
-- +-------------+-------------+------------+-----------------------------+
-- | 1           | 1           | 2019-08-01 | 2019-08-02                  |
-- | 2           | 2           | 2019-08-02 | 2019-08-02                  |
-- | 3           | 1           | 2019-08-11 | 2019-08-12                  |
-- | 4           | 3           | 2019-08-24 | 2019-08-24                  |
-- | 5           | 3           | 2019-08-21 | 2019-08-22                  |
-- | 6           | 2           | 2019-08-11 | 2019-08-13                  |
-- | 7           | 4           | 2019-08-09 | 2019-08-09                  |
-- +-------------+-------------+------------+-----------------------------+
-- Output: 
-- +----------------------+
-- | immediate_percentage |
-- +----------------------+
-- | 50.00                |
-- +----------------------+
-- Explanation: 
-- The customer id 1 has a first order with delivery id 1 and it is scheduled.
-- The customer id 2 has a first order with delivery id 2 and it is immediate.
-- The customer id 3 has a first order with delivery id 5 and it is scheduled.
-- The customer id 4 has a first order with delivery id 7 and it is immediate.
-- Hence, half the customers have immediate first orders.

--SOLUTION
--I have used Subquery to get the immediate food delivery percentage
SELECT ROUND(100*SUM(order_date=customer_pref_delivery_date)/COUNT(order_date), 2) as immediate_percentage 
FROM Delivery
WHERE (customer_id,order_date) IN (
  SELECT customer_id, min(order_date) 
  FROM Delivery 
  GROUP BY customer_id)

51.--(Hackerrank) Top Earners

https://www.hackerrank.com/challenges/earnings-of-employees/problem?isFullScreen=true

--SOLUTION 
--I have used simple count and group by function
SELECT (months*salary), count(months*salary) FROM Employee
GROUP By (months*salary)
ORDER BY (months*salary) DESC LIMIT 1

52.--(Hackerrank) weather-observation-station-2

https://www.hackerrank.com/challenges/weather-observation-station-2/problem?isFullScreen=true&h_r=next-challenge&h_v=zen

--SOLUTION
--I have used ROUND and SUM function
SELECT ROUND(SUM(LAT_N),2) as lat, ROUND(SUM(LONG_W),2) as lon FROM STATION

53.--(Hackerrank) weather-observation-station-13

https://www.hackerrank.com/challenges/weather-observation-station-13/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

--SOLUTION
--I have used ROUND and SUM Function
SELECT ROUND(SUM(LAT_N),4) FROM STATION
WHERE LAT_N > 38.7880 and LAT_N < 137.2345

54.--(Hackerrank) weather-observation-station-14

https://www.hackerrank.com/challenges/weather-observation-station-14/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

--SOLUTION
--I have used ROUND and Max Function
SELECT ROUND(MAX(LAT_N),4) FROM STATION
WHERE LAT_N < 137.2345

55.--(Hackerrank) weather-observation-station-15

https://www.hackerrank.com/challenges/weather-observation-station-15/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

--SOLUTION
--I have used subquery to check the LONG_W for the larget LAT_N in station less than
SELECT ROUND((LONG_W),4) FROM STATION
WHERE LAT_N IN (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345)

56.--(Hackerrank) weather-observation-station-16

https://www.hackerrank.com/challenges/weather-observation-station-16/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

--SOLUTION
--I have used ROUND function to check the LONG_W for the larget LAT_N in station
SELECT ROUND(MIN(LAT_N),4) FROM STATION 
WHERE LAT_N > 38.7780

57.--(Hackerrank) weather-observation-station-17

https://www.hackerrank.com/challenges/weather-observation-station-17/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

--SOLUTION
--I have used subquery to check the LONG_W for the larget LAT_N in station greater than
SELECT ROUND((LONG_W),4) FROM STATION
WHERE LAT_N IN (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7780)

58.--(Hackerrank) weather-observation-station-18

https://www.hackerrank.com/challenges/weather-observation-station-18/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

--SOLUTION
--I have used WITH clause to find out the manhattan distance between LONG_W and LAT_N

WITH points as (
    SELECT 
    MIN(LAT_N) as a,
    MIN(LONG_W) as b,
    MAX(LAT_N) as c,
    MAX(LONG_W) as d
    FROM STATION
)
SELECT ROUND((c-a)+(d-b), 4) FROM points

59.--(Hackerrank) Population Census

https://www.hackerrank.com/challenges/asian-population/problem?isFullScreen=true

--SOLUTION
--I have used LEFT JOIN to find out population census
SELECT SUM(CITY.POPULATION) FROM CITY
LEFT JOIN COUNTRY ON COUNTRY.CODE = CITY.COUNTRYCODE
WHERE CONTINENT = 'Asia'

60.--(Hackerrank) African Cities

https://www.hackerrank.com/challenges/african-cities/problem?isFullScreen=true&h_r=next-challenge&h_v=zen

--SOLUTION
--I have used LEFT JOIN to find out African Cities
SELECT CITY.NAME FROM CITY
LEFT JOIN COUNTRY ON COUNTRY.CODE = CITY.COUNTRYCODE
WHERE CONTINENT = 'Africa'

61.--(Hackerrank) Average Population

https://www.hackerrank.com/challenges/average-population-of-each-continent/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

--SOLUTION
--I have used INNER JOIN to find out Average population
SELECT COUNTRY.CONTINENT, FLOOR(AVG(CITY.POPULATION)) FROM CITY
INNER JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
GROUP BY COUNTRY.CONTINENT

62.--(Hackerrank) The Report

https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true

--SOLUTION
--I have used Simple Join with Case function to find out the report of the students grade.
SELECT 
     CASE 
     WHEN Grade >= 8 THEN Name
     WHEN Grade < 8 THEN NULL
     ELSE 0
     END AS Name, Grade, Marks
FROM Students JOIN Grades ON Students.Marks BETWEEN Grades.Min_mark and Grades.Max_Mark
ORDER BY Grades.Grade DESC,Students.Name ASC

63.--(Hackerrank) THE PADS

https://www.hackerrank.com/challenges/the-pads/problem?isFullScreen=true

-- SOLUTION 
-- I have used CTE function and CONCAT function to get the PADS and total of the pads.
SELECT
WITH codeee AS (
    SELECT Name,
    (CASE 
        WHEN Occupation = 'Doctor' THEN '(D)'
        WHEN Occupation = 'Singer' THEN '(S)'
        WHEN Occupation = 'Actor' THEN '(A)'
        ELSE '(P)'
        END) AS cod
    FROM OCCUPATIONS
    ORDER BY Name
)

SELECT CONCAT(Name,cod) FROM codeee;

SELECT CONCAT("There are a total of", " ", Count(Occupation), " ",lower(Occupation), "s.") FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY count(Occupation);

64.--(Datalemur) Data Science Skills [LinkedIn SQL Interview Question]
-- Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. 
-- You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.
-- Write a query to list the candidates who possess all of the required skills for the job. Sort the output by candidate ID in ascending order.
-- Assumption:
-- There are no duplicates in the candidates table.
-- candidates Table:
-- Column Name	Type
-- candidate_id	integer
-- skill	varchar
-- candidates Example Input:
-- candidate_id	skill
-- 123	Python
-- 123	Tableau
-- 123	PostgreSQL
-- 234	R
-- 234	PowerBI
-- 234	SQL Server
-- 345	Python
-- 345	Tableau
-- Example Output:
-- candidate_id
-- 123
-- Explanation
-- Candidate 123 is displayed because they have Python, Tableau, and PostgreSQL skills. 345 isn't included in the output because they're missing one of the required skills: PostgreSQL.

-- The dataset you are querying against may have different input & output - this is just an example!

--SOLUTION 
-- I Have used CTE to find the duplicates.
WITH duplicates AS(
SELECT company_id, title, description, count(job_id) as job
FROM job_listings
GROUP BY company_id, title, description
)
SELECT COUNT(DISTINCT(company_id)) AS duplicate_companies
FROM duplicates
WHERE job > 1

65.--(Datalemur) Page With No Likes [Facebook SQL Interview Question]
-- Assume you're given two tables containing data about Facebook Pages and their respective likes (as in "Like a Facebook Page").

-- Write a query to return the IDs of the Facebook pages that have zero likes. The output should be sorted in ascending order based on the page IDs.

-- pages Table:
-- Column Name	Type
-- page_id	integer
-- page_name	varchar

-- pages Example Input:
-- page_id	page_name
-- 20001	SQL Solutions
-- 20045	Brain Exercises
-- 20701	Tips for Data Analysts

-- page_likes Table:
-- Column Name	Type
-- user_id	integer
-- page_id	integer
-- liked_date	datetime

-- page_likes Example Input:
-- user_id	page_id	liked_date
-- 111	20001	04/08/2022 00:00:00
-- 121	20045	03/12/2022 00:00:00
-- 156	20001	07/25/2022 00:00:00

-- Example Output:
-- page_id
-- 20701

--SOLUTION 
-- I have used left join to get the page with no like
SELECT pages.page_id as page_id FROM pages
LEFT JOIN page_likes ON page_likes.page_id = pages.page_id
WHERE liked_date is NULL
ORDER BY pages.page_id;

66.--(Datalemur) Unfinished Parts [Tesla SQL Interview Question]
-- Tesla is investigating production bottlenecks and they need your help to extract the relevant data. 
-- Write a query that determines which parts with the assembly steps have initiated the assembly process but remain unfinished.
-- Assumptions:
-- parts_assembly table contains all parts currently in production, each at varying stages of the assembly process.
-- An unfinished part is one that lacks a finish_date.
-- This question is straightforward, so let's approach it with simplicity in both thinking and solution.

-- Effective April 11th 2023, the problem statement and assumptions were updated to enhance clarity.

-- parts_assembly Table
-- Column Name	Type
-- part	          string
-- finish_date	datetime
-- assembly_step	integer

-- parts_assembly Example Input

-- part	finish_date	assembly_step
-- battery	01/22/2022 00:00:00	1
-- battery	02/22/2022 00:00:00	2
-- battery	03/22/2022 00:00:00	3
-- bumper	01/22/2022 00:00:00	1
-- bumper	02/22/2022 00:00:00	2
-- bumper		               3
-- bumper		               4

-- Example Output
-- part	assembly_step
-- bumper	3
-- bumper	4

-- Explanation
-- The bumpers in step 3 and 4 are the only item that remains unfinished as it lacks a recorded finish date.

--SOLUTION
-- I have used simple SELECT and WHERE clause to find out the null value.
SELECT part, assembly_step FROM parts_assembly
WHERE finish_date is NULL;


67.--(Datalemur) Laptop vs. Mobile Viewership [New York Times SQL Interview Question]
-- This is the same question as problem #3 in the SQL Chapter of Ace the Data Science Interview!
-- Assume you're given the table on user viewership categorised by device type where the three types are laptop, tablet, and phone.
-- Write a query that calculates the total viewership for laptops and mobile devices where mobile is defined as the sum of tablet and phone viewership. 
-- Output the total viewership for laptops as laptop_reviews and the total viewership for mobile devices as mobile_views.
-- Effective 15 April 2023, the solution has been updated with a more concise and easy-to-understand approach.

-- viewership Table
-- Column Name	Type
-- user_id	integer
-- device_type	string ('laptop', 'tablet', 'phone')
-- view_time	timestamp

-- viewership Example Input
-- user_id	device_type	view_time
-- 123	tablet	01/02/2022 00:00:00
-- 125	laptop	01/07/2022 00:00:00
-- 128	laptop	02/09/2022 00:00:00
-- 129	phone	02/09/2022 00:00:00
-- 145	tablet	02/24/2022 00:00:00
-- Example Output
-- laptop_views	mobile_views
-- 2	3
-- Explanation
-- Based on the example input, there are a total of 2 laptop views and 3 mobile views.

--SOLUTION
--I have used simple subquery to find the views
SELECT (SELECT COUNT(*) FROM viewership WHERE device_type = 'laptop') as laptop_views,
       (SELECT COUNT(*) FROM viewership WHERE device_type IN ('phone','tablet')) as mobile_views
FROM viewership
GROUP BY laptop_views,mobile_views


68.--(Datalemur) Cities With Completed Trades [Robinhood SQL Interview Question]
-- This is the same question as problem #2 in the SQL Chapter of Ace the Data Science Interview!
-- Assume you're given the tables containing completed trade orders and user details in a Robinhood trading system.
-- Write a query to retrieve the top three cities that have the highest number of completed trade orders listed in descending order. 
-- Output the city name and the corresponding number of completed trade orders.

-- trades Table:
-- Column Name	Type
-- order_id	integer
-- user_id	integer
-- price	decimal
-- quantity	integer
-- status	string('Completed' ,'Cancelled')
-- timestamp	datetime

-- trades Example Input:
-- order_id	user_id	price	quantity	status	timestamp
-- 100101	111	9.80	10	Cancelled	08/17/2022 12:00:00
-- 100102	111	10.00	10	Completed	08/17/2022 12:00:00
-- 100259	148	5.10	35	Completed	08/25/2022 12:00:00
-- 100264	148	4.80	40	Completed	08/26/2022 12:00:00
-- 100305	300	10.00	15	Completed	09/05/2022 12:00:00
-- 100400	178	9.90	15	Completed	09/09/2022 12:00:00
-- 100565	265	25.60	5	Completed	12/19/2022 12:00:00

-- users Table:
-- Column Name	Type
-- user_id	integer
-- city	string
-- email	string
-- signup_date	datetime

-- users Example Input:
-- user_id	city	email	signup_date
-- 111	San Francisco	rrok10@gmail.com	08/03/2021 12:00:00
-- 148	Boston	sailor9820@gmail.com	08/20/2021 12:00:00
-- 178	San Francisco	harrypotterfan182@gmail.com	01/05/2022 12:00:00
-- 265	Denver	shadower_@hotmail.com	02/26/2022 12:00:00
-- 300	San Francisco	houstoncowboy1122@hotmail.com	06/30/2022 12:00:00

-- Example Output:
-- city	total_orders
-- San Francisco	3
-- Boston	2
-- Denver	1
-- Explanation
-- In the given dataset, San Francisco has the highest number of completed trade orders with 3 orders. 
-- Boston holds the second position with 2 orders, and Denver ranks third with 1 order.

--SOLUTION 
--I have simply used LEFT JOIN and GROUP BY function to find the order from the given cities.
SELECT users.city,count(trades.user_id) as total_orders FROM trades
LEFT JOIN users ON trades.user_id = users.user_id
WHERE status  = 'Completed'
GROUP BY users.city
HAVING count(trades.user_id) > 1
ORDER BY total_orders DESC

69.--(Datalemur) Histogram of Tweets [Twitter SQL Interview Question]
-- This is the same question as problem #6 in the SQL Chapter of Ace the Data Science Interview!
-- Assume you're given a table Twitter tweet data, write a query to obtain a histogram of tweets posted per user in 2022. 
-- Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.

-- In other words, group the users by the number of tweets they posted in 2022 and count the number of users in each group.

-- tweets Table:
-- Column Name	Type
-- tweet_id	integer
-- user_id	integer
-- msg	string
-- tweet_date	timestamp

-- tweets Example Input:
-- tweet_id	user_id	msg	tweet_date
-- 214252	111	Am considering taking Tesla private at $420. Funding secured.	12/30/2021 00:00:00
-- 739252	111	Despite the constant negative press covfefe	01/01/2022 00:00:00
-- 846402	111	Following @NickSinghTech on Twitter changed my life!	02/14/2022 00:00:00
-- 241425	254	If the salary is so competitive why won’t you tell me what it is?	03/01/2022 00:00:00
-- 231574	148	I no longer have a manager. I can't be managed	03/23/2022 00:00:00

-- Example Output:
-- tweet_bucket	users_num
-- 1	2
-- 2	1
-- Explanation:
-- Based on the example output, there are two users who posted only one tweet in 2022, and one user who posted two tweets in 2022. 
-- The query groups the users by the number of tweets they posted and displays the number of users in each group.

--SOLUTION
--I have used CTE to find the tweet posted by users.
WITH tweet_data AS (
    SELECT user_id,
    COUNT(*) AS tweet_bucket
    FROM tweets
    WHERE EXTRACT(year FROM tweet_date)=2022
    GROUP BY user_id
)

SELECT tweet_bucket,COUNT(*) AS users_num FROM tweet_data
GROUP BY tweet_bucket

70.--(Datalemur) Average Post Hiatus (Part 1) [Facebook SQL Interview Question]
-- Given a table of Facebook posts, for each user who posted at least twice in 2021, 
-- write a query to find the number of days between each user’s first post of the year and last post of the year in the year 2021.
-- Output the user and number of the days between each user's first and last post.

-- p.s. If you've read the Ace the Data Science Interview and liked it, consider writing us a review?

-- posts Table:
-- Column Name	Type
-- user_id	integer
-- post_id	integer
-- post_date	timestamp
-- post_content	text

-- posts Example Input:
-- user_id	post_id	post_date	post_content
-- 151652	599415	07/10/2021 12:00:00	Need a hug
-- 661093	624356	07/29/2021 13:00:00	Bed. Class 8-12. Work 12-3. Gym 3-5 or 6. Then class 6-10. Another day that's gonna fly by. I miss my girlfriend
-- 004239	784254	07/04/2021 11:00:00	Happy 4th of July!
-- 661093	442560	07/08/2021 14:00:00	Just going to cry myself to sleep after watching Marley and Me.
-- 151652	111766	07/12/2021 19:00:00	I'm so done with covid - need travelling ASAP!

-- Example Output:
-- user_id	days_between
-- 151652	2
-- 661093	21

--SOLUTION 
--I have used sub query to get the average post hiatus.
SELECT * FROM (
SELECT user_id, max(date(post_date))-min(date(post_date)) as days_between FROM posts
WHERE post_date >= '01/01/2021 00:00:00' AND  post_date <= '12/31/2021 24:00:00'
GROUP BY user_id) as dp
WHERE days_between > 1


71.--(Datalemur) Teams Power Users [Microsoft SQL Interview Question]
-- Write a query to identify the top 2 Power Users who sent the highest number of messages on Microsoft Teams in August 2022. 
-- Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending order based on the count of the messages.

-- Assumption:
-- No two users have sent the same number of messages in August 2022.

-- messages Table:
-- Column Name	Type
-- message_id	integer
-- sender_id	integer
-- receiver_id	integer
-- content	varchar
-- sent_date	datetime

-- messages Example Input:
-- message_id	sender_id	receiver_id	content	sent_date
-- 901	3601	4500	You up?	08/03/2022 00:00:00
-- 902	4500	3601	Only if you're buying	08/03/2022 00:00:00
-- 743	3601	8752	Let's take this offline	06/14/2022 00:00:00
-- 922	3601	4500	Get on the call	08/10/2022 00:00:00

-- Example Output:
-- sender_id	message_count
-- 3601	2
-- 4500	1

--SOLUTION 
-- I have used simple count and GROUP BY function to count the top 2 power users
SELECT sender_id, COUNT(message_id) as message_count FROM messages
WHERE sent_date >= '08/01/2022' and sent_date <= '09/01/2022'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2


72.--(Datalemur) Duplicate Job Listings [Linkedin SQL Interview Question]
-- This is the same question as problem #8 in the SQL Chapter of Ace the Data Science Interview!
-- Assume you're given a table containing job postings from various companies on the LinkedIn platform. 
-- Write a query to retrieve the count of companies that have posted duplicate job listings.

-- Definition:
-- Duplicate job listings are defined as two job listings within the same company that share identical titles and descriptions.

-- job_listings Table:
-- Column Name	Type
-- job_id	integer
-- company_id	integer
-- title	string
-- description	string

-- job_listings Example Input:
-- job_id	company_id	title	description
-- 248	827	Business Analyst	Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations.
-- 149	845	Business Analyst	Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations.
-- 945	345	Data Analyst	Data analyst reviews data to identify key insights into a business's customers and ways the data can be used to solve problems.
-- 164	345	Data Analyst	Data analyst reviews data to identify key insights into a business's customers and ways the data can be used to solve problems.
-- 172	244	Data Engineer	Data engineer works in a variety of settings to build systems that collect, manage, and convert raw data into usable information for data scientists and business analysts to interpret.

-- Example Output:
-- duplicate_companies
-- 1
-- Explanation:
-- There is one company ID 345 that posted duplicate job listings. The duplicate listings, IDs 945 and 164 have identical titles and descriptions.

--SOLUTION
--- I have simply used COUNT and GROUP BY function
SELECT COUNT(company_id) as duplicate_companies 
FROM job_listings
GROUP BY company_id
having count(title)>2
limit 1

73.--(Datalemur) Average Review Ratings [Amazon SQL Interview Question]
-- Given the reviews table, write a query to retrieve the average star rating for each product, grouped by month. 
-- The output should display the month as a numerical value, product ID, and average star rating rounded to two decimal places. 
-- Sort the output first by month and then by product ID.

-- P.S. If you've read the Ace the Data Science Interview, and liked it, consider writing us a review?

-- reviews Table:
-- Column Name	Type
-- review_id	integer
-- user_id	integer
-- submit_date	datetime
-- product_id	integer
-- stars	integer (1-5)

-- reviews Example Input:
-- review_id	user_id	submit_date	product_id	stars
-- 6171	123	06/08/2022 00:00:00	     50001	       4
-- 7802	265	06/10/2022 00:00:00  	69852	       4
-- 5293	362	06/18/2022 00:00:00 	50001	       3
-- 6352	192	07/26/2022 00:00:00	     69852	       3
-- 4517	981	07/05/2022 00:00:00 	69852	       2

-- Example Output:
-- mth	product	avg_stars
-- 6	50001	3.50
-- 6	69852	4.00
-- 7	69852	2.50
-- Explanation
-- Product 50001 received two ratings of 4 and 3 in the month of June (6th month), resulting in an average star rating of 3.5.

--SOLUTION
--I have simply usede EXTRACT and GROUP By with aggregate function to get the average of each product from the reviews
SELECT EXTRACT(MONTH FROM submit_date) as mth, 
       product_id as product, 
       ROUND(AVG(stars),2) as avg_stars
FROM reviews
GROUP BY mth, product
ORDER BY mth, product

74.--(Datalemur) App Click-through Rate (CTR) [Facebook SQL Interview Question]
-- This is the same question as problem #1 in the SQL Chapter of Ace the Data Science Interview!
-- Assume you have an events table on Facebook app analytics. Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.

-- Definition and note:

-- Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
-- To avoid integer division, multiply the CTR by 100.0, not 100.

-- events Table:
-- Column Name	Type
-- app_id	integer
-- event_type	string
-- timestamp	datetime

-- events Example Input:
-- app_id	event_type	timestamp
-- 123	impression	07/18/2022 11:36:12
-- 123	impression	07/18/2022 11:37:12
-- 123	click	07/18/2022 11:37:42
-- 234	impression	07/18/2022 14:15:12
-- 234	click	07/18/2022 14:16:12

-- Example Output:
-- app_id	ctr
-- 123	50.00
-- 234	100.00

-- Explanation
-- Let's consider an example of App 123. This app has a click-through rate (CTR) of 50.00% because out of the 2 impressions it received, it got 1 click.
-- To calculate the CTR, we divide the number of clicks by the number of impressions, and then multiply the result by 100.0 to express it as a percentage. 
-- In this case, 1 divided by 2 equals 0.5, and when multiplied by 100.0, it becomes 50.00%. So, the CTR of App 123 is 50.00%.

--SOLUTION
--I have used CASE function with ROUND aggregate to get the click through rate.
SELECT app_id,
      ROUND(100.0 * 
      SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END)/
      SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END),2) as ctr
FROM events
WHERE timestamp >= '2022-01-01' and timestamp <'2023-01-01'
GROUP BY app_id

75.--(Datalemur) Second Day Confirmation [TikTok SQL Interview Question]
-- Assume you're given tables with information about TikTok user sign-ups and confirmations through email and text. 
-- New users on TikTok sign up using their email addresses, and upon sign-up, each user receives a text message confirmation to activate their account.
-- Write a query to display the user IDs of those who did not confirm their sign-up on the first day, but confirmed on the second day.
-- Definition:
-- action_date refers to the date when users activated their accounts and confirmed their sign-up through text messages.

-- emails Table:
-- Column Name	Type
-- email_id	integer
-- user_id	integer
-- signup_date	datetime
-- emails Example Input:
-- email_id	user_id	signup_date
-- 125	7771	06/14/2022 00:00:00
-- 433	1052	07/09/2022 00:00:00

-- texts Table:
-- Column Name	Type
-- text_id	integer
-- email_id	integer
-- signup_action	string ('Confirmed', 'Not confirmed')
-- action_date	datetime

-- texts Example Input:
-- text_id	email_id	signup_action	action_date
-- 6878	125	Confirmed	06/14/2022 00:00:00
-- 6997	433	Not Confirmed	07/09/2022 00:00:00
-- 7000	433	Confirmed	07/10/2022 00:00:00

-- Example Output:
-- user_id
-- 1052

-- Explanation:
-- Only User 1052 confirmed their sign-up on the second day.

--SOLUTION
--I have used simple LEFT JOIN and INTERVAL function to find out the second day confirmation.
SELECT e.user_id
FROM emails as e
LEFT JOIN texts as t ON t.email_id = e.email_id
WHERE t.action_date = e.signup_date + INTERVAL '1 day' 
GROUP BY e.user_id
LIMIT 2

76.--(Datalemur) 
-- Your team at JPMorgan Chase is soon launching a new credit card, and to gain some context, you are analyzing how many credit cards were issued each month.
-- Write a query that outputs the name of each credit card and the difference in issued amount between the month with the most cards issued, and the least cards issued. 
-- Order the results according to the biggest difference.

-- monthly_cards_issued Table:
-- Column Name	Type
-- issue_month	integer
-- issue_year	integer
-- card_name	string
-- issued_amount	integer
-- monthly_cards_issued Example Input:

-- card_name	            issued_amount	issue_month	issue_year
-- Chase Freedom Flex	       55000	         1	       2021
-- Chase Freedom Flex	       60000	         2	       2021
-- Chase Freedom Flex	       65000	         3	       2021
-- Chase Freedom Flex	       70000	         4	       2021
-- Chase Sapphire Reserve	  170000	         1	       2021
-- Chase Sapphire Reserve	  175000           2	       2021
-- Chase Sapphire Reserve	  180000	         3	       2021

-- Example Output:
-- card_name	difference
-- Chase Freedom Flex	15000
-- Chase Sapphire Reserve	10000

-- Explanation
-- Chase Freedom Flex's best month was 70k cards issued and the worst month was 55k cards, so the difference is 15k cards.

-- Chase Sapphire Reserve's best month was 180k cards issued and the worst month was 170k cards, so the difference is 10k cards.

--SOLUTION
--I have used MIN and MAX function to find the difference
SELECT card_name, (MAX(issued_amount) - Min(issued_amount)) as difference FROM monthly_cards_issued
GROUP BY card_name 
ORDER BY difference DESC


77.--(Datalemur) Compressed Mean [Alibaba SQL Interview Question]
-- You're trying to find the mean number of items per order on Alibaba, 
-- rounded to 1 decimal place using tables which includes information on the count of items in each order (item_count table) and the corresponding number of orders for each item count (order_occurrences table).

-- items_per_order Table:
-- Column Name	Type
-- item_count	integer
-- order_occurrences	integer

-- items_per_order Example Input:
-- item_count	order_occurrences
-- 1	500
-- 2	1000
-- 3	800
-- 4	1000
-- There are a total of 500 orders with one item per order, 1000 orders with two items per order, and 800 orders with three items per order."

-- Example Output:
-- mean
-- 2.7
-- Explanation
-- Let's calculate the arithmetic average:

-- Total items = (1*500) + (2*1000) + (3*800) + (4*1000) = 8900
-- Total orders = 500 + 1000 + 800 + 1000 = 3300
-- Mean = 8900 / 3300 = 2.7

--SOLUTION
--I have used round with avg aggregate function to find out the compressed mean
SELECT ROUND(AVG(item_count*order_occurrences)/AVG(order_occurrences),1) as mean 
FROM items_per_order;


78.--(Datalemur) Pharmacy Analytics (Part 1) [CVS Health SQL Interview Question]
-- CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. Each drug can only be produced by one manufacturer.

-- Write a query to find the top 3 most profitable drugs sold, and how much profit they made. 
--Assume that there are no ties in the profits. Display the result from the highest to the lowest total profit.

-- Definition:

-- cogs stands for Cost of Goods Sold which is the direct cost associated with producing the drug.
-- Total Profit = Total Sales - Cost of Goods Sold
-- If you like this question, try out Pharmacy Analytics (Part 2)!

-- pharmacy_sales Table:
-- Column Name	Type
-- product_id	integer
-- units_sold	integer
-- total_sales	decimal
-- cogs	decimal
-- manufacturer	varchar
-- drug	varchar

-- pharmacy_sales Example Input:
-- product_id	units_sold	total_sales	cogs	manufacturer	drug
-- 9	37410	293452.54	208876.01	Eli Lilly	Zyprexa
-- 34	94698	600997.19	521182.16	AstraZeneca	Surmontil
-- 61	77023	500101.61	419174.97	Biogen	Varicose Relief
-- 136	144814	1084258	1006447.73	Biogen	Burkhart

-- Example Output:
-- drug	total_profit
-- Zyprexa	84576.53
-- Varicose Relief	80926.64
-- Surmontil	79815.03

-- Explanation:
-- Zyprexa made the most profit (of $84,576.53) followed by Varicose Relief (of $80,926.64) and Surmontil (of $79,815.3).

--SOLUTION
--I have used simple function to get the total profit.
SELECT drug, (total_sales - cogs) as total_profit 
FROM pharmacy_sales
order by total_profit DESC
LIMIT 3

79.--(Datalemur) Pharmacy Analytics (Part 2) [CVS Health SQL Interview Question]
-- CVS Health is analyzing its pharmacy sales data, and how well different products are selling in the market. Each drug is exclusively manufactured by a single manufacturer.
-- Write a query to identify the manufacturers associated with the drugs that resulted in losses for CVS Health and calculate the total amount of losses incurred.
-- Output the manufacturer's name, the number of drugs associated with losses, and the total losses in absolute value. 
-- Display the results sorted in descending order with the highest losses displayed at the top.

-- If you like this question, try out Pharmacy Analytics (Part 3)!

-- pharmacy_sales Table:
-- Column Name	Type
-- product_id	integer
-- units_sold	integer
-- total_sales	decimal
-- cogs	decimal
-- manufacturer	varchar
-- drug	varchar

-- pharmacy_sales Example Input:
-- product_id	units_sold	total_sales	cogs	manufacturer	drug
-- 156	89514	3130097.00	3427421.73	Biogen	Acyclovir
-- 25	222331	2753546.00	2974975.36	AbbVie	Lamivudine and Zidovudine
-- 50	90484	2521023.73	2742445.90	Eli Lilly	Dermasorb TA Complete Kit
-- 98	110746	813188.82	140422.87	Biogen	Medi-Chord

-- Example Output:
-- manufacturer	drug_count	total_loss
-- Biogen	1	297324.73
-- AbbVie	1	221429.36
-- Eli Lilly	1	221422.17

-- Explanation:
-- The first three rows indicate that some drugs resulted in losses. Among these, Biogen had the highest losses, followed by AbbVie and Eli Lilly. 
-- However, the Medi-Chord drug manufactured by Biogen reported a profit and was excluded from the result.

--SOLUTION
--I have used COUNT, SUM, and GROUP BY function to get the total_loss
SELECT manufacturer, count(drug) as drug_count, SUM(cogs-total_sales) as total_loss
FROM pharmacy_sales
WHERE cogs > total_sales
GROUP BY manufacturer
ORDER BY total_loss DESC

80.--(Datalemur) Pharmacy Analytics (Part 3) [CVS Health SQL Interview Question]
-- CVS Health wants to gain a clearer understanding of its pharmacy sales and the performance of various products.

-- Write a query to calculate the total drug sales for each manufacturer. 
-- Round the answer to the nearest million and report your results in descending order of total sales. In case of any duplicates, sort them alphabetically by the manufacturer name.

-- Since this data will be displayed on a dashboard viewed by business stakeholders, please format your results as follows: "$36 million".

-- If you like this question, try out Pharmacy Analytics (Part 4)!

-- pharmacy_sales Table:
-- Column Name	Type
-- product_id	integer
-- units_sold	integer
-- total_sales	decimal
-- cogs	decimal
-- manufacturer	varchar
-- drug	varchar

-- pharmacy_sales Example Input:
-- product_id	units_sold	total_sales	cogs	manufacturer	drug
-- 94	132362	2041758.41	1373721.70	Biogen	UP and UP
-- 9	37410	293452.54	208876.01	Eli Lilly	Zyprexa
-- 50	90484	2521023.73	2742445.9	Eli Lilly	Dermasorb
-- 61	77023	500101.61	419174.97	Biogen	Varicose Relief
-- 136	144814	1084258.00	1006447.73	Biogen	Burkhart

-- Example Output:
-- manufacturer	sale
-- Biogen	$4 million
-- Eli Lilly	$3 million
-- Explanation
-- The total sales for Biogen is $4 million ($2,041,758.41 + $500,101.61 + $1,084,258.00 = $3,626,118.02) and for Eli Lilly is $3 million ($293,452.54 + $2,521,023.73 = $2,814,476.27).

-- SOLUTION
-- I have used CTE to do the calculation and then used CONCAT function to get the output as a characters.
WITH pharmacy as (
      SELECT manufacturer,ROUND(SUM(total_sales)/1000000) as sale FROM pharmacy_sales
      GROUP BY manufacturer
      ORDER BY sum(total_sales) DESC
      )

SELECT manufacturer, CONCAT('$',sale,' ', 'million') FROM pharmacy


81.--(Datalemur) Patient Support Analysis (Part 1) [UnitedHealth SQL Interview Question]
-- UnitedHealth has a program called Advocate4Me, which allows members to call an advocate and receive support for their health care needs – 
-- whether that's behavioural, clinical, well-being, health care financing, benefits, claims or pharmacy help.

-- Write a query to find how many UHG members made 3 or more calls. case_id column uniquely identifies each call made.

-- If you like this question, try out Patient Support Analysis (Part 2)!

-- callers Table:
-- Column Name	Type
-- policy_holder_id	integer
-- case_id	varchar
-- call_category	varchar
-- call_received	timestamp
-- call_duration_secs	integer
-- original_order	integer

-- callers Example Input:
-- policy_holder_id	case_id	call_category	call_received	call_duration_secs	original_order
-- 50837000	dc63-acae-4f39-bb04	claims	03/09/2022 02:51:00	205	130
-- 50837000	41be-bebe-4bd0-a1ba	IT_support	03/12/2022 05:37:00	254	129
-- 50936674	12c8-b35c-48a3-b38d	claims	05/31/2022 7:27:00	240	31
-- 50886837	d0b4-8ea7-4b8c-aa8b	IT_support	03/11/2022 3:38:00	276	16
-- 50886837	a741-c279-41c0-90ba		03/19/2022 10:52:00	131	325
-- 50837000	bab1-3ec5-4867-90ae	benefits	05/13/2022 18:19:00	228	339

-- Example Output:
-- member_count
-- 1

-- Explanation:
-- The only caller who made 3 or more calls is member ID 50837000.

-- SOLUTION
-- I have used subquery to find the count of the members.
SELECT COUNT(policy_holder_id) as member_count 
FROM (
     SELECT policy_holder_id 
     FROM callers
     GROUP BY policy_holder_id
     HAVING COUNT(case_id) >= 3
) as call


82.--(Datalemur) Patient Support Analysis (Part 2) [UnitedHealth SQL Interview Question]
-- UnitedHealth Group has a program called Advocate4Me, which allows members to call an advocate and 
-- receive support for their health care needs – whether that's behavioural, clinical, well-being, health care financing, benefits, claims or pharmacy help.

-- Calls to the Advocate4Me call centre are categorised, but sometimes they can't fit neatly into a category. 
-- These uncategorised calls are labelled “n/a”, or are just empty (when a support agent enters nothing into the category field).

-- Write a query to find the percentage of calls that cannot be categorised. Round your answer to 1 decimal place.

-- callers Table:
-- Column Name	Type
-- policy_holder_id	integer
-- case_id	varchar
-- call_category	varchar
-- call_received	timestamp
-- call_duration_secs	integer
-- original_order	integer

-- callers Example Input:
-- policy_holder_id	case_id	call_category	call_received	call_duration_secs	original_order
-- 52481621	a94c-2213-4ba5-812d		01/17/2022 19:37:00	286	161
-- 51435044	f0b5-0eb0-4c49-b21e	n/a	01/18/2022 2:46:00	208	225
-- 52082925	289b-d7e8-4527-bdf5	benefits	01/18/2022 3:01:00	291	352
-- 54624612	62c2-d9a3-44d2-9065	IT_support	01/19/2022 0:27:00	273	358
-- 54624612	9f57-164b-4a36-934e	claims	01/19/2022 6:33:00	157	362

-- Example Output:
-- call_percentage
-- 40.0

-- Explanation:
-- A total of 5 calls were registered. Out of which 2 calls were not categorised. That makes 40.0% (2/5 x 100.0) of the calls uncategorised.

-- SOLUTION
-- I have used CTE function to find the uncategorised call
WITH percent as (
    SELECT 
        policy_holder_id, 
        case_id,
        CASE 
            WHEN call_category is null THEN 1
            WHEN call_category = 'n/a' THEN 1
            ELSE 0
        END as call
    FROM callers
    group by policy_holder_id,call_category,case_id
)

SELECT ROUND(100*SUM(call)/COUNT(case_id),1) as call_percentage FROM percent


83.--(Datalemur) User's Third Transaction [Uber SQL Interview Question]
-- Assume you are given the table below on Uber transactions made by users. 
-- Write a query to obtain the third transaction of every user. 
-- Output the user id, spend and transaction date.

-- transactions Table:
-- Column Name	Type
-- user_id	integer
-- spend	decimal
-- transaction_date	timestamp

-- transactions Example Input:
-- user_id	spend	transaction_date
-- 111	100.50	01/08/2022 12:00:00
-- 111	55.00	01/10/2022 12:00:00
-- 121	36.00	01/18/2022 12:00:00
-- 145	24.99	01/26/2022 12:00:00
-- 111	89.60	02/05/2022 12:00:00

-- Example Output:
-- user_id	spend	transaction_date
-- 111	89.60	02/05/2022 12:00:00

-- SOLUTION
-- I have used CTE and WINDOW function to find out the third transaction of user in UBER.
WITH tran as (
SELECT user_id, spend, transaction_date,
ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date) as row_numbers
FROM transactions
GROUP BY user_id, spend, transaction_date
)


SELECT user_id, spend, transaction_date FROM tran
WHERE row_numbers = 3

84.--(Datalemur) Sending vs. Opening Snaps [Snapchat SQL Interview Question]
-- Assume you're given tables with information on Snapchat users, including their ages and time spent sending and opening snaps.
-- Write a query to obtain a breakdown of the time spent sending vs. opening snaps as a percentage of total time spent on these activities grouped by age group. 
-- Round the percentage to 2 decimal places in the output.

-- Notes:

-- Calculate the following percentages:
-- time spent sending / (Time spent sending + Time spent opening)
-- Time spent opening / (Time spent sending + Time spent opening)
-- To avoid integer division in percentages, multiply by 100.0 and not 100.
-- Effective April 15th, 2023, the solution has been updated and optimised.

-- activities Table
-- Column Name	Type
-- activity_id	integer
-- user_id	integer
-- activity_type	string ('send', 'open', 'chat')
-- time_spent	float
-- activity_date	datetime

-- activities Example Input
-- activity_id	user_id	activity_type	time_spent	activity_date
-- 7274	123	open	4.50	06/22/2022 12:00:00
-- 2425	123	send	3.50	06/22/2022 12:00:00
-- 1413	456	send	5.67	06/23/2022 12:00:00
-- 1414	789	chat	11.00	06/25/2022 12:00:00
-- 2536	456	open	3.00	06/25/2022 12:00:00

-- age_breakdown Table
-- Column Name	Type
-- user_id	integer
-- age_bucket	string ('21-25', '26-30', '31-25')
-- age_breakdown Example Input

-- user_id	age_bucket
-- 123	31-35
-- 456	26-30
-- 789	21-25

-- Example Output
-- age_bucket	send_perc	open_perc
-- 26-30	65.40	34.60
-- 31-35	43.75	56.25
-- Explanation
-- Using the age bucket 26-30 as example, the time spent sending snaps was 5.67 and the time spent opening snaps was 3.
-- To calculate the percentage of time spent sending snaps, we divide the time spent sending snaps by the total time spent on sending and opening snaps, which is 5.67 + 3 = 8.67.
-- So, the percentage of time spent sending snaps is 5.67 / (5.67 + 3) = 65.4%, and the percentage of time spent opening snaps is 3 / (5.67 + 3) = 34.6%.

-- SOLUTION
-- I have used CASE and LEFT JOIN to get the percentage.
SELECT ab.age_bucket,
    ROUND(100.0 * (SUM(CASE WHEN act.activity_type = 'send' THEN act.time_spent ELSE 0 END) / SUM(act.time_spent)), 2) AS send_perc,
    ROUND(100.0 * (SUM(CASE WHEN act.activity_type = 'open' THEN act.time_spent ELSE 0 END) / SUM(act.time_spent)), 2) AS open_perc
FROM activities act
LEFT JOIN age_breakdown ab ON ab.user_id = act.user_id
WHERE act.activity_type IN ('send','open')
GROUP BY age_bucket, act.user_id;


85.--(Datalemur) Tweets' Rolling Averages [Twitter SQL Interview Question]
-- This is the same question as problem #10 in the SQL Chapter of Ace the Data Science Interview!

-- Given a table of tweet data over a specified time period, calculate the 3-day rolling average of tweets for each user. 
-- Output the user ID, tweet date, and rolling averages rounded to 2 decimal places.

-- Notes:

-- A rolling average, also known as a moving average or running mean is a time-series technique that examines trends in data over a specified period of time.
-- In this case, we want to determine how the tweet count for each user changes over a 3-day period.
-- Effective April 7th, 2023, the problem statement, solution and hints for this question have been revised.

-- tweets Table:
-- Column Name	Type
-- user_id	integer
-- tweet_date	timestamp
-- tweet_count	integer

-- tweets Example Input:
-- user_id	tweet_date	tweet_count
-- 111	06/01/2022 00:00:00	2
-- 111	06/02/2022 00:00:00	1
-- 111	06/03/2022 00:00:00	3
-- 111	06/04/2022 00:00:00	4
-- 111	06/05/2022 00:00:00	5

-- Example Output:
-- user_id	tweet_date	rolling_avg_3d
-- 111	06/01/2022 00:00:00	2.00
-- 111	06/02/2022 00:00:00	1.50
-- 111	06/03/2022 00:00:00	2.00
-- 111	06/04/2022 00:00:00	2.67
-- 111	06/05/2022 00:00:00	4.00


-- SOLUTION
-- I have used WINDOW FUNCTION with PRECEDING to find the 3 days average rolling
SELECT user_id,tweet_date,
ROUND(AVG(tweet_count) OVER (PARTITION BY user_id ORDER BY tweet_date
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) as rolling_avg_3days
from tweets;


86.--(Datalemur) Top 5 Artists [Spotify SQL Interview Question]
-- Assume there are three Spotify tables: artists, songs, and global_song_rank, which contain information about the artists, songs, and music charts, respectively.

-- Write a query to find the top 5 artists whose songs appear most frequently in the Top 10 of the global_song_rank table. 
-- Display the top 5 artist names in ascending order, along with their song appearance ranking.

-- Assumptions:

-- If two or more artists have the same number of song appearances, they should be assigned the same ranking, and the rank numbers should be continuous (i.e. 1, 2, 2, 3, 4, 5).
-- For instance, if both Ed Sheeran and Bad Bunny appear in the Top 10 five times, they should both be ranked 1st and the next artist should be ranked 2nd.

-- artists Table:
-- Column Name	Type
-- artist_id	integer
-- artist_name	varchar
-- artists Example Input:
-- artist_id	artist_name
-- 101	Ed Sheeran
-- 120	Drake

-- songs Table:
-- Column Name	Type
-- song_id	integer
-- artist_id	integer
-- songs Example Input:
-- song_id	artist_id
-- 45202	101
-- 19960	120

-- global_song_rank Table:
-- Column Name	Type
-- day	integer (1-52)
-- song_id	integer
-- rank	integer (1-1,000,000)

-- global_song_rank Example Input:
-- day	song_id	rank
-- 1	45202	5
-- 3	45202	2
-- 1	19960	3
-- 9	19960	15

-- Example Output:
-- artist_name	artist_rank
-- Ed Sheeran	1
-- Drake	2

-- Explanation:
-- Ed Sheeran's song appeared twice in the Top 10 list of global song rank while Drake's song is only listed once. 
-- Therefore, Ed is ranked #1 and Drake is ranked #2.

-- SOLUTION
-- I have used WINDOW function under CTE and used LEFT JOIN to find out top 5 artists.
WITH top10 as (
        SELECT artists.artist_name, 
        DENSE_RANK() OVER (ORDER BY COUNT(songs.song_id) DESC ) as artist_rank
        FROM artists
        LEFT JOIN songs ON artists.artist_id = songs.artist_id
        LEFT JOIN global_song_rank ON songs.song_id = global_song_rank.song_id
        WHERE global_song_rank.rank <= 10
        GROUP BY artists.artist_name
)

select artist_name,artist_rank
FROM top10
WHERE artist_rank <= 5


87.--(Datalemur) TikTok users sign up
-- New TikTok users sign up with their emails. They confirmed their signup by replying to the text confirmation to activate their accounts. 
-- Users may receive multiple text messages for account confirmation until they have confirmed their new account.
-- A senior analyst is interested to know the activation rate of specified users in the emails table. 
-- Write a query to find the activation rate. Round the percentage to 2 decimal places.

-- Definitions:
-- emails table contain the information of user signup details.
-- texts table contains the users' activation information.

-- Assumptions:
-- The analyst is interested in the activation rate of specific users in the emails table, which may not include all users that could potentially be found in the texts table.
-- For example, user 123 in the emails table may not be in the texts table and vice versa.
-- Effective April 4th 2023, we added an assumption to the question to provide additional clarity.

-- emails Table:
-- Column Name	Type
-- email_id	integer
-- user_id	integer
-- signup_date	datetime

-- emails Example Input:
-- email_id	user_id	signup_date
-- 125	7771	06/14/2022 00:00:00
-- 236	6950	07/01/2022 00:00:00
-- 433	1052	07/09/2022 00:00:00

-- texts Table:
-- Column Name	Type
-- text_id	integer
-- email_id	integer
-- signup_action	varchar

-- texts Example Input:
-- text_id	email_id	signup_action
-- 6878	125	Confirmed
-- 6920	236	Not Confirmed
-- 6994	236	Confirmed
-- 'Confirmed' in signup_action means the user has activated their account and successfully completed the signup process.

-- Example Output:
-- confirm_rate
-- 0.67

-- Explanation:
-- 67% of users have successfully completed their signup and activated their accounts. The remaining 33% have not yet replied to the text to confirm their signup.

-- SOLUTION
-- I have used CASE function and INNER JOIN under CTE to find the signup activate rate.
WITH activation as (
  SELECT texts.email_id, CASE WHEN signup_action = 'Confirmed' THEN 1 ELSE 0 END as new_action 
  FROM texts
  INNER JOIN emails ON emails.email_id = texts.email_id
  )

SELECT ROUND(AVG(new_action),2) as confirm_rate FROM activation


88.--(Datalemur) Supercloud Customer [Microsoft SQL Interview Question]
-- A Microsoft Azure Supercloud customer is defined as a company that purchases at least one product from each product category.
-- Write a query that effectively identifies the company ID of such Supercloud customers.
-- As of 5 Dec 2022, data in the customer_contracts and products tables were updated.

-- customer_contracts Table:
-- Column Name	Type
-- customer_id	integer
-- product_id	integer
-- amount	integer

-- customer_contracts Example Input:
-- customer_id	product_id	amount
-- 1	1	1000
-- 1	3	2000
-- 1	5	1500
-- 2	2	3000
-- 2	6	2000

-- products Table:
-- Column Name	Type
-- product_id	integer
-- product_category	string
-- product_name	string
-- products Example Input:

-- product_id	product_category	product_name
-- 1	Analytics	Azure Databricks
-- 2	Analytics	Azure Stream Analytics
-- 4	Containers	Azure Kubernetes Service
-- 5	Containers	Azure Service Fabric
-- 6	Compute	Virtual Machines
-- 7	Compute	Azure Functions

-- Example Output:
-- customer_id
-- 1

-- Explanation:
-- Customer 1 bought from Analytics, Containers, and Compute categories of Azure, and thus is a Supercloud customer. 
-- Customer 2 isn't a Supercloud customer, since they don't buy any container services from Azure.

-- SOLUTION
-- I haved used INNER JOIN with HAVING to find out the supercloud customer.

SELECT cc.customer_id FROM customer_contracts cc
INNER JOIN products p ON p.product_id = cc.product_id
GROUP BY cc.customer_id
HAVING COUNT(DISTINCT(p.product_category)) >= 3 


89.--(Datalemur) Odd and Even Measurements [Google SQL Interview Question]
-- Assume you're given a table with measurement values obtained from a Google sensor over multiple days with measurements taken multiple times within each day.
-- Write a query to calculate the sum of odd-numbered and even-numbered measurements separately for a particular day and display the results in two different columns. 
-- Refer to the Example Output below for the desired format.

-- Definition:
-- Within a day, measurements taken at 1st, 3rd, and 5th times are considered odd-numbered measurements, and measurements taken at 2nd, 4th, and 6th times are considered even-numbered measurements.
-- Effective April 15th, 2023, the question and solution for this question have been revised.

-- measurements Table:
-- Column Name	Type
-- measurement_id	integer
-- measurement_value	decimal
-- measurement_time	datetime

-- measurements Example Input:
-- measurement_id	measurement_value	measurement_time
-- 131233	1109.51	07/10/2022 09:00:00
-- 135211	1662.74	07/10/2022 11:00:00
-- 523542	1246.24	07/10/2022 13:15:00
-- 143562	1124.50	07/11/2022 15:00:00
-- 346462	1234.14	07/11/2022 16:45:00

-- Example Output:
-- measurement_day	odd_sum	even_sum
-- 07/10/2022 00:00:00	2355.75	1662.74
-- 07/11/2022 00:00:00	1124.50	1234.14
-- Explanation
-- Based on the results,

-- On 07/10/2022, the sum of the odd-numbered measurements is 2355.75, while the sum of the even-numbered measurements is 1662.74.
-- On 07/11/2022, there are only two measurements available. 
-- The sum of the odd-numbered measurements is 1124.50, and the sum of the even-numbered measurements is 1234.14.

-- SOLUTION
-- I have used ROW_NUMBER WINDOW fucnction to get the even and odd number of the measurement and another way is we can use dense_rank
WITH new_measure AS (SELECT
date(measurement_time) as measurement_day,
measurement_value,
ROW_NUMBER() OVER(PARTITION BY date(measurement_time) ORDER BY measurement_time) AS rownumber
FROM measurements)

SELECT 
measurement_day,
SUM(CASE WHEN rownumber % 2 != 0 THEN measurement_value END) AS odd_sum,
SUM(CASE WHEN rownumber % 2 = 0 THEN measurement_value END) AS even_sum
FROM new_measure
GROUP BY measurement_day

90.--(Datalemur) Histogram of Users and Purchases [Walmart SQL Interview Question]
-- Assume you're given a table on Walmart user transactions. Based on their most recent transaction date, write a query that retrieve the users along with the number of products they bought.
-- Output the user's most recent transaction date, user ID, and the number of products, sorted in chronological order by the transaction date.
-- Starting from November 10th, 2022, the official solution was updated, and the expected output of transaction date, number of users, and number of products was changed to the current expected output.

-- user_transactions Table:
-- Column Name	Type
-- product_id	integer
-- user_id	integer
-- spend	decimal
-- transaction_date	timestamp

-- user_transactions Example Input:
-- product_id	user_id	spend	transaction_date
-- 3673	123	68.90	07/08/2022 12:00:00
-- 9623	123	274.10	07/08/2022 12:00:00
-- 1467	115	19.90	07/08/2022 12:00:00
-- 2513	159	25.00	07/08/2022 12:00:00
-- 1452	159	74.50	07/10/2022 12:00:00

-- Example Output:
-- transaction_date	user_id	purchase_count
-- 07/08/2022 12:00:00	115	1
-- 07/08/2022 12:00:000	123	2
-- 07/10/2022 12:00:00	159	1

-- SOLUTION
-- I have used CTE and Rank window function to find the most recent transactions.
WITH CTE as (
      SELECT ut.transaction_date, user_id, count(ut.transaction_date) as purchase_count,
      DENSE_RANK() OVER(PARTITION BY user_id ORDER BY ut.transaction_date DESC) as trans_rank
      FROM user_transactions ut
      GROUP BY ut.transaction_date, user_id
)

SELECT 
CTE.transaction_date,user_id,purchase_count
FROM CTE 
WHERE trans_rank = 1
ORDER BY CTE.transaction_date;

91.--(Datalemur) Compressed Mode [Alibaba SQL Interview Question]
-- You're given a table containing the item count for each order on Alibaba, along with the frequency of orders that have the same item count. 
-- Write a query to retrieve the mode of the order occurrences. Additionally, if there are multiple item counts with the same mode, the results should be sorted in ascending order.

-- Clarifications:
-- item_count: Represents the number of items sold in each order.
-- order_occurrences: Represents the frequency of orders with the corresponding number of items sold per order.
-- For example, if there are 800 orders with 3 items sold in each order, the record would have an item_count of 3 and an order_occurrences of 800.

-- items_per_order Table:
-- Column Name	Type
-- item_count	integer
-- order_occurrences	integer

-- items_per_order Example Input:
-- item_count	order_occurrences
-- 1	500
-- 2	1000
-- 3	800

-- Example Output:
-- mode
-- 2

-- Explanation:
-- Based on the example output, the order_occurrences value of 1000 corresponds to the highest frequency among all item counts.
-- This means that item count of 2 has occurred 1000 times, making it the mode of order occurrences.

-- SOLUTION
-- THERE can be 2 ways for this one with using Subquery or simple MAX with HAVING CLAUSE.
SELECT item_count as mode FROM items_per_order
WHERE order_occurrences = (SELECT MAX(order_occurrences) FROM items_per_order)

-- ---------OR--------- --

SELECT item_count as mode FROM items_per_order
GROUP by item_count
HAVING MAX(order_occurrences) = 1000
ORDER BY item_count

92.--(Datalemur) Card Launch Success [JPMorgan Chase SQL Interview Question]
-- Your team at JPMorgan Chase is soon launching a new credit card. You are asked to estimate how many cards you'll issue in the first month.
-- Before you can answer this question, you want to first get some perspective on how well new credit card launches typically do in their first month.
-- Write a query that outputs the name of the credit card, and how many cards were issued in its launch month. 
-- The launch month is the earliest record in the monthly_cards_issued table for a given card. Order the results starting from the biggest issued amount.

-- monthly_cards_issued Table:
-- Column Name	Type
-- issue_month	integer
-- issue_year	integer
-- card_name	string
-- issued_amount	integer

-- monthly_cards_issued Example Input:
-- issue_month	issue_year	card_name	issued_amount
-- 1	2021	Chase Sapphire Reserve	170000
-- 2	2021	Chase Sapphire Reserve	175000
-- 3	2021	Chase Sapphire Reserve	180000
-- 3	2021	Chase Freedom Flex	65000
-- 4	2021	Chase Freedom Flex	70000

-- Example Output:
-- card_name	issued_amount
-- Chase Sapphire Reserve	170000
-- Chase Freedom Flex	65000
-- Explanation
-- Chase Sapphire Reserve card was launched on 1/2021 with an issued amount of 170,000 cards and the Chase Freedom Flex card was launched on 3/2021 with an issued amount of 65,000 cards.

-- SOLUTION
-- I have used WITH function and DENSE_RANK window function to find the card issued in first launch
WITH c as (
      SELECT card_name, issued_amount,
      DENSE_RANK() OVER (PARTITION BY card_name ORDER BY issue_year, issue_month ) as card_rank
      FROM monthly_cards_issued
)
SELECT card_name, issued_amount 
FROM c
WHERE card_rank = 1
ORDER BY issued_amount DESC

93.--(Datalemur) International Call Percentage [Verizon SQL Interview Question]
A phone call is considered an international call when the person calling is in a different country than the person receiving the call.
What percentage of phone calls are international? Round the result to 1 decimal.

Assumption:
The caller_id in phone_info table refers to both the caller and receiver.

phone_calls Table:
Column Name	Type
caller_id	integer
receiver_id	integer
call_time	timestamp

phone_calls Example Input:
caller_id	receiver_id	call_time
1	2	2022-07-04 10:13:49
1	5	2022-08-21 23:54:56
5	1	2022-05-13 17:24:06
5	6	2022-03-18 12:11:49

phone_info Table:
Column Name	Type
caller_id	integer
country_id	integer
network	integer
phone_number	string

phone_info Example Input:
caller_id	country_id	network	phone_number
1	US	Verizon	+1-212-897-1964
2	US	Verizon	+1-703-346-9529
3	US	Verizon	+1-650-828-4774
4	US	Verizon	+1-415-224-6663
5	IN	Vodafone	+91 7503-907302
6	IN	Vodafone	+91 2287-664895

Example Output:
international_calls_pct
50.0
Explanation
There is a total of 4 calls with 2 of them being international calls 
(from caller_id 1 => receiver_id 5, and caller_id 5 => receiver_id 1). Thus, 2/4 = 50.0%

-- SOLUTION
-- I have used CASE function along with LEFT to find out the percentage of international calls.
SELECT ROUND(100.0 * 
SUM(CASE WHEN c.country_id != r.country_id THEN 1 ELSE NULL END)/COUNT(*),1)
as international_calls_pct
FROM phone_calls as calls
LEFT JOIN phone_info c 
  ON calls.caller_id = c.caller_id
LEFT JOIN phone_info r
  ON calls.receiver_id = r.caller_id

94.--(Datalemur) Tutorial Lesson: Pivoting using SQL CASE Statement [Concert SQL Interview Question]
-- As the lead data analyst for a prominent music event management company, you have been entrusted with a dataset containing concert revenue and detailed information about various artists.
-- Write a query that categorizes the artists based on their album release count. 
-- Display the output of the artist name, and album categort, sorted in ascending order of the artist's name.

-- The album category will be based on the number of albums released by the artists or bands:

-- If an artist has released 7 or more albums, they fall under the "Platinum" category.
-- If an artist has released between 3 and 6 albums (inclusive), they fall under the "Gold" category.
-- If an artist has released 2 or fewer albums, they fall under the "Silver" category.

-- concerts Schema:
-- Column Name	Type	Description
-- artist_id	integer	A unique identifier for each artist or band performing in the concert.
-- artist_name	varchar(100)	The name of the artist or band performing in the concert.
-- genre	varchar(50)	The music genre associated with the concert.
-- concert_revenue	integer	The total revenue generated from the concert.
-- year_of_formation	integer	The year that the artist or band was formed.
-- country	varchar(50)	The country of origin or residence of the artist or band.
-- number_of_members	integer	The number of members in the band.
-- album_released	integer	The total number of albums released by the artist or band.
-- label	varchar(100)	The record label or music company associated with the artist or band.

-- concerts Example Input:
-- artist_id	artist_name	genre	concert_revenue	year_of_formation	country	number_of_members	album_released	label
-- 103	Taylor Swift	Pop	700000	2004	United States	1	9	Republic Records
-- 104	BTS	K-Pop	800000	2013	South Korea	7	7	Big Hit Music
-- 105	Adele	Pop	600000	2006	United Kingdom	1	3	Columbia Records
-- 109	Blackpink	K-Pop	450000	2016	South Korea	4	5	YG Entertainment
-- 110	Maroon 5	Pop	550000	1994	United States	5	7	Interscope Records

-- SOLUTION
-- I have used CASE function to find out the artist category.
SELECT artist_name,
CASE WHEN album_released >= 7 THEN 'Platinum'
     WHEN album_released >= 3 and album_released <= 6 THEN 'Gold'
     ELSE 'Silver'
     END as album_category
FROM concerts
ORDER BY artist_name ASC;

95.--(Datalemur) Tutorial Lesson: CTE vs. Subquery [Concert Revenue SQL Interview Question]
-- As the lead data analyst for a prominent music event management company, you have been entrusted with a dataset containing concert revenue and detailed information about various artists.
-- Your mission is to unlock valuable insights by analyzing the concert revenue data and identifying the top revenue-generating artists within each music genre.
-- Write a query to rank the artists within each genre based on their revenue per member and extract the top revenue-generating artist from each genre. 
-- Display the output of the artist name, genre, concert revenue, number of members, and revenue per band member, sorted by the highest revenue per member within each genre.

-- concerts Schema:
-- Column Name	Type	Description
-- artist_id	integer	A unique identifier for each artist or band performing in the concert.
-- artist_name	varchar(100)	The name of the artist or band performing in the concert.
-- genre	varchar(50)	The music genre associated with the concert.
-- concert_revenue	integer	The total revenue generated from the concert.
-- year_of_formation	integer	The year that the artist or band was formed.
-- country	varchar(50)	The country of origin or residence of the artist or band.
-- number_of_members	integer	The number of members in the band.
-- album_released	integer	The total number of albums released by the artist or band.
-- label	varchar(100)	The record label or music company associated with the artist or band.

-- concerts Example Input:
-- artist_id	artist_name	genre	concert_revenue	year_of_formation	country	number_of_members	album_released	label
-- 103	Taylor Swift	Pop	700000	2004	United States	1	9	Republic Records
-- 104	BTS	K-Pop	800000	2013	South Korea	7	7	Big Hit Music
-- 105	Adele	Pop	600000	2006	United Kingdom	1	3	Columbia Records
-- 109	Blackpink	K-Pop	450000	2016	South Korea	4	5	YG Entertainment
-- 110	Maroon 5	Pop	550000	1994	United States	5	7	Interscope Records

-- SOLUTION
-- I have used CTE alon with DENSE_RANK window function to find the top artists within each genre based on 
-- their revenue per member and extract the top revenue-generating artist from each genre.
WITH CTE as (
     SELECT artist_name,concert_revenue, genre, number_of_members,
ROUND(concert_revenue/number_of_members) as revenue_per_member
FROM concerts
GROUP BY artist_name, genre, concert_revenue, number_of_members
ORDER BY concert_revenue DESC
),
CTE1 as (
     SELECT artist_name, concert_revenue, genre, number_of_members, revenue_per_member,
DENSE_RANK() OVER (PARTITION BY genre ORDER BY revenue_per_member DESC ) as rnk 
FROM CTE
)
SELECT artist_name, concert_revenue, genre, number_of_members, revenue_per_member FROM CTE1
WHERE rnk = 1
ORDER BY revenue_per_member DESC

96.--(Datalemur) Tutorial Lesson: Manipulating with SQL Case Statement [Marvel's Avengers SQL Interview Question]
-- Delve into the Marvel Avengers dataset and write a query to categorize the superheroes based on their average likes as follows:
-- Super Likes: Superheroes with an average likes count greater than or equal to 15,000.
-- Good Likes: Superheroes with an average likes count between 5,000 and 14,999 (inclusive).
-- Low Likes: Superheroes with an average likes count less than 5,000.
-- Display the superhero's character name, platform, average likes, and the corresponding likes category.

-- marvel_avengers Schema:
-- Column Name	Type	Description
-- actor	varchar	The name of the actor who portrays the Marvel Avengers character.
-- character	varchar	The name of the Marvel Avengers character.
-- superhero_alias	varchar	The superhero alias or code name of the character.
-- platform	varchar	The social media platform where the character has a presence.
-- followers	integer	The number of followers or subscribers on the character's social media platform.
-- posts	integer	The total number of posts made by the character on the social media platform.
-- engagement_rate	decimal(5,2)	The engagement rate of the character's posts on the social media platform.
-- avg_likes	integer	The average number of likes received on the character's posts.
-- avg_comments	integer	The average number of comments received on the character's posts.

-- marvel_avengers Example Input:
-- actor	character	superhero_alias	platform	followers	posts	engagement_rate	avg_likes	avg_comments
-- Robert Downey Jr.	Tony Stark	Iron Man	Instagram	500000	200	8.20	12000	800
-- Chris Evans	Steve Rogers	Captain America	Twitter	300000	150	6.50	8000	500
-- Scarlett Johansson	Natasha Romanoff	Black Widow	Instagram	700000	300	7.80	15000	1000
-- Chris Hemsworth	Thor	Thor	YouTube	400000	100	9.10	20000	1200
-- Mark Ruffalo	Bruce Banner	Hulk	Twitter	200000	80	5.30	6000	400

-- SOLUTION
-- I have used CASE function to find out the category of avg_likes from marvel and avengers.
SELECT actor, character, platform, avg_likes,
CASE
    WHEN avg_likes >= 15000 THEN 'Super Likes'
    WHEN avg_likes >= 5000 and avg_likes <= 14999 THEN 'Good Likes'
    ELSE 'Low Likes'
    END as category
FROM marvel_avengers
ORDER BY avg_likes DESC;

97.--(LeetCode) Last Person to Fit in the Bus
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | person_id   | int     |
-- | person_name | varchar |
-- | weight      | int     |
-- | turn        | int     |
-- +-------------+---------+
-- person_id is the primary key column for this table.
-- This table has the information about all people waiting for a bus.
-- The person_id and turn columns will contain all numbers from 1 to n, where n is the number of rows in the table.
-- turn determines the order of which the people will board the bus, where turn=1 denotes the first person to board and turn=n denotes the last person to board.
-- weight is the weight of the person in kilograms.
 
-- There is a queue of people waiting to board a bus. However, the bus has a weight limit of 1000 kilograms, so there may be some people who cannot board.

-- Write an SQL query to find the person_name of the last person that can fit on the bus without exceeding the weight limit. 
-- The test cases are generated such that the first person does not exceed the weight limit.

-- The query result format is in the following example.
-- Example 1:

-- Input: 
-- Queue table:
-- +-----------+-------------+--------+------+
-- | person_id | person_name | weight | turn |
-- +-----------+-------------+--------+------+
-- | 5         | Alice       | 250    | 1    |
-- | 4         | Bob         | 175    | 5    |
-- | 3         | Alex        | 350    | 2    |
-- | 6         | John Cena   | 400    | 3    |
-- | 1         | Winston     | 500    | 6    |
-- | 2         | Marie       | 200    | 4    |
-- +-----------+-------------+--------+------+
-- Output: 
-- +-------------+
-- | person_name |
-- +-------------+
-- | John Cena   |
-- +-------------+
-- Explanation: The folowing table is ordered by the turn for simplicity.
-- +------+----+-----------+--------+--------------+
-- | Turn | ID | Name      | Weight | Total Weight |
-- +------+----+-----------+--------+--------------+
-- | 1    | 5  | Alice     | 250    | 250          |
-- | 2    | 3  | Alex      | 350    | 600          |
-- | 3    | 6  | John Cena | 400    | 1000         | (last person to board)
-- | 4    | 2  | Marie     | 200    | 1200         | (cannot board)
-- | 5    | 4  | Bob       | 175    | ___          |
-- | 6    | 1  | Winston   | 500    | ___          |
-- +------+----+-----------+--------+--------------+

-- SOLUTION
-- I have used CTE function along with WINDOW function to find out last person to fit in the bus.
WITH CTE as(
SELECT person_name,weight,turn,
      SUM(weight) OVER (ORDER BY turn asc) as total_weight
from Queue
ORDER BY turn)

SELECT Q.person_name as person_name FROM Queue Q
WHERE Q.turn = (SELECT MAX(turn) FROM CTE WHERE total_weight <= 1000)

98.--(Hackerrank) OCCUPATIONS

https://www.hackerrank.com/challenges/occupations/problem?isFullScreen=true

-- SOLUTION
-- I have used WITH clause with WINDOW function, using UNION to combine the occupation and LEFT JOIN to get the occupations.
with _doctor as (SELECT name, 
                 ROW_NUMBER() OVER(ORDER BY name) as row_id 
                 FROM OCCUPATIONS
           WHERE Occupation = 'Doctor'),
_actor as (SELECT name, 
                 ROW_NUMBER() OVER(ORDER BY name) as row_id 
                 FROM OCCUPATIONS
           WHERE Occupation = 'Actor'),
_prof as (SELECT name, 
                 ROW_NUMBER() OVER(ORDER BY name) as row_id 
                 FROM OCCUPATIONS
           WHERE Occupation = 'Professor'),
_singer as (SELECT name, 
                 ROW_NUMBER() OVER(ORDER BY name) as row_id 
                 FROM OCCUPATIONS
           WHERE Occupation = 'Singer'),
_fake as (SELECT row_id FROM _doctor
         UNION
          SELECT row_id FROM _actor
         UNION
          SELECT row_id FROM _prof
         UNION
          SELECT row_id FROM _singer)
          
SELECT d.name, p.name, s.name, a.name FROM _fake f
LEFT JOIN _doctor d on f.row_id = d.row_id
LEFT JOIN _prof p on f.row_id = p.row_id
LEFT JOIN _singer s on f.row_id = s.row_id
LEFT JOIN _actor a on f.row_id = a.row_id

99.--(Hackerrank) Binary Tree Nodes

https://www.hackerrank.com/challenges/binary-search-tree-1/problem

-- SOLUTION
-- I have used CASE and Subquery to find the node of the binary tree.
SELECT N, 
CASE WHEN P is NULL THEN 'Root'
     WHEN N in (SELECT P FROM BST) THEN 'Inner'
     ELSE 'Leaf'
     END as Tree
     FROM BST
ORDER BY N

100.--(Hackerrank) The Company

https://www.hackerrank.com/challenges/the-company/problem?isFullScreen=true

-- SOLUTION
-- I have used DISTINCT and LEFT JOIN to find the company hierarchy.
SELECT
    C.company_code,
    C.founder,
    COUNT(DISTINCT(LM.lead_manager_code))AS no_of_lm,
    COUNT(DISTINCT(SM.senior_manager_code)) AS no_of_sm,
    COUNT(DISTINCT(M.manager_code)) AS no_of_manager,
    COUNT(DISTINCT(E.employee_code)) AS no_of_employee
FROM company C
LEFT JOIN Employee E ON C.company_code = E.company_code
LEFT JOIN Manager M ON C.company_code = M.company_code
LEFT JOIN Senior_Manager SM ON C.company_code = SM.company_code
LEFT JOIN Lead_Manager LM ON C.company_code = LM.company_code
GROUP BY C.company_code, C.founder
ORDER BY C.company_code ASC;

101.--(Hackerrank) Draw the triangle

https://www.hackerrank.com/challenges/draw-the-triangle-1/problem?isFullScreen=true

-- SOLUTION
-- Here i am using SET function with REPEAT to print the pattern in descending 
SET @numb = 21;
SELECT REPEAT('* ', @numb := @numb -1)
    FROM information_schema.tables 
    LIMIT 20;

102.--(Hackerrank) draw the triangle 2 

https://www.hackerrank.com/challenges/draw-the-triangle-2/problem?isFullScreen=true&h_r=next-challenge&h_v=zen

-- SOLUTIION
-- Here i am using SET function with REPEAT to print the pattern in ascending
SET @num = 0;
SELECT REPEAT('* ', @num := @num + 1)
    FROM information_schema.tables 
    LIMIT 20;

103.--(HackerRank) print prime number

https://www.hackerrank.com/challenges/print-prime-numbers/problem?isFullScreen=true

-- SOLUTION
-- I am using RECURSIVE CTE with GROUP CONCAT to find the prime number
-- (The recursive CTEs are used for series generation and traversal of hierarchical or tree-structured data)
WITH RECURSIVE prime_number (num) as (
SELECT 2
    UNION ALL
SELECT num + 1 FROM prime_number WHERE num <= 1000
),

CTE2 as (
SELECT num FROM prime_number
    WHERE num NOT IN (SELECT p.num FROM prime_number p, prime_number q
                     WHERE p.num > q.num AND p.num % q.num = 0)
)

SELECT GROUP_CONCAT(num SEPARATOR '&') as new_num FROM CTE2

104.--(Hackerrank) weather-observation-station-19

https://www.hackerrank.com/challenges/weather-observation-station-19/problem?isFullScreen=true

-- SOLUTION
-- I haved used Square aggregation with POWER to find out the euclidean distance
SELECT ROUND(SQRT(POWER(MAX(LAT_N)-MIN(LAT_N),2) + POWER(MAX(LONG_W)-MIN(LONG_W),2)),4) 
FROM STATION

105.--(Datalemur) Highest-Grossing Items [Amazon SQL Interview Question]
-- This is the same question as problem #12 in the SQL Chapter of Ace the Data Science Interview!

-- Assume you're given a table containing data on Amazon customers and their spending on products in different category, 
-- write a query to identify the top two highest-grossing products within each category in the year 2022. 
-- The output should include the category, product, and total spend.

-- product_spend Table:
-- Column Name	Type
-- category	string
-- product	string
-- user_id	integer
-- spend	decimal
-- transaction_date	timestamp

-- product_spend Example Input:
-- category	product	user_id	spend	transaction_date
-- appliance	refrigerator	165	246.00	12/26/2021 12:00:00
-- appliance	refrigerator	123	299.99	03/02/2022 12:00:00
-- appliance	washing machine	123	219.80	03/02/2022 12:00:00
-- electronics	vacuum	178	152.00	04/05/2022 12:00:00
-- electronics	wireless headset	156	249.90	07/08/2022 12:00:00
-- electronics	vacuum	145	189.00	07/15/2022 12:00:00

-- Example Output:
-- category	product	total_spend
-- appliance	refrigerator	299.99
-- appliance	washing machine	219.80
-- electronics	vacuum	341.00
-- electronics	wireless headset	249.90

-- Explanation:
-- Within the "appliance" category, the top two highest-grossing products are "refrigerator" and "washing machine."
-- In the "electronics" category, the top two highest-grossing products are "vacuum" and "wireless headset."
-- The dataset you are querying against may have different input & output - this is just an example!

-- SOLUTION
-- I have used CTE with SUM and ROW_NUMBER window function to find out the top 2 highest grossing item.
WITH CTE as (
SELECT category, product, spend,transaction_date,
SUM(spend) OVER(PARTITION BY product ORDER BY spend DESC) as sum_rn
FROM product_spend
ORDER BY category ASC
),

CTE2 as (SELECT *,
ROW_NUMBER() OVER(PARTITION BY category ORDER BY sum_rn DESC ) as n_rn
FROM CTE
WHERE transaction_date >= '01/01/2022' and  transaction_date <= '12/01/2022')

SELECT category, product, sum_rn as total_spend FROM CTE2
GROUP BY category, product, sum_rn
HAVING MAX(n_rn) <= 2
ORDER BY category, total_spend DESC,

106.--(Leetcode) Product Price at a given date
-- Write an SQL query to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

-- Return the result table in any order.

-- The query result format is in the following example.
-- Example 1:

-- Input: 
-- Products table:
-- +------------+-----------+-------------+
-- | product_id | new_price | change_date |
-- +------------+-----------+-------------+
-- | 1          | 20        | 2019-08-14  |
-- | 2          | 50        | 2019-08-14  |
-- | 1          | 30        | 2019-08-15  |
-- | 1          | 35        | 2019-08-16  |
-- | 2          | 65        | 2019-08-17  |
-- | 3          | 20        | 2019-08-18  |
-- +------------+-----------+-------------+
-- Output: 
-- +------------+-------+
-- | product_id | price |
-- +------------+-------+
-- | 2          | 50    |
-- | 1          | 35    |
-- | 3          | 10    |
-- +------------+-------+

-- SOLUTION
-- I have used CTE with window function and used UNION with SUBQUERY to get the product price.
WITH CTE AS (Select *, 
RANK() OVER(PARTITION BY product_id ORDER BY change_date DESC) as r
FROM Products
WHERE change_date <= '2019-08-16')


SELECT product_id, new_price as price 
FROM CTE
WHERE r = 1

UNION

SELECT product_id, 10 as price 
FROM Products
WHERE product_id NOT IN (SELECT product_id FROM CTE),

107. --(StrataScratch) Salaries Differences
--Write a query that calculates the difference between the highest salaries found in the marketing and engineering departments. 
--Output just the absolute difference in salaries.

-- SOLUTION
-- I have used CTE function with MIN and MAX function & LEFT JOIN
WITH CTE1 as (
SELECT MAX(e.salary) AS max_salary, d.department
FROM db_employee e
LEFT JOIN db_dept d ON e.department_id = d.id
WHERE d.department IN ('marketing', 'engineering')
GROUP BY d.department
)

select max(max_salary)-min(max_salary) as salary_diff from cte1,

108. --(StrataScratch) Finding Updated Records
-- We have a table with employees and their salaries, however, some of the records are old and contain outdated salary information. 
-- Find the current salary of each employee assuming that salaries increase each year. Output their id, first name, last name, department ID, and current salary. 
-- Order your list by employee ID in ascending order.

--SOLUTION
-- I have used simple max function to find out updated records
SELECT id, first_name, last_name, department_id, max(salary)
FROM ms_employee_salary
GROUP BY id, first_name, last_name, department_id
order by id ASC;


109. --(StrataScratch) Bike Last Used
-- Find the last time each bike was in use. Output both the bike number and the date-timestamp of the bike's last use (i.e., the date-time the bike was returned).
-- Order the results by bikes that were most recently used.

-- SOLUTION
-- I have used simple max function with group by function to find the bike last used.
select bike_number, max(end_time) as last_used 
from dc_bikeshare_q1_2012
GROUP BY bike_number
ORDER BY last_used DESC;


110. --(StrataScratch) Reviews of hotel Arena
-- Find the number of rows for each review score earned by 'Hotel Arena'.
-- Output the hotel name (which should be 'Hotel Arena'), review score along with the corresponding number of rows with that score for the specified hotel.

-- SOLUTION
-- I have used simple  SQL functions to find out the reviews
select hotel_name, reviewer_score, Count(total_number_of_reviews_reviewer_has_given)
from hotel_reviews
WHERE hotel_name = 'Hotel Arena'
GROUP By hotel_name, reviewer_score;


111. --(StrataScratch) Count the number of movies that Abigail Breslin nominated for oscar
-- Count the number of movies that Abigail Breslin was nominated for an oscar.

-- SOLUTION
-- I have used simple count function to find nominee for oscar
select Count(nominee) from oscar_nominees
WHERE nominee = 'Abigail Breslin';


112. --(StrataScratch) Popularity of Hack
-- Meta/Facebook has developed a new programing language called Hack.To measure the popularity of Hack they ran a survey with their employees. 
-- The survey included data on previous programing familiarity as well as the number of years of experience, age, gender and most importantly satisfaction with Hack.
-- Due to an error location data was not collected, but your supervisor demands a report showing average popularity of Hack by office location. 
-- Luckily the user IDs of employees completing the surveys were stored.
-- Output the location along with the average popularity.
-- Based on the above, find the average popularity of the Hack per office location.

-- SOLUTION
-- I have used simple JOIN to find the popularity of the hack.
SELECT fe.location,AVG(popularity) FROM facebook_hack_survey fs
JOIN facebook_employees fe ON fe.id = fs.employee_id
GROUP BY fe.location;


113. --(StrataScratch) Find all posts whihc were reacted to with a heart
-- Find all posts which were reacted to with a heart. For such posts output all columns from facebook_posts table.

-- SOLUTION
-- I have used simple join to find out the hearts reactions
select fp.post_id,fp.poster,fp.post_text,fp.post_keywords,post_date from facebook_posts fp
JOIN facebook_reactions fr ON fr.post_id = fp.post_id
where reaction = 'heart'
group by fp.post_id,fp.poster,fp.post_text,fp.post_keywords,post_date;


114. --(StrataScratch) Lyft Driver Wages
--Find all Lyft drivers who earn either equal to or less than 30k USD or equal to or more than 70k USD. Output all details related to retrieved records.

-- SOLUTION
-- I have used simple SQL functions
select index,start_date,end_date,yearly_salary from lyft_drivers
where yearly_salary <= 30000 or yearly_salary >= 70000;


115. --(StrataScratch) Find how many times each artist appeared on the spotify ranking list.
-- Find how many times each artist appeared on the Spotify ranking list
-- Output the artist name along with the corresponding number of occurrences.
-- Order records by the number of occurrences in descending order.

-- SOLUTION
-- I have used simple count function to find the rankings.
select artist, count(position) as n_occurrence from spotify_worldwide_daily_song_ranking
group by artist
order by n_occurrence DESC;


116. --(StrataScratch) Find the base pay for Police Captains
-- Find the base pay for Police Captains.
-- Output the employee name along with the corresponding base pay.

-- SOLUTION
-- I used simple SQL functions
select employeename, basepay from sf_public_salaries
WHERE jobtitle = 'CAPTAIN III (POLICE DEPARTMENT)'


117. --(StrataScratch) Most profitables Companies
-- Find the 3 most profitable companies in the entire world.
-- Output the result along with the corresponding company name.
-- Sort the result based on profits in descending order.

-- SOLUTION
-- I have used CTE function with  DENSE_RANK() Window function.

WITH CTE as (SELECT company, profits,
Dense_rank() OVER(order by profits) as dr
FROM forbes_global_2010_2014
)

SELECT company,profits FROM CTE
ORDER BY dr Desc
LIMIT  3;


118. --(StrataScratch) Worker with the highest salaries
-- You have been asked to find the job titles of the highest-paid employees.
-- Your output should include the highest-paid title or multiple titles with the same salary.

-- SOLUTION
-- I have used subquery to find out highest salaries
SELECT t.worker_title as best_paid_title FROM worker w
JOIN title t ON w.worker_id = t.worker_ref_id
WHERE w.salary = (SELECT MAX(salary) FROM worker)

119. --(StrataScratch) Activity Rank
--Find the email activity rank for each user. Email activity rank is defined by the total number of emails sent. 
-- The user with the highest number of emails sent will have a rank of 1, and so on. 
-- Output the user, total emails, and their activity rank. 
-- Order records by the total emails in descending order. Sort users with the same number of emails in alphabetical order.
-- In your rankings, return a unique value (i.e., a unique rank) even if multiple users have the same number of emails. 
-- For tie breaker use alphabetical order of the user usernames.

-- SOLUTION
-- I have used CTE function with ROW NUMBER window function
WITH CTE as (SELECT from_user, count(from_user) as cnt FROM google_gmail_emails
GROUP BY from_user)

SELECT from_user, cnt, ROW_NUMBER() OVER(ORDER BY cnt DESC, from_user ASC) as row_n FROM CTE
ORDER BY cnt DESC, from_user;


120. --(StrataScratch) Finding User Purchases
-- Write a query that'll identify returning active users.
--  A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. 
--  Output a list of user_ids of these returning active users.

-- SOLUTION
-- I have simply used simple JOIN function to get the users purchases
SELECT DISTINCT(a.user_id) FROM amazon_transactions a
JOIN amazon_transactions b
ON a.user_id = b.user_id and a.created_at - b.created_at  BETWEEN 0 and 7 and a.id != b.id


121. --(StrataScratch) New Products
-- You are given a table of product launches by company by year.
-- Write a query to count the net difference between the number of products companies launched in 2020 with the number of products companies launched in the previous year.
-- Output the name of the companies and a net difference of net products released for 2020 compared to the previous year.

-- SOLUTION
-- I have used CTE function with SUM aggregate function and CASE function to find the new product
WITH CTE as (SELECT company_name, SUM(CASE WHEN year = 2020 THEN 1 END) as y20,
SUM(CASE WHEN year = 2019 THEN 1 END) as y19
FROM car_launches
GROUP BY company_name)

SELECT company_name, y20-y19 as net_difference FROM CTE


122. --(StrataScratch) Ranking Most Active Guests
-- Rank guests based on the number of messages they've exchanged with the hosts. 
-- Guests with the same number of messages as other guests should have the same rank. Do not skip rankings if the preceding rankings are identical.
-- Output the rank, guest id, and number of total messages they've sent. Order by the highest number of total messages first.

-- SOLUTION
-- I have used DENSE_RANK() window function to find out the most ranking active guests
SELECT id_guest, sum(n_messages), dense_rank() over(order by sum(n_messages) DESC) as rnk
FROM airbnb_contacts
GROUP BY 1
ORDER BY id_guest DESC


123. --(StrataScratch) Number of units Per Nationality
-- Find the number of apartments per nationality that are owned by people under 30 years old.
-- Output the nationality along with the number of apartments.
-- Sort records by the apartments count in descending order

-- SOLUTION
-- I have used LEFT JOIN with COUNT and DISTINCT to find the units per nationality
SELECT ah.nationality, COUNT(DISTINCT(au.unit_id)) as apartment_count from airbnb_hosts ah
LEFT JOIN airbnb_units au ON ah.host_id = au.host_id
WHERE  au.unit_type = 'Apartment' and age < 30
GROUP BY ah.nationality, au.unit_type 

125. --(StrataScratch) Spam Posts
-- Calculate the percentage of spam posts in all viewed posts by day. A post is considered a spam if a string "spam" is inside keywords of the post.
-- Note that the facebook_posts table stores all posts posted by users.
-- The facebook_post_views table is an action table denoting if a user has viewed a post.

-- SOLUTION
-- I have used CTE function with LEFT JOIN, SUM and COUNT to find the percentage of spam posts
WITH CTE as (
SELECT *, Case
            WHEN fp.post_keywords LIKE '%spam%' THEN 1 
            ELSE 0
            END as spam 
FROM facebook_posts fp
LEFT JOIN facebook_post_views fpv ON fp.post_id = fpv.post_id
)

SELECT post_date, SUM(spam)*100/COUNT(*) as spam_percentage 
FROM CTE
WHERE viewer_id is NOT NULL
GROUP BY 1

126. --(StrataScratch) Find the percentage of shipable orders
-- Find the percentage of shipable orders.
-- Consider an order is shipable if the customer's address is known.

-- SOLUTION 1
-- I have used CTE with left join
WITH CTE AS (
SELECT 100 * (AVG(CASE WHEN c.address IS NOT NULL THEN 1 ELSE 0 END)) as shipable_percent FROM orders o
LEFT JOIN customers c ON o.cust_id = c.id
)
SELECT * FROM CTE

-- SOLUTION 2
-- I have used simple  aggregate function with left join
SELECT count(c.address)*100/count(*) as ship_percent FROM orders o
LEFT JOIN customers c ON o.cust_id = c.id

127. --(StrataScratch) Find matching hosts and guests in a way that they are both of the same gender and nationality
-- Find matching hosts and guests pairs in a way that they are both of the same gender and nationality.
-- Output the host id and the guest id of matched pair.

-- SOLUTION
-- I have used left join to find out the same pair
select ah.host_id, ag.guest_id from airbnb_hosts ah
LEFT JOIN airbnb_guests ag on  ah.gender = ag.gender and ah.nationality = ag.nationality
group by ah.host_id, ag.guest_id
order by ah.host_id;

128. --(StrataScratch) Income by title and gender
-- Find the average total compensation based on employee titles and gender.
-- Total compensation is calculated by adding both the salary and bonus of each employee.
-- However, not every employee receives a bonus so disregard employees without bonuses in your calculation. Employee can receive more than one bonus.
-- Output the employee title, gender (i.e., sex), along with the average total compensation.

-- SOLUTION
-- I have used CTE function and aggregate function to find income by title and gender.
WITH CTE as (
SELECT worker_ref_id, SUM(bonus) b
FROM sf_bonus
GROUP BY 1
)
SELECT sf.employee_title, sf.sex, AVG(sf.salary + b) as avg_compensation FROM sf_employee sf
JOIN CTE ON sf.id = CTE.worker_ref_id
GROUP BY 1,2

129. --(StrataScratch) Highest Energy Consumption
-- Find the date with the highest total energy consumption from the Meta/Facebook data centers.
-- Output the date along with the total energy consumption across all data centers.

-- SOLUTION
-- I have used CTE function with UNION with subqueries to find the highest consumption
WITH CTE AS (
SELECT date, SUM(consumption) as total_consumption FROM (
SELECT * FROM fb_eu_energy 
UNION
SELECT * FROM fb_asia_energy
UNION
SELECT * FROM fb_na_energy
) as CTE_q
GROUP BY CTE_q.date)

SELECT date, total_consumption FROM CTE
WHERE total_consumption = (SELECT MAX(total_consumption) FROM CTE)

130. --(StrataScratch) Top Cool votes
-- Find the review_text that received the highest number of  'cool' votes.
-- Output the business name along with the review text with the highest numbef of 'cool' votes.

-- SOLUTION
-- I have written simple subquery to find the top cool votes
SELECT business_name, review_text FROM yelp_reviews
WHERE cool = (SELECT MAX(cool) FROM yelp_reviews)
group by 1,2

131. --(StrataScratch) Reviews of Categories
-- Find the top business categories based on the total number of reviews.
-- Output the category along with the total number of reviews. Order by total reviews in descending order.

-- SOLUTION
-- I have use CTE's with SUM and DENSE_RANK window function to find out the top review of categories
WITH CTE as (SELECT review_count, business_id, unnest(string_to_array(categories, ';')) as category FROM yelp_business ),

CTE2 as (SELECT category, SUM(review_count) OVER(partition by category ORDER by business_id ASC ) cr FROM CTE
GROUP BY category, review_count, business_id),

CTE3 as (SELECT category,cr,  DENSE_RANK() OVER(PARTITION by category order by cr DESC) dr FROM CTE2
GROUP BY category, cr)

SELECT category, cr FROM CTE3
WHERE dr = 1
GROUP BY category,cr
ORDER BY cr DESC

132. --(StrataScratch) Top businesses with most reviews
-- Find the top 5 businesses with most reviews. Assume that each row has a unique business_id such that the total reviews for each business is listed on each row.
-- Output the business name along with the total number of reviews and order your results by the total reviews in descending order.

-- SOLUTION
-- I have used CTE function with DENSE_RANK
WITH CTE as (select name, review_count, DENSE_RANK() OVER(Order by review_count DESC) as re from yelp_business
GROUP BY name, review_count)

SELECT name, review_count FROM CTE
WHERE re <= 5

133. --(StrataScratch) Find all wineries which produce wines by possessing aromas of plum, cherry, rose, or hazelnut
--Find all wineries which produce wines by possessing aromas of plum, cherry, rose, or hazelnut. 
--To make it more simple, look only for singular form of the mentioned aromas. 
--HINT: if one of the specified words is just a substring of another word, this should not be a hit, but a miss.
--Example Description: Hot, tannic and simple, with cherry jam and currant flavors accompanied by high, tart acidity and chile-pepper alcohol heat.
--Therefore the winery Bella Piazza is expected in the results

--SOLUTION
-- I have used simple distinct function with LOWER and regular expression
SELECT DISTINCT winery FROM winemag_p1
WHERE lower(description) ~ '\y(plum|cherry|rose|hazelnut)\y'

134. --(StrataScratch) Top Ranked Songs
-- Find songs that have ranked in the top position. Output the track name and the number of times it ranked at the top. 
-- Sort your records by the number of times the song was in the top position in descending order.

-- SOLUTION
-- I have used simple GROUP By and count function to find the top ranked songs
SELECT trackname, count(trackname) as times_top FROM spotify_worldwide_daily_song_ranking
WHERE position = '1'
GROUP BY trackname
ORDER BY times_top DESC

135. --(StrataScratch) Largest Olympics
-- Find the Olympics with the highest number of athletes. The Olympics game is a combination of the year and the season, and is found in the 'games' column. 
-- Output the Olympics along with the corresponding number of athletes.

-- SOLUTION
-- I have used simple count, distinct, and group by function to find out the highest athlete by applying WHERE clause
select games, COUNT(Distinct Id) as highest_athlete  from olympics_athletes_events
where year = '1924'
group by games
ORDER by 2 DESC

136. --(StrataScratch) Highest cost orders
-- Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01.
-- If customer had more than one order on a certain day, sum the order costs on daily basis.
-- Output customer's first name, total cost of their items, and the date.
-- For simplicity, you can assume that every first name in the dataset is unique.

-- SOLUTION
-- I have used CTEs, LEFT JOIN, DENSE_RANK(), MAX and SUM functions to find the highest cost orders
WITH CTE as (SELECT c.first_name f, SUM(o.total_order_cost) t, o.order_date od 
    FROM customers c
LEFT JOIN orders o 
    ON c.id = o.cust_id 
WHERE o.order_date BETWEEN '2019-02-01' AND '2019-05-01'
GROUP BY c.first_name, o.order_date),

CTE2 as (SELECT f, t, DENSE_RANK() OVER(PARTITION BY f ORDER BY od DESC) as d, od 
FROM CTE
GROUP BY f, t, od
HAVING t = (SELECT MAX(t) FROM CTE))
 
SELECT f, t, od FROM CTE2

137. --(StrataScratch) Highest Target Under Manager
-- Find the highest target achieved by the employee or employees who works under the manager id 13. Output the first name of the employee and target achieved. 
-- The solution should show the highest target achieved under manager_id=13 and which employee(s) achieved it.

-- SOLUTION
-- I have used CTE with MAX aggregate function to find the target under manager
WITH CTE as (select first_name, manager_id, target from salesforce_employees
WHERE manager_id = 13
group by first_name, manager_id, target)

SELECT first_name,target from CTE
GROUP by first_name, target
having target = (SELECT MAX(target) FROM CTE)


138. --(StrataScratch) Highest salary in Department
-- Find the employee with the highest salary per department.
-- Output the department name, employee's first name along with the corresponding salary.

-- SOLUTION
-- I have used CTEs with MAX(), DENSE_RANK() window function to find highest salary in department
WITH CTE as (select department, first_name, MAX(salary) OVER(Partition by department ORDER BY salary ASC ) as salarys from employee),

CTE2 as (SELECT department,first_name, salarys, dense_rank() OVER(partition by department order by salarys Desc) as high_rank 
FROM CTE)

SELECT department, first_name, salarys FROM CTE2
WHERE high_rank = 1

139. --(StrataScratch) Employee and Manager Salaries
--Find employees who are earning more than their managers. Output the employee's first name along with the corresponding salary.

-- SOLUTION
-- I have used MAX() aggregate function to find the employees who earn more the manager
select first_name, MAX(salary) from employee
group by first_name, salary
having salary = (SELECT MAX(salary) FROM employee)

140. --(StrataScratch) Second highest Salary
-- Find the second highest salary of employees.

-- SOLUTION
-- I have used CTE with RANK() window function to find the second highest salary
WITH CTE as(select salary, rank() over(order by salary DESC) as r from employee)

SELECT salary FROM CTE
where r = 2

141. --(StrataScratch) Make a report showing the number of survivors and non-survivors by passenger class
-- Make a report showing the number of survivors and non-survivors by passenger class.
-- Classes are categorized based on the pclass value as:
-- pclass = 1: first_class
-- pclass = 2: second_classs
-- pclass = 3: third_class
-- Output the number of survivors and non-survivors by each class.

-- SOLUTION
-- I have used CASE to find the survival
SELECT survived,
SUM(CASE WHEN pclass = 1 THEN 1 ELSE 0 END) AS first_class,
SUM(CASE WHEN pclass = 2 THEN 1 ELSE 0 END) AS second_class,
SUM(CASE WHEN pclass = 3 THEN 1 ELSE 0 END) AS third_class
FROM titanic
GROUP BY survived

142. --(StrataScratch) Customer Revenue In March
-- Calculate the total revenue from each customer in March 2019. Include only customers who were active in March 2019.
-- Output the revenue along with the customer id and sort the results based on the revenue in descending order.

-- SOLUTION
-- I have used simple SUM aggregate function
select cust_id, SUM(total_order_cost) as revenue from orders
WHERE order_date >= '2019-03-01' AND order_date <= '2019-03-31'
GROUP by cust_id
ORDER BY 2 DESC

143. --(StrataScratch) Find the rate of processed tickets for each type
-- Find the rate of processed tickets for each type.

-- SOLUTION
-- I have simply used AVG aggregate function WITH CASE to find the each processed type
select type,
AVG(CASE
WHEN processed = TRUE THEN 1 ELSE 0 END) as processed_rate
from facebook_complaints
group by type

144. --(StrataScratch) Number of violations
-- You're given a dataset of health inspections. Count the number of violation in an inspection in 'Roxanne Cafe' for each year.
-- If an inspection resulted in a violation, there will be a value in the 'violation_id' column. Output the number of violations by year in ascending order.

-- SOLUTION
-- I have used EXTRACT function to get the date and to find the number of violations by year
SELECT extract(year from inspection_date), count(inspection_score) FROM sf_restaurant_health_violations
WHERE business_name = 'Roxanne Cafe'
GROUP BY inspection_date

145. --(StrataScratch) Classify Business Type
-- Classify each business as either a restaurant, cafe, school, or other.
-- •	A restaurant should have the word 'restaurant' in the business name.
-- •	A cafe should have either 'cafe', 'café', or 'coffee' in the business name.
-- •	A school should have the word 'school' in the business name.
-- •	All other businesses should be classified as 'other'.
-- Output the business name and their classification.

-- SOLUTION
-- I have used LOWER in CASE function to find the classification business type
SELECT
    business_name,
CASE
    WHEN LOWER(business_name) LIKE '%restaurant%' THEN 'restaurant'
    WHEN LOWER(business_name) LIKE '%cafe%' OR LOWER(business_name) LIKE '%café%' OR LOWER(business_name) LIKE '%coffee%' THEN 'cafe'
    WHEN LOWER(business_name) LIKE '%school%' THEN 'school'
ELSE 'other'
    END AS business_type
FROM
    sf_restaurant_health_violations
GROUP BY business_name

146. --(StrataScratch) Find the top 10 ranked songs in 2010
-- What were the top 10 ranked songs in 2010? Output the rank, group name, and song name but do not show the same song twice.
-- Sort the result based on the year_rank in ascending order.

-- SOLUTION
-- I have used DISTINCT to find the top rank in 2010
select DISTINCT(year_rank) rank, group_name, song_name
from billboard_top_100_year_end
where year = 2010
group by id, year, year_rank, song_name, group_name
order by rank ASC
limit 10;

147. --(StrataScratch) User with Most Approved Flags
-- Which user flagged the most distinct videos that ended up approved by YouTube? Output, in one column, their full name or names in case of a tie. 
-- In the user's full name, include a space between the first and the last name.

-- SOLUTION
-- I have used LEFT JOIN with CTE and DENSE_RANK() window function to find the approved flags
WITH CTE as (select
    count(DISTINCT uf.video_id) as v,
    Concat(uf.user_firstname, ' ', uf.user_lastname) username
from
    user_flags uf
left join
    flag_review fr ON uf.flag_id = fr.flag_id
WHERE
    fr.reviewed_outcome = 'APPROVED'
group by
    uf.user_firstname, uf.user_lastname
order by
    v desc
),

CTE1 as (SELECT username, dense_rank() over(order by v DESC) as dr FROM CTE)

SELECT username FROM CTE1
WHERE dr = 1

148. --(StrataScratch) flags per video
-- For each video, find how many unique users flagged it.
-- A unique user can be identified using the combination of their first name and last name. Do not consider rows in which there is no flag ID.

-- SOLUTION
-- I have used CONCAT function to merge the name and group by to find out flags per video
SELECT video_id,
count(DISTINCT (concat(user_firstname, ' ', user_lastname))) as uni_fullname
from user_flags
where flag_id is not null
group by video_id

149. --(StrataScratch) Share of active users
-- Output share of US users that are active. Active users are the ones with an "open" status in the table.

-- SOLUTION
-- I have used ROUND, AVG function with CASE function to find the share of active users
select ROUND(AVG(case when status = 'open' then 1 else 0 end),1) as active_user_shares from fb_active_users;

150. --(LeetCode) 185. Department Top Three Salaries
-- A company's executives are interested in seeing who earns the most money in each of the company's departments.
-- A high earner in a department is an employee who has a salary in the top three unique salaries for that department.
-- Write a solution to find the employees who are high earners in each of the departments.Return the result table in any order.

-- SOLUTION
-- I have used CTE function and DENSE_RANK() wwindow function with INNER JOIN to find out the Department Top Three Salaries
WITH CTE as (
    SELECT name, departmentId, salary ,dense_rank() over(partition by departmentId Order by salary DESC) as Dr
    FROM Employee)

SELECT d.name as Department,c.name as Employee,c.salary as Salary
FROM CTE c
INNER JOIN Department d on c.departmentId = d.id
WHERE dr < 4

151. --(LeetCode) Investment in 2016
--Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:
-- have the same tiv_2015 value as one or more other policyholders, and
-- are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
-- Round tiv_2016 to two decimal places.

-- The result format is in the following example.

-- Example 1:

-- Input:
-- Insurance table:
-- +-----+----------+----------+-----+-----+
-- | pid | tiv_2015 | tiv_2016 | lat | lon |
-- +-----+----------+----------+-----+-----+
-- | 1   | 10       | 5        | 10  | 10  |
-- | 2   | 20       | 20       | 20  | 20  |
-- | 3   | 10       | 30       | 20  | 20  |
-- | 4   | 10       | 40       | 40  | 40  |
-- +-----+----------+----------+-----+-----+
-- Output:
-- +----------+
-- | tiv_2016 |
-- +----------+
-- | 45.00    |
-- +----------+
-- Explanation:
-- The first record in the table, like the last record, meets both of the two criteria.
-- The tiv_2015 value 10 is the same as the third and fourth records, and its location is unique.

-- The second record does not meet any of the two criteria. 
-- Its tiv_2015 is not like any other policyholders and its location is the same as the third record, which makes the third record fail, too.
-- So, the result is the sum of tiv_2016 of the first and last record, which is 45.

-- SOLUTION
-- I have used concat and subquery with round and sum function to find the investment in 2016
SELECT ROUND(SUM(tiv_2016), 2) as tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*)>1
)
AND CONCAT(lat,lon) IN
(
    SELECT CONCAT(lat,lon)
    FROM Insurance
    GROUP BY lat,lon
    HAVING COUNT(tiv_2016)=1
)

152.--(HackerRank) Weather Observation Station 20

https://www.hackerrank.com/challenges/weather-observation-station-20/problem?isFullScreen=true

-- SOLUTION
-- I have used CTE function with RANK() window function to find the median of the weather
WITH CTE AS(
SELECT ROUND(LAT_N,4) as LAT_N,
    RANK() OVER(ORDER BY LAT_N ASC) AS NRank
    FROM STATION
)

SELECT LAT_N
FROM CTE
WHERE NRank = (SELECT (COUNT(LAT_N)+1)/2 FROM CTE)

153. --(Stratascratch) Find students with a median writing score
-- Output ids of students with a median score from the writing SAT.

-- SOLUTION
-- I have used percentile_cont() function to find the median from the sat scores
SELECT student_id
FROM sat_scores
WHERE sat_writing = (SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY sat_writing) as satwriting  FROM sat_scores)

154. --(Stratascratch) Most Lucrative Products
-- You have been asked to find the 5 most lucrative products in terms of total revenue for the first half of 2022 (from January to June inclusive).
-- Output their IDs and the total revenue.

-- SOLUTION
I Have used simple SUM function with group by to find the most lucrative products
WITH CTE as (select product_id, SUM((cost_in_dollars) * units_sold) as total_revenue from online_orders
WHERE date >= '2022-01-01' AND date <= '2022-06-30'
group by product_id, units_sold)

SELECT product_id, SUM(total_revenue) FROM CTE
GROUP BY 1
ORDER BY sum DESC
limit 5
-- OR
select product_id, SUM(cost_in_dollars * units_sold) as total_revenue from online_orders
WHERE date >= '2022-01-01' AND date <= '2022-06-30'
group by product_id
ORDER BY total_revenue DESC
limit 5

155. --(Stratascratch) Number of Shipments per month
-- Write a query that will calculate the number of shipments per month.
-- The unique key for one shipment is a combination of shipment_id and sub_id.
-- Output the year_month in format YYYY-MM and the number of shipments in that month.

-- SOLUTION
-- I have used to_char and CONCAT function to find the shipments per month
SELECT to_char(shipment_date, 'YYYY-MM') as year_month, COUNT(CONCAT(shipment_id, sub_id)) FROM amazon_shipment
GROUP BY year_month

156. --(Stratascratch) Unique Users Per Client Per Month
-- Write a query that returns the number of unique users per client per month

-- SOLUTION
-- I have used EXTRACT() function to get the month from the date and used DISTINCT to find the unique users per client per month
select  client_id, EXTRACT(MONTH FROM time_id) as month,  COUNT(DISTINCT(user_id)) as d from fact_events
GROUP by 1,2

157. --(Stratascratch) Average Salaries
-- Compare each employee's salary with the average salary of the corresponding department.
-- Output the department, first name, and salary of employees along with the average salary of that department.

-- SOLUTION
-- I have used avg() and over() to find the average salaries
SELECT department, first_name, salary, AVG(salary) OVER(PARTITION BY department) as average FROM employee
GROUP by 1,2,3

158. --(Stratascratch) Order Details
-- Find order details made by Jill and Eva.
-- Consider the Jill and Eva as first names of customers.
-- Output the order date, details and cost along with the first name.
-- Order records based on the customer id in ascending order.

-- SOLUTION
-- I have used LEFT JOIN to find the order details of Jill and Eva
SELECT c.first_name, o.order_date, o.order_details, o.total_order_cost FROM customers c
LEFT JOIN orders o ON
c.id = o.cust_id
WHERE c.first_name IN ('Jill', 'Eva')
ORDER BY o.cust_id ASC

159. --(Stratascratch) Customer Details
-- Find the details of each customer regardless of whether the customer made an order. Output the customer's first name, last name, and the city along with the order details.
-- You may have duplicate rows in your results due to a customer ordering several of the same items. Sort records based on the customer's first name and the order details in ascending order.

-- SOLUTION
-- I have used LEFT JOIN to find the customer details
SELECT c.first_name,c.last_name, c.city, o.order_details FROM customers c
LEFT JOIN orders o ON
c.id = o.cust_id
ORDER BY c.first_name ASC

160. --(Stratascratch) Number of Bathrooms and Bedrooms
--Find the average number of bathrooms and bedrooms for each city’s property types. Output the result along with the city name and the property type.

-- SOLUTION
-- I have used simple AVG() function to find the average number of bathrooms and bedrooms.
SELECT city, property_type, AVG(bathrooms) as avg_bath, AVG(bedrooms) as avg_bed
FROM airbnb_search_details
GROUP BY 1,2;

161. --(Stratascratch) Churro activity date
-- Find the activity date and the pe_description of facilities with the name 'STREET CHURROS' and with a score of less than 95 points.

-- SOLUTION
-- I have used simple SELECT statement with WHERE clause to find churro acitvity date.
select activity_date, pe_description
from los_angeles_restaurant_health_inspections
WHERE facility_name = 'STREET CHURROS' and score < 95

162. --(Stratascratch) Count the number of user events performed by MacBookPro users
-- Count the number of user events performed by MacBookPro users.
-- Output the result along with the event name.
-- Sort the result based on the event count in the descending order

-- SOLUTION
-- I have used simple count function to find the numbers of user events performed by macbook pro
select event_name, COUNT(device) as count_event
from playbook_events
WHERE device = 'macbook pro'
GROUP by 1;

163. --(Stratascratch) Find the most profitable company in the financial sector of the entire world along with its continent
-- Find the most profitable company from the financial sector. Output the result along with the continent.

-- SOLUTION
-- I have 2 solution one is simply using WHERE clasue to filter out the result and another one is writing subquery in WHERE clause with MAX() function
select company, continent from forbes_global_2010_2014
WHERE sector = 'Financials' and rank = 1

-- OR

SELECT company, continent FROM forbes_global_2010_2014
WHERE profits = (SELECT MAX(profits) FROM forbes_global_2010_2014)

164. --(Stratascratch) Admin Department Employees Beginning in April or Later
--Find the number of employees working in the Admin department that joined in April or later.

-- SOLUTION
-- I have used COUNT() function to find the number of employee working in 'Admin' department
select count(department) as n_admin from worker
where joining_date >= '2014-04-01' AND department = 'Admin'

165. --(Stratascratch) Number of Workers by Department Starting in April or Later
-- Find the number of workers by department who joined in or after April.
-- Output the department name along with the corresponding number of workers.
-- Sort records based on the number of workers in descending order.

-- SOLUTION
-- I have used COUNT() function to find out number of workers by department satrting in april or later
select department, COUNT(worker_id) from worker
WHERE joining_date >= '2014-04-01'
GROUP BY 1;

166. --(Stratascratch) Find libraries who haven't provided the email address in circulation year 2016 but their notice preference definition is set to email
-- Find libraries who haven't provided the email address in circulation year 2016 but their notice preference definition is set to email.
-- Output the library code.

-- SOLUTION
-- I have used WHERE clause to find the libraries who havent provided the email address.
select home_library_code from library_usage
WHERE circulation_active_year = '2016' and
    notice_preference_definition = 'email' and
    provided_email_address = FALSE
GROUP BY 1;

167. --(StrataScratch) Acceptance Rate By Date
-- What is the overall friend acceptance rate by date? Your output should have the rate of acceptances by the date the request was sent. Order by the earliest date to latest.
-- Assume that each friend request starts by a user sending (i.e., user_id_sender) a friend request to another user (i.e., user_id_receiver) that's logged in the table with action = 'sent'.
-- If the request is accepted, the table logs action = 'accepted'. If the request is not accepted, no record of action = 'accepted' is logged.

-- SOLUTION
-- I have used LEAD() window function with CTE to find the acceptance rate by date
WITH CTE as (SELECT date, action,
    LEAD(action) OVER(PARTITION BY user_id_sender, user_id_receiver ORDER BY date ASC) as dr
FROM fb_friend_requests)

SELECT date, COUNT(dr)*1.0/COUNT(action)
FROM CTE
WHERE action = 'sent'
GROUP BY 1

168. --(StrataScratch) Top 5 States With 5 Star Businesses
-- Find the top 5 states with the most 5 star businesses.
-- Output the state name along with the number of 5-star businesses and order records by the number of 5-star businesses in descending order.
-- In case there are ties in the number of businesses, return all the unique states. If two states have the same result, sort them in alphabetical order.

-- SOOLUTION
-- I have used CTE with RANK() Window function to find out the 5 states with 5 star businessess
WITH CTE as (select state, COUNT(DISTINCT(business_id)) as b from yelp_business
WHERE stars = 5
group by 1,business_id),

CTE1 as (SELECT state, SUM(b) as n_businessess FROM CTE
group by 1,b
ORDER BY n_businessess DESC),

CTE2 as (SELECT *, rank() over(order by n_businessess DESC) as d FROM CTE1)

SELECT state, n_businessess FROM CTE2
where d <= 5

169. --(Stratascratch) Find the number of times each word appears in drafts
-- Find the number of times each word appears in drafts.
-- Output the word along with the corresponding number of occurrences.

-- SOLUTION
-- I have used Unnest() with STRING_TO_ARRAY() function to find out the number of times each word appears
SELECT
    TRIM(BOTH '.,' FROM LOWER(UNNEST(STRING_TO_ARRAY(contents, ' ')))) as un_words,
    COUNT(*)
FROM google_file_store
WHERE filename LIKE '%draft%'
GROUP BY un_words

170. --(Stratascratch) City With Most Amenities
-- You're given a dataset of searches for properties on Airbnb. For simplicity, let's say that each search result (i.e., each row) represents a unique host.
-- Find the city with the most amenities across all their host's properties. Output the name of the city.

-- SOLUTION
-- I have used CTE with ARRAY_LENGTH() function to know the number of items in an array and used STRING_TO_ARRAY() to split a string into array elements using supplied delimiter
WITH CTE as (SELECT city,
SUM(ARRAY_LENGTH(STRING_TO_ARRAY(amenities, ','),1)) as t
FROM airbnb_search_details
group by city),

CTE2 as (SELECT city, RANK() OVER(ORDER BY t DESC) as r
FROM CTE)

SELECT city
FROM CTE2
WHERE r = 1

171. --(StrataScratch) Host Popularity Rental Prices
-- You’re given a table of rental property searches by users. The table consists of search results and outputs host information for searchers.
-- Find the minimum, average, maximum rental prices for each host’s popularity rating. The host’s popularity rating is defined as below:
-- 0 reviews: New
-- 1 to 5 reviews: Rising
-- 6 to 15 reviews: Trending Up
-- 16 to 40 reviews: Popular
-- more than 40 reviews: Hot
-- Tip: The id column in the table refers to the search ID. You'll need to create your own host_id by concating price, room_type, host_since, zipcode, and number_of_reviews.
-- Output host popularity rating and their minimum, average and maximum rental prices.

-- SOLUTION
-- I have used CTE with CASE function and used MIN(), AVG(), MAX() aggregate function to find the host popularity rental prices
WITH CTE as (select
        CASE WHEN number_of_reviews = 0 THEN 'New'
            WHEN number_of_reviews >= 1 and number_of_reviews <= 5 THEN 'Rising'
            WHEN number_of_reviews >= 6 and number_of_reviews <= 15 THEN 'Trending Up'
            WHEN number_of_reviews >= 16 and number_of_reviews <= 40 THEN 'Popular'
            ELSE 'Hot' END as host_pop_rating,
            price
from airbnb_host_searches
GROUP BY price,room_type,host_since,zipcode,number_of_reviews)

SELECT host_pop_rating, Min(price), AVG(price), Max(price) FROM CTE
GROUP by 1

172. --(StrataScratch) Counting Instances in Text
-- Find the number of times the words 'bull' and 'bear' occur in the contents.
-- We're counting the number of times the words occur so words like 'bullish' should not be included in our count.
-- Output the word 'bull' and 'bear' along with the corresponding number of occurrences.

-- SOLUTION
-- I have used TRIM(), LOWER(), UNNEST() which is used to transform an array into a set of rows and STRING_TO_ARRAY() to split a string into array elements using supplied delimiter
WITH CTE as (SELECT TRIM(BOTH '.,' FROM LOWER(UNNEST(STRING_TO_ARRAY(contents, ' ')))) as word ,COUNT(*) as c
FROM google_file_store
group by contents)

SELECT word, SUM(c)
FROM CTE
WHERE word IN ('bull', 'bear')
group by 1

173. --(StrataScratch) Monthly Percentage Difference
-- Given a table of purchases by date, calculate the month-over-month percentage change in revenue.
-- The output should include the year-month date (YYYY-MM) and percentage change, rounded to the 2nd decimal point, and sorted from the beginning of the year to the end of the year.
-- The percentage change column will be populated from the 2nd month forward and can be calculated as ((this month's revenue - last month's revenue) / last month's revenue)*100.

-- SOLUTION
-- I have used LAG() window function with 3 CTE's by utilizing EXTRACT() and CONCAT() to get the monthly percentage.
WITH CTE as (SELECT value, EXTRACT(YEAR FROM created_at) as y, EXTRACT(MONTH FROM created_at) as m
FROM sf_transactions
order by m ASC),

CTE2 as (SELECT y,m, CONCAT(y,'-',m) as year_month, SUM(value) as v FROM CTE
group by y,m
order by m ASC),

CTE3 as (SELECT m,year_month, v, LAG(v) OVER(ORDER BY m ASC) as l FROM CTE2
order by m ASC)

SELECT year_month, ROUND((((v-l)/l )* 100),2) FROM CTE3
order by m ASC

174. --(StrataScratch) Top Percentile Fraud
-- ABC Corp is a mid-sized insurer in the US and in the recent past their fraudulent claims have increased significantly for their personal auto insurance portfolio.
-- They have developed a ML based predictive model to identify propensity of fraudulent claims. Now, they assign highly experienced claim adjusters for top 5 percentile of claims identified by the model.
-- Your objective is to identify the top 5 percentile of claims from each state. Your output should be policy number, state, claim cost, and fraud score.

-- SOLUTION
-- I have used Percent_rank() window function with CTE to find top percentile fraud
WITH CTE as(SELECT *, percent_rank() OVER(PARTITION BY state ORDER BY fraud_score Desc) as p FROM fraud_score)

SELECT policy_num, state, claim_cost, fraud_score From CTE
WHERE p <= 0.05
