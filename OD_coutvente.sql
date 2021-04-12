
SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT numclient PROMPT "Entrer le numero de client: "
ACCEPT datevente PROMPT "Entrer la date de vente: "
DECLARE
	
	varnombre1 VARCHAR2(50):='&numclient';
	varnombre2 DATE:='&datevente';
	resultat NUMBER(20,2):=0;
BEGIN
-- Appel a la fonction operation_gr431()
	resultat:=OD_total_taxe.OD_coutvente(varnombre1,varnombre2);
	DBMS_OUTPUT.PUT_LINE('Le sous total est: '||resultat || '$');
	
END;
/
SET VERIFY ON

PAUSE Appuyer sur touche...
@C:\PLSQL\user\Projet\MENU.sql

