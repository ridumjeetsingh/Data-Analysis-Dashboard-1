
-- here we are taking both of these select statement in one, with help of with 'clause'
with cte as(
select * from bike_share_yr_0
union all -- Using union all to remove duplicate records from both of the tables if any
select * from bike_share_yr_1)



-- From tables only limited columns data records will work for us here. 
select dteday,
season,
a.yr, -- Here taking 'yr' from cte table
weekday,
hr,
rider_type,
riders,
price,
COGS,
riders * price as revenue, -- calculating the revenue for the ease in power bi 
riders * price - COGS * riders  as profit -- calculating the profit for the ease in power bi 
from cte as a
left join cost_table as b
on a.yr = b.yr
-- In this query we are doing left join includes all the records from left 'cte' table with cost_table
