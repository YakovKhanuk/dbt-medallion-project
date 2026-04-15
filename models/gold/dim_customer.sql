select
    customer_id,
    first_name,
    last_name,
    full_name,
    city,
    country,
    phone
from {{ ref('stg_customer') }}