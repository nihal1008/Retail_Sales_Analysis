-- Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select *
from Project_1
where sale_date='2022-11-05';


-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
select *
from Project_1
where category='Clothing' and quantity>=4
and TO_CHAR(sale_date,'YYYY-MM')='2022-11';

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select category, sum(total_sale)
from project_1
group by category 
order by Sum(total_sale) desc;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select avg(age) as Average_age
from Project_1
where category='Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select *
from Project_1
where total_sale>1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select category, gender, sum(transactions_id) as Total_transaction
from project_1
group by category,gender
order by Total_Transaction desc;


-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.
select extract(month from sale_date) as month, avg(total_sale)
from Project_1
group by Extract(month from sale_date)
order by extract(month from sale_date) asc;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
select customer_id,sum(total_sale) as total_sales
from project_1
group by customer_id
order by sum(total_sale) desc
limit 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
select category,count(Distinct customer_Id)
from project_1
group by 1
order by 2 desc
limit 5;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17).
select (select count(transactions_id)
from project_1
where(sale_time between '00:00:00' and '12:00:00')) as Orders_In_Morning_Shift,

(select count(transactions_id)
from project_1
where(sale_time between '12:00:01' and '17:00:00'))  as Orders_In_Afternoon_Shift,

(select count(transactions_id)
from project_1
where (sale_time between '17:00:01' and '23:59:59')) as Orders_In_Evening_Shift;
              -----or------

select 
case 
when sale_time between '00:00:00' and '12:00:00' then 'Morning_Shift'
when sale_time between '12:00:01' and '17:00:00' then 'Afternoon_Shift'
else 'Evening_Shift'
end as shifts ,count(transactions_id)
from project_1
group by shifts;

select * from project_1;