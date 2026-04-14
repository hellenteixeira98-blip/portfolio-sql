-- Visualizar os dados da tabela
SELECT *
FROM cap12.vendas
LIMIT 10;

-- Verificar funcionários
SELECT DISTINCT funcionario
FROM cap12.vendas;

-- Verificar anos disponíveis
SELECT DISTINCT ano
FROM cap12.vendas
ORDER BY ano;

-- Verificar meses disponíveis
SELECT DISTINCT mes
FROM cap12.vendas;

-- Contar total de registros
SELECT COUNT(*) AS total_registros
FROM cap12.vendas;

-- Verificar intervalo de vendas
SELECT 
    MIN(ano) AS ano_inicial,
    MAX(ano) AS ano_final
FROM cap12.vendas;
