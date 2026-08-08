CREATE DATABASE employee;
SELECT * FROM employee;

-- DATA CLEANSING & DATA PREPARATION
-- 1. Data type check
DESCRIBE employee;

-- 2. Duplicate check
SELECT EmployeeNumber, 
	COUNT(*) AS total_duplicate
FROM employee
GROUP BY EmployeeNumber
HAVING total_duplicate > 1;

-- 3. Missing values check
   SELECT
    SUM(Age IS NULL) AS Age,
    SUM(Attrition IS NULL) AS Attrition,
    SUM(BusinessTravel IS NULL) AS BusinessTravel,
    SUM(DailyRate IS NULL) AS DailyRate,
    SUM(Department IS NULL) AS Department,
    SUM(DistanceFromHome IS NULL) AS DistanceFromHome,
    SUM(Education IS NULL) AS Education,
    SUM(EducationField IS NULL) AS EducationField,
    SUM(EmployeeCount IS NULL) AS EmployeeCount,
    SUM(EmployeeNumber IS NULL) AS EmployeeNumber,
    SUM(EnvironmentSatisfaction IS NULL) AS EnvironmentSatisfaction,
    SUM(Gender IS NULL) AS Gender,
    SUM(HourlyRate IS NULL) AS HourlyRate,
    SUM(JobInvolvement IS NULL) AS JobInvolvement,
    SUM(JobLevel IS NULL) AS JobLevel,
    SUM(JobRole IS NULL) AS JobRole,
    SUM(JobSatisfaction IS NULL) AS JobSatisfaction,
    SUM(MaritalStatus IS NULL) AS MaritalStatus,
    SUM(MonthlyIncome IS NULL) AS MonthlyIncome,
    SUM(MonthlyRate IS NULL) AS MonthlyRate,
    SUM(NumCompaniesWorked IS NULL) AS NumCompaniesWorked,
    SUM(Over18 IS NULL) AS Over18,
    SUM(OverTime IS NULL) AS OverTime,
    SUM(PercentSalaryHike IS NULL) AS PercentSalaryHike,
    SUM(PerformanceRating IS NULL) AS PerformanceRating,
    SUM(RelationshipSatisfaction IS NULL) AS RelationshipSatisfaction,
    SUM(StandardHours IS NULL) AS StandardHours,
    SUM(StockOptionLevel IS NULL) AS StockOptionLevel,
    SUM(TotalWorkingYears IS NULL) AS TotalWorkingYears,
    SUM(TrainingTimesLastYear IS NULL) AS TrainingTimesLastYear,
    SUM(WorkLifeBalance IS NULL) AS WorkLifeBalance,
    SUM(YearsAtCompany IS NULL) AS YearsAtCompany,
    SUM(YearsInCurrentRole IS NULL) AS YearsInCurrentRole,
    SUM(YearsSinceLastPromotion IS NULL) AS YearsSinceLastPromotion,
    SUM(YearsWithCurrManager IS NULL) AS YearsWithCurrManager
FROM employee;

-- KPIs
-- Total Employees
SELECT COUNT(*) AS TotalEmployees
FROM employee;
-- Active Employees
SELECT COUNT(*) AS ActiveEmployees
FROM employee
WHERE Attrition = 'No';
-- Employees Left
SELECT COUNT(*) AS EmployeesLeft
FROM employee
WHERE Attrition = 'Yes';
-- Attrition Rate
SELECT ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)/COUNT(*))*100,2) AS AttritionRate
FROM employee;
-- Average Monthly Income
SELECT ROUND(AVG(MonthlyIncome),0) AS AverageMonthlyIncome
FROM employee;
-- Average Years at Company
SELECT ROUND(AVG(YearsAtCompany),2) AS AverageYearsAtCompany
FROM employee;


-- Business Question
-- Which department has the highest employee attrition rate?
SELECT Department,
	COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 / COUNT(*),
        2
    ) AS AttritionRate
FROM employee
GROUP BY Department
ORDER BY AttritionRate DESC;

-- Which job roles experience the highest employee attrition rate?
SELECT JobRole,
	COUNT(*) AS TotalEmployees,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 / COUNT(*),
        2
    ) AS AttritionRate
FROM employee
GROUP BY JobRole
ORDER BY AttritionRate DESC;

-- Which age groups have the highest employee attrition rate?
SELECT
	CASE WHEN Age BETWEEN 18 AND 25 THEN '18-25'
		WHEN Age BETWEEN 26 AND 35 THEN '26-35'
		WHEN Age BETWEEN 36 AND 45 THEN '36-45'
		ELSE '46+'
	END AS AgeGroup,
	COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 / COUNT(*),
        2
    ) AS AttritionRate
FROM employee
GROUP BY AgeGroup
ORDER BY AttritionRate DESC;

-- At what stage of an employee's tenure is attrition most likely to occur?
SELECT YearsAtCompany,
	COUNT(*) AS EmployeesLeft
FROM employee
WHERE Attrition = 'Yes'
GROUP BY YearsAtCompany
ORDER BY EmployeesLeft DESC;

-- Do employees who work overtime have a higher attrition rate?
SELECT OverTime,
	COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 / COUNT(*),
        2
    ) AS AttritionRate
FROM employee
GROUP BY OverTime
ORDER BY AttritionRate DESC;

-- Does business travel appear to be associated with employee attrition?
SELECT BusinessTravel,
	COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 / COUNT(*),
        2
    ) AS AttritionRate
FROM employee
GROUP BY BusinessTravel
ORDER BY AttritionRate DESC;
    
-- How does average monthly income differ across job roles?
SELECT JobRole,
	ROUND(AVG(MonthlyIncome),0) AS AverageMonthlyIncome
FROM employee
GROUP BY JobRole
ORDER BY AverageMonthlyIncome DESC;