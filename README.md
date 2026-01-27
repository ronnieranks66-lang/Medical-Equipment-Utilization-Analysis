# Medical Equipment Utilization Analysis

Healthcare analytics project analyzing medical imaging equipment utilization, profitability, and ROI to optimize costs, capacity, and patient access.

This project uses synthetic hospital data to analyze usage patterns for MRI, CT, X-Ray, Ultrasound, and Mammography equipment. It combines **utilization metrics** (hours, procedures, rates) with **financial metrics** (revenue, operating cost, net profit, ROI) to support data-driven decisions on scheduling, capital investment, and equipment decommissioning.

---

## 📋 Project Overview

This project is designed to help healthcare administrators and finance teams make data-driven decisions about medical equipment management. Using synthetic hospital data, it performs comprehensive analysis on:
- **Equipment utilization patterns** across departments and time periods
- **Financial performance metrics** including revenue, costs, and profit margins
- **Return on Investment (ROI)** analysis for capital expenditure planning
- **Capacity planning** recommendations based on historical usage trends

---

## 📁 Project Structure

```
Medical-Equipment-Utilization-Analysis/
├── data/
│   ├── raw/                          # Original synthetic dataset
│   ├── processed/                    # Cleaned, analysis-ready data
│   └── sample_data/                  # Small sample for exploration
├── analysis/
│   ├── eda.ipynb                     # Main exploratory data analysis
│   └── exploratory_analysis/         # Additional analysis notebooks
├── LICENSE                           # Project licensing
├── README.md                         # This file
└── requirements.txt                  # Python dependencies
```

---

## 🎯 Key Features

- **Exploratory Data Analysis (EDA)**
  - Distribution analysis of utilization across equipment types
  - Temporal patterns (daily, weekly, monthly trends)
  - Equipment performance comparisons by department

- **Utilization Metrics**
  - Operating hours and availability analysis
  - Procedure volume tracking
  - Utilization rates by equipment type and department

- **Financial & ROI Analysis**
  - Revenue and cost calculations
  - Net profit and margin analysis
  - ROI percentage and profitability metrics
  - Profit per procedure and per day metrics

- **Data Quality**
  - Automatic handling of missing values
  - Currency conversion and normalization
  - Data validation and cleaning procedures

---

## 🚀 Getting Started

### Prerequisites
- Python 3.8 or higher
- pip or conda package manager
- 2GB free disk space (for data and notebooks)

### Installation

1. **Clone or download the project** to your local machine

2. **Create a virtual environment** (recommended):
   ```bash
   python -m venv venv
   # On Windows:
   venv\Scripts\activate
   # On macOS/Linux:
   source venv/bin/activate
   ```

3. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

4. **Launch Jupyter Notebook**:
   ```bash
   jupyter notebook
   ```

5. **Open analysis notebooks**:
   - Navigate to `analysis/eda.ipynb` for the main analysis
   - Run cells sequentially from top to bottom

---

## 📊 Data Description

### Input Data
The synthetic dataset includes:
- **Equipment_Type**: MRI, CT, X-Ray, Ultrasound, Mammography
- **Department**: Radiology, Orthopedics, Cardiology, etc.
- **Utilization Data**: Available hours, actual operating hours, utilization rate
- **Procedures**: Number of procedures performed
- **Financial Data**: Revenue, operating costs, net profit, ROI percentages

### Output Data
Processed data includes:
- Cleaned and standardized values
- Normalized currency columns
- Datetime conversion
- Missing value handling
- Ready for analysis and visualization

---

## 🔧 Dependencies

Core dependencies are listed in `requirements.txt`:
- **pandas** - Data manipulation and analysis
- **numpy** - Numerical computing
- **matplotlib** - Data visualization
- **seaborn** - Statistical visualization
- **plotly** - Interactive visualizations
- **dash** - Interactive web dashboards
- **jupyter** - Interactive notebooks
- **openpyxl** - Excel file handling

For development and testing:
- **black** - Code formatting
- **flake8** - Code linting
- **pytest** - Unit testing

---

## 💡 Usage Examples

### Basic Data Loading and Exploration
```python
import pandas as pd

# Load processed data
df = pd.read_csv('data/processed/medical_equipment_utilization_synthetic_cleaned(in).csv')

# View first few rows
print(df.head())

# Get summary statistics
print(df.describe())
```

### Equipment Comparison
```python
# Analyze utilization by equipment type
equipment_stats = df.groupby('Equipment_Type').agg({
    'Utilization_Rate': 'mean',
    'Number_of_Procedures': 'sum',
    'Net-Profit_(daily)': 'mean'
})
print(equipment_stats)
```

---

## 👥 Intended Audience

- **Hospital Operations & Clinical Leadership** - Understand utilization patterns and capacity constraints
- **Finance & Strategy Teams** - Evaluate ROI and support capital investment decisions
- **Data & Analytics Teams** - Reuse framework on real hospital datasets
- **Healthcare Consultants** - Benchmark against synthetic performance metrics

---

## 🔒 Data Privacy & Security

This project uses **synthetic data only** for demonstration purposes. When using with real patient data:
- ✅ Ensure HIPAA compliance (if applicable)
- ✅ De-identify all patient information
- ✅ Secure data transmission and storage
- ✅ Follow institutional data governance policies

---

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## 🤝 Contributing

Contributions are welcome! To improve this project:
1. Fork the repository
2. Create a feature branch
3. Make your improvements
4. Submit a pull request

---

## 📧 Support

For issues, questions, or suggestions:
- Check existing documentation and notebooks
- Review data in `sample_data/` for format reference
- Consult the comments in analysis notebooks for methodology explanations

