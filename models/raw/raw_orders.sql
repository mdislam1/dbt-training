{{
    config(
        materialized='table'
    )
}}

select 
    *
    -- ordersellingprice - ordercostprice as Profit 
from RAW.GLOBALMART.ORDERS