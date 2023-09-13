WITH alldata AS
  (
    SELECT
      CAST(date AS date) AS date,
      CASE
        WHEN (leads < 50) THEN 'NÃO PRONTO PARA ANÁLISE'
        ELSE 'PRONTO PARA ANÁLISE'
      END AS CreativeAnalysisStatus,
      'Nome do Editor' AS publisher,
      'Nome da Segmentação' AS Segmentation_name,
      'Tipo de Segmentação' AS segmentation_type,
      'Nome do Anúncio' AS CreativeName,
      'Tipo de Anúncio' AS AdType,
      'Código de Rastreamento' AS url_build_track,
      cost AS custo,
      leads AS leads,
      bounces AS bounces,
      visits AS visits,
      impressions AS impressions,
      clicks AS clicks,
      video_watches_at_50 AS video_watches_at_50,
      video_watches_at_100 AS video_watches_at_100
    FROM
      `seu_banco_de_dados`.`sua_tabela`
  ),
  allMaxLastDate AS
  (
    SELECT
      url_build_track AS Código_de_Rastreamento,
      MAX(date) AS MaxLastDate,
      CASE
        WHEN (MAX(date) < DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)) THEN 'PAUSADA'
        ELSE 'ATIVA'
      END AS StatusCampanha
    FROM
      `seu_banco_de_dados`.`sua_tabela`
    WHERE
      custo > 0
    GROUP BY
      1
  )
SELECT
  a.date AS Data,
  a.CreativeAnalysisStatus AS StatusAnaliseCriativa,
  a.publisher AS Editor,
  a.Segmentation_name AS NomeSegmentação,
  a.segmentation_type AS TipoSegmentação,
  a.CreativeName AS NomeAnúncio,
  a.AdType AS TipoAnúncio,
  a.tracking_code AS CódigoRastreamento,
  a.custo AS Custo,
  a.leads AS Leads,
  a.bounces AS Bounces,
  a.visits AS Visitas,
  a.impressions AS Impressões,
  a.clicks AS Cliques,
  a.video_watches_at_50 AS VideoAssistido50,
  a.video_watches_at_100 AS VideoAssistido100,
  b.MaxLastDate AS ÚltimaData,
  b.StatusCampanha AS StatusCampanha
FROM
  alldata a
  LEFT JOIN
    allMaxLastDate b
    ON
      a.url_build_track = b.url_build_track
WHERE
  custo > 0
ORDER BY
  a.url_build_track DESC;
