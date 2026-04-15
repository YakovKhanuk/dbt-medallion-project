select distinct
    cast(supplier_id as integer) as supplier_id,
    trim(company_name) as company_name,
    trim(contact_name) as contact_name,
    trim(city) as city,
    trim(country) as country,
    trim(phone) as phone,
    trim(fax) as fax
from {{ ref('br_supplier') }}