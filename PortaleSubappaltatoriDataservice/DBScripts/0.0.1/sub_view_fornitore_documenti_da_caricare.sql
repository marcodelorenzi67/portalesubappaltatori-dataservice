CREATE OR REPLACE VIEW public.sub_view_fornitore_documenti_da_caricare
AS SELECT oid AS fornitore_oid,
    (EXISTS ( SELECT 1
           FROM sub_allegati sa
             JOIN sub_stato_allegato ssa ON ssa.oid = sa.stato_allegato_oid
          WHERE sa.fornitore_oid = sf.oid AND sa.tenant_oid = 1 AND ssa.codice::text = 'I'::text AND sa.personale_oid IS NULL)) AS documenti_da_caricare_tenant_1,
    (EXISTS ( SELECT 1
           FROM sub_allegati sa
             JOIN sub_stato_allegato ssa ON ssa.oid = sa.stato_allegato_oid
          WHERE sa.fornitore_oid = sf.oid AND sa.tenant_oid = 2 AND ssa.codice::text = 'I'::text AND sa.personale_oid IS NULL)) AS documenti_da_caricare_tenant_2
   FROM sub_fornitore sf;
 