-- Insertion de Clients

-- OD_Clients(numclient VARCHAR2(50) PRIMARY KEY, nomclient VARCHAR2(50),prenomclient VARCHAR2(50),telephone VARCHAR2(50),norue number(10,2),nomrue VARCHAR2(50),ville VARCHAR2(50),province VARCHAR2(50),codepostal VARCHAR2(50),pays VARCHAR2(50))

SET SERVEROUTPUT ON 

SET VERIFY OFF 

PROMPT *************** Insertion de OD_Clients ********************** 

  

ACCEPT lenom PROMPT "Entrer le nom du client: " 

ACCEPT leprenom PROMPT "Entrer le prenom du client : " 

ACCEPT letele PROMPT "Entrer le numero de telephone du client [FORMAT (xxx) xxx-xxxx]: " 

ACCEPT lenorue PROMPT "Entrer le numero de rue du client: " 

ACCEPT lenomrue PROMPT "Entrer le nom de rue du client: "

ACCEPT laville PROMPT "Entrer la ville du client : " 

ACCEPT laprovince PROMPT "Entrer la province du client : " 

ACCEPT lecodepostal PROMPT "Entrer le code postal du client[FORMAT A2B 3C4]: " 

ACCEPT lepays PROMPT "Entrer le pays du client: "



DECLARE     
	 
	
   varnumclient OD_Clients.numclient%TYPE; 
	Err_integre EXCEPTION;
	PRAGMA EXCEPTION_INIT(Err_integre,-2291);
    
    
     
BEGIN 


        -- !!!!!!!!!!! INSERTION NULL !!!!!!!!!!!!!


        IF regexp_like('&letele','^\(?\d{3}\)?([[:blank:]|-])?\d{3}-?\d{4}$') = FALSE then
            DBMS_OUTPUT.PUT_LINE('!!!!!!!!!!!!!!!!!---Format telephone non OK---!!!!!!!!!!!!!!!!!!!!');
        ELSE



        IF regexp_like('&lecodepostal','^[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ][ -]?[0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]$') = FALSE        then
            DBMS_OUTPUT.PUT_LINE('!!!!!!!!!!!!!!!!!---Format du code postal non OK---!!!!!!!!!!!!!!!!!!!!');
        ELSE
            
       


      /* 

        IF regexp_like('&vartele','^\d{4}-\d{2}-\d{4}-\d{3}$') = FALSE then


                DBMS_OUTPUT.PUT_LINE('Format du telephone non OK!');

        ELSE 
*/

 IF varnumclient IS NULL THEN 

        INSERT INTO OD_Clients(numclient,nomclient,prenomclient,telephone,norue,nomrue,ville,province,codepostal,pays) VALUES(upper(substr('&lenom',0,3)||substr('&leprenom',0,1)||substr('&letele',-4)),'&lenom','&leprenom','&letele','&lenorue','&lenomrue',
               '&laville','&laprovince','&lecodepostal','&lepays'); 

        COMMIT; 

        DBMS_OUTPUT.PUT_LINE('*** Insertion de numClient OK!'); 
        DBMS_OUTPUT.PUT_LINE('*-*-*-*-*-* Insertion de OD_Clients OK! *-*-*-*-*-*');
        

    ELSE 

    
            DBMS_OUTPUT.PUT_LINE('*** Veuillez entrer une valeur pour le nobixi! ***'); 

END IF; 

 END IF;

    END IF;

/*       
IF regexp_like('&vartele','^\d{4}-\d{2}-\d{4}-\d{3}$') = FALSE then


                DBMS_OUTPUT.PUT_LINE('Format du telephone non OK!');

        ELSE 




        INSERT INTO OD_Clients  

        VALUES; 

         

        COMMIT; 

         

     END IF; 

*/

EXCEPTION 

    WHEN dup_val_on_index THEN 

        DBMS_OUTPUT.PUT_LINE('***Doublon de OD_Clients***'); 

    WHEN Err_integre THEN
	    DBMS_OUTPUT.PUT_LINE('Le numclient n''est pas valide!'); 
 
    WHEN others THEN 

        DBMS_OUTPUT.PUT_LINE('***Une erreur s''est produite'); 



END; 
/ 
/*
PROMPT *********************** Affichage de OD_Clients ************************
BEGIN
--  Cursor FOR sans declaration de curseur 
DBMS_OUTPUT.PUT_LINE(rpad('numclient',5)||rpad('nomclient',5)||rpad('prenomclient',5)||rpad('telephone',5)||rpad('norue',5)||rpad('nomrue',5)||rpad('la ville',5)||rpad('la province',5)||rpad('le code postal',5)||rpad('le pays',5));
FOR liste IN (select nobixi,marque,annee,prix,nocat from OD_Clients) LOOP 

        DBMS_OUTPUT.PUT_LINE(rpad(liste.numclient,5)||' '||rpad(liste.nomclient,5)||' '||rpad(liste.prenomclient,5)||' '||rpad(liste.telephone,5)||' '||rpad(liste.norue,5)||' '||rpad(liste.nomrue,5)||' '||rpad(liste.ville,5)||' '||rpad(liste.province,5)||' '||rpad(liste.codepostal,5)||' '||rpad(liste.pays,5)); 

END LOOP; 

END;
/
  */

SET VERIFY ON 

PAUSE Appuyer sur touche...
@C:\PLSQL\user\Projet\MENU.sql
