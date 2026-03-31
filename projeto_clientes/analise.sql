-- 📊 Análise de Clientes

-- Objetivo:
-- Identificar clientes mais valiosos com base em faturamento,
-- quantidade de compras e valor médio de compras por cliente

WITH resumo_clientes AS (
    SELECT 
        nome,
        COUNT(*) AS qt_pedidos,
        SUM(valor_compra) AS fat_total,
        ROUND(AVG(valor_compra), 2) AS media_compra
    FROM clientes
    GROUP BY nome
)

SELECT *,
       RANK() OVER (ORDER BY fat_total DESC) AS ranking
FROM resumo_clientes
ORDER BY fat_total DESC;
