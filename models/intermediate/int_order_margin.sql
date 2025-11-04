select 
 date_date,
 orders_id,
 quantity,
 revenue,
 purchase_cost,
 margin,
 shipping_fee,
 log_cost,
 ship_cost,
 (margin + shipping_fee) - (log_cost + ship_cost ) as Operational_margin
from {{ref("int_sales_margin")}}
join {{ref("stg_raw__ship")}}
 using (orders_id) 


 

