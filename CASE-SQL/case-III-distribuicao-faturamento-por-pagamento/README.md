# Case III - Distribuição de Faturamento por Forma de Pagamento
  
  ## Problema de Negócio:
    Analisar como o Faturamento de cada Vendedor é distribuído pelas Quatro Formas de Pagamento.
    Para cada Vendedor, identificar:
      - Valor Total vendido;
      - Percentual do Faturamento pago através de:
        - Cartão de Crédito;
        - Cartão de Débito;
        - Boleto;
        - Voucher.
  ## Desafios Técnicos:
    - Unificar dados de vendas e pagamentos que possuem granularidade diferente;
    - Diferenciar corretamente Total de Vendas de Valor Total (Preço + Frete);
    - Tratar valores nulos para formas de pagamento vazias;
    - Transformar dados de pagamento de formato Linear para Colunar;
    - Cálculo de percentuais.
  ## Solução:
    - Solução construída através de:
      - JOIN entre tabelas: Itens dos Pedidos e Pagamentos;
      - CTE's para organização da lógica; 
      - Aplicação do CASE WHEN para pivotar os tipos de pagamento; 
      - Funções de Agregação;
      - COALESCE para Valores Nulos.
  ## Métricas:
    - Valor Total (Preço + Frete);
    - Percentual de faturamento dividido em 4 formas de pagamento.
  ## Tecnologias: 
    - SQL;
    - CTE (Commom Table Expressions);
    - CASE WHEN;
    - JOIN.
  ## Arquivos 
    - query_III.sql
