# Global Layoffs Data Cleaning and Analysis

This project utilizes SQL to clean, standardize, and analyze global layoff data. The data cleaning steps involve removing duplicate records, converting data types, correcting null or inconsistent values, and dropping unnecessary columns. The cleaned data is then analyzed to uncover layoff trends from various perspectives.

## Table of Contents

- [Data Source](#data-source)
- [Tools](#tools)
- [Project Objective](#project-objective)
- [Data Cleaning and Standardization Steps](#data-cleaning-and-standardization-steps)
- [Data Analysis and Findings](#data-analysis-and-findings)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Data Source

The dataset used in this project contains information about global layoff events, including various attributes such as company, location, industry, total laid off, percentage laid off, date, stage, country, and funds raised in millions.

## Tools

- **SQL Server**: Used for all data cleaning, transformation, and analysis tasks.

## Project Objective

The primary goals of this project are:
1.  To clean and standardize a raw layoff dataset.
2.  To provide a reliable and consistent dataset for analysis.
3.  To explore layoff trends and patterns across different dimensions such as industry, country, year, and company.
4.  To identify the years and industries with the highest number of layoffs.

## Data Cleaning and Standardization Steps

The following steps were performed to clean and standardize the dataset:

1.  **Staging Table Creation**: A staging table named `layoffs_staging` was created as a copy of the original `layoffs` table to perform transformations without altering the raw data.
2.  **Duplicate Record Removal**: Identified and removed duplicate rows that were exact matches across all columns, ensuring data integrity.
3.  **Data Standardization**:
    * **Company Names**: Trimmed leading and trailing spaces from company names for consistency.
    * **Industry Names**: Standardized industry names, specifically consolidating variations of "Crypto" into a single "Crypto" category.
    * **Country Names**: Corrected misspellings or inconsistencies in country names (e.g., "United States." to "United States").
    * **Date Format**: Converted the date column from a `VARCHAR` data type to a proper `DATE` data type, and the old column was dropped.
    * **Handling Null/Blank Industry Values**: Populated missing or blank industry values for specific companies where the industry was known.
    * **Numerical Column Conversion**: Converted `total_laid_off`, `percentage_laid_off`, and `funds_raised_millions` columns to appropriate numerical data types (`INT` and `FLOAT`) and removed rows where these values were explicitly 'NULL' strings, as they could not be converted.

## Data Analysis and Findings

Once the data was cleaned, various analyses were conducted to reveal insights:

* **Total Layoffs by Company**: Calculated the aggregate number of layoffs for each company.
* **Layoff Date Range**: Determined the earliest and latest layoff dates present in the dataset.
* **Top Industries by Layoffs**: Identified the industries that experienced the highest total number of layoffs.
* **Layoffs by Country**: Analyzed the total layoffs grouped by country to see geographical distribution.
* **Layoffs by Year**: Examined annual layoff trends to pinpoint periods of increased activity.
* **Layoffs by Stage**: Explored layoff numbers based on the company's funding stage (e.g., Early Stage, Series A).
* **Monthly Layoff Trends**: Showcased the total layoffs on a monthly basis to observe seasonal or short-term trends.
* **Company Layoff Details by Year**: Provided a breakdown of layoffs for each company on a yearly basis.
* **Year with Most Layoffs**: Identified the single year with the highest total number of layoffs.

## Usage

To utilize this project:

1.  Ensure you have access to SQL Server or another compatible SQL database system.
2.  Set up a `layoffs` table with your layoff data and populate it.
3.  Execute the data cleaning and analysis queries in your database management system.
4.  The cleaned data will reside in the `layoffs_staging` table, ready for further exploration or reporting.

## Contributing

Contributions are welcome! If you have any suggestions or improvements, please feel free to submit a pull request or open an issue.

## License

This project is licensed under the MIT License.
