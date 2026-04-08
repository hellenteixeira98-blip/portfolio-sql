-- Visualizar amostra dos dados
SELECT * 
FROM revisao.projetos_estudo
LIMIT 10;

-- Contar projetos sem data de fim (em andamento)
SELECT COUNT(*) AS qt_projetos_em_andamento
FROM revisao.projetos_estudo
WHERE data_fim IS NULL;

-- Top 10 projetos com maior orçamento
SELECT *
FROM revisao.projetos_estudo
ORDER BY orcamento DESC
LIMIT 10;
