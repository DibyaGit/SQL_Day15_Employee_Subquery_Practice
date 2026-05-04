# SQL Subqueries and Joins Case Study

## Overview
This repository contains a structured SQL practice project designed to demonstrate proficiency in writing complex subqueries and joins. The provided SQL script builds a sample company database from scratch and executes nine progressive problem statements, focusing on data retrieval, filtering, and query optimization in Microsoft SQL Server (SSMS).

## Database Schema
The project utilizes a mock database named `CompanyDB` consisting of two primary tables:
* **Departments**: Contains department details (`DeptID`, `DeptName`, `Location`).
* **Employees**: Contains employee records (`EmpID`, `EmpName`, `Salary`, `DeptID`).

## Key Concepts Covered
* **Scalar and Aggregate Subqueries**: Using `AVG()` and `MAX()` for direct comparisons.
* **Correlated Subqueries**: Comparing row-level data against grouped department data.
* **Nested Subqueries**: Utilizing subqueries within `IN` and `HAVING` clauses.
* **Query Optimization**: Refactoring correlated subqueries using `JOIN` and derived tables to improve performance.
* **Multi-Condition Filtering**: Combining joins, derived tables, and specific `WHERE` clause conditions.

## How to Use
1. Open Microsoft SQL Server Management Studio (SSMS).
2. Create a new query window.
3. Open the `Employee_Subquery_Practice.sql` file or paste the code into the query window.
4. Execute the script. The script includes `DROP TABLE IF EXISTS` commands, meaning it can be run multiple times safely without producing object duplication errors.
5. The results for all nine tasks will output automatically in the results grid.
