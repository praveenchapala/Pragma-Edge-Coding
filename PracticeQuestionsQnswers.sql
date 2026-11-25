# SQL Practice Questions — Solutions

## 1. Basic SQL (1–10)

### 1. Display all employees
```sql
SELECT * FROM Employees;
```

### 2. Display employee names and salaries
```sql
SELECT emp_name, salary
FROM Employees;
```

### 3. Find employees earning more than 50,000
```sql
SELECT *
FROM Employees
WHERE salary > 50000;
```

### 4. Find employees working in the IT department
```sql
SELECT *
FROM Employees
WHERE department = 'IT';
```

### 5. Display employees in descending order of salary
```sql
SELECT *
FROM Employees
ORDER BY salary DESC;
```

### 6. Find employees earning between 40,000 and 60,000
```sql
SELECT *
FROM Employees
WHERE salary BETWEEN 40000 AND 60000;
```

### 7. Display unique department names
```sql
SELECT DISTINCT department
FROM Employees;
```

### 8. Find employees whose names start with 'R'
```sql
SELECT *
FROM Employees
WHERE emp_name LIKE 'R%';
```

### 9. Display the top 3 highest-paid employees
```sql
SELECT *
FROM Employees
ORDER BY salary DESC
LIMIT 3;
```

### 10. Find employees who do not have a manager
```sql
SELECT *
FROM Employees
WHERE manager_id IS NULL;
```

---

## 2. Aggregate Functions (11–18)

### 11. Find the total number of employees
```sql
SELECT COUNT(*) AS total_employees
FROM Employees;
```

### 12. Find the highest salary
```sql
SELECT MAX(salary) AS highest_salary
FROM Employees;
```

### 13. Find the average salary
```sql
SELECT AVG(salary) AS average_salary
FROM Employees;
```

### 14. Find the total salary of each department
```sql
SELECT department, SUM(salary) AS total_salary
FROM Employees
GROUP BY department;
```

### 15. Count employees in each department
```sql
SELECT department, COUNT(*) AS employee_count
FROM Employees
GROUP BY department;
```

### 16. Find departments having more than 2 employees
```sql
SELECT department, COUNT(*) AS employee_count
FROM Employees
GROUP BY department
HAVING COUNT(*) > 2;
```

### 17. Find the average salary of each department
```sql
SELECT department, AVG(salary) AS average_salary
FROM Employees
GROUP BY department;
```

### 18. Find the department with the highest total salary
```sql
SELECT department, SUM(salary) AS total_salary
FROM Employees
GROUP BY department
ORDER BY total_salary DESC
LIMIT 1;
```

---

## 3. Joins (19–25)

### 19. Display employee names and their department locations
```sql
SELECT e.emp_name, d.location
FROM Employees e
JOIN Departments d
    ON e.department = d.department;
```

### 20. Display employees who have a matching department
```sql
SELECT e.*
FROM Employees e
INNER JOIN Departments d
    ON e.department = d.department;
```

### 21. Display all departments and their employees, including departments without employees
```sql
SELECT d.department, e.emp_name
FROM Departments d
LEFT JOIN Employees e
    ON d.department = e.department;
```

### 22. Find employees whose department does not exist in the Departments table
```sql
SELECT e.*
FROM Employees e
LEFT JOIN Departments d
    ON e.department = d.department
WHERE d.department IS NULL;
```

### 23. Display each employee and their manager's name
```sql
SELECT e.emp_name AS employee,
       m.emp_name AS manager
FROM Employees e
LEFT JOIN Employees m
    ON e.manager_id = m.emp_id;
```

### 24. Find employees earning more than their managers
```sql
SELECT e.emp_name AS employee,
       e.salary AS employee_salary,
       m.emp_name AS manager,
       m.salary AS manager_salary
FROM Employees e
JOIN Employees m
    ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;
```

### 25. Find departments that have no employees
```sql
SELECT d.department
FROM Departments d
LEFT JOIN Employees e
    ON d.department = e.department
WHERE e.emp_id IS NULL;
```

---

## 4. Advanced SQL (26–35)

### 26. Find employees earning more than the average salary
```sql
SELECT *
FROM Employees
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
);
```

### 27. Find the second-highest salary
```sql
SELECT MAX(salary) AS second_highest_salary
FROM Employees
WHERE salary < (
    SELECT MAX(salary)
    FROM Employees
);
```

### 28. Find the highest salary in each department
```sql
SELECT department, MAX(salary) AS highest_salary
FROM Employees
GROUP BY department;
```

### 29. Find departments whose average salary is greater than 50,000
```sql
SELECT department, AVG(salary) AS average_salary
FROM Employees
GROUP BY department
HAVING AVG(salary) > 50000;
```

### 30. Find the third-highest distinct salary
```sql
SELECT DISTINCT salary
FROM Employees
ORDER BY salary DESC
LIMIT 1 OFFSET 2;
```

### 31. Find customers whose total order amount is greater than 4,000
```sql
SELECT customer_name,
       SUM(amount) AS total_amount
FROM Orders
GROUP BY customer_name
HAVING SUM(amount) > 4000;
```

### 32. Find the highest-paid employee in each department
```sql
SELECT emp_name, department, salary
FROM (
    SELECT emp_name,
           department,
           salary,
           RANK() OVER (
               PARTITION BY department
               ORDER BY salary DESC
           ) AS salary_rank
    FROM Employees
) ranked
WHERE salary_rank = 1;
```

### 33. Rank employees by salary
```sql
SELECT emp_name,
       salary,
       RANK() OVER (
           ORDER BY salary DESC
       ) AS salary_rank
FROM Employees;
```

### 34. Calculate a running total of order amounts
```sql
SELECT order_id,
       customer_name,
       amount,
       SUM(amount) OVER (
           ORDER BY order_date, order_id
       ) AS running_total
FROM Orders;
```

### 35. Find employees earning more than any employee in HR
```sql
SELECT *
FROM Employees
WHERE salary > ALL (
    SELECT salary
    FROM Employees
    WHERE department = 'HR'
);
```

---

## 5. Interview-Level SQL (36–45)

### 36. Find the second-highest salary without using LIMIT
```sql
SELECT MAX(salary) AS second_highest_salary
FROM Employees
WHERE salary < (
    SELECT MAX(salary)
    FROM Employees
);
```

### 37. Find duplicate salaries
```sql
SELECT salary, COUNT(*) AS employee_count
FROM Employees
GROUP BY salary
HAVING COUNT(*) > 1;
```

### 38. Find employees who share the same salary
```sql
SELECT emp_name, salary
FROM Employees
WHERE salary IN (
    SELECT salary
    FROM Employees
    GROUP BY salary
    HAVING COUNT(*) > 1
)
ORDER BY salary DESC;
```

### 39. Find the top 2 highest-paid employees in each department
```sql
SELECT emp_name, department, salary
FROM (
    SELECT emp_name,
           department,
           salary,
           ROW_NUMBER() OVER (
               PARTITION BY department
               ORDER BY salary DESC
           ) AS row_num
    FROM Employees
) ranked
WHERE row_num <= 2;
```

**Note:** Use `DENSE_RANK()` instead of `ROW_NUMBER()` if you want to include employees tied at the same salary.

### 40. Find the salary range of each department
```sql
SELECT department,
       MAX(salary) - MIN(salary) AS salary_range
FROM Employees
GROUP BY department;
```

### 41. Find the month with the highest total order amount
```sql
SELECT DATE_FORMAT(order_date, '%Y-%m') AS order_month,
       SUM(amount) AS total_amount
FROM Orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY total_amount DESC
LIMIT 1;
```

### 42. Find customers who placed more than one order
```sql
SELECT customer_name,
       COUNT(*) AS order_count
FROM Orders
GROUP BY customer_name
HAVING COUNT(*) > 1;
```

### 43. Calculate each employee's salary as a percentage of the total salary
```sql
SELECT emp_name,
       salary,
       ROUND(
           salary * 100.0 /
           (SELECT SUM(salary) FROM Employees),
           2
       ) AS salary_percentage
FROM Employees;
```

### 44. Find employees who joined before their managers

This question requires a `hire_date` column in the Employees table.

```sql
SELECT e.emp_name AS employee,
       e.hire_date AS employee_hire_date,
       m.emp_name AS manager,
       m.hire_date AS manager_hire_date
FROM Employees e
JOIN Employees m
    ON e.manager_id = m.emp_id
WHERE e.hire_date < m.hire_date;
```

### 45. Find the median salary
```sql
WITH RankedSalaries AS (
    SELECT salary,
           ROW_NUMBER() OVER (
               ORDER BY salary
           ) AS row_num,
           COUNT(*) OVER () AS total_rows
    FROM Employees
)
SELECT AVG(salary) AS median_salary
FROM RankedSalaries
WHERE row_num IN (
    FLOOR((total_rows + 1) / 2),
    FLOOR((total_rows + 2) / 2)
);
```

**Important:** The median is the middle salary after sorting. For an even number of employees, it is the average of the two middle salaries.
