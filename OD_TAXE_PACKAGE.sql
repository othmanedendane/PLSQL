-- Creation de l'en-tete du package
CREATE OR REPLACE PACKAGE OD_total_taxe AS
	/* Description     : Cette fonction calcul la somme
	   Argument(s)     : a et b sont les nombes a addition
	   Auteur(s)       : Rick Alce
	   Date de creation: 23-07-2020
	   Date de modif.  : 23-07-2020
*/
	
	FUNCTION OD_coutvente(varnombre1 IN VARCHAR,varnombre2 IN DATE)
	RETURN NUMBER; 

/*  Description     :


*/


    FUNCTION OD_Taxe(varnombre1 IN VARCHAR,varprix IN NUMBER)
	RETURN NUMBER; 




	
END OD_total_taxe;
/

-- Creation du corps du package

CREATE OR REPLACE PACKAGE BODY OD_total_taxe AS

	
-- debut:: operation_pack_gr431
	FUNCTION OD_coutvente(varnombre1 IN VARCHAR,varnombre2 IN DATE)
	RETURN NUMBER IS 
		resultat NUMBER(20,2):=0;
	BEGIN
		SELECT SUM(prix * quantitevendue) INTO resultat FROM OD_Venteclients WHERE numclient = varnombre1 AND datevente = varnombre2; -- yy-mm-dd
    IF resultat > 0 THEN

-- Affichage
     
      dbms_output.put_line( rpad('NUM PROD', 20) || rpad('QUANTITEVENDUE', 20) || rpad('PRIXVENTE', 20) || rpad('SOUSTOTAL', 20) );
      dbms_output.put_line('=========================================================================');


    for curseur in ( SELECT * FROM OD_Venteclients WHERE numclient = varnombre1 AND dateVente = varnombre2) loop

        dbms_output.put_line(rpad(curseur.numprod, 20) || rpad(curseur.quantitevendue, 20) || '$' || rpad(curseur.prix, 20) || '$' ||   rpad(curseur.prix * curseur.quantitevendue, 20));

      end loop;

		END IF;
		RETURN(resultat);	
	END OD_coutvente;
-- Fin::operation_pack_gr431





FUNCTION OD_Taxe(varnombre1 IN VARCHAR,varprix IN NUMBER)
	RETURN NUMBER IS 
		resultat NUMBER(20,2):=0;
	BEGIN
		SELECT SUM(prix * 1.15) INTO resultat FROM OD_Venteclients WHERE numclient = varnombre1 AND prix = varprix; 
    IF resultat > 0 THEN

-- Affichage
     
      dbms_output.put_line( rpad('NUM PROD', 20) || rpad('QUANTITEVENDUE', 20) || rpad('PRIXVENTE', 20) || rpad('PRIX TOTAL', 20) );
      dbms_output.put_line('=========================================================================');


    for curseur in ( SELECT * FROM OD_Venteclients WHERE numclient = varnombre1 AND prix = varprix) loop

        dbms_output.put_line(rpad(curseur.numprod, 20) || rpad(curseur.quantitevendue, 20) || '$' || rpad(curseur.prix, 20) || '$' ||   rpad((curseur.prix * curseur.quantitevendue) * 1.15, 20));

      end loop;

		END IF;
		RETURN(resultat);	
	END OD_Taxe;






END OD_total_taxe;
/

PAUSE Appuyer sur touche...
@C:\PLSQL\user\Projet\MENU.sql