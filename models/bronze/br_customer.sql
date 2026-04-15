select *
from {{ source('oltp', 'customer') }}