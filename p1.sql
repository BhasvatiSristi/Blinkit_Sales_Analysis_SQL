show tables;

select * from blinkit ;

set SQL_SAFE_UPDATES=0;

update blinkit set Item_Fat_Content =case 
when Item_Fat_Content in ('LF','low fat') then 'Low Fat'
when Item_Fat_Content in ('reg','regular') then 'Regular'
else Item_Fat_Content end;

select count(*) as Total_Sales from blinkit;

select Outlet_establishment_year as Year_,
	   count(*) as Total_Sales_per_year 
from blinkit 
group by Outlet_Establishment_Year 
order by Outlet_Establishment_Year;

select round(sum(Sales),2) as Total_Revenue from blinkit;

select round(avg(Sales),2) as Average_sales_Millions
from blinkit ;

select count(distinct(Item_Type)) as Number_of_Items from blinkit;

select avg(Rating) as Average_Rating from blinkit;

select Item_Type, round(sum(Sales)) as Total_Sales_by_item
from blinkit
group by Item_Type
order by round(sum(Sales)) desc
limit 5;

select Item_Fat_Content as Fat, Outlet_Location_Type as Location,
	round(sum(Sales)) as Total_Sales,
    round(avg(Sales)) as Average_Sales
from blinkit
group by Item_Fat_Content, Outlet_Location_Type
order by Total_Sales;
    
select Item_Type, Outlet_Location_Type as Location,
	round(sum(Sales)) as Total_Sales,
    round(avg(Sales)) as Average_Sales
from blinkit
group by Item_Type,Outlet_Location_Type
order by Total_Sales;

select Outlet_Location_Type ,
       round(sum(Sales)) as Total_Sales,
	   round(avg(Sales),2) as Average_Sales
from blinkit
group by Outlet_Location_Type
order by sum(Sales);

select round(sum(Sales)) as Total_Sales,
       Outlet_Establishment_Year as Year_
from blinkit
group by Outlet_Establishment_Year
order by Outlet_Establishment_Year;

select round(sum(Sales)) as Total_sales, Outlet_type
from blinkit
group by Outlet_Type
order by Total_Sales;