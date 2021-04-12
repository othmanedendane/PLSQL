
SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT numclient PROMPT "Entrer le numero de client: "
ACCEPT prixvente PROMPT "Entrer le prix de vente: "
DECLARE
	
	varnombre1 VARCHAR2(50):='&numclient';
	varprix NUMBER(10,2):='&prixvente';
	resultat NUMBER(20,2):=0;
BEGIN
-- Appel a la fonction operation_gr431()
	resultat:=OD_total_taxe.OD_taxe(varnombre1,varprix);
	-- DBMS_OUTPUT.PUT_LINE('La taxe est: '||resultat || '$');
	
END;
/
SET VERIFY ON

PAUSE Appuyer sur touche...
@C:\PLSQL\user\Projet\MENU.sql