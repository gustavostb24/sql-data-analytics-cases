# Case V - Análise Temporal e Classificação de Atividade dos Vendedores
  
  ## Problema de Negócio:
    Construir uma análise completa do comportamento de vendas dos vendedores ao
    longo do tempo, permitindo:
      - Identificar o mês da primeira venda de cada vendedor    
      - Acompanhar a evolução mensal do faturamento;
      - Classificar os vendedores de acordo com seu status de atividade;
      - Detectar padrões de Entrada, Recorrência, Churn e Recuperação.

    Essa Análise é fundamental para áreas do negócio como:
      - Performance Comercial;
      - Retenção de Vendedores;
      - Planejamento Estratégico;
      - Análise de Cohort e Lifecycle
  ## Objetivos da Análise:
    Para cada vendedor e mês de referência, a análise deve responder:
      - Quando ocorreu a primeira venda;
      - Qual foi o valor vendido no mês;
      - Se o vendedor esteve ativo ou inativo;
      - Qual o status do vendedor naquele período.
  ## Desafios Técnicos:
    - Trabalhar com dados temporais em granularidade mensal;
    - Tratar de forma correta as datas que estão em nível diário;
    - Evitar duplicidade de valores causada por diferença de granularidade;
    - Identificar corretamente o primeiro mês de venda;
    - Criar uma métrica binária de atividade (ativo/inativo);
    - Comparar o status atual com o mês anterior;
    - Traduzir regras de negócio em lógica SQL clara e confiável
  ## Solução:
    Solução construída através de uma abordagem modular baseada em CTEsm
    contemplando:
      - Tratamento de Datas com 'STRFTIME' para padronização em ano-mês;
      - Construção de uma base temporal mensal de referência;
      - Identificação do primeiro mês de venda por vendedor usando 'MIN';
      - Agregação correta do valor vendido por mês;
      - Criação de uma flag de atividade baseada na existência de vendas;
      - Aplicação de Window Functions para análise temporal;
      - Uso da função 'LAG' para acessar o status do período anterior;
      - Classificação do vendedor através de regras de negócio implementadas com
      'CASE WHEN'.
  ## Classificação de Status dos Vendedores:
    Os vendedores foram classificados em:
      - Prior Entry: período anterior à primeira venda;
      - Novo: mês da primeira venda;
      - Regular: vendeu no mês atual e no mês anterior;
      - Churn: não realizou vendas no mês atual;
      - Recuperado: voltou a vender após o período de inatividade.

    Essa classificação permite análises avançadas de comportamento e retenção.
  ## Métricas:
    - Mês de Referência;
    - Mês da primeira venda;
    - Valor total vendido no Mês;
    - Indicador de atividade;
    - Status do vendedor por período.
  ## Tecnologias: 
    - SQL;
    - CASE WHEN;
    - CTE (Commom Table Expressions);
    - Window Function ('LAG');
    - JOIN;
    - Manipulação de Datas ('STRFTIME')
  ## Arquivos 
    - query_V.sql
