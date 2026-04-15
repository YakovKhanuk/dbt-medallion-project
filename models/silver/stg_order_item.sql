select
    cast(order_item_id as integer) as order_item_id,
    min(cast(order_id as integer)) as order_id,
    min(cast(product_id as integer)) as product_id,
    min(cast(quantity as integer)) as quantity,
    min(cast(unit_price as double)) as unit_price,
    min(cast(quantity as double) * cast(unit_price as double)) as line_amount
from {{ ref('br_order_item') }}
group by 1