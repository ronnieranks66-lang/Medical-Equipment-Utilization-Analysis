-- Copy of alternative SQL analysis for use from the dashboard code folder
-- Source: analysis/sql/alternative_analysis.sql

-- Alternative analysis using SQL on the processed dataset
-- Assumes a table named equipment_utilization with columns matching:
-- Date, Equipment_ID, Equipment_Type, Department, Available_Hours,
-- Actual_Operating_Hours, Utilization_Rate, Number_of_Procedures,
-- Cost_per_procedure, Daily_Operating_Cost, Procedure_Revenue,
-- Day_of_Week, Month, Is_Weekend, Net_Profit_daily

-- 1. Basic EDA: overall counts and descriptive stats (simplified)

SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT Equipment_ID) AS distinct_equipment,
  MIN(Date) AS min_date,
  MAX(Date) AS max_date
FROM equipment_utilization;

SELECT
  AVG(Available_Hours) AS avg_available_hours,
  AVG(Actual_Operating_Hours) AS avg_actual_hours,
  AVG(Utilization_Rate) AS avg_utilization_rate,
  AVG(Number_of_Procedures) AS avg_procedures
FROM equipment_utilization;

-- 2. Utilization metrics by equipment type

SELECT
  Equipment_Type,
  COUNT(*) AS n_days,
  AVG(Available_Hours) AS avg_available_hours,
  AVG(Actual_Operating_Hours) AS avg_actual_hours,
  AVG(Utilization_Rate) AS avg_utilization_rate,
  SUM(Number_of_Procedures) AS total_procedures,
  AVG(Number_of_Procedures) AS avg_procedures_per_day
FROM equipment_utilization
GROUP BY Equipment_Type
ORDER BY avg_utilization_rate DESC;

-- 3. Utilization metrics by department

SELECT
  Department,
  COUNT(*) AS n_days,
  AVG(Utilization_Rate) AS avg_utilization_rate,
  SUM(Number_of_Procedures) AS total_procedures
FROM equipment_utilization
GROUP BY Department
ORDER BY avg_utilization_rate DESC;

-- 4. Time-based utilization patterns (by month and weekend flag)

SELECT
  Month,
  AVG(Utilization_Rate) AS avg_utilization_rate,
  SUM(Number_of_Procedures) AS total_procedures
FROM equipment_utilization
GROUP BY Month
ORDER BY avg_utilization_rate DESC;

SELECT
  Is_Weekend,
  COUNT(*) AS n_days,
  AVG(Utilization_Rate) AS avg_utilization_rate,
  SUM(Number_of_Procedures) AS total_procedures
FROM equipment_utilization
GROUP BY Is_Weekend;

-- 5. Financial and ROI analysis by equipment type

SELECT
  Equipment_Type,
  COUNT(*) AS n_days,
  SUM(Procedure_Revenue) AS total_revenue,
  SUM(Daily_Operating_Cost) AS total_operating_cost,
  SUM(Net_Profit_daily) AS total_net_profit,
  CASE
    WHEN SUM(Daily_Operating_Cost) <> 0
      THEN SUM(Net_Profit_daily) / SUM(Daily_Operating_Cost)
  END AS roi_ratio,
  CASE
    WHEN SUM(Procedure_Revenue) <> 0
      THEN SUM(Net_Profit_daily) / SUM(Procedure_Revenue)
  END AS profit_margin_ratio,
  SUM(Net_Profit_daily) / COUNT(*) AS avg_profit_per_day
FROM equipment_utilization
GROUP BY Equipment_Type
ORDER BY roi_ratio DESC;

-- 6. Financial and ROI analysis by department

SELECT
  Department,
  COUNT(*) AS n_days,
  SUM(Procedure_Revenue) AS total_revenue,
  SUM(Daily_Operating_Cost) AS total_operating_cost,
  SUM(Net_Profit_daily) AS total_net_profit,
  CASE
    WHEN SUM(Daily_Operating_Cost) <> 0
      THEN SUM(Net_Profit_daily) / SUM(Daily_Operating_Cost)
  END AS roi_ratio,
  CASE
    WHEN SUM(Procedure_Revenue) <> 0
      THEN SUM(Net_Profit_daily) / SUM(Procedure_Revenue)
  END AS profit_margin_ratio,
  SUM(Net_Profit_daily) / COUNT(*) AS avg_profit_per_day
FROM equipment_utilization
GROUP BY Department
ORDER BY roi_ratio DESC;


