-- Custo total dos pedidos por estado
SELECT 
    cli.estado_cliente,
    SUM(prod.custo) AS custo_total
FROM cap10.dsa_pedidos ped
INNER JOIN cap10.dsa_clientes cli 
    ON ped.id_cliente = cli.id_cli
INNER JOIN cap10.dsa_produtos prod 
    ON ped.id_produto = prod.id_prod
GROUP BY cli.estado_cliente
ORDER BY custo_total DESC;

-- Custo médio dos pedidos por estado
SELECT 
    cli.estado_cliente,
    ROUND(AVG(prod.custo), 2) AS custo_medio
FROM cap10.dsa_pedidos ped
INNER JOIN cap10.dsa_clientes cli 
    ON ped.id_cliente = cli.id_cli
INNER JOIN cap10.dsa_produtos prod 
    ON ped.id_produto = prod.id_prod
GROUP BY cli.estado_cliente
ORDER BY custo_medio DESC;

-- Quantidade de pedidos por estado
SELECT 
    cli.estado_cliente,
    COUNT(*) AS total_pedidos
FROM cap10.dsa_pedidos ped
INNER JOIN cap10.dsa_clientes cli 
    ON ped.id_cliente = cli.id_cli
GROUP BY cli.estado_cliente
ORDER BY total_pedidos DESC;
