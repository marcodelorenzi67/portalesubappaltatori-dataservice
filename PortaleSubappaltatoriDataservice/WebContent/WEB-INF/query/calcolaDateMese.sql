SELECT
    CAST(date_trunc('month', current_date) AS date) AS primoGiorno,
    CAST(
        date_trunc('month', current_date) + interval '1 month - 1 day'
        AS date
    ) AS ultimoGiorno;