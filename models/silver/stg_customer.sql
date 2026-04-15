select distinct
    cast(customer_id as integer) as customer_id,
    trim(first_name) as first_name,
    trim(last_name) as last_name,
    trim(first_name) || ' ' || trim(last_name) as full_name,
    trim(city) as city,
    trim(country) as country,
    trim(phone) as phone
from {{ ref('br_customer') }}