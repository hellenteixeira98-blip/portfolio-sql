-- Total de vendas por funcionário
SELECT 
    funcionario,
    SUM(unidades_vendidas) AS total_vendas
FROM cap12.vendas
GROUP BY funcionario
ORDER BY total_vendas DESC;

-- Total de vendas por ano
SELECT 
    ano,
    SUM(unidades_vendidas) AS total_vendas
FROM cap12.vendas
GROUP BY ano
ORDER BY ano;

-- Total de vendas por funcionário e ano
SELECT 
    funcionario,
    ano,
    SUM(unidades_vendidas) AS total_vendas
FROM cap12.vendas
GROUP BY funcionario, ano
ORDER BY funcionario, ano;

-- Média de vendas por funcionário
SELECT 
    funcionario,
    ROUND(AVG(unidades_vendidas), 2) AS media_vendas
FROM cap12.vendas
GROUP BY funcionario
ORDER BY media_vendas DESC;
