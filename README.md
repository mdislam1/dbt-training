# Data Transformation and Analytics Pipeline with DBT (Data Build Tool)

This DBT (Data Build Tool) project is designed to transform and analyze data for Global Mart, a company that sells household items like furniture, office equipment, appliances, and electronics. The project includes data transformation, testing, documentation, and deployment processes.

---

## Project Overview

The project focuses on transforming raw data from Snowflake into meaningful insights for Global Mart. It includes the following key components:

- **Raw Data**: The raw data consists of three main datasets:
  - `orders`: Breakdown of global orders.
  - `products`: Breakdown of global products, categories, and subcategories.
  - `customers`: Customer details, including location and segments.

- **Staging Models**: Intermediate models that perform transformations and calculations, such as calculating profit and joining relevant tables.

- **Reporting Models**: Final models that aggregate data for reporting purposes, such as profit by customer and profit by product.

- **Tests**: Data quality tests to ensure the integrity of the data, including uniqueness, not null, and accepted values tests.

- **Documentation**: Comprehensive documentation generated using DBT's built-in documentation tools.

- **Deployment**: Automated deployment using DBT Cloud, with scheduled jobs to refresh data and run tests.

---

## Project Structure

The project is organized into the following folders:

- **models/**: Contains all DBT models.
  - `raw/`: Raw data models.
  - `staging/`: Intermediate transformation models.
  - `reporting/`: Final reporting models.
  
- **tests/**: Contains custom tests for data validation.
  
- **macros/**: Contains reusable SQL macros.
  
- **seeds/**: Contains static CSV files loaded into the data warehouse.
  
- **analyses/**: Contains SQL scripts for ad-hoc analysis (not executed as part of the DBT run).

---

## Key Features

### 1. **Data Transformation**
- **Profit Calculation**: The `stage_orders` model calculates profit as `order_selling_price - order_cost_price`.
- **Joins**: The `stage_orders` model joins `orders`, `customers`, and `products` tables to create a comprehensive view of the data.
- **Aggregations**: Reporting models aggregate profit by customer and product.

### 2. **Data Quality Tests**
- **Uniqueness**: Ensures that fields like `order_id` and `customer_id` are unique.
- **Not Null**: Ensures that critical fields like `order_id` and `customer_id` are not null.
- **Accepted Values**: Ensures that fields like `ship_mode` contain only valid values (e.g., "First Class", "Second Class", "Same Day", "Standard Class").

### 3. **Documentation**
- The project includes detailed documentation for models, columns, and sources, generated using `dbt docs generate`.
- Documentation is accessible via DBT Cloud and includes lineage graphs to visualize dependencies between models.

### 4. **Deployment**
- A deployment environment is set up in DBT Cloud to run scheduled jobs.
- The `daily refresh` job runs `dbt seed`, `dbt run`, and `dbt test` commands daily at midnight.

---

## Setup Instructions

### 1. **Prerequisites**
- A Snowflake account with the necessary permissions.
- A DBT Cloud account.
- GitHub repository for version control.

### 2. **Install DBT Packages**
Add the following packages to your `packages.yml` file:

```yaml
packages:
  - package: dbt-labs/dbt_utils
    version: 0.8.0
```

Run the following command to install the packages:

```bash
dbt deps
```

### 3. **Load Seed Data**
Seed files (e.g., `delivery_team.csv`) can be loaded into the data warehouse using the following command:

```bash
dbt seed
```

### 4. **Run Models and Tests**
To run all models and tests, use the following command:

```bash
dbt run
dbt test
```

### 5. **Generate Documentation**
To generate and view documentation, use the following command:

```bash
dbt docs generate
dbt docs serve
```

---

## Deployment

### 1. **Create Deployment Environment**
- In DBT Cloud, create a new environment called `deployment`.
- Configure the environment with the appropriate Snowflake credentials.

### 2. **Create Scheduled Job**
- Create a job named `daily refresh` in DBT Cloud.
- Set the job to run the following commands daily at midnight:
  ```bash
  dbt seed
  dbt run
  dbt test
  ```

---

## Key Files

- **`dbt_project.yml`**: Configuration file for the DBT project.
- **`sources.yml`**: Defines source tables and their schemas.
- **`models/`**: Contains all SQL models for raw, staging, and reporting layers.
- **`macros/`**: Contains reusable SQL macros.
- **`seeds/`**: Contains static CSV files loaded into the data warehouse.

---

## Troubleshooting

- **Failed Tests**: If tests fail, check the error details in DBT Cloud and fix the underlying data issues.
- **Missing Seeds**: Ensure that seed files are correctly loaded using the `dbt seed` command.
- **Deployment Errors**: Verify that the deployment environment is correctly configured with the appropriate Snowflake credentials.

---

## Contributors
- Md Islam
- GitHub: https://github.com/mdislam1

---

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
