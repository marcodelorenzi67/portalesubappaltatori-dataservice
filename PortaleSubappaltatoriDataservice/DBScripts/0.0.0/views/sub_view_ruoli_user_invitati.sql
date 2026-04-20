CREATE OR REPLACE VIEW sub_view_ruoli_user_invitati AS
SELECT
    sui.email,
    COALESCE(
        string_agg(sr.descrizione, ', '),
        ''
    ) AS ruoli
FROM sub_user_invitati sui
LEFT JOIN sub_user_invitati_ruolo suir
    ON suir.user_invitati_email = sui.email
LEFT JOIN sub_ruolo sr
    ON suir.ruolo_oid = sr."oid"
GROUP BY
    sui.email;