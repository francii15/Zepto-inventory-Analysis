## Zepto Product Inventory Analysis Using SQL

## Project Overview

This project analyzes Zepto's product inventory dataset using MySQL to uncover insights related to product pricing, discounts, stock availability, inventory value, and category performance. The analysis focuses on answering business-oriented questions that can support inventory management, pricing strategies, and promotional decision-making.

## Objectives

* Explore and understand the product inventory dataset.
* Clean and prepare the data for analysis.
* Identify products offering the highest discounts.
* Analyze stock availability across products.
* Estimate inventory revenue by category.
* Discover high-value and low-value product segments.
* Evaluate category-level discount strategies.
* Analyze inventory weight distribution.

## Dataset Information

The dataset contains information about products available on Zepto, including:

* Product Name
* Category
* MRP (Maximum Retail Price)
* Discount Percentage
* Discounted Selling Price
* Available Quantity
* Product Weight (grams)
* Stock Status

## Tools Used

* MySQL
* SQL Queries
* Aggregate Functions
* CASE Statements
* GROUP BY & HAVING
* Sorting and Filtering Operations

## Data Cleaning Performed

* Removed products with zero pricing values.
* Converted price values from paisa to rupees.
* Added a unique ID column using AUTO_INCREMENT.
* Checked for null values and duplicate product names.



## Business Questions Answered

### 1. Which products offer the highest discounts?

Identified the top discounted products based on discount percentage.

### 2. Which high-priced products are currently out of stock?

Filtered products with high MRP values that are unavailable.

### 3. Which categories generate the highest estimated inventory revenue?

Calculated inventory value using selling price and available quantity.

### 4. Which premium products have low discounts?

Identified products priced above ₹500 with discount percentages below 10%.

### 5. Which categories offer the highest average discounts?

Compared category-level discount strategies.

### 6. Which products provide the best value per gram?

Calculated price per gram for products weighing more than 100 grams.

### 7. How can products be segmented by weight?

Categorized products into Low, Medium, and Bulk weight groups.

### 8. Which categories contribute the most inventory weight?

Calculated total inventory weight by category.



## Key Insights

* Certain categories rely heavily on discount-driven pricing strategies.
* A small number of products provide significantly better value per gram than competitors.
* Inventory value is concentrated within a few major categories.
* Premium products often maintain lower discount percentages.
* Product availability can directly impact potential revenue generation.
* Inventory weight varies significantly across categories, affecting storage and logistics planning.



## SQL Concepts Demonstrated

* Data Cleaning
* Aggregate Functions (SUM, AVG, COUNT)
* Conditional Logic (CASE)
* GROUP BY
* HAVING
* ORDER BY
* Filtering with WHERE
* DISTINCT
* Data Transformation
* Inventory Valuation Calculations



## Conclusion

This project demonstrates how SQL can be used to transform raw inventory data into actionable business insights. By analyzing discounts, pricing, stock availability, inventory value, and category performance, the project provides a data-driven view of Zepto's product portfolio and highlights opportunities for inventory optimization, pricing improvements, and revenue growth.



SQL | Python | Power BI | Data Analytics
