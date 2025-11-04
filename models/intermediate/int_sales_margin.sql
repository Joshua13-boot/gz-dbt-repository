with sales_data as (
    select
        s.orders_id,
        s.products_id,
        s.revenue,
        CAST(s.quantity AS INT64) AS quantity,
        CAST(p.purchase_price AS FLOAT64) AS purchase_price
    from {{ ref('stg_raw__sales') }} s
    left join {{ ref('stg_raw__product') }} p
        on s.products_id = p.products_id
)

select
    *,
    -- Calcul du purchase_cost
    quantity * purchase_price AS purchase_cost,
    -- Calcul de la marge
    revenue - (quantity * purchase_price) AS margin
from sales_data

