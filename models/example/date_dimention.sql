with cte as (select STARTED_AT ,

to_timestamp(STARTED_AT),
date(to_timestamp(STARTED_AT)),
hour(to_timestamp(STARTED_AT)),
month(to_timestamp(STARTED_AT)),
dayname(to_timestamp(STARTED_AT)),
case when dayname(to_timestamp(STARTED_AT)) in ('Sat','Sun') then 'Weekend' else 'BussinessDay' end as daytype,
case when month(to_timestamp(STARTED_AT)) in (12,1,2) then 'Winter'
     when month(to_timestamp(STARTED_AT)) in (3,4,5) then 'Sring'
     when month(to_timestamp(STARTED_AT)) in (6,7,8) then 'Summer'
     else 'Autumn' end as "stationOfYear"  ,
     {{fun1('STARTED_AT')}} as f1,
     {{get_season('STARTED_AT')}} as get_season,
     {{day_type('STARTED_AT')}} as day_type_fun,


from {{ source('demo', 'bike') }}
) 
select * from cte 