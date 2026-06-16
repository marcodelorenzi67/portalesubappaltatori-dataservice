CREATE OR REPLACE VIEW public.sub_view_documenti_da_caricare_personale
AS SELECT oid AS personale_oid,
    fornitore_oid,
    (EXISTS ( SELECT 1
           FROM sub_allegati sa
             JOIN sub_stato_allegato ssa ON ssa.oid = sa.stato_allegato_oid
          WHERE sa.personale_oid = sp.oid AND sa.fornitore_oid = sp.fornitore_oid AND sa.tenant_oid = 1 AND ssa.codice::text = 'I'::text)) AS documenti_da_caricare_tenant_1,
    (EXISTS ( SELECT 1
           FROM sub_allegati sa
             JOIN sub_stato_allegato ssa ON ssa.oid = sa.stato_allegato_oid
          WHERE sa.personale_oid = sp.oid AND sa.fornitore_oid = sp.fornitore_oid AND sa.tenant_oid = 2 AND ssa.codice::text = 'I'::text)) AS documenti_da_caricare_tenant_2
   FROM sub_personale sp;