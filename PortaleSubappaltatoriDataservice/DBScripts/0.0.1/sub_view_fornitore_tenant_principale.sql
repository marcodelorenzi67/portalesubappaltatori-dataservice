CREATE VIEW sub_view_fornitore_tenant_principale AS
SELECT
    ft.fornitore_oid,
    CASE
        WHEN COUNT(*) = 1 THEN MIN(ft.tenant_oid)
        ELSE 1
    END AS tenant_oid
FROM sub_fornitore_tenant ft
GROUP BY ft.fornitore_oid;