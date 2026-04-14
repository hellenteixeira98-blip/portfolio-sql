SELECT 
    cli.estado_cliente,
    
    -- Custo total com ajuste de regra de negócio
    SUM(
        CASE 
            WHEN cli.estado_cliente = 'SP' THEN prod.custo * 1.1
            ELSE prod.custo
        END
    ) AS custo_total_ajustado,

    -- Classificação do custo
    CASE 
        WHEN SUM(prod.custo) > 200000 THEN 'Alto Custo'
        WHEN SUM(prod.custo) BETWEEN 100000 AND 200000 THEN 'Médio Custo'
        ELSE 'Baixo Custo'
    END AS classificacao_custo,

    -- Status do aumento
    CASE 
        WHEN cli.estado_cliente = 'SP' THEN 'Com Aumento de Custo'
        ELSE 'Sem Aumento de Custo'
    END AS status_aumento

FROM cap10.dsa_pedidos ped

INNER JOIN cap10.dsa_clientes cli 
    ON ped.id_cliente = cli.id_cli

INNER JOIN cap10.dsa_produtos prod 
    ON ped.id_produto = prod.id_prod

-- Filtro estratégico de produtos
WHERE 
    prod.nome_produto LIKE '%Análise%' 
    OR prod.nome_produto LIKE '%Apache%'

GROUP BY 
    cli.estado_cliente

-- Filtro de negócio
HAVING 
    SUM(prod.custo) BETWEEN 100000 AND 250000

ORDER BY 
    custo_total_ajustado DESC;
