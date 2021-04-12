-- OD_Venteclients(codevente,*numclient*,*numprod*,datevente,quantitevendue,prix)
SET SERVEROUTPUT ON
SET VERIFY OFF 

 ACCEPT lenumclient PROMPT "Entrer le numero de client que vous cherchez: " 


DECLARE

 varcode OD_Venteclients.numclient%TYPE:='&lenumclient'; 


        

-- 1)declaration du curseur 
    CURSOR lecurseur IS
    SELECT numclient,numprod,quantitevendue,prix FROM OD_Venteclients WHERE upper(numclient)=upper('&lenumclient');
    var_curseur lecurseur%ROWTYPE;
BEGIN

        IF varcode IS NULL THEN 

        DBMS_OUTPUT.PUT_LINE('*** Veuillez entrer une valeur pour le code! ***'); 

    ELSE 

-- 2) ouverture du curseur
    IF NOT lecurseur%ISOPEN THEN
        OPEN lecurseur;
    END IF;
-- 3) Traitement de CHAQUE LIGNE DU CURSEUR!!!
    DBMS_OUTPUT.PUT_LINE(rpad('NUM CLIENT',15) ||rpad('NUM PROD',15) ||rpad('SOUS TOTAL',15) ||rpad('TAXE',15) ||rpad('TOTAL',15)); -- pour ecrire code      nom
    FETCH lecurseur INTO var_curseur;
-- Vérifier si aucune donne trouvee
    IF lecurseur%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('Le curseur est vide');
    ELSE
        WHILE lecurseur%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE(rpad(var_curseur.numclient,15) ||rpad(var_curseur.numprod,15) ||rpad(var_curseur.quantitevendue * var_curseur.prix,15) ||rpad('15%',15) ||rpad((var_curseur.quantitevendue * var_curseur.prix)+(var_curseur.quantitevendue * var_curseur.prix)*0.15, 15));
        FETCH lecurseur INTO var_curseur;
    END LOOP;
    END IF;
-- 4) Fermeture du curseur
    CLOSE lecurseur;

END IF;


END;
/
 SET VERIFY ON 

PAUSE Appuyer sur touche...
@C:\PLSQL\user\Projet\MENU.sql