INSERT INTO public.sub_stato_allegato
("oid", attivo, codice, descrizione)
VALUES(7, true, 'X', 'Annullato');

INSERT INTO public.sub_stato_allegato
("oid", attivo, codice, descrizione)
VALUES(8, true, 'IS', 'In Scadenza');

INSERT INTO public.sub_messaggi
("oid", oggetto, codice, body, attivo)
VALUES(5, 'Documento in scadenza', 'DIS', '<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <title>Invito registrazione</title>
</head>
<body style="margin:0; padding:0; background-color:#f4f4f4; font-family:Arial, sans-serif;">
  <table width="100%" cellpadding="0" cellspacing="0">
    <tr>
      <td align="center">
        <table width="600" cellpadding="0" cellspacing="0" style="background:#ffffff; margin:40px 0; border-radius:8px; overflow:hidden;">
          <tr>
            <td style="background:#D42725; color:#ffffff; padding:20px; text-align:center; font-size:20px; font-weight:bold;">
              Portale Subappaltatori
            </td>
          </tr>
          <tr>
            <td style="padding:30px; color:#333333;">
              <h2 style="margin-top:0;">Buongiorno $$Nome$$ $$Cognome$$</h2>
              <p>
                Il documento $$tipologiaDocumento$$ è in scadenza! Accedi alla tua area privata per caricare la nuova versione
              </p>
            </td>
          </tr>
          <tr>
            <td style="background:#f9f9f9; padding:20px; text-align:center; font-size:12px; color:#242424;">
              Elettromeccanica Galli Italo S.p.A. - Portale Subappaltatori
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</body>
</html>', true);

INSERT INTO public.sub_stato_allegato
("oid", attivo, codice, descrizione)
VALUES(9, true, 'S', 'Scaduto');


INSERT INTO public.sub_messaggi
("oid", oggetto, codice, body, attivo)
VALUES(6, 'Documento da inserire', 'DDI', '<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <title>Invito registrazione</title>
</head>
<body style="margin:0; padding:0; background-color:#f4f4f4; font-family:Arial, sans-serif;">
  <table width="100%" cellpadding="0" cellspacing="0">
    <tr>
      <td align="center">
        <table width="600" cellpadding="0" cellspacing="0" style="background:#ffffff; margin:40px 0; border-radius:8px; overflow:hidden;">
          <tr>
            <td style="background:#D42725; color:#ffffff; padding:20px; text-align:center; font-size:20px; font-weight:bold;">
              Portale Subappaltatori
            </td>
          </tr>
          <tr>
            <td style="padding:30px; color:#333333;">
              <h2 style="margin-top:0;">Buongiorno $$Nome$$ $$Cognome$$</h2>
              <p>
                Hai il documento $$tipologiaDocumento$$ da inserire! Accedi alla tua area privata per caricarlo
              </p>
            </td>
          </tr>
          <tr>
            <td style="background:#f9f9f9; padding:20px; text-align:center; font-size:12px; color:#242424;">
              Elettromeccanica Galli Italo S.p.A. - Portale Subappaltatori
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</body>
</html>', true);