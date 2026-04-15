select distinct
    oi.order_item_id as sales_key,
    o.order_id,
    oi.product_id,
    p.supplier_id,
    o.customer_id,
    cast(strftime(cast(o.order_date as date), '%Y%m%d') as integer) as date_key,
    trim(o.order_number) as order_number,
    cast(o.order_date as timestamp) as order_date,
    oi.quantity,
    oi.unit_price,
    oi.line_amount,
    o.total_amount as order_total_amount
from {{ ref('stg_order_item') }} oi
inner join {{ ref('stg_orders') }} o
    on oi.order_id = o.order_id
inner join {{ ref('stg_product') }} p
    on oi.product_id = p.product_id