# Case I — Produto Mais Vendido por Vendedor

  # Problema de Negócio:
  - Identificar para cada vendedor:
      - Produto mais vendido;
      - Quantidade de Unidades Vendidas;
      - Valor Total gerado pela venda do Produto com mais vendas.
  # Desafios Técnicos
    - Garantir a contagem correta de unidades vendidas, respeitando a granularidade do dado;
    - Diferenciar corretamente pedidos de unidades;
    - Tratar empates entre produtos com a mesma quantidade de vendas;
    - Garantir ordenação consistente usando múltiplos critérios.
  # Solução:
    - Solução construída através de:
      - JOIN entre tabelas;
      - CTE's para organização da lógica; 
      - Uso da Window Function ROW NUMBER para ranquear os produtos mais vendidos; 
      - Ordenamento e Agrupamento.
  # Métricas
    - Quantidade de Unidades Vendidas;
    - Valor Total de vendas por produto;
    - Ranking do Produto mais Vendido por Vendedor.
  # Tecnologias 
    - SQL
    - Window Functions (ROW_NUMBER)
    - CTE (Commom Table Expressions)
    - JOIN
  # Arquivos
    - 
  
    
    
