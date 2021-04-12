CLEAR SCREEN 

PROMPT *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* MENU PRINCIPAL *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

PROMPT 1: Creation des tables

PROMPT 2: Insertion dans les tables 

PROMPT 3: Affichage du contenu des tables

PROMPT 4: Affichage de facture 

PROMPT 5: Appliquer un rabais 

PROMPT 6: Executer un update et une suppresion dans les tables

PROMPT 7: Quitter 

ACCEPT selection PROMPT " Entrer option 1-7: " 

SET TERM OFF 

COLUMN script NEW_VALUE v_script 

SELECT CASE '&selection' 

WHEN '1' THEN 'VenteLibre.sql'

WHEN '2' THEN 'OD_Clients.sql','OD_Produits.sql','OD_Venteclient.sql' 

WHEN '3' THEN 'OD_affichePackage.sql','OD_LISTECLIENT.sql','OD_LISTEPRODUITS.sql','OD_LISTEVENTE.sql'

WHEN '4' THEN 'OD_TAXE_PACKAGE.sql','OD_coutvente.sql','OD_Taxe.sql','facture.sql' 

WHEN '5' THEN 'ProcRabais.sql','Rabais.sql' 

WHEN '6' THEN 'Trigger_update.sql','OD_update.sql','Trigger_delete.sql','OD_delete.sql'

WHEN '7' THEN 'Quitter.sql' 

ELSE 'Menu.sql' 

END AS script  
FROM dual;   
SET TERM ON 


@C:\PLSQL\user\Projet\&v_script