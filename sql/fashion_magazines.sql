SELECT
    customers.customer_name AS Customer,
    PRINTF('$%.2f', SUM(subscriptions.price_per_month * subscriptions.subscription_length)) AS "Amount Due"
FROM
    customers
JOIN
    orders ON customers.customer_id = orders.customer_id
JOIN
    subscriptions ON orders.subscription_id = subscriptions.subscription_id
WHERE
    orders.order_status = 'unpaid'
    AND subscriptions.description = 'Fashion Magazine'
GROUP BY
    customers.customer_name;

