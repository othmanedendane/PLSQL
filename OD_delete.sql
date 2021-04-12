-- OD_Produits(numprod,nom,quantitestock,prix) 

SET VERIFY OFF
ACCEPT lenumprod PROMPT "Entrer le numero de produit: " 

DECLARE

nombre NUMBER := 0; 
BEGIN
SELECT count(numprod) INTO nombre FROM OD_Produits WHERE upper(numprod)=upper('&lenumprod');
if nombre > 0 then

   DELETE FROM OD_Produits WHERE numprod = '&lenumprod';
    COMMIT;
    dbms_output.put_line('Suppression effectue du produit!');

  else
    dbms_output.put_line('Le numero produit est incorrecte');
  
 commit;

END IF;
END;
/


SET VERIFY ON


PAUSE Appuyer sur touche...
@C:\PLSQL\user\Projet\MENU.sql


