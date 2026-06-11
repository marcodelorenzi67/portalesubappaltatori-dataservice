ALTER TABLE public.sub_allegati RENAME COLUMN seriale TO marca;

-- User [User]
alter table "public"."sub_user"  add column  "principale"  bool;

-- User invitati [cls4]
alter table "public"."sub_user_invitati"  add column  "principale"  bool;

ALTER TABLE public.sub_tipologia_allegati RENAME COLUMN giorni_durata TO giorni_alert;

-- Documenti [cls5]
alter table "public"."sub_allegati"  add column  "data_alert"  date;

-- Documento_DocumentoInScadenza [as32o]
alter table "public"."sub_allegati"  add column  "allegati_oid"  int4;
alter table "public"."sub_allegati"   add constraint fk_allegati_allegati foreign key ("allegati_oid") references "public"."sub_allegati" ("oid");

-- Fornitore [cls2]
alter table "public"."sub_fornitore"  add column  "importato"  bool;

-- Fornitore_Azienda [as33o]
alter table "public"."sub_fornitore"  add column  "azienda_oid"  int4;
alter table "public"."sub_fornitore"   add constraint fk_fornitore_azienda foreign key ("azienda_oid") references "public"."azienda" ("oid");

-- Tenant [cls1]
alter table "public"."sub_tenant"  add column  "omnia"  bool;

-- Personale_Contatto [as34o]
alter table "public"."sub_personale"  add column  "contatto_oid"  int4;
alter table "public"."sub_personale"   add constraint fk_personale_contatto foreign key ("contatto_oid") references "public"."contatto" ("oid");