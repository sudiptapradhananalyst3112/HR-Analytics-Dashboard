# HR Analytics Dashboard (SQL & Tableau)

## 📌 Project Overview
An end-to-end HR data analysis framework designed to track employee headcount, monitor attrition rates, and uncover demographic patterns impacting workforce retention. Data was queried, aggregated, and validated using PostgreSQL before being visualized dynamically in Tableau.

<img width="1510" height="847" alt="HR ANALYSTICS DB SS" src="https://github.com/user-attachments/assets/1f7a197b-8498-44d6-a490-ad648bc449e2" />


## 🛠️ Tech Stack & Tools
- **Database Engine:** PostgreSQL (Aggregations, conditional counts, matrix pivots)
- **Visualization:** Tableau Desktop
- **Data Attributes:** 1,470 Employees | 237 Attrition Count | 16.12% Attrition Rate

## 📊 Key Insights Uncovered
- **Department Dynamics:** The R&D department holds the highest overall attrition count (133), but the Sales department bears a higher internal turnover rate (20.63%).
- **Satisfaction Correlates:** Cross-tabulation matrices revealed lower retention values among frontline Sales Representatives compared to long-term Healthcare Representatives.
- **Demographic Peaks:** Attrition heavily spikes within the 25–34 age bracket, accounting for 29.11% of total employee departures.

## 💾 SQL Snippets Implemented
```sql
-- Dynamic Attrition Calculation verified alongside Tableau KPIs
SELECT ROUND(((SELECT COUNT(attrition) FROM hrdata WHERE attrition = 'Yes') /
SUM(employee_count)) * 100, 2) AS attrition_rate
FROM hrdata;
```
