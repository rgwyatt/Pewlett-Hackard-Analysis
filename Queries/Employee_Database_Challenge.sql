
--SELECT emp_no,
--first_name,
--last_name
--FROM employees
--WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')

--SELECT title,
--from_date,
--to_date
--FROM titles


SELECT employees.emp_no,
employees.first_name,
employees.last_name,
titles.title,
titles.from_date,
titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31');

-- SELECT * FROM retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) retirement_titles.emp_no,
retirement_titles.first_name,
retirement_titles.last_name,
retirement_titles.title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, from_date DESC;

-- SELECT * FROM unique_titles