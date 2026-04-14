-- Visualizar dados de pedidos
SELECT *
FROM cap10.dsa_pedidos
LIMIT 10;

-- Visualizar dados de clientes
SELECT *
FROM cap10.dsa_clientes
LIMIT 10;

-- Visualizar dados de produtos
SELECT *
FROM cap10.dsa_produtos
LIMIT 10;

-- Verificar produtos com palavras-chave relevantes
SELECT nome_produto
FROM cap10.dsa_produtos
WHERE nome_produto LIKE '%Análise%' 
   OR nome_produto LIKE '%Apache%';

-- Contar quantidade de pedidos por estado
SELECT 
    cli.estado_cliente,
    COUNT(*) AS total_pedidos
FROM cap10.dsa_pedidos ped
INNER JOIN cap10.dsa_clientes cli 
    ON ped.id_cliente = cli.id_cli
GROUP BY cli.estado_cliente
ORDER BY total_pedidos DESC;
