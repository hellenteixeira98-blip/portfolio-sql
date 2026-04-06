# 📊 Projeto: Análise de Clientes

## 🎯 Objetivo
Analisar o comportamento de clientes com base no histórico de compras, identificando frequência, faturamento, ticket médio e o Top 10.

---

## 📁 Base de dados
Tabela: clientes

Contém:
- id_cliente
- nome
- data_compra
- valor_compra

---

## 🔧 Análise realizada

Foi desenvolvida uma query para calcular:

- Quantidade de pedidos por cliente
- Faturamento total por cliente
- Ticket médio por cliente
- Top 10 de faturamento 

---

## 💻 Query

```sql
SELECT 
    nome,
    COUNT(*) AS qt_pedidos,
    SUM(valor_compra) AS total_gasto,
    ROUND(SUM(valor_compra) / COUNT(*), 2) AS ticket_medio
FROM sql.clientes
GROUP BY nome
ORDER BY total_gasto DESC
LIMIT 10;


## 📊 Insights (resumo)

- Clientes com maior faturamento se destacam
- Existe variação no ticket médio entre clientes
