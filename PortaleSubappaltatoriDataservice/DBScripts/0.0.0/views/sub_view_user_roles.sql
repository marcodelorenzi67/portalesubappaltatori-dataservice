CREATE OR REPLACE VIEW sub_view_user_roles AS
SELECT
    q.oid,
    q.user_id,
    BOOL_OR(q.flg_bo_consultazione) AS flg_bo_consultazione,
    BOOL_OR(q.flg_bo_admin)         AS flg_bo_admin,
    BOOL_OR(q.flg_bo_gestione)      AS flg_bo_gestione,
    BOOL_OR(q.flg_bo_responsabile)  AS flg_bo_responsabile,
    BOOL_OR(q.flg_fornitore)        AS flg_fornitore,
    BOOL_OR(q.flg_bo_any)           AS flg_bo_user
FROM (
    SELECT
        u.oid,
        u.user_id,
        (a.scope = 'Consultazione')  AS flg_bo_consultazione,
        (a.scope = 'Amministratore') AS flg_bo_admin,
        (a.scope = 'Gestione')       AS flg_bo_gestione,
        (a.scope = 'Responsabile')   AS flg_bo_responsabile,
        (a.scope = 'Fornitore')      AS flg_fornitore,
        (
            a.scope IN (
                'Consultazione',
                'Amministratore',
                'Gestione',
                'Responsabile'
            )
        ) AS flg_bo_any
    FROM "sub_user" u
    JOIN auth_approval a
        ON u.user_id = a.identity_user_id
) q
GROUP BY
    q.oid,
    q.user_id;