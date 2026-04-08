-- Total investido
SELECT ROUND(SUM(orcamento),2) AS total_investido
FROM revisao.projetos_estudo;

-- Média de orçamento
SELECT ROUND(AVG(orcamento),2) AS media_orcamento
FROM revisao.projetos_estudo;

-- Projetos por responsável
SELECT responsavel, COUNT(*) AS total_projetos
FROM revisao.projetos_estudo
GROUP BY responsavel;
