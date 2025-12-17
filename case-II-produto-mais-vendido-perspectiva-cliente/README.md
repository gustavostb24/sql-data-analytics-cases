# Case II - Produto mais Comprado por Cliente
  
  ## Problema de Negócio:
    Identificar para cada Cliente:
      - Categoria do Produto mais comprado;
      - Quantidade de Unidades compradas;
      - Valor Total gerado pela compra do Produto com mais compras;
      - Produto mais comprado por cada Cliente.
  ## Desafios Técnicos:
    - Garantir a contagem correta de unidades compradas, respeitando a granularidade do dado;
    - Diferenciar corretamente pedidos de unidades;
    - Tratar empates entre produtos com a mesma quantidade de compras;
    - Garantir ordenação consistente usando múltiplos critérios.
  ## Solução:
    - Solução construída através de:
      - JOIN entre tabelas;
      - CTE's para organização da lógica; 
      - Uso da Window Function ROW NUMBER para ranquear os produtos mais comprados; 
      - Ordenamento e Agrupamento.
  ## Métricas:
    - Quantidade de Unidades Compradas;
    - Valor Total gasto por produto;
    - Ranking do Produto mais comprado por cliente.
  ## Tecnologias: 
    - SQL;
    - Window Functions (ROW_NUMBER);
    - CTE (Commom Table Expressions);
    - JOIN.
  ## Arquivos 
    - query_II.sql
