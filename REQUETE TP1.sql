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

