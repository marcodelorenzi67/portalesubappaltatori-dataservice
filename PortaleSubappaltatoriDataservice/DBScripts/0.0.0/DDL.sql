-- User [User]
create table "public"."sub_user" (
   "oid"  int4  not null,
   "user_id"  varchar(255),
   "secret_key"  varchar(255),
  primary key ("oid")
);


-- Tenant [cls1]
create table "public"."sub_tenant" (
   "oid"  int4  not null,
   "nome"  varchar(255),
  primary key ("oid")
);


-- Tipologia Azienda [cls10]
create table "public"."sub_tipologia_azienda" (
   "oid"  int4  not null,
   "attivo"  bool,
   "codice"  varchar(255),
   "descrizione"  varchar(255),
  primary key ("oid")
);


-- Fornitore [cls2]
create table "public"."sub_fornitore" (
   "oid"  int4  not null,
   "email"  varchar(255),
   "cognome_referente"  varchar(255),
   "nome_referente"  varchar(255),
   "partita_iva"  varchar(255),
   "ragione_sociale"  varchar(255),
  primary key ("oid")
);


-- Stato Registrazione [cls3]
create table "public"."sub_stato_registrazione" (
   "oid"  int4  not null,
   "attivo"  bool,
   "codice"  varchar(255),
   "descrizione"  varchar(255),
  primary key ("oid")
);


-- User invitati [cls4]
create table "public"."sub_user_invitati" (
   "email"  varchar(255)  not null,
   "cognome"  varchar(255),
   "nome"  varchar(255),
  primary key ("email")
);


-- Allegati [cls5]
create table "public"."sub_allegati" (
   "oid"  int4  not null,
   "documento"  varchar(255),
   "descrizione"  varchar(255),
   "note"  text,
   "corrente"  bool,
   "created_at"  timestamp,
  primary key ("oid")
);


-- Token [cls6]
create table "public"."sub_token" (
   "descrizione"  varchar(255)  not null,
   "created_at"  timestamp,
  primary key ("descrizione")
);


-- Tipo Token [cls7]
create table "public"."sub_tipo_token" (
   "oid"  int4  not null,
   "lunghezza"  int4,
   "giorni_validita"  int4,
   "codice"  varchar(255),
   "attivo"  bool,
   "descrizione"  varchar(255),
  primary key ("oid")
);


-- Tipologia Allegati [cls8]
create table "public"."sub_tipologia_allegati" (
   "oid"  int4  not null,
   "pattern_nome"  varchar(255),
   "giorni_durata"  int4,
   "condiviso"  bool,
  primary key ("oid")
);


-- Macro-tipologia [cls9]
create table "public"."sub_macro_tipologia" (
   "oid"  int4  not null,
   "attivo"  bool,
   "codice"  varchar(255),
   "descrizione"  varchar(255),
  primary key ("oid")
);


-- User [User]
alter table "public"."sub_user"  add column  "nome"  varchar(255);
alter table "public"."sub_user"  add column  "cognome"  varchar(255);
alter table "public"."sub_user"  add column  "email"  varchar(255);


-- User_Tenant [as1]
create table "public"."sub_user_tenant" (
   "user_oid"  int4 not null,
   "tenant_oid"  int4 not null,
  primary key ("user_oid", "tenant_oid")
);
alter table "public"."sub_user_tenant"   add constraint fk_user_tenant_user foreign key ("user_oid") references "public"."sub_user" ("oid");
alter table "public"."sub_user_tenant"   add constraint fk_user_tenant_tenant foreign key ("tenant_oid") references "public"."sub_tenant" ("oid");


-- Allegati_Tipologia Allegati [as11]
alter table "public"."sub_allegati"  add column  "tipologia_allegati_oid"  int4;
alter table "public"."sub_allegati"   add constraint fk_allegati_tipologia_allegati foreign key ("tipologia_allegati_oid") references "public"."sub_tipologia_allegati" ("oid");


-- Tipologia Allegati_Macro-tipologia [as12]
alter table "public"."sub_tipologia_allegati"  add column  "macro_tipologia_oid"  int4;
alter table "public"."sub_tipologia_allegati"   add constraint fk_tipologia_allegati_macro_ti foreign key ("macro_tipologia_oid") references "public"."sub_macro_tipologia" ("oid");


-- Fornitore_Tipologia Azienda [as13]
alter table "public"."sub_fornitore"  add column  "tipologia_azienda_oid"  int4;
alter table "public"."sub_fornitore"   add constraint fk_fornitore_tipologia_azienda foreign key ("tipologia_azienda_oid") references "public"."sub_tipologia_azienda" ("oid");


-- Tipologia Azienda_Tipologia Allegati [as14]
create table "public"."sub_tipologia_azienda_tipologi" (
   "tipologia_azienda_oid"  int4 not null,
   "tipologia_allegati_oid"  int4 not null,
  primary key ("tipologia_azienda_oid", "tipologia_allegati_oid")
);
alter table "public"."sub_tipologia_azienda_tipologi"   add constraint fk_tipologia_azienda_tipologi foreign key ("tipologia_azienda_oid") references "public"."sub_tipologia_azienda" ("oid");
alter table "public"."sub_tipologia_azienda_tipologi"   add constraint fk_tipologia_azienda_tipolog_2 foreign key ("tipologia_allegati_oid") references "public"."sub_tipologia_allegati" ("oid");


-- User_Fornitore [as2]
alter table "public"."sub_user"  add column  "fornitore_oid"  int4;
alter table "public"."sub_user"   add constraint fk_user_fornitore foreign key ("fornitore_oid") references "public"."sub_fornitore" ("oid");


-- Fornitore_Stato Registrazione [as3]
alter table "public"."sub_fornitore"  add column  "stato_registrazione_oid"  int4;
alter table "public"."sub_fornitore"   add constraint fk_fornitore_stato_registrazio foreign key ("stato_registrazione_oid") references "public"."sub_stato_registrazione" ("oid");


-- Pre Registrazione_Fornitore [as4]
alter table "public"."sub_user_invitati"  add column  "fornitore_oid"  int4;
alter table "public"."sub_user_invitati"   add constraint fk_user_invitati_fornitore foreign key ("fornitore_oid") references "public"."sub_fornitore" ("oid");


-- Documentazione_Fornitore [as6]
alter table "public"."sub_allegati"  add column  "fornitore_oid"  int4;
alter table "public"."sub_allegati"   add constraint fk_allegati_fornitore foreign key ("fornitore_oid") references "public"."sub_fornitore" ("oid");


-- Token_User [as7]
alter table "public"."sub_token"  add column  "user_oid"  int4;
alter table "public"."sub_token"   add constraint fk_token_user foreign key ("user_oid") references "public"."sub_user" ("oid");


-- User invitati_Token [as9]
alter table "public"."sub_user_invitati"  add column  "token_descrizione"  varchar(255);
alter table "public"."sub_user_invitati"   add constraint fk_user_invitati_token foreign key ("token_descrizione") references "public"."sub_token" ("descrizione");


-- Fornitore_Tenant [as5]
create view "public"."fornitoretotenant_view" as
select distinct AL1."oid" as "s_oid", AL3."tenant_oid" as "T_tenant_oid"
from  "public"."sub_fornitore" AL1 
               inner join "public"."sub_user" AL2 on AL1."oid"=AL2."fornitore_oid"
               inner join "public"."sub_user_tenant" AL3 on AL2."oid"=AL3."user_oid";


-- Class Services Mapping
create table "public"."WR_DELETE_HISTORY" (
   "OID"  int4  not null,
   "OBJECT_ID"  varchar(255),
   "CLASS_ID"  varchar(255),
   "DELETED_AT"  timestamp,
  primary key ("OID")
);

create index IDX_WR_CLASS_ID on "public"."WR_DELETE_HISTORY"("CLASS_ID");
create index IDX_WR_OBJECT_ID on "public"."WR_DELETE_HISTORY"("DELETED_AT");

-- User invitati [cls4]
alter table "public"."sub_user_invitati"  add column  "backoffice"  bool;


-- User invitati_Tenant [as16]
create table "public"."sub_user_invitati_tenant" (
   "user_invitati_email"  varchar(255) not null,
   "tenant_oid"  int4 not null,
  primary key ("user_invitati_email", "tenant_oid")
);
alter table "public"."sub_user_invitati_tenant"   add constraint fk_user_invitati_tenant_user_i foreign key ("user_invitati_email") references "public"."sub_user_invitati" ("email");
alter table "public"."sub_user_invitati_tenant"   add constraint fk_user_invitati_tenant_tenant foreign key ("tenant_oid") references "public"."sub_tenant" ("oid");


-- Token_Tipo Token [as17]
alter table "public"."sub_token"  add column  "tipo_token_oid"  int4;
alter table "public"."sub_token"   add constraint fk_token_tipo_token foreign key ("tipo_token_oid") references "public"."sub_tipo_token" ("oid");

-- Messaggi [cls11]
create table "public"."sub_messaggi" (
   "oid"  int4  not null,
   "oggetto"  varchar(255),
   "codice"  varchar(255),
   "body"  text,
   "attivo"  bool,
  primary key ("oid")
);

-- Ruolo [cls12]
create table "public"."sub_ruolo" (
   "oid"  int4  not null,
   "attivo"  varchar(255),
   "descrizione"  varchar(255),
  primary key ("oid")
);


-- User invitati_Ruolo [as18]
create table "public"."sub_user_invitati_ruolo" (
   "user_invitati_email"  varchar(255) not null,
   "ruolo_oid"  int4 not null,
  primary key ("user_invitati_email", "ruolo_oid")
);
alter table "public"."sub_user_invitati_ruolo"   add constraint fk_user_invitati_ruolo_user_in foreign key ("user_invitati_email") references "public"."sub_user_invitati" ("email");
alter table "public"."sub_user_invitati_ruolo"   add constraint fk_user_invitati_ruolo_ruolo foreign key ("ruolo_oid") references "public"."sub_ruolo" ("oid");

-- Tipologia Allegati [cls8]
alter table "public"."sub_tipologia_allegati"  add column  "descrizione"  varchar(255);

-- Allegati_Tenant [as19]
alter table "public"."sub_allegati"  add column  "tenant_oid"  int4;
alter table "public"."sub_allegati"   add constraint fk_allegati_tenant foreign key ("tenant_oid") references "public"."sub_tenant" ("oid");

-- Tenant [cls1]
alter table "public"."sub_tenant"  add column  "master"  bool;


-- Fornitore_Tenant [as5]
create table "public"."sub_fornitore_tenant" (
   "fornitore_oid"  int4 not null,
   "tenant_oid"  int4 not null,
  primary key ("fornitore_oid", "tenant_oid")
);
alter table "public"."sub_fornitore_tenant"   add constraint fk_fornitore_tenant_fornitore foreign key ("fornitore_oid") references "public"."sub_fornitore" ("oid");
alter table "public"."sub_fornitore_tenant"   add constraint fk_fornitore_tenant_tenant foreign key ("tenant_oid") references "public"."sub_tenant" ("oid");

-- Log [cls13o]
create table "public"."sub_log" (
   "oid"  int4  not null,
   "tipo_azione"  varchar(255),
   "timestamp_log"  timestamp,
  primary key ("oid")
);


-- Log_User [as20o]
alter table "public"."sub_log"  add column  "user_oid"  int4;
alter table "public"."sub_log"   add constraint fk_log_user foreign key ("user_oid") references "public"."sub_user" ("oid");


-- Log_Fornitore [as21o]
alter table "public"."sub_log"  add column  "fornitore_oid"  int4;
alter table "public"."sub_log"   add constraint fk_log_fornitore foreign key ("fornitore_oid") references "public"."sub_fornitore" ("oid");

-- Comunicazione [cls14o]
create table "public"."sub_comunicazione" (
   "oid"  int4  not null,
   "note"  text,
   "oggetto"  varchar(255),
  primary key ("oid")
);


-- Comunicazione_User [as22o]
alter table "public"."sub_comunicazione"  add column  "user_oid"  int4;
alter table "public"."sub_comunicazione"   add constraint fk_comunicazione_user foreign key ("user_oid") references "public"."sub_user" ("oid");


-- Comunicazione_Fornitore [as23o]
alter table "public"."sub_comunicazione"  add column  "fornitore_oid"  int4;
alter table "public"."sub_comunicazione"   add constraint fk_comunicazione_fornitore foreign key ("fornitore_oid") references "public"."sub_fornitore" ("oid");

-- Comunicazione [cls14o]
alter table "public"."sub_comunicazione"  add column  "backoffice"  bool;


-- Fornitore [cls2]
alter table "public"."sub_fornitore"  add column  "attrezzature"  bool;
alter table "public"."sub_fornitore"  add column  "mezzi"  bool;
alter table "public"."sub_fornitore"  add column  "prodotti"  bool;
alter table "public"."sub_fornitore"  add column  "sostanze_chimiche"  bool;

-- Stato Allegato [cls15o]
create table "public"."sub_stato_allegato" (
   "oid"  int4  not null,
   "attivo"  bool,
   "codice"  varchar(255),
   "descrizione"  varchar(255),
  primary key ("oid")
);


-- Allegati_Stato Allegato [as24o]
alter table "public"."sub_allegati"  add column  "stato_allegato_oid"  int4;
alter table "public"."sub_allegati"   add constraint fk_allegati_stato_allegato foreign key ("stato_allegato_oid") references "public"."sub_stato_allegato" ("oid");

-- Allegati [cls5]
alter table "public"."sub_allegati"  add column  "mandatory"  bool;

-- Allegati [cls5]
alter table "public"."sub_allegati"  add column  "valutato_il"  timestamp;