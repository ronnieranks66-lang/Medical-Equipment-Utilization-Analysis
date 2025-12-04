# Copy of alternative R analysis and visualizations for use from the dashboard code folder
# Source: analysis/r/alternative_analysis.R

library(tidyverse)

# 1. Load data -------------------------------------------------------------

file_path <- "../../data/processed/medical_equipment_utilization_synthetic_cleaned(in).csv"

df_raw <- read_csv(file_path, show_col_types = FALSE)

# Standardize column names
df_raw <- df_raw %>%
  rename_with(~ gsub(" ", "_", .x, fixed = TRUE))

df <- df_raw

# Clean currency-like columns
currency_cols <- c("Cost_per_procedure",
                   "Daily_Operating_Cost",
                   "Procedure_Revenue",
                   "Net-Profit_(daily)")

for (col in currency_cols) {
  if (col %in% names(df)) {
    df[[col]] <- df[[col]] %>%
      as.character() %>%
      str_replace_all("KES", "") %>%
      str_replace_all(",", "") %>%
      str_replace_all(" ", "") %>%
      as.numeric()
  }
}

# Convert numeric utilization fields
num_cols <- c("Available_Hours",
              "Actual_Operating_Hours",
              "Utilization_Rate",
              "Number_of_Procedures")

for (col in num_cols) {
  if (col %in% names(df)) {
    df[[col]] <- as.numeric(df[[col]])
  }
}

# Parse Date
if ("Date" %in% names(df)) {
  df$Date <- as.Date(df$Date, format = "%m/%d/%Y")
}


# 2. Basic EDA -------------------------------------------------------------

glimpse(df)

summary(select(df, all_of(num_cols)))

df %>%
  count(Equipment_Type, sort = TRUE)

df %>%
  count(Department, sort = TRUE)


# 3. Utilization metrics ---------------------------------------------------

util_by_type <- df %>%
  group_by(Equipment_Type) %>%
  summarise(
    n_days = n(),
    avg_available_hours = mean(Available_Hours, na.rm = TRUE),
    avg_actual_hours = mean(Actual_Operating_Hours, na.rm = TRUE),
    avg_utilization_rate = mean(Utilization_Rate, na.rm = TRUE),
    total_procedures = sum(Number_of_Procedures, na.rm = TRUE),
    avg_procedures_per_day = mean(Number_of_Procedures, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  arrange(desc(avg_utilization_rate))

util_by_type

util_by_dept <- df %>%
  group_by(Department) %>%
  summarise(
    n_days = n(),
    avg_utilization_rate = mean(Utilization_Rate, na.rm = TRUE),
    total_procedures = sum(Number_of_Procedures, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  arrange(desc(avg_utilization_rate))

util_by_dept


# 4. Financial & ROI analysis ---------------------------------------------

roi_by_type <- df %>%
  group_by(Equipment_Type) %>%
  summarise(
    n_days = n(),
    total_revenue = sum(Procedure_Revenue, na.rm = TRUE),
    total_operating_cost = sum(Daily_Operating_Cost, na.rm = TRUE),
    total_net_profit = sum(`Net-Profit_(daily)`, na.rm = TRUE),
    roi_ratio = if_else(total_operating_cost > 0,
                        total_net_profit / total_operating_cost,
                        NA_real_),
    profit_margin_ratio = if_else(total_revenue > 0,
                                  total_net_profit / total_revenue,
                                  NA_real_),
    avg_profit_per_day = total_net_profit / n_days,
    .groups = "drop"
  ) %>%
  arrange(desc(roi_ratio))

roi_by_type

roi_by_dept <- df %>%
  group_by(Department) %>%
  summarise(
    n_days = n(),
    total_revenue = sum(Procedure_Revenue, na.rm = TRUE),
    total_operating_cost = sum(Daily_Operating_Cost, na.rm = TRUE),
    total_net_profit = sum(`Net-Profit_(daily)`, na.rm = TRUE),
    roi_ratio = if_else(total_operating_cost > 0,
                        total_net_profit / total_operating_cost,
                        NA_real_),
    profit_margin_ratio = if_else(total_revenue > 0,
                                  total_net_profit / total_revenue,
                                  NA_real_),
    avg_profit_per_day = total_net_profit / n_days,
    .groups = "drop"
  ) %>%
  arrange(desc(roi_ratio))

roi_by_dept


# 5. Alternative visualizations with ggplot2 -------------------------------

# 5.1 Utilization rate distribution
df %>%
  ggplot(aes(x = Utilization_Rate)) +
  geom_histogram(bins = 30, fill = "#2C7BB6", color = "white") +
  labs(
    title = "Distribution of Utilization Rate",
    x = "Utilization Rate",
    y = "Count"
  )

# 5.2 Utilization by equipment type
util_by_type %>%
  ggplot(aes(x = reorder(Equipment_Type, -avg_utilization_rate),
             y = avg_utilization_rate)) +
  geom_col(fill = "#1B9E77") +
  coord_flip() +
  labs(
    title = "Average Utilization Rate by Equipment Type",
    x = "Equipment Type",
    y = "Average Utilization Rate"
  )

# 5.3 Utilization vs available hours (scatter, colored by equipment type)
df %>%
  ggplot(aes(x = Available_Hours,
             y = Actual_Operating_Hours,
             color = Equipment_Type)) +
  geom_point(alpha = 0.7) +
  labs(
    title = "Available vs Actual Operating Hours",
    x = "Available Hours",
    y = "Actual Operating Hours",
    color = "Equipment Type"
  )

# 5.4 Utilization by department
util_by_dept %>%
  ggplot(aes(x = reorder(Department, -avg_utilization_rate),
             y = avg_utilization_rate)) +
  geom_col(fill = "#7570B3") +
  coord_flip() +
  labs(
    title = "Average Utilization Rate by Department",
    x = "Department",
    y = "Average Utilization Rate"
  )

# 5.5 ROI by equipment type
roi_by_type %>%
  ggplot(aes(x = reorder(Equipment_Type, -roi_ratio),
             y = roi_ratio)) +
  geom_col(fill = "#E7298A") +
  coord_flip() +
  labs(
    title = "ROI Ratio by Equipment Type",
    x = "Equipment Type",
    y = "ROI (Net Profit / Operating Cost)"
  )


