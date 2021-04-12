
-- OD_Venteclients(codevente,*numclient*,*numprod*,datevente,quantitevendue,prix)
SET VERIFY OFF 

CREATE OR REPLACE PROCEDURE OD_rabais IS
    taux NUMBER(4,2);




CURSOR Cur_vente IS 

    SELECT codevente, numclient, numprod, datevente, quantitevendue, prix FROM OD_Venteclients WHERE lower(numclient)=lower('&lenumclient') 

    FOR UPDATE OF prix; 

    Le_curseur_vente Cur_vente%ROWTYPE; 


    




BEGIN
    -- 2. Ouverture du curseur 

    OPEN Cur_vente; 

-- 3. Traitement du curseur 

    FETCH Cur_vente INTO Le_curseur_vente; 

    WHILE Cur_vente%FOUND LOOP 

        IF 100 >= (Le_curseur_vente.quantitevendue * Le_curseur_vente.prix) THEN 

            taux:=1.05; 

        ELSIF 500 >= (Le_curseur_vente.quantitevendue * Le_curseur_vente.prix) AND (Le_curseur_vente.quantitevendue * Le_curseur_vente.prix) > 100 THEN 

            taux:=1.10; 

        ELSIF 500 > (Le_curseur_vente.quantitevendue * Le_curseur_vente.prix) THEN 

            taux:=1.15; 

        
        END IF; 

        UPDATE OD_Venteclients SET prix = Le_curseur_vente.prix * taux WHERE lower(numclient)=lower('&lenumclient'); 

         

        FETCH Cur_vente INTO Le_curseur_vente; 

    END LOOP; 

    COMMIT; 

-- 4. Fermeture du curseur 

    CLOSE Cur_vente; 

    -- Affichage de la nouvelle liste de cours  
END;
/

SET VERIFY ON

PAUSE Appuyer sur touche...
@C:\PLSQL\user\Projet\MENU.sql