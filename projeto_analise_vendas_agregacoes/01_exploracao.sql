-- Visualizar dados da tabela de vendas
SELECT *
FROM cap10.vendas
LIMIT 10;

-- Verificar produtos existentes
SELECT DISTINCT Produto
FROM cap10.vendas;

-- Verificar vendedores
SELECT DISTINCT Vendedor
FROM cap10.vendas;

-- Verificar período de vendas
SELECT 
    MIN(DataVenda) AS data_inicial,
    MAX(DataVenda) AS data_final
FROM cap10.vendas;

-- Contar quantidade de registros
SELECT COUNT(*) AS total_registros
FROM cap10.vendas;
