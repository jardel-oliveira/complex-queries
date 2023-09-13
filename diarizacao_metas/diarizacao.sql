select 
    uf,
    praca,
    veiculo,
    urls,
    contato_envio_pi,
    responsavel,
    plataforma,
    formato,
    especificacoes,
    tipo_de_compra,
    data_inicial,
    data_final,
    tt_ins,
    impressoes_estimadas_total_periodo,
    valor_bruto_tabela,
    descconto,
    valor_bruto_total_negociado,
    valor_liquido_total_negociado,
    valor_cliente_total_negociado,
    data_meta,
    insercoes
from 
(
    select * from nome_da_tabela
) as src
unpivot
(
    insercoes
    for data in (Coluna1, Coluna2, ..., ColunaN) 
) as unpvt;
