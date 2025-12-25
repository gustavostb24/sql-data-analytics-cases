# Case IV - Participação das Categorias de Produtos no Faturamento por Vendedor
  
  ## Problema de Negócio:
    Analisar como o faturamento de cada vendedor está distribuído pelas categorias de produto,
    permitindo identificar dependência de categorias específicas e como diversificar o portfolio
    de cada vendedor.
    Para cada Vendedor, identificar:
      - Valor Total vendido;
      - Valor vendido por categoria de produto;
      - Percentual que cada categoria representa no faturamento total do vendedor.
  ## Desafios Técnicos:
    - Calcular corretamente o valor total de vendas considerando preço + frete;
    - Agrupar vendas por vendedor e categoria;
    - Tratar categorias que tem variações de si mesmas;
    - Transformar categorias do formato linear para colunar;
    - Tratar valores nulos corretamente;
    - Cálculo preciso de percentuais
  ## Solução:
    - Solução construída através de:
      - JOIN entre tabelas, Itens dos Pedidos, Pedidos e Produtos;
      - CTE's para organização da lógica; 
      - CASE WHEN para agrupar categorias semelhantes e pivotar os dados; 
      - COALESCE para Valores Nulos;
      - Cálculo do percentual de participação de cada categoria no faturamento total.
  ## Métricas:
    - Valor total vendido por vendedor;
    - Valor vendido por categoria;
    - Participação de cada categoria no faturamento do vendedor.
  ## Tecnologias: 
    - SQL;
    - CASE WHEN;
    - CTE (Commom Table Expressions);
    - SUM;
    - ROUND;
    - JOIN.
  ## Arquivos 
    - query_IV.sql
