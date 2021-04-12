                            -- ****************** Creation de l'en-tete du package *******************
CREATE OR REPLACE PACKAGE OD_package_affichage AS
	/* Description     : Cette procedure est pour contenir 3 procedures d'affichage
	   Auteur(s)       : Othmane Dendane
	   Date de creation: 27-07-2020
	   Date de modif.  : 27-07-2020
*/
	PROCEDURE OD_listeClient;
/*   Description     :

*/
	PROCEDURE OD_listeProduits;
/*  Description     :

*/
	PROCEDURE OD_listeVente;

END OD_package_affichage;
/







                            -- ****************** Creation du corps du package *******************

CREATE OR REPLACE PACKAGE BODY OD_package_affichage AS
-- debut:: OD_listeClient
		PROCEDURE OD_listeClient IS
BEGIN
--  Cursor FOR sans declaration de curseur 
DBMS_OUTPUT.PUT_LINE(rpad('numclient',20)||rpad('nomclient',20)||rpad('prenomclient',20)||rpad('telephone',20)||rpad('norue',20)||rpad('nomrue',20)||rpad('la ville',20)||rpad('la province',20)||rpad('le code postal',20)||rpad('le pays',20));

DBMS_OUTPUT.PUT_LINE('================================================================================');

FOR liste IN (select numclient,nomclient,prenomclient,telephone,norue,nomrue,ville,province,codepostal,pays from OD_Clients) LOOP 

        DBMS_OUTPUT.PUT_LINE(rpad(liste.numclient,20)||' '||rpad(liste.nomclient,20)||' '||rpad(liste.prenomclient,20)||' '||rpad(liste.telephone,20)||' '||rpad(liste.norue,20)||' '||rpad(liste.nomrue,20)||' '||rpad(liste.ville,20)||' '||rpad(liste.province,20)||' '||rpad(liste.codepostal,20)||' '||rpad(liste.pays,20)); 

END LOOP; 
			
	END OD_listeClient;

-- fin:: OD_listeClient
-- debut:: OD_listeProduits
	PROCEDURE OD_listeProduits IS
	BEGIN

		DBMS_OUTPUT.PUT_LINE(rpad('numprod',20)||rpad('nom',20)||rpad('quantitestock',20)||rpad('Prix',20));
FOR liste IN (select numprod,nom,quantitestock,prix from OD_Produits) LOOP 

        DBMS_OUTPUT.PUT_LINE(rpad(liste.numprod,20)||' '||rpad(liste.nom,18)||' '||rpad(liste.quantitestock,18)||' '||rpad(liste.prix,20)); 

END LOOP;
			
	END OD_listeProduits;
-- Fin:: OD_listeProduits

-- Debut:: OD_listeVente
	PROCEDURE OD_listeVente IS
	BEGIN

		DBMS_OUTPUT.PUT_LINE(rpad('codevente',20)||rpad('numclient',20)||rpad('numprod',20)||rpad('datevente',20)||rpad('quantitevendue',20)||rpad('prix',20));

DBMS_OUTPUT.PUT_LINE('================================================================================');

FOR liste IN (select codevente,numclient,numprod,datevente,quantitevendue,prix from OD_Venteclients) LOOP 

        DBMS_OUTPUT.PUT_LINE(rpad(liste.codevente,20)||' '||rpad(liste.numclient,20)||' '||rpad(liste.numprod,20)||' '||rpad(liste.datevente,20)||' '||rpad(liste.quantitevendue,20)||' '||rpad(liste.prix,20)); 

END LOOP;
			
	END OD_listeVente;
-- fin:: OD_listeVente
END OD_package_affichage;
/

PAUSE Appuyer sur touche...
@C:\PLSQL\user\Projet\MENU.sql
