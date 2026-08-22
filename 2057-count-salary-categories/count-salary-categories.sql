# Write your MySQL query statement below
WITH salary_counts AS (
    SELECT
        SUM(income < 20000 ) AS low_count,
        SUM(income BETWEEN 20000 AND 50000 ) AS average_count,
        SUM(income > 50000 ) AS high_count
    FROM Accounts
)

SELECT 'Low Salary' AS category, low_count AS accounts_count
FROM salary_counts

UNION ALL

SELECT 'Average Salary', average_count
FROM salary_counts

UNION ALL

SELECT 'High Salary', high_count
FROM salary_counts;