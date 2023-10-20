SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key(['StockCode', 'Description', 'UnitPrice']) }} as product_id,
    StockCode as stock_code,
    Description as description,
    UnitPrice as price,
FROM {{ source('retail', 'raw_invoices') }}
WHERE StockCode IS NOT NULL
AND UnitPrice > 0
