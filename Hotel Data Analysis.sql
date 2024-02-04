--Put the Horels Years data under one table using UNIONS.

select * from dbo.[2018]
union 
select * from dbo.[2019]
union 
select * from dbo.[2020]

--Create a CTE.

With Hotels as (
select * from dbo.[2018]
union 
select * from dbo.[2019]
union 
select * from dbo.[2020]
)
select * from Hotels

--Q1. is Hotel Revenue growing by the Year
-- Creat a new column for Revenue.

With Hotels as (
select * from dbo.[2018]
union 
select * from dbo.[2019]
union
select * from dbo.[2020]
)
select arrival_date_year, hotel, 
round(sum((stays_in_week_nights + stays_in_weekend_nights) * adr),2) as Revenue
from Hotels
group by arrival_date_year,hotel

--Join our Hotels table to our market segment.

select * from market_segment
select * from meal_cost

With Hotels as (
select * from dbo.[2018]
union 
select * from dbo.[2019]
union
select * from dbo.[2020]
)
select * from Hotels hot
left join dbo.market_segment mar
on hot.market_segment = mar.market_segment
left join meal_cost mea
on mea.meal = hot.meal