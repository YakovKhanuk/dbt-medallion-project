select distinct
    cast(order_id as integer) as order_id,
    cast(order_date as timestamp) as order_date,
    cast(customer_id as integer) as customer_id,
    cast(total_amount as double) as total_amount,
    trim(order_number) as order_number
from {{ ref('br_orders') }}