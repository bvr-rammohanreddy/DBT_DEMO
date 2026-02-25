{%macro fun1(x)%}
case when to_timestamp({{x}})<current_date then 'Past' else 'Future' end 
{%endmacro%}

{%macro get_season(x)%}

case when month(to_timestamp({{x}})) in (12,1,2) then 'Winter'
     when month(to_timestamp({{x}})) in (3,4,5) then 'Sring'
     when month(to_timestamp({{x}}))in (6,7,8) then 'Summer'
     else 'Autumn'
 end 

{%endmacro%}

{%macro day_type(x)%}
case when dayname(to_timestamp({{x}})) in ('Sat','Sun') then 'Weekend' else 'BussinessDay' end
{%endmacro%}