SET VERIFY OFF
ACCEPT lancien PROMPT "Entrer le numero de client: " 
ACCEPT lenumclient PROMPT "Entrer le nouveau numero de client: " 
DECLARE
varclient OD_Clients.numclient%TYPE:='&lancien';
nombre NUMBER(1):=0; 
BEGIN
SELECT count(numclient) INTO nombre FROM OD_Clients WHERE upper(numclient)=upper(varclient);
IF nombre = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Le code n''existe pas !');
ELSE

 update OD_Clients set numclient = '&lenumclient' where numclient=varclient;

commit;

END IF;
END;
/


SET VERIFY ON


PAUSE Appuyer sur touche...
@C:\PLSQL\user\Projet\MENU.sql