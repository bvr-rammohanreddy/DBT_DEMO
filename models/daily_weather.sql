with daily_weather as(

select to_Date(TIME) as daily_weather,
WEATHER,
temp,
PRESSURE,
HUMIDITY,
CLOUDS
from {{ source('demo', 'weather') }} 
),

daily_weather_agg as(
 select 
daily_weather,
WEATHER,
round(avg(temp),2) as avg_temp,
round(avg(PRESSURE),2) as avg_PRESSURE,
round(avg(HUMIDITY),2) as avg_HUMIDITY,
round(avg(CLOUDS),2) as avg_CLOUDS,

-- row_number() over (partition by daily_weather order by count(WEATHER) desc) as rw_number
 from daily_weather
 group by daily_weather,WEATHER
 qualify row_number() over (partition by daily_weather order by count(WEATHER) desc)=1
)

select * from daily_weather_agg 