SELECT 
    COALESCE(TO_CHAR(DataVenda, 'YYYY-MM-DD'), 'Total Geral') AS data_venda,
    COALESCE(Produto, 'Todos os Produtos') AS produto,
    
    SUM(Quantidade * ValorUnitario) AS total_vendas,

    -- Classificação de desempenho
    CASE 
        WHEN SUM(Quantidade * ValorUnitario) > 50000 THEN 'Alto Desempenho'
        WHEN SUM(Quantidade * ValorUnitario) BETWEEN 20000 AND 50000 THEN 'Médio Desempenho'
        ELSE 'Baixo Desempenho'
    END AS classificacao_desempenho

FROM cap10.vendas

GROUP BY 
    ROLLUP (DataVenda, Produto)

ORDER BY 
    DataVenda,
    Produto;
