USE schema1_dados_publicos;

-- 1. Período dos dados analisados
SELECT
    MIN(order_purchase_timestamp) AS primeira_compra,
    MAX(order_purchase_timestamp) AS ultima_compra
FROM orders;


-- 2. Indicadores gerais dos valores dos produtos
SELECT
    SUM(price) AS valor_total_produtos,
    AVG(price) AS preco_medio_produto,
    MAX(price) AS maior_preco,
    MIN(price) AS menor_preco
FROM order_items;


-- 3. Análise dos pagamentos por tipo
SELECT
    payment_type,
    COUNT(*) AS quantidade_pagamentos,
    SUM(payment_value) AS valor_total,
    AVG(payment_value) AS valor_medio
FROM order_payments
GROUP BY payment_type
ORDER BY valor_total DESC;


-- 4. Quantidade de pedidos e vendas por mês
SELECT
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS mes,
    COUNT(DISTINCT o.order_id) AS quantidade_pedidos,
    SUM(i.price) AS valor_total_vendas,
    AVG(i.price) AS preco_medio_item
FROM orders o
INNER JOIN order_items i
    ON o.order_id = i.order_id
GROUP BY DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m')
ORDER BY mes;


-- 5. Os cinco meses com maior valor em vendas
SELECT
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS mes,
    COUNT(DISTINCT o.order_id) AS quantidade_pedidos,
    SUM(i.price) AS valor_total_vendas
FROM orders o
INNER JOIN order_items i
    ON o.order_id = i.order_id
GROUP BY DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m')
ORDER BY valor_total_vendas DESC
LIMIT 5;


-- 6. Distribuição dos pedidos por situação
SELECT
    order_status,
    COUNT(*) AS quantidade_pedidos,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders),
        2
    ) AS percentual
FROM orders
GROUP BY order_status
ORDER BY quantidade_pedidos DESC;


-- 7. Análise das vendas por ano
SELECT
    YEAR(o.order_purchase_timestamp) AS ano,
    COUNT(DISTINCT o.order_id) AS quantidade_pedidos,
    SUM(i.price) AS valor_total_vendas,
    AVG(i.price) AS preco_medio_item,
    MAX(i.price) AS maior_preco,
    MIN(i.price) AS menor_preco
FROM orders o
INNER JOIN order_items i
    ON o.order_id = i.order_id
GROUP BY YEAR(o.order_purchase_timestamp)
ORDER BY ano;


-- 8. Distribuição dos pedidos e vendas por estado
SELECT
    c.customer_state AS estado,
    COUNT(DISTINCT o.order_id) AS quantidade_pedidos,
    SUM(i.price) AS valor_total_vendas,
    AVG(i.price) AS preco_medio_item
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
INNER JOIN order_items i
    ON o.order_id = i.order_id
GROUP BY c.customer_state
ORDER BY quantidade_pedidos DESC;


-- 9. Estados com maior valor médio de compra por pedido
SELECT
    c.customer_state AS estado,
    COUNT(DISTINCT o.order_id) AS quantidade_pedidos,
    ROUND(
        SUM(i.price) / COUNT(DISTINCT o.order_id),
        2
    ) AS valor_medio_por_pedido
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
INNER JOIN order_items i
    ON o.order_id = i.order_id
GROUP BY c.customer_state
ORDER BY valor_medio_por_pedido DESC
LIMIT 10;
