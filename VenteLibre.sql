SET SERVEROUTPUT ON

 DECLARE

    err_table_existe_global EXCEPTION; 

    PRAGMA EXCEPTION_INIT(err_table_existe_global,-955);  

BEGIN 

    DECLARE 

        err_table_existe EXCEPTION; 

        PRAGMA EXCEPTION_INIT(err_table_existe,-955); 

    BEGIN 

    -- Creation de la table OD_Clients(numclient,nomclient,prenomClient,telephone,norue,nomrue,ville,province,codepostal,pays) 

        EXECUTE IMMEDIATE'CREATE TABLE OD_Clients(numclient VARCHAR2(50) PRIMARY KEY, nomclient VARCHAR2(50),prenomclient VARCHAR2(50),telephone VARCHAR2(50),norue number(10,2),nomrue VARCHAR2(50),ville VARCHAR2(50),province VARCHAR2(50),codepostal VARCHAR2(50),pays VARCHAR2(50))';

        EXCEPTION 

            WHEN err_table_existe THEN 

                DBMS_OUTPUT.PUT_LINE('La table "OD_Clients" existe deja!'); 

    END; 





 

        DECLARE 

        err_table_existe EXCEPTION; 

        PRAGMA EXCEPTION_INIT(err_table_existe,-955); 

BEGIN

-- Creation de la table OD_Produits(numprod,nom,quantitestock,prix) 

        EXECUTE IMMEDIATE'CREATE TABLE OD_Produits(numprod VARCHAR2(50) PRIMARY KEY, 

        nom VARCHAR2(50), quantitestock NUMBER(10,2), prix NUMBER(10,2))'; 

        EXCEPTION

            WHEN err_table_existe THEN 

            DBMS_OUTPUT.PUT_LINE('La table "OD_Produits" existe deja!'); 

    END; 







   

    BEGIN 

-- Creation de la table OD_Venteclients(codevente,*numclient*,*numprod*,datevente,quantitevendue,prix) 

        EXECUTE IMMEDIATE'CREATE TABLE OD_Venteclients(codevente VARCHAR2(50) PRIMARY KEY, numclient VARCHAR2(50), CONSTRAINT fk_numclient

        FOREIGN KEY(numclient) REFERENCES OD_Clients(numclient) ON DELETE CASCADE, numprod VARCHAR2(50), CONSTRAINT fk_numprod

        FOREIGN KEY(numprod) REFERENCES OD_Produits(numprod), datevente DATE, quantitevendue NUMBER(10,2), prix

        NUMBER(10,2))'; 

        EXCEPTION

            WHEN err_table_existe_global THEN 

            DBMS_OUTPUT.PUT_LINE('La table "OD_Venteclients" existe deja!'); 

    END; 

  

END; 

/ 


PAUSE Appuyer sur touche...
@C:\PLSQL\user\Projet\MENU.sql
