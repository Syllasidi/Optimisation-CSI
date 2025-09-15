-- TP1 OPTIMISATION 
-- 1 les bases installées sur le serveur 
SELECT datname, datdba, encoding,pg_encoding_to_char(encoding) AS encodage ,datistemplate FROM pg_database;

-- 2 es comptes présents sur le serveur
SELECT rolname, rolsuper, rolcreatedb, rolcanlogin
FROM pg_roles;
