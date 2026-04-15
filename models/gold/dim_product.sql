select
    product_id,
    product_name,
    supplier_id,
    unit_price,
    package,
    is_discontinued
from {{ ref('stg_product') }}