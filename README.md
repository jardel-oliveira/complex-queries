# Verificação de Status de Anúncios Ativos em Campanhas Publicitárias
O script SQL neste repositório foi desenvolvido para analisar dados de campanhas publicitárias e determinar o status de cada anúncio com base em várias métricas, incluindo a data da campanha e o custo associado. Aqui está uma visão mais detalhada do que o script realiza:

Funcionalidades Principais
Utilização de Cláusulas CTE (Common Table Expressions):

O script utiliza cláusulas CTE para criar duas tabelas temporárias: "alldata" e "allMaxLastDate".
Tabela "alldata":

A tabela "alldata" contém dados detalhados das campanhas publicitárias.
Calcula o status da análise criativa com base no número de leads.
Além disso, inclui informações sobre a data da campanha, editor, segmentação, tipo de segmentação, nome do anúncio, tipo de anúncio, código de rastreamento e várias métricas, como custo, leads, bounces, visitas, impressões, cliques e visualizações de vídeo.
Tabela "allMaxLastDate":

A tabela "allMaxLastDate" determina o status da campanha com base na data máxima da campanha em relação ao dia anterior (D-1).
Classifica as campanhas como "PAUSADAS" ou "ATIVAS" com base na data máxima da campanha.
JOIN e Filtragem:

Realiza um JOIN entre as tabelas "alldata" e "allMaxLastDate" para combinar os dados.
Filtra os resultados para incluir apenas campanhas com custo maior que zero.