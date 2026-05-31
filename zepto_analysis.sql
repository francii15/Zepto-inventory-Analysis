/*Project: Zepto Product Analysis
Dataset: Zepto Product Inventory Dataset
Objectives:
1. Explore product inventory
2. Analyze discounts
3. Evaluate stock availability
4. Estimate inventory revenue
5. Identify best-value products
*/




create database zepto_sql_project;
use zepto_sql_project;
drop table if exists zepto;

 #data exploration
 select * from zepto;
 rename table zepto_v2 to zepto;
 alter table zepto add column id int not null Auto_Increment primary key first;

 #count the rows
 select count(*) from zepto;
  select * from zepto limit 10;

#NUll values
  select * from zepto where name is null or Category is null or mrp is null or discountPercent is null or discountedSellingPrice is null
  or availableQuantity is null or weightInGms is null or outOFStock is null or quantity is null;

#different product categories
select distinct category from zepto order by category;

#products avaialbily 
select outOFStock, count(id)
from zepto
group by outOFStock;

# products name present multiple times
select name,count(id) as "number of sku" from zepto group by name having count(id)>1 order by count(id) desc;



#data cleaning

## products price = 0
select * from zepto where mrp=0 or discountedsellingprice = 0;

delete from zepto where mrp = 0;

#convert paisa to rupee
 update zepto set mrp=mrp/100.0, discountedSellingPrice = discountedSellingPrice/100.0;
  select mrp,discountedSellingPrice from zepto;
  
  #Q1 find the top 10 best value products based on the dicount percentage
  select name ,mrp,discountpercent from zepto order by discountPercent desc limit 10;
 /* Insight:
Products with the highest discounts can be used for promotional campaigns and customer acquisition strategies*/


 #Q2 what are the products with high MRP but out of stock
 SELECT DISTINCT name,mrp FROM zepto WHERE outOfStock = 'true' and mrp>300
ORDER BY mrp DESC;

#Q3 calculate estimate revenue for each category
select category,sum(discountedSellingPrice* availableQuantity) as total_revenue from zepto group by category order by total_revenue desc ;

/*Insight:
Categories generating the highest estimated inventory revenue contribute the most to overall business value and should receive priority in inventory management.*/

#Q4 find all the category where mrp is greater than 500 and discount less than 100
select distinct name ,mrp ,discountpercent from zepto where mrp>500 and discountPercent <10 order by mrp desc,discountpercent desc;

#Q5 identity the top 5 catgeories offering the highest average discount percentage
select category,round(avg(discountpercent),2) as avg_discount from zepto group by category order by avg_discount desc limit 5;
/*Certain categories rely heavily on discounting strategies to drive sales, indicating competitive pricing behavior.*/

#Q6 find the price per gram for products above 100g and sort by best value
select distinct name, weightInGms,discountedSellingPrice,discountedSellingPrice/weightInGms as price_per_gms from zepto where weightInGms>=100 order by price_per_gms;
/*Products with lower price-per-gram ratios provide better value to customers and can be highlighted in marketing campaigns.*/

#Q7 Group the products into categories like low,medium,bulk
select distinct name ,weightingms ,case when weightInGms < 1000 then "low"
                                       when weightInGms<5000 then "medium"
                                       else "Bulk" end as weight_category from zepto;
                                       

#Q8 what is the total inventory weight per category
select category, sum(weightInGms*availableQuantity) as total_weight from zepto group by category order by total_weight;
/*Categories with larger inventory weight require more storage space and logistics planning.*/

#Q9 what highest potential inventory value
SELECT name, category,discountedSellingPrice * availableQuantity AS inventory_value FROM zepto ORDER BY inventory_value DESC LIMIT 10;


#Q10 what is average selling price per category
SELECT category, ROUND(AVG(discountedSellingPrice),2) AS avg_price FROM zepto  GROUP BY category ORDER BY avg_price DESC;

#Q11 what are the products at lowest stock
SELECT name, availableQuantity FROM zepto ORDER BY availableQuantity LIMIT 10;
