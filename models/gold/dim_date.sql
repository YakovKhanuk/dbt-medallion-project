with distinct_dates as (

    select distinct cast(order_date as date) as date_day
    from {{ ref('stg_orders') }}

)

select
    cast(strftime(date_day, '%Y%m%d') as integer) as date_key,
    date_day,
    extract(year from date_day) as year_number,
    extract(month from date_day) as month_number,
    extract(day from date_day) as day_number,
    strftime(date_day, '%Y-%m') as year_month,
    strftime(date_day, '%B') as month_name,
    strftime(date_day, '%w') as day_of_week_number,
    strftime(date_day, '%A') as day_of_week_name
from distinct_dates