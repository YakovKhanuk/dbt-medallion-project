select *
from {{ source('oltp', 'order_item') }}