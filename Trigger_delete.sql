SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER OD_triggerdelete
AFTER DELETE ON OD_Produits
FOR EACH ROW
BEGIN
 DBMS_OUTPUT.PUT_LINE('Suppression en cascade de : ' ||:OLD.numprod);
-- update employees set nodep='' where nodep=:OLD.nodep;
INSERT INTO OD_ventes_suprimees SELECT * FROM OD_Venteclients
WHERE numprod=:OLD.numprod;
 delete from OD_Venteclients where numprod=:OLD.numprod;
END;
/

PAUSE Appuyer sur touche...
@C:\PLSQL\user\Projet\MENU.sql