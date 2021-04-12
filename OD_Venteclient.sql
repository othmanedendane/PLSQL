-- OD_Venteclients(codevente,*numclient*,*numprod*,datevente,quantitevendue,prix)

-- OD_Venteclients(codevente VARCHAR2(50) PRIMARY KEY, numclient VARCHAR2(50), CONSTRAINT fk_numclientFOREIGN KEY(numclient) REFERENCES OD_Clients(numclient) ON DELETE CASCADE, numprod VARCHAR2(50), CONSTRAINT fk_numprod FOREIGN KEY(numprod) REFERENCES OD_Produits(numprod) ON DELETE CASCADE, datevente DATE, quantitevendue NUMBER(10,2), prix NUMBER(10,2))



SET SERVEROUTPUT ON 

SET VERIFY OFF 

PROMPT *************** Insertion de VenteClient ********************** 

  

ACCEPT lenumclient PROMPT "Entrer le numclient: " 

ACCEPT lenumprod PROMPT "Entrer la numero de produit : " 

ACCEPT ladate PROMPT "Entrer la date de vente : " 

ACCEPT laquantite PROMPT "Entrer la quantite vendue: " 

ACCEPT leprix PROMPT "Entrer le prix: " 

DECLARE     
	 
	
    varcode OD_Venteclients.codevente%TYPE:='&lecode';  
	Err_integre EXCEPTION;
	PRAGMA EXCEPTION_INIT(Err_integre,-2291);
BEGIN 

    IF varcode IS NULL THEN 


    INSERT INTO OD_Venteclients(codevente,numclient,numprod,datevente,quantitevendue,prix)  

        VALUES(''||OD_seq_codevente.NEXTVAL,'&lenumclient','&lenumprod','&ladate','&laquantite','&leprix'); 

         

        COMMIT; 

        DBMS_OUTPUT.PUT_LINE('*-*-*-*-*-* Insertion de OD_Venteclient OK! *-*-*-*-*-*'); 

        

    ELSE 


            DBMS_OUTPUT.PUT_LINE('*** Veuillez entrer une valeur pour le code de vente! ***'); 

        

    END IF; 




EXCEPTION 

    WHEN dup_val_on_index THEN 

        DBMS_OUTPUT.PUT_LINE('***Doublon de mb_bixi***'); 

	WHEN Err_integre THEN
	    DBMS_OUTPUT.PUT_LINE('Le numclient / le numprod n''est pas valide!'); 

    WHEN others THEN 

        DBMS_OUTPUT.PUT_LINE('***Une erreur s''est produite'); 

END; 

/

/*
PROMPT *********************** Affichage de BIXI ************************
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
