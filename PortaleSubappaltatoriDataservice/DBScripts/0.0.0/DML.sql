INSERT INTO public.sub_tipo_token
("oid", lunghezza, giorni_validita, codice, attivo, descrizione)
VALUES(1, 16, 60, 'I', true, 'Invito Utente');
INSERT INTO public.sub_tipo_token
("oid", lunghezza, giorni_validita, codice, attivo, descrizione)
VALUES(2, 16, 1, 'P', true, 'Reset Password');
INSERT INTO public.sub_tipo_token
("oid", lunghezza, giorni_validita, codice, attivo, descrizione)
VALUES(3, 6, 1, 'L', true, 'Login MFA');

INSERT INTO public.sub_ruolo
("oid", attivo, descrizione)
VALUES(1, '1', 'Amministratore');
INSERT INTO public.sub_ruolo
("oid", attivo, descrizione)
VALUES(2, '1', 'Responsabile');
INSERT INTO public.sub_ruolo
("oid", attivo, descrizione)
VALUES(3, '1', 'Gestione');
INSERT INTO public.sub_ruolo
("oid", attivo, descrizione)
VALUES(4, '1', 'Consultazione');

INSERT INTO public.sub_macro_tipologia
("oid", attivo, codice, descrizione)
VALUES(1, true, 'AZ', 'Aziendali');
INSERT INTO public.sub_macro_tipologia
("oid", attivo, codice, descrizione)
VALUES(2, true, 'PE', 'Personali');
INSERT INTO public.sub_macro_tipologia
("oid", attivo, codice, descrizione)
VALUES(3, true, 'AT', 'Attrezzature');
INSERT INTO public.sub_macro_tipologia
("oid", attivo, codice, descrizione)
VALUES(4, true, 'MZ', 'Mezzi');
INSERT INTO public.sub_macro_tipologia
("oid", attivo, codice, descrizione)
VALUES(5, true, 'PR', 'Prodotti');
INSERT INTO public.sub_macro_tipologia
("oid", attivo, codice, descrizione)
VALUES(6, true, 'SC', 'Sostanze Chimiche');

INSERT INTO public.sub_tipologia_azienda
("oid", attivo, codice, descrizione)
VALUES(1, true, 'A', 'Autonomi');
INSERT INTO public.sub_tipologia_azienda
("oid", attivo, codice, descrizione)
VALUES(2, true, 'IF', 'Imprese familiari');
INSERT INTO public.sub_tipologia_azienda
("oid", attivo, codice, descrizione)
VALUES(3, true, 'ID', 'Imprese con dipendenti');

INSERT INTO public.sub_stato_registrazione
("oid", attivo, codice, descrizione)
VALUES(1, true, 'B', 'In Bozza');
INSERT INTO public.sub_stato_registrazione
("oid", attivo, codice, descrizione)
VALUES(2, true, 'I', 'Invitato');
INSERT INTO public.sub_stato_registrazione
("oid", attivo, codice, descrizione)
VALUES(3, true, 'R', 'Registrato');

INSERT INTO public.sub_stato_allegato
("oid", attivo, codice, descrizione)
VALUES(1, true, 'B', 'In Bozza');
INSERT INTO public.sub_stato_allegato
("oid", attivo, codice, descrizione)
VALUES(2, true, 'I', 'Inserito');
INSERT INTO public.sub_stato_allegato
("oid", attivo, codice, descrizione)
VALUES(3, true, 'V', 'In Valutazione');
INSERT INTO public.sub_stato_allegato
("oid", attivo, codice, descrizione)
VALUES(4, true, 'R', 'Rigettato');
INSERT INTO public.sub_stato_allegato
("oid", attivo, codice, descrizione)
VALUES(5, true, 'A', 'Approvato');