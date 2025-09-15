-- TP1 OPTIMISATION 
-- 1 les bases installées sur le serveur 
SELECT datname, datdba, encoding,pg_encoding_to_char(encoding) AS encodage ,datistemplate FROM pg_database;

