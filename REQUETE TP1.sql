-- TP1 OPTIMISATION 
-- 1 les bases installées sur le serveur 
SELECT datname, datdba, encoding,pg_encoding_to_char(encoding) AS encodage ,datistemplate FROM pg_database;

-- 2 es comptes présents sur le serveur
SELECT rolname, rolsuper, rolcreatedb, rolcanlogin
FROM pg_roles;
-- 3 Quels comptes peuvent créer des bases
SELECT rolname, rolsuper, rolcreatedb, rolcanlogin
FROM pg_roles WHERE rolcreatedb = 'true';
-- 4 comptes sont actuellement connectés au serveur
SELECT datname, usename, client_addr, state
FROM pg_stat_activity;

-- 5. Comptes connectés sur plus de deux bases distinctes
SELECT usename, COUNT(DISTINCT datname) AS nb_bases
FROM pg_stat_activity
GROUP BY usename
HAVING COUNT(DISTINCT datname) > 2;

-- 6. Comptes connectés sur une base qui n’est pas la leur (hors postgres)
SELECT usename, datname
FROM pg_stat_activity
WHERE datname NOT IN ('postgres') 
  AND usename <> datname;

-- 7. Nombre de connexions simultanées autorisées pour le compte m1user3_n
SELECT rolname, rolconnlimit
FROM pg_roles
WHERE rolname = 'm1user3_n';

-- 8. Nombre de connexions simultanées autorisées sur la base m1_circuit_n
SELECT datname, datconnlimit
FROM pg_database
WHERE datname = 'm1_circuit_n';

-- 9. Contraintes de domaine des attributs des tables de la base
SELECT table_name, column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_schema = 'public';

-- 10a. Taille du cache mémoire
SHOW shared_buffers;

-- 10b. Taille maximale des noms des attributs
SHOW max_identifier_length;

-- 10c. Fuseau horaire utilisé par le serveur
SHOW TimeZone;

-- 10d. Temps au bout duquel un deadlock est identifié
SHOW deadlock_timeout;

-- 10e. Nombre maximal de connexions simultanées sur le serveur
SHOW max_connections;

-- 11a. Triggers présents dans la base
SELECT trigger_name, event_object_table, event_manipulation, action_statement
FROM information_schema.triggers
WHERE trigger_schema = 'public';

-- 11b. Droits (privilèges) des différents utilisateurs sur les tables de la base
SELECT grantee, privilege_type, table_name
FROM information_schema.role_table_grants
WHERE table_schema = 'public';

SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_schema = 'public'  -- pour ton schéma principal
  AND table_type = 'BASE TABLE';  -- uniquement les tables (pas les vues)
SELECT * FROM reservation;