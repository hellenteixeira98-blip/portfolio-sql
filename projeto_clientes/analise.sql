-- 📊 Projeto: Análise de Clientes

-- Objetivo:
-- Identificar clientes mais valiosos com base em quantidade de pedidos,
-- faturamento total, ticket médio e Top 10.

SELECT 
    nome,
    COUNT(*) AS qt_pedidos,
    SUM(valor_compra) AS total_gasto,
    ROUND(SUM(valor_compra) / COUNT(*), 2) AS ticket_medio
FROM sql.clientes
GROUP BY nome
ORDER BY total_gasto DESC
LIMIT 10;
