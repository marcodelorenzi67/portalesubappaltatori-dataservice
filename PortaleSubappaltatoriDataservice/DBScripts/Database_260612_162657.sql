-- User_Ruolo [as1p]
create table "public"."sub_user_ruolo" (
   "user_oid"  int4 not null,
   "ruolo_oid"  int4 not null,
  primary key ("user_oid", "ruolo_oid")
);
alter table "public"."sub_user_ruolo"   add constraint fk_user_ruolo_user foreign key ("user_oid") references "public"."sub_user" ("oid");
alter table "public"."sub_user_ruolo"   add constraint fk_user_ruolo_ruolo foreign key ("ruolo_oid") references "public"."sub_ruolo" ("oid");


