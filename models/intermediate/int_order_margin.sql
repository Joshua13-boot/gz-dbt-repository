select
    orders_id,
    sales.products_id,
    sales.revenue,
    quantity,
    product.purchse_price,
    -- Calcul de purchase_cost
    quantity * purchse_price as purchase_cost,
    -- Calcul de la marge
    revenue - (quantity * purchse_price) as margin
from {{ ref('stg_raw__sales') }} as sales
join {{ ref('stg_raw__product') }} as product
        on sales.products_id = product.products_id
