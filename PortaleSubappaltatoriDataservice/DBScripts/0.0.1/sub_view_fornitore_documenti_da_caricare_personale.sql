CREATE OR REPLACE VIEW sub_view_fornitore_documenti_da_caricare_personale AS
SELECT
    sf.oid AS fornitore_oid,
    EXISTS (
        SELECT 1
        FROM sub_personale sp
        JOIN sub_allegati sa
            ON sa.personale_oid = sp.oid
           AND sa.fornitore_oid = sp.fornitore_oid
        JOIN sub_stato_allegato ssa
            ON ssa.oid = sa.stato_allegato_oid
        WHERE sp.fornitore_oid = sf.oid
          AND sa.tenant_oid = 1
          AND ssa.codice = 'I'
    ) AS documenti_da_caricare_tenant_1,
    EXISTS (
        SELECT 1
        FROM sub_personale sp
        JOIN sub_allegati sa
            ON sa.personale_oid = sp.oid
           AND sa.fornitore_oid = sp.fornitore_oid
        JOIN sub_stato_allegato ssa
            ON ssa.oid = sa.stato_allegato_oid
        WHERE sp.fornitore_oid = sf.oid
          AND sa.tenant_oid = 2
          AND ssa.codice = 'I'
    ) AS documenti_da_caricare_tenant_2
FROM sub_fornitore sf;