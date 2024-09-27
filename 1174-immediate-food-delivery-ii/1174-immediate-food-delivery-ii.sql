WITH FirstOrders AS (
    SELECT 
        customer_id,
        MIN(order_date) AS first_order_date
    FROM 
        Delivery
    GROUP BY 
        customer_id
)

SELECT 
    ROUND(SUM(CASE WHEN d.order_date = d.customer_pref_delivery_date THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS immediate_percentage
FROM 
    FirstOrders fo
JOIN 
    Delivery d ON fo.customer_id = d.customer_id AND fo.first_order_date = d.order_date;
