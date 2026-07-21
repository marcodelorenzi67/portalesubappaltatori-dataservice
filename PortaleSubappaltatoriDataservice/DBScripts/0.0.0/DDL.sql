CREATE TABLE public.auth_application (
	app_id varchar(255) NOT NULL,
	refresh_token_validity int4 NULL,
	access_token_validity int4 NULL,
	secret varchar(255) NULL,
	description varchar(255) NULL,
	"name" varchar(255) NULL,
	"type" varchar(255) NULL,
	CONSTRAINT auth_application_pkey PRIMARY KEY (app_id)
);

CREATE TABLE public.auth_authorized_grant_type (
	"oid" int4 NOT NULL,
	application_app_id varchar(255) NULL,
	"name" varchar(255) NULL,
	CONSTRAINT auth_authorized_grant_type_pkey PRIMARY KEY (oid),
	CONSTRAINT fkk0a2nvoq8b2eycexd90oai9jr FOREIGN KEY (application_app_id) REFERENCES public.auth_application(app_id)
);

CREATE TABLE public.auth_authorized_resource (
	"oid" int4 NOT NULL,
	application_app_id varchar(255) NULL,
	"name" varchar(255) NULL,
	CONSTRAINT auth_authorized_resource_pkey PRIMARY KEY (oid),
	CONSTRAINT fk533nh988d7mq6pjckwhanlleg FOREIGN KEY (application_app_id) REFERENCES public.auth_application(app_id)
);

CREATE TABLE public.auth_claim (
	"oid" int4 NOT NULL,
	"key" varchar(255) NULL,
	value varchar(1000) NULL,
	CONSTRAINT auth_claim_pkey PRIMARY KEY (oid)
);

CREATE TABLE public.auth_code (
	code varchar(255) NOT NULL,
	authentication varchar(255) NULL,
	authenticationblob oid NULL,
	creation_date timestamp NULL,
	CONSTRAINT auth_code_pkey PRIMARY KEY (code)
);

CREATE TABLE public.auth_identity (
	user_id varchar(255) NOT NULL,
	expired bool NULL,
	"locked" bool NULL,
	"password" varchar(255) NULL,
	disabled bool NULL,
	attempts_number int4 NULL,
	password_expiration_date timestamp NULL,
	email varchar(255) NULL,
	auth_admin bool NULL,
	first_name varchar(255) NULL,
	last_name varchar(255) NULL,
	CONSTRAINT auth_identity_pkey PRIMARY KEY (user_id)
);

CREATE TABLE public.auth_device (
	"oid" int4 NOT NULL,
	application_app_id varchar(255) NULL,
	identity_user_id varchar(255) NULL,
	device_id varchar(255) NULL,
	notification_device_id varchar(255) NULL,
	model varchar(255) NULL,
	platform varchar(255) NULL,
	platform_version varchar(255) NULL,
	browser varchar(255) NULL,
	CONSTRAINT auth_device_pkey PRIMARY KEY (oid),
	CONSTRAINT fkc9aob03r9nqhwd9go0teudc1n FOREIGN KEY (identity_user_id) REFERENCES public.auth_identity(user_id),
	CONSTRAINT fkp3pe7gns1a6uua8ofxy4apere FOREIGN KEY (application_app_id) REFERENCES public.auth_application(app_id)
);

CREATE TABLE public.auth_claim_identity (
	identity_user_id varchar(255) NOT NULL,
	claim_oid int4 NOT NULL,
	CONSTRAINT auth_claim_identity_pkey PRIMARY KEY (claim_oid, identity_user_id),
	CONSTRAINT fk1wx0aj7f1dbeu3334g5ny5i1a FOREIGN KEY (identity_user_id) REFERENCES public.auth_identity(user_id),
	CONSTRAINT fk8m5nr9f4rv0vvkvhjh1royrqa FOREIGN KEY (claim_oid) REFERENCES public.auth_claim("oid")
);

CREATE TABLE public.auth_approval (
	"oid" int4 NOT NULL,
	application_app_id varchar(255) NULL,
	updated_at timestamp NULL,
	expiration_date timestamp NULL,
	status varchar(255) NULL,
	"scope" varchar(255) NULL,
	identity_user_id varchar(255) NULL,
	CONSTRAINT auth_approval_pkey PRIMARY KEY (oid),
	CONSTRAINT fkeyj3s9ivw72ja6xivopicv8tr FOREIGN KEY (identity_user_id) REFERENCES public.auth_identity(user_id),
	CONSTRAINT fklp20u45rmynrunu0ibttjyl88 FOREIGN KEY (application_app_id) REFERENCES public.auth_application(app_id)
);

CREATE TABLE public.auth_redirect_uri (
	"oid" int4 NOT NULL,
	application_app_id varchar(255) NULL,
	url varchar(255) NULL,
	CONSTRAINT auth_redirect_uri_pkey PRIMARY KEY (oid),
	CONSTRAINT fkquipio00cid27r8whn9dj9dxa FOREIGN KEY (application_app_id) REFERENCES public.auth_application(app_id)
);

CREATE TABLE public.auth_refresh_token (
	"oid" int4 NOT NULL,
	application_app_id varchar(255) NULL,
	"token" varchar(2500) NULL,
	expiration_date timestamp NULL,
	identity_user_id varchar(255) NULL,
	CONSTRAINT auth_refresh_token_pkey PRIMARY KEY (oid),
	CONSTRAINT fk3exwaoevcccym18gfyimsey06 FOREIGN KEY (identity_user_id) REFERENCES public.auth_identity(user_id),
	CONSTRAINT fkacr366w9jtb0uivu4ebumfkux FOREIGN KEY (application_app_id) REFERENCES public.auth_application(app_id)
);

CREATE TABLE public.auth_scope (
	"oid" int4 NOT NULL,
	application_app_id varchar(255) NULL,
	auto_approve bool NULL,
	"name" varchar(255) NULL,
	CONSTRAINT auth_scope_pkey PRIMARY KEY (oid),
	CONSTRAINT fk424qpm96uu7jibv8pdp1xguj8 FOREIGN KEY (application_app_id) REFERENCES public.auth_application(app_id)
);

--


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
   "username"  varchar(255)  not null,
   "cognome"  varchar(255),
   "nome"  varchar(255),
  primary key ("username")
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
alter table "public"."sub_user_invitati_tenant"   add constraint fk_user_invitati_tenant_user_i foreign key ("user_invitati_email") references "public"."sub_user_invitati" ("username");
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
alter table "public"."sub_user_invitati_ruolo"   add constraint fk_user_invitati_ruolo_user_in foreign key ("user_invitati_email") references "public"."sub_user_invitati" ("username");
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

-- User invitati [cls4]
alter table "public"."sub_user_invitati"  add column  "email_utente"  varchar(255);

-- Fornitore [cls2]
alter table "public"."sub_fornitore"  add column  "username"  varchar(255);

-- User [User]
alter table "public"."sub_user"  add column  "attivo"  bool;

-- Comunicazione [cls14o]
alter table "public"."sub_comunicazione"  add column  "creata_il"  timestamp;

-- Comunicazione [cls14o]
alter table "public"."sub_comunicazione"  add column  "letta"  bool;

-- Documenti [cls5]
alter table "public"."sub_allegati"  add column  "data_scadenza"  date;

-- Documenti Comunicazione [cls16o]
create table "public"."sub_documenti_comunicazione" (
   "oid"  int4  not null,
   "documento"  varchar(255),
  primary key ("oid")
);

-- Documenti Comunicazione_Comunicazione [as25o]
alter table "public"."sub_documenti_comunicazione"  add column  "comunicazione_oid"  int4;
alter table "public"."sub_documenti_comunicazione"   add constraint fk_documenti_comunicazione_com foreign key ("comunicazione_oid") references "public"."sub_comunicazione" ("oid");

-- Log_Documenti [as26o]
alter table "public"."sub_log"  add column  "allegati_oid"  int4;
alter table "public"."sub_log"   add constraint fk_log_allegati foreign key ("allegati_oid") references "public"."sub_allegati" ("oid");

-- Categoria [cls18o]
create table "public"."sub_categoria" (
   "oid"  int4  not null,
   "descrizione"  varchar(255),
  primary key ("oid")
);


-- Categoria_Macro-tipologia [as27o]
alter table "public"."sub_categoria"  add column  "macro_tipologia_oid"  int4;
alter table "public"."sub_categoria"   add constraint fk_categoria_macro_tipologia foreign key ("macro_tipologia_oid") references "public"."sub_macro_tipologia" ("oid");


-- Tipologia Documenti_Categoria [as28o]
create table "public"."sub_tipologia_documenti_catego" (
   "tipologia_allegati_oid"  int4 not null,
   "categoria_oid"  int4 not null,
  primary key ("tipologia_allegati_oid", "categoria_oid")
);
alter table "public"."sub_tipologia_documenti_catego"   add constraint fk_tipologia_documenti_catego foreign key ("tipologia_allegati_oid") references "public"."sub_tipologia_allegati" ("oid");
alter table "public"."sub_tipologia_documenti_catego"   add constraint fk_tipologia_documenti_categ_2 foreign key ("categoria_oid") references "public"."sub_categoria" ("oid");

-- Documenti [cls5]
alter table "public"."sub_allegati"  add column  "seriale"  varchar(255);
alter table "public"."sub_allegati"  add column  "identificativo"  varchar(255);
alter table "public"."sub_allegati"  add column  "modello"  varchar(255);

-- Documenti_Categoria [as29o]
alter table "public"."sub_allegati"  add column  "categoria_oid"  int4;
alter table "public"."sub_allegati"   add constraint fk_allegati_categoria foreign key ("categoria_oid") references "public"."sub_categoria" ("oid");

-- Personale [cls20o]
create table "public"."sub_personale" (
   "oid"  int4  not null,
   "ruolo"  varchar(255),
   "cognome"  varchar(255),
   "nome"  varchar(255),
  primary key ("oid")
);

-- Personale_Fornitore [as30o]
alter table "public"."sub_personale"  add column  "fornitore_oid"  int4;
alter table "public"."sub_personale"   add constraint fk_personale_fornitore foreign key ("fornitore_oid") references "public"."sub_fornitore" ("oid");

-- Documenti_Personale [as31o]
alter table "public"."sub_allegati"  add column  "personale_oid"  int4;
alter table "public"."sub_allegati"   add constraint fk_allegati_personale foreign key ("personale_oid") references "public"."sub_personale" ("oid");

-- Documenti [cls5]
alter table "public"."sub_allegati"  add column  "documento_compilato"  varchar(255);

-- Documenti [cls5]
alter table "public"."sub_allegati"  add column  "documento_da_compilare"  bool;

-- Tipologia Documenti [cls8]
alter table "public"."sub_tipologia_allegati"  add column  "codice"  varchar(255);

-- Documenti [cls5]
alter table "public"."sub_allegati"  add column  "note_fornitore"  varchar(255);