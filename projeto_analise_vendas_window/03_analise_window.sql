SELECT
    funcionario,
    ano,
    mes,
    unidades_vendidas,

    -- Ordenação correta dos meses
    CASE
        WHEN mes = 'Janeiro' THEN 1
        WHEN mes = 'Fevereiro' THEN 2
        WHEN mes = 'Março' THEN 3
        WHEN mes = 'Abril' THEN 4
        WHEN mes = 'Maio' THEN 5
        WHEN mes = 'Junho' THEN 6
        WHEN mes = 'Julho' THEN 7
        WHEN mes = 'Agosto' THEN 8
        WHEN mes = 'Setembro' THEN 9
        WHEN mes = 'Outubro' THEN 10
        WHEN mes = 'Novembro' THEN 11
        WHEN mes = 'Dezembro' THEN 12
    END AS mes_numero,

    -- Ranking por ano
    RANK() OVER (
        PARTITION BY ano 
        ORDER BY unidades_vendidas DESC
    ) AS ranking_ano,

    -- Soma acumulada por funcionário
    SUM(unidades_vendidas) OVER (
        PARTITION BY funcionario 
        ORDER BY ano, 
        CASE
            WHEN mes = 'Janeiro' THEN 1
            WHEN mes = 'Fevereiro' THEN 2
            WHEN mes = 'Março' THEN 3
            WHEN mes = 'Abril' THEN 4
            WHEN mes = 'Maio' THEN 5
            WHEN mes = 'Junho' THEN 6
            WHEN mes = 'Julho' THEN 7
            WHEN mes = 'Agosto' THEN 8
            WHEN mes = 'Setembro' THEN 9
            WHEN mes = 'Outubro' THEN 10
            WHEN mes = 'Novembro' THEN 11
            WHEN mes = 'Dezembro' THEN 12
        END
    ) AS soma_acumulada,

    -- Comparação com mês anterior
    LAG(unidades_vendidas) OVER (
        PARTITION BY funcionario 
        ORDER BY ano,
        CASE
            WHEN mes = 'Janeiro' THEN 1
            WHEN mes = 'Fevereiro' THEN 2
            WHEN mes = 'Março' THEN 3
            WHEN mes = 'Abril' THEN 4
            WHEN mes = 'Maio' THEN 5
            WHEN mes = 'Junho' THEN 6
            WHEN mes = 'Julho' THEN 7
            WHEN mes = 'Agosto' THEN 8
            WHEN mes = 'Setembro' THEN 9
            WHEN mes = 'Outubro' THEN 10
            WHEN mes = 'Novembro' THEN 11
            WHEN mes = 'Dezembro' THEN 12
        END
    ) AS vendas_mes_anterior,

    -- Crescimento (diferença)
    unidades_vendidas - 
    LAG(unidades_vendidas) OVER (
        PARTITION BY funcionario 
        ORDER BY ano,
        CASE
            WHEN mes = 'Janeiro' THEN 1
            WHEN mes = 'Fevereiro' THEN 2
            WHEN mes = 'Março' THEN 3
            WHEN mes = 'Abril' THEN 4
            WHEN mes = 'Maio' THEN 5
            WHEN mes = 'Junho' THEN 6
            WHEN mes = 'Julho' THEN 7
            WHEN mes = 'Agosto' THEN 8
            WHEN mes = 'Setembro' THEN 9
            WHEN mes = 'Outubro' THEN 10
            WHEN mes = 'Novembro' THEN 11
            WHEN mes = 'Dezembro' THEN 12
        END
    ) AS crescimento_vendas

FROM cap12.vendas

ORDER BY funcionario, ano, mes_numero;
