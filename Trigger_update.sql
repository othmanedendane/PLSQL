SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER OD_triggerupdate
AFTER UPDATE OF numclient ON OD_Clients
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Modification en cascade de: ' ||:NEW.numclient);
    update OD_Venteclients set numclient=:NEW.numclient where numclient=:OLD.numclient;
END;
/

PAUSE Appuyer sur touche...
@C:\PLSQL\user\Projet\MENU.sql