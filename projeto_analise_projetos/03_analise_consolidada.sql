SELECT 
    nome_projeto,
    responsavel,
    orcamento,
    
    -- Classificação do investimento
    CASE
        WHEN orcamento > 100000 THEN 'Alto Investimento'
        WHEN orcamento BETWEEN 60000 AND 100000 THEN 'Médio Investimento'
        ELSE 'Baixo Investimento'
    END AS classificacao_investimento,

    -- Situação do projeto
    CASE
        WHEN data_fim IS NULL THEN 'Em andamento'
        ELSE 'Finalizado'
    END AS status,

    -- Duração (se concluído)
    CASE
        WHEN data_fim IS NOT NULL THEN (data_fim - data_inicio)
        ELSE NULL
    END AS duracao_dias,

    -- Comparação com média
    CASE
        WHEN orcamento > (SELECT AVG(orcamento) FROM revisao.projetos_estudo)
        THEN 'Acima da média'
        ELSE 'Abaixo da média'
    END AS comparacao_media,

    -- Ano de início
    EXTRACT(YEAR FROM data_inicio) AS ano_inicio

FROM revisao.projetos_estudo

-- Filtro inteligente usando BETWEEN
WHERE data_inicio BETWEEN '2022-01-01' AND '2023-12-31'

ORDER BY orcamento DESC;
