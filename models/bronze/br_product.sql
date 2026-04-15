select *
from {{ source('oltp', 'product') }}