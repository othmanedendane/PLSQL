-- Insertion OD_Produits(numprod,nom,quantitestock,prix) 

-- OD_Produits(numprod VARCHAR2(50) PRIMARY KEY, nom VARCHAR2(50), quantitestock NUMBER(10,2), prix NUMBER(10,2))

SET SERVEROUTPUT ON 

SET VERIFY OFF 

PROMPT *************** Insertion de Produits ********************** 

   

ACCEPT lenom PROMPT "Entrer le nom : " 

ACCEPT laquantite PROMPT "Entrer la quantite : " 

ACCEPT leprix PROMPT "Entrer le prix de produit: " 



DECLARE     
	 
	
    varnumprod OD_Produits.numprod%TYPE:='&lenumprod'; 
	Err_integre EXCEPTION;
	PRAGMA EXCEPTION_INIT(Err_integre,-2291);
BEGIN 

    IF varnumprod IS NULL THEN 

        DBMS_OUTPUT.PUT_LINE('*** Veuillez entrer une valeur pour le numprod! ***'); 

    ELSE 




      

        INSERT INTO OD_Produits(numprod,nom,quantitestock,prix)  

        VALUES('P'||OD_seq_numprod.NEXTVAL,'&lenom','&laquantite','&leprix'); 

         

        COMMIT; 

        DBMS_OUTPUT.PUT_LINE('*-*-*-*-*-* Insertion de OD_Produits OK! *-*-*-*-*-*'); 

    END IF; 



   

EXCEPTION 

    WHEN dup_val_on_index THEN 

        DBMS_OUTPUT.PUT_LINE('***Doublon de OD_Produits***'); 

	WHEN Err_integre THEN
	    DBMS_OUTPUT.PUT_LINE('Le numprod  n''est pas valide!'); 

    WHEN others THEN 

        DBMS_OUTPUT.PUT_LINE('***Une erreur s''est produite'); 

END; 

/ 

/*
PROMPT *********************** Affichage de Produits ************************
BEGIN
--  Cursor FOR sans declaration de curseur 
DBMS_OUTPUT.PUT_LINE(rpad('nobixi',20)||rpad('marque',20)||rpad('annee',20)||rpad('Prix',20)||rpad('nocat',20));
FOR liste IN (select nobixi,marque,annee,prix,nocat from OD_bixi) LOOP 

        DBMS_OUTPUT.PUT_LINE(rpad(liste.nobixi,20)||' '||rpad(liste.marque,18)||' '||rpad(liste.annee,18)||' '||rpad(liste.prix,20)||' '||rpad(liste.nocat,20)); 

END LOOP; 

END;
/
  */

SET VERIFY ON 


PAUSE Appuyer sur touche...
@C:\PLSQL\user\Projet\MENU.sql
