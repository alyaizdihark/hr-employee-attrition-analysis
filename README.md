# HR Employee Attrition Analysis

## Project Overview

This project analyzes employee data using SQL and Looker Studio to identify key factors associated with employee attrition. The analysis examines employee turnover across gender, age groups, job roles, overtime, monthly income, and tenure. The project aims to provide data-driven insights and actionable business recommendations to help the company identify employee groups with higher attrition and develop targeted retention strategies.

---

## Business Questions

1. Which gender has the highest number of employees left? 
2. Which age group has the highest number of employees left? 
3. Which job roles have the highest number of employees left? 
4. Do employees who work overtime account for more employees left? 
5. Which monthly income group has the highest number of employees left? 
6. At what tenure stage do most employees leave?

---

## Tools Used

- SQL
- Looker Studio

---

## Dataset

- Total Records: 1,470
- Total Columns: 35
- Source: Kaggle HR Analytics Employee Attrition 

---

## Dashboard Preview

![Dashboard](dashboard.png)

---

## Looker Studio Dashboard

🔗 **Dashboard Link:** https://datastudio.google.com/reporting/0140b410-2b9c-405e-addc-672832581dae 

---

## Key Insights

- The dataset contains **1,470 employees**, with **237 employees leaving**, resulting in an overall **16.12% attrition rate**.
- **Male employees** account for the largest share of employees left.
- The **26–35 age group** has the highest number of employees left.
- **Laboratory Technicians** have the highest number of employees left.
- Employees who **work overtime** account for 53.6% of employees left. 
- Employees earning **< $3K** have the highest number of employees left. 
- Employees with **0–2 years of tenure** have the highest number of employees left.

---

## Business Recommendations
- The company should monitor employee attrition patterns by gender by ensuring fair access to career opportunities, compensation, career development programs, and workplace support for both male and female employees.
- The company should focus on employees aged 26–35 by providing clearer career development opportunities, such as training, skill development, mentoring, and internal mobility, so employees have opportunities to grow within the company.
- The company should prioritize retention efforts for Laboratory Technicians by reviewing workload, career development opportunities, and compensation and benefits to ensure they remain competitive. Employee feedback can also be collected to identify areas that need improvement for this role.
- The company should improve overtime management by reviewing workload distribution and staffing needs, while ensuring that overtime is properly managed and fairly compensated. The company should also support employees' work-life balance and well-being to ensure overtime is driven by specific business needs rather than becoming a regular working condition.
- The company should review compensation for employees with a monthly income below $3K, including salary competitiveness, performance incentives, alignment between compensation and job responsibilities or position level, and career advancement opportunities to support employee retention.
- The company should strengthen retention efforts during the first two years of employment by improving onboarding and employee engagement. This can include providing regular feedback, offering mentoring, and communicating clear career development opportunities from the beginning of employment.

---

## Repository Contents

| File | Description |
| --- | --- |
| `README.md` | Project documentation and summary |
| `employee_attrition_analysis.sql` | SQL queries used for data cleaning, KPI calculation, and business analysis |
| `dashboard.png` | Looker Studio dashboard preview |
