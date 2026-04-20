CREATE OR REPLACE VIEW sub_view_token_validita AS
SELECT
    t.descrizione,
    t.created_at + (COALESCE(tt.giorni_validita, 0) * INTERVAL '1 day') AS data_scadenza,
    CASE 
        WHEN t.created_at < t.created_at + (COALESCE(tt.giorni_validita, 0) * INTERVAL '1 day')
        THEN true
        ELSE false
    END AS attivo
FROM 
    sub_token t
JOIN 
    sub_tipo_token tt ON t.tipo_token_oid = tt.oid;