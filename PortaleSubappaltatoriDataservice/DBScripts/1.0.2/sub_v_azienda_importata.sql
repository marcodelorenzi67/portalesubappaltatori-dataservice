CREATE OR REPLACE VIEW sub_v_azienda_importata AS
SELECT
    a.oid,
    EXISTS (
        SELECT 1
        FROM sub_fornitore sf
        WHERE sf.azienda_oid = a.oid
    ) AS importata
FROM azienda a;