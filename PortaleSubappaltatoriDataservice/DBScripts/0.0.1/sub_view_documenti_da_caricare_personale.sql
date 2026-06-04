CREATE OR REPLACE VIEW sub_view_documenti_da_caricare_personale AS
SELECT 
    sp."oid",
    EXISTS (
        SELECT 1
        FROM sub_allegati sa
        JOIN sub_stato_allegato ssa 
            ON sa.stato_allegato_oid = ssa."oid"
        WHERE sa.personale_oid = sp."oid"
          AND ssa.codice = 'I'
    ) AS documenti_da_caricare
FROM sub_personale sp;