select
    supplier_id,
    company_name,
    contact_name,
    city,
    country,
    phone,
    fax
from {{ ref('stg_supplier') }}