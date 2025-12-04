## Slide 1 – Title & Team

- **Title**: Medical Equipment Utilization Analysis & ROI Dashboard
- **Subtitle**: Data-Driven Insights for Hospital Equipment Planning
- **Prepared by**: *[Your Name / Team]*
- **Date**: *[Insert Date]*

---

## Slide 2 – Agenda

- **Project Objectives & Scope**
- **Data & Methodology**
- **Exploratory Data Analysis (EDA)**
- **Utilization Metrics & Operational Insights**
- **Financial & ROI Analysis**
- **Dashboards & Decision Support**
- **Recommendations & Next Steps**

---

## Slide 3 – Project Objectives

- **Primary goals**
  - Quantify how effectively key medical equipment is utilized.
  - Assess financial performance and ROI at equipment-type and department level.
  - Identify under- and over-utilized assets to guide operational and investment decisions.
- **Key questions**
  - Which equipment types deliver the highest utilization and ROI?
  - Where are there capacity gaps or inefficiencies?
  - How do utilization and profitability vary over time (months, weekdays vs weekends)?

---

## Slide 4 – Scope of Analysis

- **Equipment types**
  - MRI scanners, CT scanners, X-ray machines, mammography units, ultrasound.
- **Dimensions analyzed**
  - Utilization rate, available vs actual hours.
  - Number of procedures performed.
  - Procedure revenue, operating cost, and net profit.
- **Time dimension**
  - Multiple months across a calendar year.
  - Day-of-week and weekend vs weekday behavior.

---

## Slide 5 – Data Sources & Structure

- **Data sources**
  - Raw synthetic dataset: `data/raw/medical_equipment_utilization_synthetic.csv`.
  - Cleaned dataset: `data/processed/medical_equipment_utilization_synthetic_cleaned(in).csv`.
  - Excel summaries: EDA, utilization, and ROI workbooks in `analysis/`.
- **Key fields**
  - `Date`, `Equipment_ID`, `Equipment_Type`, `Department`.
  - `Available_Hours`, `Actual_Operating_Hours`, `Utilization_Rate`.
  - `Number_of_Procedures`, `Daily_Operating_Cost`, `Procedure_Revenue`, `Net-Profit (daily)`.

---

## Slide 6 – Data Preparation & Cleaning

- **Standardization**
  - Normalized column names (spaces → underscores).
  - Dropped empty or redundant columns.
- **Type conversions**
  - Parsed `Date` to datetime.
  - Converted utilization metrics and counts to numeric.
- **Currency handling**
  - Stripped `KES`, commas, and spaces from currency fields.
  - Converted `Cost_per_procedure`, `Daily_Operating_Cost`, `Procedure_Revenue`, `Net-Profit (daily)` to numeric.

---

## Slide 7 – Feature Engineering

- **Time-based features**
  - Used `Day_of_Week`, `Month`, and `Is_Weekend` for temporal analysis.
- **Aggregations**
  - By **equipment type**: procedures, utilization, revenue, cost, net profit.
  - By **department**: share of volume and financial contribution.
  - By **month**: seasonal trends in utilization and profitability.

---

## Slide 8 – EDA: Utilization Overview

- **Utilization rate distribution**
  - Broad spread from very low (< 0.2) to very high (> 0.9) utilization.
  - Indicates both under-used and near-capacity equipment in the fleet.
- **Hours analysis**
  - Relationship between `Available_Hours` and `Actual_Operating_Hours` varies by modality.
  - Some equipment consistently under-runs available hours.

---

## Slide 9 – EDA: Equipment & Department Mix

- **Equipment mix**
  - Radiology holds most high-tech modalities (MRI, CT, X-ray, Ultrasound).
  - Women’s Health focuses heavily on mammography units.
- **Department patterns**
  - Radiology drives the majority of procedures and revenue.
  - Women’s Health contributes meaningful volume through mammography with efficient utilization.

---

## Slide 10 – Utilization by Equipment Type

- **Key KPIs by equipment type**
  - Average utilization rate.
  - Average available vs actual operating hours.
  - Average and total procedures performed.
- **Typical synthetic findings**
  - CT and Ultrasound often show **high utilization** and strong throughput.
  - MRI units show **mixed utilization**, some well-used, others under-utilized.
  - Mammography units are **consistently busy**, especially in Women’s Health.

---

## Slide 11 – Utilization by Department & Time

- **By department**
  - Radiology: high overall utilization and volume; central to hospital imaging services.
  - Women’s Health: focused but efficient use of mammography equipment.
- **By time**
  - Certain months show higher average utilization and profit, revealing seasonal demand.
  - Weekends: fewer operating days but not always lower **average** profit per operating day.

---

## Slide 12 – Financial Metrics & Definitions

- **Key financial variables**
  - **Revenue**: sum of `Procedure_Revenue` by unit/type/department.
  - **Operating cost**: sum of `Daily_Operating_Cost`.
  - **Net profit**: `Revenue – Operating Cost` (daily, then aggregated).
- **KPIs**
  - **ROI (%)** = Net Profit ÷ Operating Cost × 100.
  - **Profit margin (%)** = Net Profit ÷ Revenue × 100.
  - **Avg profit per day** = Net Profit ÷ number of observed days.
  - **Avg profit per procedure** (where used) = Net Profit ÷ total procedures.

---

## Slide 13 – ROI by Equipment Type

- **ROI & margin comparisons**
  - CT and Mammography units tend to show **strong ROI and margins** in the synthetic data.
  - Some MRI and X-ray units show **lower ROI** and lower profit per day.
- **Interpretation**
  - High-ROI modalities are strong candidates for further investment or expansion.
  - Lower-ROI units may need utilization optimization, cost control, or strategic review.

---

## Slide 14 – ROI by Department

- **Departmental profitability**
  - Radiology: large revenue base and solid ROI across several modalities.
  - Women’s Health: fewer assets but high-margin mammography services.
- **Implications**
  - Departments with high ROI and margins can support cross-subsidization or growth initiatives.
  - Underperforming departments/equipment require deeper process and demand analysis.

---

## Slide 15 – Dashboards & Tooling

- **Technologies used**
  - Python: `pandas`, `numpy` for data preparation and aggregation.
  - Visualization: Matplotlib/Seaborn and Plotly (interactive).
  - Dash / JupyterDash for interactive, multi-tab dashboards.
- **Dashboard views**
  - **EDA tab**: distributions, hours relationships, equipment/department counts.
  - **ROI tab**: ROI, margins, profit-per-day by type and department.
  - **Utilization tab**: utilization rate and procedure KPIs by type/department/month.

---

## Slide 16 – Example Dashboard Use Cases

- **Operations managers**
  - Monitor utilization hot spots and bottlenecks.
  - Adjust scheduling, staffing, and maintenance windows.
- **Finance & strategy teams**
  - Evaluate ROI of existing assets and new capital proposals.
  - Run “what-if” scenarios on volume, pricing, and operating hours.
- **Clinical leadership**
  - Ensure key diagnostic services are available where and when needed.

---

## Slide 17 – Key Insights (Synthetic Data)

- There is a **mix of under- and over-utilized equipment**, especially within MRI and some radiology assets.
- **High-utilization, high-ROI equipment** (e.g., certain CT, ultrasound, and mammography units) are strong candidates for further investment.
- Departments like Radiology and Women’s Health provide **substantial financial contribution** and should be monitored closely via dashboards.
- Temporal analysis shows that **demand and profitability vary over months and days**, offering opportunities to refine scheduling and capacity planning.

---

## Slide 18 – Recommendations

- **Optimize scheduling & referrals**
  - Centralize and standardize booking to move volume toward under-utilized equipment.
  - Balance workload across similar modalities and sites where possible.
- **Targeted investments**
  - Expand or upgrade high-ROI, high-utilization modalities to relieve bottlenecks.
- **Review low-ROI assets**
  - Consider redeployment, leasing, or decommissioning of persistently underperforming equipment.

---

## Slide 19 – Future Enhancements

- **Predictive analytics**
  - Forecast equipment demand and utilization using time-series and machine learning models.
  - Predict maintenance needs based on usage patterns.
- **Scenario analysis**
  - Simulate the impact of pricing changes, new equipment purchases, or extended hours.
- **Integration**
  - Connect to live hospital systems (RIS/HIS/EMR) for near real-time dashboards.

---

## Slide 20 – Conclusion & Next Steps

- **Conclusion**
  - Combining utilization and financial metrics enables **data-informed decisions** on equipment planning, operations, and capital allocation.
  - The framework developed here can be directly adapted to real hospital data.
- **Next steps**
  - Validate the approach on real datasets.
  - Roll out interactive dashboards to key stakeholders.
  - Iterate KPIs and thresholds based on clinical and financial priorities.

---

## Slide 21 – Executive Summary (For Leadership)

- **Overall picture**
  - High-value modalities (CT, ultrasound, mammography) generally show strong utilization and ROI.
  - Some MRI and X-ray assets are under-utilized and financially weaker.
- **Key takeaways**
  - There is clear headroom to **optimize scheduling** and **rebalance load** across equipment.
  - Dashboards provide near real-time visibility into utilization and profitability.
- **Executive decision points**
  - Where to invest next, which assets to monitor closely, and which to reconsider or repurpose.

---

## Slide 22 – Technical Overview (For Analytics Teams)

- **Data pipeline**
  - Synthetic raw CSV → cleaned processed CSV with standardized schema.
  - Python (pandas, numpy) for cleaning, feature engineering, and aggregations.
- **Analytics methods**
  - Grouped statistics by equipment type, department, and month.
  - Calculation of utilization KPIs and financial KPIs (ROI, margins, profit-per-day).
- **Technology stack**
  - Notebooks for EDA and development.
  - Matplotlib/Seaborn for static plots; Plotly & Dash/JupyterDash for interactive multi-tab dashboards.

---

## Slide 23 – Business Case Highlights

- **Value creation**
  - Quantified utilization and ROI across equipment and departments.
  - Identified high-performing assets to prioritize for capital investment.
- **Cost & risk management**
  - Highlighted underperforming equipment where costs may outweigh benefits.
  - Supports decisions on redeployment, refurbishment, or decommissioning.
- **Financial impact**
  - Scenario-ready metrics: profit-per-day, profit-per-procedure, ROI%, and margin% to feed into formal business case documents.

---

## Slide 24 – Stakeholder-Oriented Materials

- **Executives & board**
  - High-level summary slides (1–3, 17–21, 23) for strategic discussions and approvals.
- **Operations & clinical leadership**
  - Utilization and EDA slides (8–11, 16, 18, 20, 24) plus dashboards to manage daily/weekly performance.
- **Finance & strategy teams**
  - ROI and business case slides (12–14, 17–19, 23) for investment evaluation and budgeting.
- **Data & analytics teams**
  - Technical overview (5–7, 15, 22) to understand methodology, assumptions, and reproducibility.


