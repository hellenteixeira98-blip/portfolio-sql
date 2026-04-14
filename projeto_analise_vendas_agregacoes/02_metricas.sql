-- Total de vendas por produto
SELECT 
    Produto,
    SUM(Quantidade * ValorUnitario) AS total_vendas
FROM cap10.vendas
GROUP BY Produto
ORDER BY total_vendas DESC;

-- Total de vendas por vendedor
SELECT 
    Vendedor,
    SUM(Quantidade * ValorUnitario) AS total_vendas
FROM cap10.vendas
GROUP BY Vendedor
ORDER BY total_vendas DESC;

-- Total de vendas por dia
SELECT 
    DataVenda,
    SUM(Quantidade * ValorUnitario) AS total_vendas
FROM cap10.vendas
GROUP BY DataVenda
ORDER BY DataVenda;

-- Ticket médio por venda
SELECT 
    ROUND(AVG(Quantidade * ValorUnitario), 2) AS ticket_medio
FROM cap10.vendas;
