select *
from {{ source('oltp', 'supplier') }}