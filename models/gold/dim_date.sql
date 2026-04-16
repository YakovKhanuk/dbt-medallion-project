with distinct_dates as (

    select distinct cast(order_date as date) as date
    from {{ ref('stg_orders') }}

)

select
    cast(strftime(date, '%Y%m%d') as integer) as DateKey,
    date as Date,
    extract(day from date) as Day,
    extract(month from date) as Month,
    extract(year from date) as Year,
    extract(quarter from date) as Quarter
from distinct_dates