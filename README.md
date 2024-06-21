# SQL Assessment: Employee Management System

## Overview

This project is designed to test the ability to design relational databases, write complex SQL queries, and handle data relationships. The assessment involves creating a schema for an Employee Management System and writing several SQL queries to interact with the data.

## Database Schema

The project consists of three tables: `employees`, `departments`, and `salaries`.

### Tables

1. **Departments**
    - `department_id` (INT, Primary Key)
    - `department_name` (VARCHAR(100), NOT NULL)

2. **Employees**
    - `employee_id` (INT, Primary Key)
    - `first_name` (VARCHAR(50), NOT NULL)
    - `last_name` (VARCHAR(50), NOT NULL)
    - `department_id` (INT, Foreign Key referencing `departments(department_id)`)
    - `hire_date` (DATE)

3. **Salaries**
    - `employee_id` (INT, Foreign Key referencing `employees(employee_id)`)
    - `salary` (DECIMAL(10, 2))
    - `from_date` (DATE)
    - `to_date` (DATE)
    - Primary Key (`employee_id`, `from_date`)

## SQL Queries

### 1. Find all employees who have been hired in the last year

```sql
SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
