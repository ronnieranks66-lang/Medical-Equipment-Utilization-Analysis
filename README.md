# Medical-Equipment-Utilization-Analysis

Healthcare analytics project analyzing medical imaging equipment utilization, profitability, and ROI to optimize costs, capacity, and patient access.

This project uses synthetic hospital data to analyze usage patterns for MRI, CT, X-Ray, Ultrasound, and Mammography equipment. It combines **utilization metrics** (hours, procedures, rates) with **financial metrics** (revenue, operating cost, net profit, ROI) to support data‑driven decisions on scheduling, capital investment, and decommissioning.

## Project Structure

- `data/`
  - `raw/` – original synthetic dataset.
  - `processed/` – cleaned, analysis‑ready CSV used by notebooks and dashboards.
  - `sample_data/` – small sample for quick exploration.
- `analysis/`
  - `exploratory_analysis/` – EDA notebooks and Excel for initial profiling.
  - `utilization_metrics/` – utilization‑focused analysis.
  - `roi_calculations/` – financial and ROI analysis.
  - `dashboards/` – integrated Plotly/Dash multipage dashboard notebook.
- `dashboard/`
  - `dashboards code/` – dashboard notebooks (EDA, ROI, utilization, Plotly).
  - `screenshots/` – PNG exports of key dashboards.
- `documentation/` – progress logs for EDA, utilization, ROI, dashboards, and presentation.
- `presentation/`
  - `Medical_Equipment_Utilization_Slides.md` – full slide deck outline (executive, technical, business case, stakeholder views).
- `resources/` – `Resources_progress.txt` describing tools, data, and skills needed.
- `requirements.txt` – Python dependencies for analysis and dashboards.

## Key Features

- **Exploratory analysis (EDA)** of utilization distributions, equipment mix, and temporal patterns.
- **Utilization KPIs** by equipment type, department, and month (rates, hours, procedures).
- **Financial & ROI analysis** (revenue, cost, net profit, ROI%, margin%, profit per day/procedure).
- **Interactive Plotly/Dash dashboard** with multiple tabs (EDA, ROI, Utilization) for stakeholders.
- **Presentation materials** suitable for executives, technical teams, and business case discussions.

## Getting Started

1. **Create/activate a virtual environment** (optional but recommended).
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
3. Launch Jupyter (or VS Code with Jupyter support) from the project root:
   ```bash
   jupyter notebook
   ```
4. Open notebooks in `analysis/` or `dashboard/dashboards code/` and run cells top‑to‑bottom.

## Intended Audience

- **Hospital operations and clinical leadership** – understand utilization patterns and capacity.
- **Finance and strategy teams** – evaluate ROI and support investment decisions.
- **Data and analytics teams** – reuse the framework on real hospital datasets.

