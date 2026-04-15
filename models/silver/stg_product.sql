select distinct
    cast(product_id as integer) as product_id,
    trim(product_name) as product_name,
    cast(supplier_id as integer) as supplier_id,
    cast(unit_price as double) as unit_price,
    trim(package) as package,
    cast(is_discontinued as integer) as is_discontinued
from {{ ref('br_product') }}