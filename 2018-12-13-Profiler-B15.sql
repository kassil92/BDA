--====  FB ===========================================================================
--====  FB ===========================================================================
-- Université Sorbonne Paris Cité - Promotion 2018-2019 - Décembre 2018
--====  FB ===========================================================================

-- Binôme B15 :  TSOULI Mohamed            *** LAHLOU KASSI Mounir

-- Master 2 Informatique, Professionnel, Exploration Informatique des Données et Décisionnel
-- Examen de Bases de Données Avancées
--====  FB ===========================================================================

-- Nouveau nom du Fichier SQL : 2018-Profiler-B15.sql

--====  FB ===========================================================================
--====  FB ===========================================================================


/*
M. F. Boufarès ; 
Université Sorbonne Paris Cité
Université Paris 13 ; Master 2 EID2
Jeudi 13 décembre 2018

Vous êtes le TOUBIB-TABIB des données : Un Data-Logue 
(Comme par exemple les Cardio-logues, les Pneumo-logues, les Uro-logues,...) !

Vous disposez des outils qui vous permettent de DIAGNOSTIQUER les anomalies de votre patient la source de données DataSource !

Est-ce une mission possible ?! SiSi C PO CIBLE !!!
VOTRE MISSION SI VOUS L'ACCEPTEZ EST DE DONNER UN SENS AUX DONNEES !
SI VOUS ECHOUEZ, NOUS NIERONS AVOIR EU CONNAISSANCE DE VOS AGISSEMENTS !

Faites le diagnostic automatiquement qui vous permet :
- de détecter les erreurs (les anomalies), et ensuite,
- de corriger les anomalies

Vous êtes entrain de développer un outil de qualité très intelligent : --->>>>>> SmartDATA
Est-ce une mission impossible ?! SiSi C PO CIBLE !!!

-----??????????? V -----??????????? *******************************

iDQMS : intelligent Data Quality Management System --->>>>>> SmartDATA

                            -----iDQMS-----
         Data Source ---->>|               |----->>> Data Reports + Updates
                           |   SmartDATA   |
   Data Dicionnaries ---->>|               |----->>> Correct Data + INCorrect Data
                            -----iDQMS-----

Data Source       : Data with anomalies (Examples : CSV file, SQL table)
Data Dicionnaries : Dictionnaries such as DDRE for Regular Expressions and DDVS for Valid Strings
Data Reports      : Reports that contain diagnostics (metrics & mesures), to help correcting INVALID DATA
Updates           : A set of actions to do to better correct Data (UPDATE DataSource SET ...=... WHERE ... ; Etc...)
Correct Data      : VALID Records (with NO anomalies ->> Heteregeneous Data, Null Value, Functional Dependency, Deduplication,...)
INCorrect Data    : INVALID Records (with anomalies, at least one) DSWARNING

-----??????????? V -----??????????? *******************************

*/

DROP TABLE DATASOURCE;
CREATE TABLE DATASOURCE ( NOM VARCHAR2(20), PRENOM VARCHAR2(20), DATNAISS VARCHAR2(20), VILNAIS VARCHAR2(20), PAYSNAIS VARCHAR2(20), SEXE VARCHAR2(20), GS VARCHAR2(5),TAILLE VARCHAR2(20),POIDS VARCHAR2(20), TELMOBILE VARCHAR2(20), EMAIL VARCHAR2(40) );

INSERT INTO DATASOURCE VALUES ('LAMEME', 'Lina', '22/02/2002', 'Lille', 'France', 'F', 'AB+', '155cm', '69Kg', '+33 7 77 77 77 77', 'lina.lameme@gmail.com');
INSERT INTO DATASOURCE VALUES ('CLEMENT', 'Adam', '10/06/1996', 'Paris', 'France', 'M', 'B+', '172cm', '71', '+33617716698', 'adam.clement@gmail.com');
INSERT INTO DATASOURCE VALUES ('LABELLE', 'Eve', '17/06/1990', 'Paris', 'Fr', 'F', 'B', '169cm', '', '669964916', 'eve.la belle@gmail.com');
INSERT INTO DATASOURCE VALUES ('CLEMENT', 'Clémence', '01/10/1920', 'Marseille', 'France', 'F', 'A+', '1,68m', '68kg', '684071896', 'clémence.clement@gmail.com');
INSERT INTO DATASOURCE VALUES ('TRAIFOR', 'Adam', '19/06/2001', 'Lyon', 'France', 'M', 'B+', '1700mm', '71kg', '(+33) 06 30 50 19 16', 'adam.traifor@gmail.com');
INSERT INTO DATASOURCE VALUES ('EVE', 'Evelyne', '22 novembre 1969', '-', '', 'F', '', '', '', '687844442', 'evelyne!?/eve@gmail.com');
INSERT INTO DATASOURCE VALUES ('NANNOU', 'Inès', '22 novembre 1969', 'Nice', 'France', 'F', 'B+', '1,69m', '70KG', '678466837', 'ines.nan@nou@gmail.com');
INSERT INTO DATASOURCE VALUES ('GRAND', 'Adam', '16 octobre 1996', 'Paris', '', 'M', 'B+', '1920mm', '71KiloG', '646532809', 'adam.grand@gmail.com');
INSERT INTO DATASOURCE VALUES ('LAMEME', 'Lina', '22 février 2002', 'Lille', 'France', 'F', 'AB+', '155cm', '69KG', '+33 7 77 77 77 77', 'lina.lameme@gmail.com');
INSERT INTO DATASOURCE VALUES ('LAMEME', 'Lina', '22 février 2002', 'Lille', 'France', 'F', 'AB+', '155cm', '69KG', '+33 7 77 77 77 77', '');
INSERT INTO DATASOURCE VALUES ('LAMEME', 'Lina', '22 février 2002', 'Lille', 'France', 'F', 'AB+', '155cm', '69KG', '', 'lina.lameme@gmail.com');
INSERT INTO DATASOURCE VALUES ('LAMEME', 'L.', '22 février 2002', 'Lille', 'France', 'F', 'AB+', '155cm', '69KG', '', 'lina.lameme@gmail.com');
INSERT INTO DATASOURCE VALUES ('lameme', 'lina', '22 février 2002', 'lille', '', 'f', '', '155cm', '69kg', '+33 7 77 77 77 77', 'lina.lameme@gmail.com');
INSERT INTO DATASOURCE VALUES ('lameme', 'lina', '22 février 2002', 'lille', 'franc', 'f', 'ab+', '155cm', '69kg', '+33 7 77 77 77 77', 'lina.lameme@gmail');
INSERT INTO DATASOURCE VALUES ('CLEMENT', 'Clémence', '11 novembre 2011', 'Barcelone', 'Espagne', 'F', 'A+', '111cm', '13kg', '', 'fcb-clement@yahoo.fr');
INSERT INTO DATASOURCE VALUES ('CLEMENT', 'Clémence', '11 novembre 2011', 'Barcelone', 'Espagne', 'F', 'A+', '1,11m', '13000g', '', 'fcb-clement@yahoo.fr');
INSERT INTO DATASOURCE VALUES ('CLEMENT', 'clemence', '2011-novembre-11', 'Barcelone', 'Espagne', 'F', 'A+', '1,11m', '13000g', '', 'fcb-clement@yahoo.fr');
COMMIT;


--====  1 ===========================================================================

-- Quelques questions pour commencer !

SELECT DISTINCT NOM FROM DATASOURCE;
SELECT DISTINCT UPPER(NOM) FROM DATASOURCE;
SELECT EMAIL FROM DATASOURCE;

-- Homogénéisation !!! Comment !

SELECT TAILLE FROM DATASOURCE;
SELECT AVG(TAILLE) AS MOYTAIL FROM DATASOURCE ;
SELECT MAX(POIDS) AS MAXPDS FROM DATASOURCE ;

--====  2 ===========================================================================

-- Il y aurait des problèmes dans cette source de données !!

REM Que faire ?
REM C EST SMARTDATA QUI VA NOUS RENSEIGNER !

-- Développez le mécanisme qui permet de diagnostiquer (profiler) les problèmes dans la source de données
-- Complétez/Corrigez le script sql 2018ProfilerDonnees.sql --==>>> 2018-12-13-Profiler-Bxy.sql


set serveroutput on
-- ===============================================================================

-- M01 : Le nombre total de valeurs (nombre de lignes dans la table)

CREATE OR REPLACE PROCEDURE nbLigne(tab varchar, nom_col varchar) IS
query varchar(500);
nb_ligne number;
BEGIN
query := 'select count (' ||nom_col|| ') as NOMBRE_LIGNE from ' || tab ;
execute immediate query into nb_ligne  ;
dbms_output.put_line(nb_ligne);

END;
/

CREATE OR REPLACE FUNCTION Fun_numLigne (nom_col in varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS nbLigne NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := 'select count (' || nom_col || ') from ' || nom_tab ;
     	execute immediate query into nbligne  ;
      RETURN(nbLigne); 
    END;
/

-- M02 : Le nombre de valeurs nulles dans une colonne

CREATE OR REPLACE PROCEDURE nbEltNull(tab varchar, nom_col varchar) IS
query varchar(500);
nb_val_null number;
BEGIN
query := 'select count (*) from ' || tab || ' where ' ||nom_col|| ' is null';
execute immediate query into nb_val_null  ;
dbms_output.put_line(nb_val_null);
-- dbms_output.put_line(query) ;

END;
/

CREATE OR REPLACE FUNCTION Fun_nbEltNull (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS nb_val_null  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := 'select count(*) from ' || nom_tab || ' where ' || nom_col || ' is null' ;
     	execute immediate query into nb_val_null  ;
      RETURN(nb_val_null); 
    END;
/

-- M03 : Le nombre de "mots" à considérer dans une colonne

CREATE OR REPLACE PROCEDURE nbMots(tab varchar, nom_col varchar) IS
query varchar(500);
nb_mots number;
TYPE TYP_TAB is table of varchar2(100) ;
nbMots_tab TYP_TAB  ;
BEGIN
query := 'select regexp_count('|| nom_col || ','' '' )+1 from ' ||tab;
EXECUTE IMMEDIATE query BULK COLLECT INTO nbMots_tab ;
FOR I IN nbMots_tab.first..nbMots_tab.last LOOP
DBMS_OUTPUT.PUT_LINE( nbMots_tab(I) ) ;
END LOOP ;

END;
/

CREATE OR REPLACE FUNCTION Fun_nbMots (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS nb_mots  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := 'select max(regexp_count('|| nom_col || ','' '' )+1) from ' || NOM_TAB ;
     	execute immediate query into nb_mots  ;
      RETURN(nb_mots); 
    END;
/


-- M04 : Le nombre de valeurs distinctes dans une colonne

set serveroutput on
CREATE OR REPLACE PROCEDURE nbMots_distinct(tab varchar, nom_col varchar) IS
query varchar(500);
nb_mots number;
TYPE TYP_TAB is table of varchar2(100) ;
nbMots_tab TYP_TAB  ;
BEGIN
query := 'select distinct regexp_count('|| nom_col || ','' '' )+1 from ' ||tab;
EXECUTE IMMEDIATE query BULK COLLECT INTO nbMots_tab ;
FOR I IN nbMots_tab.first..nbMots_tab.last LOOP
DBMS_OUTPUT.PUT_LINE( nbMots_tab(I) ) ;
--DBMS_OUTPUT.PUT_LINE(query) ;
END LOOP ;

END;
/

CREATE OR REPLACE FUNCTION Fun_nbMots_distinct (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS nb_mots  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := 'select count(distinct regexp_count('|| nom_col || ','' '' )+1) from ' || NOM_TAB ;
     	execute immediate query into nb_mots  ;
      RETURN(nb_mots); 
    END;
/

-- M05 : L'unicité des valeurs dans une colonne
set serveroutput on
CREATE OR REPLACE PROCEDURE nbMots_unique(tab varchar, nom_col varchar) IS
nb_mots number;
BEGIN
EXECUTE IMMEDIATE 'select count(distinct regexp_count('|| nom_col || ','' '' )+1) from ' ||tab INTO nb_mots;
IF nb_mots > 1 THEN DBMS_OUTPUT.PUT_LINE('FALSE');
ELSE DBMS_OUTPUT.PUT_LINE('TRUE');
END IF;
END;
/

CREATE OR REPLACE FUNCTION Fun_nbMots_unique (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS nb_mots  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := 'select count(distinct regexp_count('|| nom_col || ','' '' )+1) from ' || NOM_TAB ;
     	execute immediate query into nb_mots  ;
      IF nb_mots > 1 THEN RETURN(0);
      ELSE RETURN(1);
      END IF ;
    END;
/


-- M06 : La longueur minimale des chaines de caractères dans une colonne

set serveroutput on
CREATE OR REPLACE PROCEDURE min_chaine_car (tab varchar, nom_col varchar) IS
query varchar(500);
min_char number;
BEGIN
query := ' select min(length(' ||nom_col|| '))  from ' || tab ;
execute immediate query into min_char  ;
dbms_output.put_line(min_char);
-- dbms_output.put_line(query) ;

END;
/

CREATE OR REPLACE FUNCTION Fun_min_chaine_car (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS min_char  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := ' select min(length(' ||nom_col|| ')) from ' || nom_tab  ;
     	execute immediate query into min_char  ;
      RETURN(min_char); 
    END;
/


-- M07 : La longueur maximale des chaines de caractères dans une colonne

CREATE OR REPLACE PROCEDURE max_chaine_car (tab varchar, nom_col varchar) IS
query varchar(500);
max_char number;
BEGIN
query := ' select max(length(' ||nom_col|| '))  from ' || tab ;
execute immediate query into max_char  ;
dbms_output.put_line(max_char);
-- dbms_output.put_line(query) ;

END;
/

CREATE OR REPLACE FUNCTION Fun_max_chaine_car (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS max_char  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := ' select max(length(' ||nom_col|| ')) from ' || nom_tab ;
     	execute immediate query into max_char ;
      RETURN(max_char); 
    END;
/

-- M08 : La longueur moyenne des chaines de caractères dans une colonne

set serveroutput on
CREATE OR REPLACE PROCEDURE avg_chaine_car (tab varchar, nom_col varchar) IS
query varchar(500);
avg_char number;
BEGIN
query := ' select avg(length(' ||nom_col|| ')) from ' || tab ;
execute immediate query into avg_char  ;
dbms_output.put_line(avg_char);
-- dbms_output.put_line(query) ;

END;
/

CREATE OR REPLACE FUNCTION Fun_avg_chaine_car  (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS moy_char  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := ' select avg(length(' ||nom_col|| '))from ' || nom_tab ;
     	execute immediate query into moy_char ;
      RETURN(moy_char); 
    END;
/

-- M09 : La valeur minimale des numériques dans une colonne

set serveroutput on
CREATE OR REPLACE PROCEDURE min_numerique (tab varchar, nom_col varchar) IS
query varchar(500);
min_num number;
BEGIN
query := 'select min (length (SUBSTR('|| nom_col ||', regexp_instr('|| nom_col ||', ''[[:digit:]]*$''), Length('|| nom_col ||') - regexp_instr('|| nom_col ||', ''[[:digit:]]*$'') + 1))) from ' || tab ;
execute immediate query into min_num  ;
dbms_output.put_line(min_num);
--dbms_output.put_line(query) ;

END;
/

CREATE OR REPLACE FUNCTION Fun_min_numerique  (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS min_num  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := 'select min (length (SUBSTR('|| nom_col ||', regexp_instr('|| nom_col ||', ''[[:digit:]]*$''), Length('|| nom_col ||') - regexp_instr('|| nom_col ||', ''[[:digit:]]*$'') + 1))) from ' || nom_tab ;
     	execute immediate query into min_num ;
        RETURN(min_num); 
    END;
/

select min (length (SUBSTR(TAILLE, regexp_instr(TAILLE, '[[:digit:]]*$'), Length(TAILLE) - regexp_instr(TAILLE, '[[:digit:]]*$') + 1))) from DATASOURCE;

select regexp_instr('115cm', '[[:digit:]]*$') from DUAL;

-- M10 : La valeur maximale des numériques dans une colonne

CREATE OR REPLACE PROCEDURE max_numerique (tab varchar, nom_col varchar) IS
query varchar(500);
max_num number;
BEGIN
query := 'select max (length (SUBSTR('|| nom_col ||', regexp_instr('|| nom_col ||', ''[[:digit:]]*$''), Length('|| nom_col ||') - regexp_instr('|| nom_col ||', ''[[:digit:]]*$'') + 1)))  from ' || tab ;
execute immediate query into max_num  ;
dbms_output.put_line(max_num);
--dbms_output.put_line(query) ;

END;
/

CREATE OR REPLACE FUNCTION Fun_max_numerique (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS max_num  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := 'select max (length (SUBSTR('|| nom_col ||', regexp_instr('|| nom_col ||', ''[[:digit:]]*$''), Length('|| nom_col ||') - regexp_instr('|| nom_col ||', ''[[:digit:]]*$'') + 1))) from ' || nom_tab ;
     	execute immediate query into max_num ;
        RETURN(max_num); 
    END;
/


-- M11 : La valeur moyenne des numériques dans une colonne

CREATE OR REPLACE PROCEDURE avg_numerique (tab varchar, nom_col varchar) IS
query varchar(500);
avg_num number;
BEGIN
query := 'select avg (length (SUBSTR('|| nom_col ||', regexp_instr('|| nom_col ||', ''[[:digit:]]*$''), Length('|| nom_col ||') - regexp_instr('|| nom_col ||', ''[[:digit:]]*$'') + 1))) from ' || tab ;
execute immediate query into avg_num  ;
dbms_output.put_line(avg_num);
--dbms_output.put_line(query) ;

END;
/

CREATE OR REPLACE FUNCTION Fun_avg_numerique (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS avg_num  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := 'select avg (length (SUBSTR('|| nom_col ||', regexp_instr('|| nom_col ||', ''[[:digit:]]*$''), Length('|| nom_col ||') - regexp_instr('|| nom_col ||', ''[[:digit:]]*$'') + 1))) from ' || nom_tab ;
     	execute immediate query into avg_num ;
        RETURN(avg_num); 
    END;
/

-- M12 : La valeur médiane des numériques dans une colonne

set serveroutput on
CREATE OR REPLACE PROCEDURE median_numerique (tab varchar, nom_col varchar) IS
query varchar(500);
median_num number;
BEGIN
query := 'select median (length (SUBSTR('|| nom_col ||', regexp_instr('|| nom_col ||', ''[[:digit:]]*$''), Length('|| nom_col ||') - regexp_instr('|| nom_col ||', ''[[:digit:]]*$'') + 1))) from ' || tab ;
execute immediate query into median_num  ;
dbms_output.put_line(median_num);
--dbms_output.put_line(query) ;

END;
/

CREATE OR REPLACE FUNCTION Fun_median_numerique  (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS median_num  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := 'select median (length (SUBSTR('|| nom_col ||', regexp_instr('|| nom_col ||', ''[[:digit:]]*$''), Length('|| nom_col ||') - regexp_instr('|| nom_col ||', ''[[:digit:]]*$'') + 1)))  from ' || nom_tab ;
     	execute immediate query into median_num ;
        RETURN(median_num); 
    END;
/

-- M13 : La valeur de l'écart type des numériques dans une colonne

set serveroutput on
CREATE OR REPLACE PROCEDURE ecartType_numerique (tab varchar, nom_col varchar) IS
query varchar(500);
ecartType_num number;
BEGIN
query := 'select stddev (length (SUBSTR('|| nom_col ||', regexp_instr('|| nom_col ||', ''[[:digit:]]*$''), Length('|| nom_col ||') - regexp_instr('|| nom_col ||', ''[[:digit:]]*$'') + 1))) as ecartType_numerique from ' || tab ;
execute immediate query into ecartType_num  ;
dbms_output.put_line(ecartType_num);
--dbms_output.put_line(query) ;

END;
/

CREATE OR REPLACE FUNCTION Fun_ecartType_numerique  (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS ecartType_num  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := 'select stddev (length (SUBSTR('|| nom_col ||', regexp_instr('|| nom_col ||', ''[[:digit:]]*$''), Length('|| nom_col ||') - regexp_instr('|| nom_col ||', ''[[:digit:]]*$'') + 1)))  from ' || nom_tab ;
     	execute immediate query into ecartType_num ;
        RETURN(ecartType_num); 
    END;
/

-- M14 : La valeur minimale des dates (la plus ancienne) dans une colonne


CREATE OR REPLACE PROCEDURE Val_Min_date(tab varchar, nom_col varchar) IS
query varchar(500);
dateMin varchar(50);
BEGIN
query := 'select min ( '||nom_col||') from ' || tab;
execute immediate query into dateMin  ;
dbms_output.put_line(dateMin);
END;
/

CREATE OR REPLACE FUNCTION Fun_Min_date (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS dateMin varchar(50);
	query varchar(500);
   BEGIN 
	query := 'select min ( '||nom_col||') from ' || nom_tab;
     	execute immediate query into dateMin ;
        RETURN(dateMin); 
    END;
/

-- M15 : La valeur maximale des dates (la plus récente) dans une colonne


CREATE OR REPLACE PROCEDURE Val_Max_date(tab varchar, nom_col varchar) IS
query varchar(500);
dateMax varchar(50);
BEGIN
query := 'select max ( '||nom_col||') from ' || tab;
execute immediate query into dateMax   ;
dbms_output.put_line(dateMax );
END;
/

CREATE OR REPLACE FUNCTION Fun_Max_date (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS dateMax varchar(50);
	query varchar(500);
   BEGIN 
	query := 'select min ( '||nom_col||') from ' || nom_tab;
     	execute immediate query into dateMax ;
        RETURN(dateMax); 
    END;
/


-- M16 : Le nombre de lignes qui respectent une condition ou des conditions donnée(s) avec le taux

select count(*) as nbLigne_condition, constraint_name, constraint_type
from user_constraints
where table_name = 'PNNP'
group by
constraint_name, constraint_type;

-- M17 : Le nombre d'anomalie par ligne PAR COLONNE ANOMALIES




-- M18 : lE NOMBRE DE LIGNE VALIDE PAR COLONNE  VALIDLIGNE

-- M19 : LE NOMBRE  de ligne non valide par ligne INVALIDCOL NUMBER(2)

-- Procedure qui duplique la source des donnees

CREATE OR REPLACE PROCEDURE duplique(tab varchar) IS
query varchar(500);
BEGIN
query := 'create table '||tab||'PRIM AS SELECT * from ' || tab;
execute immediate query   ;
END;
/

-- Creation de la table systeme DRDIAGNOTAB

DROP TABLE DRDIAGNOTAB ;
create table DRDiagnotab (
	nom_table varchar(20),
	nom_colonne varchar(20),
	type_colonne varchar(20),
	taille_colonne number,
	type_semantique varchar(20),
	M01 NUMBER ,
	M02 NUMBER ,
	M03 NUMBER ,
	M04 NUMBER ,
	M05 NUMBER ,
	M06 NUMBER ,
	M07 NUMBER ,
	M08 NUMBER ,
	M09 NUMBER ,
	M10 NUMBER ,
	M11 NUMBER ,
	M12 NUMBER ,
	M13 NUMBER ,
	M14 NUMBER ,
	M15 NUMBER ,
	date_insertion date, 
	utilisateur varchar(40)
 );


-- Creation de la table utile pour stocker les colonnes des tables dans le curseur. Cette table est utilisée dans les deux procedures INSERT_DIAGNOTAB  et  INSERT_DIAGNOTABCOL
drop table intermediaire;
create table intermediaire (
	nom_col varchar(50),
	type_col varchar (50),
	taille_col number 
);

-- Insertion grace à une procedure automatisée des differents champs dans la table systeme DIAGNOTAB. Ainsi nous avons besoin que du Nom de la table pour lancer la procedure, ce qui la rend generale.

CREATE OR REPLACE PROCEDURE INSERT_DIAGNOTAB (tab VARCHAR) IS
query1 varchar(2000);
query2 varchar(2000);
query3 varchar(2000);
query4 varchar(2000);
query5 varchar(2000);
CURSOR CUR IS
SELECT nom_col,type_col,taille_col from intermediaire ;
col_courrante varchar (50) ;
type_courrant varchar (50) ;
taille_courrante number ;
existe number ;


BEGIN   

 query1 := 'insert into intermediaire (nom_col, type_col, taille_col) SELECT column_name, data_type, data_length FROM USER_TAB_COLUMNS
									WHERE table_name =  '''||tab ||''' ';
 execute immediate query1  ;

 query2 := ' SELECT COUNT(*) FROM DRdiagnotab where nom_table = '''||tab ||''' ' ;
	execute immediate query2 INTO EXISTE  ;
 open CUR ;
LOOP
    FETCH CUR INTO col_courrante, type_courrant,taille_courrante ;
    EXIT WHEN CUR%NOTFOUND;
    query3 := ' insert into DRdiagnotab (nom_table,nom_colonne,type_colonne, taille_colonne,M01,M02,M03,M04,M05,M06,M07,M08, M09, M10,M11,M12,M13, DATE_INSERTION, UTILISATEUR)
		SELECT  '''||tab ||''' ,
			'''||col_courrante||''' ,
			'''||type_courrant||''',
			'''||taille_courrante||''',
			 Fun_numLigne ('''||col_courrante||''','''||tab||''') ,
			 Fun_nbEltNull('''||col_courrante||''','''||tab||''') ,
			 Fun_nbMots('''||col_courrante||''','''||tab||''') ,
			 Fun_nbMots_distinct('''||col_courrante||''','''||tab||'''),
			 Fun_nbMots_unique('''||col_courrante||''','''||tab||'''),
			 Fun_min_chaine_car('''||col_courrante||''','''||tab||''') ,
			 Fun_max_chaine_car('''||col_courrante||''','''||tab||''') ,
			 Fun_avg_chaine_car ('''||col_courrante||''','''||tab||''') ,
            		 Fun_min_numerique ('''||col_courrante||''','''||tab||''')  ,
			 Fun_max_numerique ('''||col_courrante||''','''||tab||''')  ,
			 Fun_avg_numerique ('''||col_courrante||''','''||tab||''') ,
			 Fun_median_numerique ('''||col_courrante||''','''||tab||''') ,
			 Fun_ecartType_numerique ('''||col_courrante||''','''||tab||''') ,
			 sysdate ,
			 user from dual 
			 ';
	query4 := ' update DRdiagnotab set
			nom_table = '''||tab ||''',
			nom_colonne = '''||col_courrante||''' ,
			type_colonne = '''||type_courrant||''',
			taille_colonne = '''||taille_courrante||''',
			M01 = (select Fun_numLigne ('''||col_courrante||''','''||tab||''') from dual) ,
			M02 = (select Fun_nbEltNull('''||col_courrante||''','''||tab||''') from dual),
			M03 = (select Fun_nbMots('''||col_courrante||''','''||tab||''') from dual),			
			M04 = (select Fun_nbMots_distinct('''||col_courrante||''','''||tab||''') from dual),
			M05 = (select Fun_nbMots_unique('''||col_courrante||''','''||tab||''') from dual),
			M06 = (select Fun_min_chaine_car('''||col_courrante||''','''||tab||''') from dual) ,
			M07 = (select Fun_max_chaine_car('''||col_courrante||''','''||tab||''') from dual) ,
			M08 = (select Fun_avg_chaine_car ('''||col_courrante||''','''||tab||''') from dual) ,
			M09 = (select Fun_min_numerique ('''||col_courrante||''','''||tab||''')  from dual) ,
			M10 = (select Fun_max_numerique ('''||col_courrante||''','''||tab||''') from dual) ,
			M11 = (select Fun_avg_numerique ('''||col_courrante||''','''||tab||''') from dual ),
			M12 = (select Fun_median_numerique ('''||col_courrante||''','''||tab||''') from dual ),
			M13 = (select Fun_ecartType_numerique ('''||col_courrante||''','''||tab||''') from dual),
			DATE_INSERTION = sysdate ,
			UTILISATEUR = (select user from dual )'
			;
	if existe > 0 then
	execute immediate query4 ;
	else
	execute immediate query3 ;
	end if ;
  END LOOP; 
  CLOSE CUR;
    query5 := ' delete from intermediaire ' ;
	execute immediate query5 ;

END;
/
-- CREATION DIAGNOTAB POUR NOTRE TABLE DATASOURCE
EXEC INSERT_DIAGNOTAB('DATASOURCE');

column NOM_TABLE FORMAT A12
column NOM_COLONNE FORMAT A10
column TYPE_COLONNE FORMAT A12
column TAILLE_COLONNE FORMAT 999
column TYPE_SEMANTIQUE FORMAT A10
column UTILISATEUR FORMAT A10
column M01 format 99
column M02 format 99
column M03 format 99
column M04 format 99
column M05 format 99
column M06 format 99
column M07 format 99
column M08 format 99
column M09 format 99
column M10 format 99
column M11 format 99
column M12 format 99
column M13 format 99
column M14 format 99
column M15 format 99

select * from DRdiagnotab;


-- Creation de la table systeme DRDIAGNOTABCOL


DROP TABLE DRDIAGNOTABCOL ;
create table DRDIAGNOTABCOL (
	nom_table varchar(20),
	nom_colonne varchar(20),
	valeur_colonne varchar(50),
	occurence_valeur number,
	ratio number ,
	date_insertion date, 
	utilisateur varchar(40)
 );


-- Insertion grace à une procedure automatisée des differents champs dans la table systeme DIAGNOTABCOL. Ainsi nous avons besoin que du Nom de la table pour lancer la procedure, ce qui la rend generale.

CREATE OR REPLACE PROCEDURE INSERT_DIAGNOTABCOL (tab VARCHAR) IS
query1 varchar(1000);
query2 varchar(1000);
query3 varchar(1000);
CURSOR CUR1 IS
SELECT nom_col from intermediaire ;
col_courrante varchar(200) ;

BEGIN
query1 := 'insert into intermediaire (nom_col) SELECT column_name
						FROM USER_TAB_COLUMNS
						WHERE table_name =  '''||tab ||''' ';
execute immediate query1  ;
open CUR1 ;
LOOP
FETCH CUR1 INTO col_courrante;
EXIT WHEN CUR1%NOTFOUND;

query2 := 'insert into DRDiagnotabcol (nom_table,valeur_colonne, nom_colonne,DATE_INSERTION,  utilisateur ,occurence_valeur) 
 	select distinct '''||tab ||''','|| col_courrante ||', '''|| col_courrante ||''', sysdate,user, count(*) from '|| tab ||' group by '|| 	col_courrante ||' ' ;
execute immediate query2 ;

 query3 := ' delete from intermediaire ' ;
	execute immediate query3 ;

END LOOP;
CLOSE CUR1;
END;
/

-- CREATION DIAGNOTABcol POUR NOTRE TABLE DATASOURCE
EXEC INSERT_DIAGNOTABCOL('DATASOURCE');

select * from DRDiagnotabcol;

-- RATIO : Procedure qui calcule les ratios des occurences de la table de DIAGNOTABCOL
set serveroutput on
CREATE OR REPLACE PROCEDURE INSERT_DIAGNOTABCOL_RATIO (tab VARCHAR) IS
query varchar(1000);

BEGIN
QUERY := 'UPDATE DRDIAGNOTABCOL D SET RATIO = (SELECT ROUND((OCCURENCE_VALEUR)/COUNT(*),2) FROM '||TAB||' WHERE D.NOM_TABLE = '''|| TAB ||''')' ;
execute immediate query ;
END;
/


-- REMPLIR LE CHAMP RATION DANS LA TABLE DIAGNOTABcol POUR NOTRE TABLE DATASOURCE
exec INSERT_DIAGNOTABCOL_RATIO ('DATASOURCE');

select * from DRDiagnotabcol;

-- Creation de la table systeme DRDIAGNOTABCOLCOL

DROP TABLE DRDIAGNOTABCOLCOL ;
create table DRDIAGNOTABCOLCOL (
	COL1 varchar(20),
	COMPARE varchar(50),
	COL2 varchar(20),
	egale_ratio number,
	sup_ratio number,
	inf_ratio number
 );


-- Procedure qui compare les colonnes d une table

set serveroutput on
CREATE OR REPLACE PROCEDURE INSERT_DIAGNOTABCOLCOL (tab VARCHAR) IS
query1 varchar(1000);
query2 varchar(1000);
TYPE TYP_TAB is table of varchar2(100) ;
colonne_tab TYP_TAB  ;
taille number ;

BEGIN
query1 := ' SELECT column_name FROM USER_TAB_COLUMNS
						WHERE table_name =  '''||tab ||''' ';
execute immediate query1 BULK COLLECT INTO colonne_tab ;
taille := colonne_tab.count ;
FOR I IN 1..taille LOOP
	for J in I .. taille loop
	--DBMS_OUTPUT.PUT_LINE( colonne_tab(I) ) ;
	query2 :=' INSERT INTO DRDIAGNOTABCOLCOL (COL1, COMPARE, COL2)
			select '''||colonne_tab(I)||''',
			CASE 
			WHEN '||colonne_tab(I)||' > '||colonne_tab(J)||' THEN 
			''>'' 
			WHEN '||colonne_tab(I)||' < '||colonne_tab(J)||' THEN 
			''<'' 
			WHEN '||colonne_tab(I)||' = '||colonne_tab(J)||' THEN 
			''='' 
			END ,
			'''||colonne_tab(J)||'''
			from '||TAB;
	--DBMS_OUTPUT.PUT_LINE( query2 ) ;
	execute immediate query2 ;
	
	end loop ;
END LOOP ;
INSERT INTO DRDIAGNOTABCOLCOL (egale_ratio, sup_ratio, inf_ratio)
			select 
			sum(case when compare = '=' then 1 else 0 end)/count(*) as eg,
			sum(case when compare = '>' then 1 else 0 end)/count(*) as sup,
			sum(case when compare = '<' then 1 else 0 end)/count(*) as inf
			from DRdiagnotabcolcol ;	
END;
/

EXEC INSERT_DIAGNOTABCOLCOL('DATASOURCE');
-- Trouver le type sémantique 

-- procedure qui trouve le type sémantique de chaque colonne d'une table ET L'INSERE DANS DRDIAGOTAB 
/*
CREATE OR REPLACE PROCEDURE INSERT_DIAGNOTAB_TYPE (tab VARCHAR2) IS
query1 varchar(1000);
query2 varchar(1000);
query3 varchar(1000);
query4 varchar(1000);
CURSOR CUR IS
SELECT nom_col from intermediaire ;
col_courrante varchar (50) ;

BEGIN   

 query1 := 'insert into intermediaire (nom_col) SELECT column_name FROM USER_TAB_COLUMNS
									WHERE table_name =  '''||tab ||''' ';
 execute immediate query1  ;

 open CUR ;
LOOP
    FETCH CUR INTO col_courrante ;
    EXIT WHEN CUR%NOTFOUND;
    query3 := ' insert into DRdiagnotab (type_semantique) values
		select CASE 
			WHEN exists (SELECT 1 FROM '||tab ||' WHERE REGEXP_LIKE ('|| col_courrante ||', ''^[A-Za-z0-9]+$'')) then
			''VARCHAR'' 
			WHEN exists (SELECT 1 FROM '||tab ||' WHERE REGEXP_LIKE ('|| col_courrante ||', ''^[[:digit:]]+$'')) then
			''NUMBER'' 
			when regexp_instr('|| col_courrante ||', ''^\d/\d/\d{4}$'') = 1 then
        		  ''date''
       			  when regexp_instr('|| col_courrante ||', ''^\d{2}/\d/\d{4}$'') = 1 then
       			   ''date''
      			   when regexp_instr('|| col_courrante ||', ''^\d/\d{2}/\d{4}$'') = 1 then
      			    ''date''
     			    when regexp_instr('|| col_courrante ||', ''^\d{2}/\d{2}/\d{4}$'') = 1 then
     			     ''date''
			END from '||tab ;
	--DBMS_OUTPUT.PUT_LINE( query3 ) ;
	execute immediate query3 ;
 END LOOP; 
  CLOSE CUR;
    query4 := ' delete from intermediaire ' ;
	execute immediate query4 ;

END;
/

*/




CREATE OR REPLACE PROCEDURE INSERT_DIAGNOTAB_TYPE (tab VARCHAR2) IS
query1 varchar(1000);
query2 varchar(1000);
query3 varchar(1000);
query4 varchar(1000);
nombredata number;
nombremail number;
nombretel number;
nombretaille number;
nombrepoids number;
semantique varchar(50);
nombremax number;
CURSOR CUR IS
SELECT nom_col from intermediaire ;
col_courrante varchar (50) ;

BEGIN   

 query1 := 'insert into intermediaire (nom_col) SELECT column_name FROM USER_TAB_COLUMNS
									WHERE table_name =  '''||tab ||''' ';
 execute immediate query1  ;

open CUR ;
LOOP
    FETCH CUR INTO col_courrante ;
    EXIT WHEN CUR%NOTFOUND;
	execute immediate 'select count('|| col_courrante ||') from '||tab ||' where REGEXP_LIKE('|| col_courrante ||',''^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012]|janvier|février|mars|mars|avril|mai|juin|juillet|aout|septembre|octobre|novembre|décembre)[- /.](19|20)\d\d$'')' into nombredata;
	--DBMS_OUTPUT.PUT_LINE( query3 ) ;
	--execute immediate query3 ;
	execute immediate 'select count('|| col_courrante ||') from '||tab ||' where REGEXP_LIKE('|| col_courrante ||',''^[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'')' into nombremail;
	execute immediate 'select count('|| col_courrante ||') from '||tab ||' where REGEXP_LIKE(REPLACE('|| col_courrante ||','' '',''''),''^((([\+]|[0]{2})([1-9]{3}|[1-9]{2}))|([0]))[1-9]([0-9]{8}|[0-9]{7})$'')' into nombretel;
	execute immediate 'select count('|| col_courrante ||') from '||tab ||' where REGEXP_LIKE(REPLACE('|| col_courrante ||','' '',''''),''^[[:digit:],]+(m|cm|mm|km|dm)$'')' into nombretaille;
	execute immediate 'select count('|| col_courrante ||') from '||tab ||' where REGEXP_LIKE(REPLACE('|| col_courrante ||','' '',''''),''^[[:digit:],]+(g|kg|cg|dg|mg)$'')' into nombrepoids;
	
	semantique :='';
	nombremax := 0; 
	IF nombredata > nombremax THEN 
	semantique := 'DATE';
	nombremax := nombredata;
	END IF;
	IF nombremail > nombremax THEN 
	semantique := 'MAIL';
	nombremax := nombremail;
	END IF;
	IF nombretel > nombremax THEN 
	semantique := 'TEL';
	nombremax := nombretel;
	END IF;	
	IF nombretaille > nombremax THEN 
	semantique := 'TAILLE';
	nombremax := nombretaille;
	END IF;	
	IF nombrepoids > nombremax THEN 
	semantique := 'POIDS';
	nombremax := nombrepoids;
	END IF;	
execute immediate 'update DRdiagnotab set type_semantique = '''||semantique||''' WHERE NOM_COLONNE = '''||col_courrante||'''' ;
 END LOOP; 
  CLOSE CUR;
    query4 := ' delete from intermediaire ' ;
	execute immediate query4 ;

END;
/

exec INSERT_DIAGNOTAB_TYPE('DATASOURCE');


select * from DRDIAGNOTAB;
select * from DRDIAGNOTABCOL;
select * from DRDIAGNOTABCOLCOL;
---CORRECTION DES DONNÉES

CREATE OR REPLACE PROCEDURE MAJ(tab varchar, COL varchar) IS
query varchar(500);
BEGIN
query := 'update '||tab||' set '||COL||'=upper('||COL||')';
execute immediate query   ;
END;
/

EXEC MAJ('datasource','NOM');
EXEC MAJ('datasource','PRENOM');
EXEC MAJ('datasource','VILNAIS');
EXEC MAJ('datasource','PAYSNAIS');
EXEC MAJ('datasource','GS');
EXEC MAJ('datasource','SEXE');

CREATE TABLE REGULAREXPRES
(
CATEGORY 								VARCHAR2(20), 
REGULAREXPR 							VARCHAR2(200),
CONSTRAINT PK_REGULAREXPRES				PRIMARY KEY(CATEGORY),
CONSTRAINT CK_REGULAREXPRES_CATEGORY	CHECK(CATEGORY = UPPER(CATEGORY))
);


INSERT INTO REGULAREXPRES VALUES
('MAIL','^[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$');
INSERT INTO REGULAREXPRES VALUES
('TELFR-I','^(([\+]|[0]{2})([3]{2}))[1-9]([0-9]{8})$');
INSERT INTO REGULAREXPRES VALUES
('TELFR','^[0][1-9][0-9]{8}$');
INSERT INTO REGULAREXPRES VALUES
('TELBE-I', '^(([\+]|[0]{2})[3][2])[4]([5-9]{1})([0-9]{7})$');
INSERT INTO REGULAREXPRES VALUES
('TELBE', '^[0][4]([5-9]{1})([0-9]{7})$');
INSERT INTO REGULAREXPRES VALUES
('TELTN-I', '^(([\+]|[0]{2})[2][1][6])[1-9]([0-9]{7})$');
INSERT INTO REGULAREXPRES VALUES
('TELTN', '^[0][1-9]([0-9]{7})$');
INSERT INTO REGULAREXPRES VALUES
('DATEFR', '^(([0-2][0-9]|3[0-1])/(0[0-9]|1[0-2])/[0-9]{4})$');
INSERT INTO REGULAREXPRES VALUES
('DATEAM', '^((0[0-9]|1[0-2])/([0-2][0-9]|3[0-1])/[0-9]{4})$');
INSERT INTO REGULAREXPRES VALUES
('ALPHABETIQUE', '^[[:alpha:] ]+$');
INSERT INTO REGULAREXPRES VALUES
('NUMERIQUE', '^[[:digit:]]+$');
INSERT INTO REGULAREXPRES VALUES
('TEMPERATURECF', '^[-[:digit:].°C]+$');
INSERT INTO REGULAREXPRES VALUES 
('MADEMOISELLE', 'MADEMOISELLE|MLLE|Mademoiselle|MADEMoiselle|Miss|MISS');
INSERT INTO REGULAREXPRES VALUES 
('MADAME', 'MADAME|MAdame|Mme|MME|Madam|MADAM|MaDAm|Mrs|MRS');
INSERT INTO REGULAREXPRES VALUES 
('MONSIEUR', 'MONSIEUR|MR|M\.|Sir|SIR|Mr\.');
INSERT INTO REGULAREXPRES VALUES 
('FEMALE', 'Femme|FEMME|Femelle|F|Woman|Wife|Female');
INSERT INTO REGULAREXPRES VALUES 
('MALE', 'Homme|HOMME|Male|MALe|M|H|MAN|Man|Male|MALe');
INSERT INTO REGULAREXPRES VALUES 
('BLOODGROUP', 'A-|A+|B-|B+|AB-|AB+|O-|O+');
--regular expression poids et taille
INSERT INTO REGULAREXPRES VALUES 
('TAILLE', '^[[:digit:],.cdkm]+$');
INSERT INTO REGULAREXPRES VALUES 
('POIDS', '^[[:digit:],.gkdm]+$');

alter table datasource
add taillevalid number;

CREATE OR REPLACE PROCEDURE corrtaille(p_table IN varchar2,p_colonne IN varchar2)
AUTHID CURRENT_USER IS
BEGIN
EXECUTE IMMEDIATE 'update '||p_table||' set '||p_colonne||'=replace('||p_colonne||','','',''.'')';
EXECUTE IMMEDIATE 'update '||p_table||' set taillevalid= 
(case when instr('||p_colonne||' ,''mm'')>0 then cast(substr('||p_colonne||',1,instr('||p_colonne||',''mm'')-1) as number)*0.001 
when instr('||p_colonne||',''cm'')>0 then cast(substr('||p_colonne||',1,instr('||p_colonne||',''cm'')-1) as number)*0.01
when instr('||p_colonne||',''dm'')>0 then cast(substr('||p_colonne||',1,instr('||p_colonne||',''dm'')-1) as number)*0.1
when instr('||p_colonne||',''km'')>0 then cast(substr('||p_colonne||',1,instr('||p_colonne||',''km'')-1) as number)*1000
when instr('||p_colonne||',''m'')>0 then cast(substr('||p_colonne||',1,instr('||p_colonne||',''m'')-1) as number)*1
end from '||p_table||' p  where p.'||p_colonne||'='||p_table||'.'||p_colonne||' )';

END;
/
exec corrtaille('DATASOURCE','TAILLE');

alter table datasource
add poidsvalid number;

CREATE OR REPLACE PROCEDURE corrpoids(p_table IN varchar2,p_colonne IN varchar2)
AUTHID CURRENT_USER IS
BEGIN
EXECUTE IMMEDIATE 'update '||p_table||' set '||p_colonne||'=replace('||p_colonne||','','',''.'')';
EXECUTE IMMEDIATE 'update '||p_table||' set poidsvalid= 
(case when instr('||p_colonne||' ,''mg'')>0 then cast(substr('||p_colonne||',1,instr('||p_colonne||',''mg'')-1) as number)*0.001 
when instr('||p_colonne||',''cg'')>0 then cast(substr('||p_colonne||',1,instr('||p_colonne||',''cg'')-1) as number)*0.01
when instr('||p_colonne||',''dg'')>0 then cast(substr('||p_colonne||',1,instr('||p_colonne||',''dg'')-1) as number)*0.1
when instr('||p_colonne||',''kg'')>0 then cast(substr('||p_colonne||',1,instr('||p_colonne||',''kg'')-1) as number)*1000
when instr('||p_colonne||',''g'')>0 then cast(substr('||p_colonne||',1,instr('||p_colonne||',''g'')-1) as number)*1
end from '||p_table||' p  where p.'||p_colonne||'='||p_table||'.'||p_colonne||' )';

END;
/
exec corrpoids('DATASOURCE','POIDS');

-- convertir la taille
create or replace function convertTailleToM(TAILLE IN varchar) 
return number IS
    BEGIN
	if instr(TAILLE ,'mm')> 0 then 
		return(cast(substr(TAILLE,1,instr(TAILLE,'mm')-1) as number)*0.001);
	elseif instr(TAILLE ,'cm')> 0 then 
		return(cast(substr(TAILLE,1,instr(TAILLE,'cm')-1) as number)*0.01);
	elseif instr(TAILLE ,'dm')> 0 then 
		return(cast(substr(TAILLE,1,instr(TAILLE,'dm')-1) as number)*0.1);
	elseif instr(TAILLE ,'km')> 0 then 
		return(cast(substr(TAILLE,1,instr(TAILLE,'km')-1) as number)*1000);
	elseif instr(TAILLE ,'m')> 0 then 
		return(cast(substr(TAILLE,1,instr(TAILLE,'m')-1) as number)*1);
    END;
/



-- convertir le poids
create or replace function convertPOIDToMg(num IN number,mesure IN varchar) 
return number IS
    BEGIN
        if mesure='kg' then 
            return(num*1000000);
        end if;
        if mesure='hg' then 
            return(num*100000);
        end if;
        if mesure='dag' then 
            return(num*10000);
        end if;
        if mesure='g' then 
            return(num*1000);
        end if;
        if mesure='dg' then 
            return(num*100);
        end if;
        if mesure='cg' then 
            return(num*10);
        end if;
        if mesure='mg' then
            return(num);
        end if;
        return num;
        
    END;
/



--====  3 ===========================================================================

-- Dans l'exemble d'application traité en cours-TD-TP "GEStion COMmerciale"
-- Les villes & les pays des clients et des magasins peuvent consituer de nouvelles données 
-- qui permettraient d'enrichir le dicionnaire de données DDVS (Data Dictionnary for Valid Strings) utilisé pour corriger des anomalies
-- Proposez une métthode d'enrichissement de ce dictionnaire et développez le script sql correspondant

--====  4 ===========================================================================

--====  4 ===========================================================================

-- Dans l'exemble d'application traité en cours-TD-TP "GEStion COMmerciale"
-- Le schéma, relationnel, de la BD GESCOM 
-- est composé de plusieurs tables et leurs dérivés : CLIENTS, COMMANDES, ARTICLES, DETAILSCOM, MAGASINS...

-- Détaillez la manière de définir un nouveau schéma cible-destination (dit schéma en étoile) extrait depuis toutes les sources
-- Celui-ci permet de faire des croisements-analyses-extractions-exploitations des données tel que celui des ventes par rapport 
-- aux articles, aux magasins, aux clients et à la dimension temps...


--le schéma en étoile




--le schéma global

drop  table bigtable;
create table bigtable as (
select c.ADRCLI,
m.ADRCPMAG,
m.ADRNUMMAG,
m.ADRPAYSMAG,
m.ADRRUEMAG,
m.ADRVILLEMAG,
c.CATCLI,
c.CIVCLI,
c.CODCLI,
c.CPCLI,
c.MAILCLI,
a.NOMART,
c.NOMCLI,
m.NOMMAG,
d.NUMCOM,
m.NUMMAG,
a.PAART,
c.PAYSCLI,
c.PRENCLI,
d.PUART,
a.PVART,
a.QSART,
d.QTCOM,
d.REFART,
d.REMISE,
c.TELCLI,
m.TELMAG,
c.VILCLI
from clients c join commandes cmd on c.codcli=cmd.codcli
join detailcom d on d.numcom=cmd.numcom
join articles a on a.refart=d.refart
join magasins m on m.nummag=c.magasin);


-- Comparez le avec le schéma global qui regroupe toutes les tables (l'Union-l'Intégration de toutes les tables de toutes les BD)

--table MAGASIN deja existante on va juste le réutilisée
/*CREATE TABLE MAGASINS
(
	NUMMAG		VARCHAR(4),
	NOMMAG		CHAR(50),
	TELMAG		CHAR(15),
	ADRNUMMAG	VARCHAR2(10),
	ADRRUEMAG	VARCHAR2(50),
	ADRCPMAG	VARCHAR2(10),
	ADRVILLEMAG	VARCHAR2(50),
	ADRPAYSMAG	VARCHAR2(50),      
   	CONSTRAINT PK_MAGASINS 				PRIMARY KEY(NUMMAG),
	CONSTRAINT NN_MAGASINS_NOMMAG		CHECK(NOMMAG IS NOT NULL),
	CONSTRAINT CK_MAGASINS_ADRVILLEMAG	CHECK(ADRVILLEMAG = UPPER(ADRVILLEMAG)),
	CONSTRAINT CK_MAGASINS_ADRPAYSMAG	CHECK(ADRPAYSMAG = UPPER(ADRPAYSMAG))
);*/


drop table DIMARTICLES;

CREATE TABLE DIMARTICLES
(
	REFART 		VARCHAR2(10), 
	NOMART 		VARCHAR2(50),
	PVART 		NUMBER(10, 2),
	QSART 		NUMBER(3),
	PAART 		NUMBER(10, 2),
	CONSTRAINT PK_ARTICLES2 		PRIMARY KEY(REFART)
);
insert into DIMARTICLES (select * from ARTICLES);


DROP TABLE DIMTEMPS;
CREATE TABLE DIMTEMPS
(
	IDTEMPS 	VARCHAR2(10),
	ANNEET 		NUMBER(20),
	MOIST 		NUMBER(20),
	JOURT 		NUMBER(20),
	CONSTRAINT PK_COMMANDES 		PRIMARY KEY(IDTEMPS),
	CONSTRAINT NN_COMMANDES_DATCOM 		CHECK(ANNEET IS NOT NULL)
);

INSERT INTO DIMTEMPS 
(SELECT NUMCOM as IDTEMPS,extract(YEAR FROM TO_DATE(DATCOM, 'DAY DD-MONTH-YYYY')),
extract(MONTH FROM TO_DATE(DATCOM, 'DAY DD-MONTH-YYYY')),
extract(DAY FROM TO_DATE(DATCOM, 'DAY DD-MONTH-YYYY')) from commandes);


DROP TABLE DIMCLIENTS;
CREATE TABLE DIMCLIENTS
(
	CODCLI 	 		VARCHAR2(10), 
	CIVCLI 	 		VARCHAR2(12),
	NOMCLI 	 		VARCHAR2(20),
	PRENCLI 	 		VARCHAR2(20),
	CATCLI 	 		NUMBER(1),
	ADRCLI 	 		VARCHAR2(50),
	CPCLI 	 		VARCHAR2(10),
	VILCLI 	 		VARCHAR2(20),
	PAYSCLI 	 		VARCHAR2(30),
	MAILCLI 	 		VARCHAR2(30),
	TELCLI 	 		VARCHAR2(20),
	CONSTRAINT PK_CLIENTS2 	 		PRIMARY KEY(CODCLI)
);

INSERT INTO DIMCLIENTS
(SELECT  
 CODCLI,
 CIVCLI,
 NOMCLI,
 PRENCLI,
 CATCLI,
 ADRCLI,
 CPCLI,
 VILCLI, PAYSCLI,
 MAILCLI,
 TELCLI 	
 from CLIENTS);
--NOTRE TABLE DE FAIT EST LA SUIVANTE															
drop TABLE DETAILCOMMANDES;
CREATE TABLE DETAILCOMMANDES
(	
	NUMCOM 	 		VARCHAR2(10), 
	REFART 	 		VARCHAR2(10),
	IDTEMPS 	 		VARCHAR2(10),
	NUMMAG 	 		VARCHAR(4),
	CODCLI 	 		VARCHAR2(10), 
	QTCOM 	 		NUMBER(3),
	PUART 	 		NUMBER(10, 2),
	REMISE 	 		NUMBER(4, 2),
	CONSTRAINT PK_DETAILCOM2 	 		PRIMARY KEY(NUMCOM, REFART, IDTEMPS, NUMMAG, CODCLI),
	CONSTRAINT FK_DETAILCOM_REF_ARTICLES1 	 		FOREIGN KEY(REFART)	 		REFERENCES DIMARTICLES(REFART),
	CONSTRAINT FK_DETAILCOM_IDT_DIMTEMPS1 	 		FOREIGN KEY(IDTEMPS)	 		REFERENCES DIMTEMPS(IDTEMPS),
	CONSTRAINT FK_DETAILCOM_NUMa_MAGASINS1 	 		FOREIGN KEY(NUMMAG)	 		REFERENCES MAGASINS(NUMMAG),
	CONSTRAINT FK_DETAILCOM_CODc_DIMCLIENTS1 	 	FOREIGN KEY(CODCLI)	 		REFERENCES DIMCLIENTS(CODCLI)
);

ALTER TABLE CLIENTS
ADD  	MAGASIN VARCHAR(20); 
update clients
set MAGASIN='FR01';

insert into DETAILCOMMANDES
select  cmd.NUMCOM , 
	a.REFART,
	t.IDTEMPS,
	m.NUMMAG,
	c.CODCLI, 
	d.QTCOM,
	d.PUART,
	d.REMISE from clients c join commandes cmd on c.codcli=cmd.codcli
join detailcom d on d.numcom=cmd.numcom
join articles a on a.refart=d.refart
join magasins m on m.nummag=c.magasin
join DIMTEMPS t on t.IDTEMPS=cmd.NUMCOM;


--EXPLOITATION DU SHCEMA EN ETOILE POUR EXPLORER LE CA
--analyse CA sur l'annee 2005

select t.ANNEET,sum((d.QTCOM*d.PUART*(1-(d.REMISE/100)))) as CA from DETAILCOMMANDES d join DIMTEMPS t ON t.IDTEMPS=d.IDTEMPS
where t.anneet='2005'
group by t.anneet;




--====  5 ===========================================================================

-- N'oubliez pas, si vous le souhaitez, d'envoyer la version définitive (G-Bxy) de tous vos travaux avant le jj-décembre 2018

--====  FB ===========================================================================
--====  FB ===========================================================================


