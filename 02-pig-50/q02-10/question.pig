-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba el codigo del mapper a partir de este punto <<<
-- 
L = LOAD 'data.tsv' USING PigStorage('\t')
    AS (C1:CHARARRAY, C2:CHARARRAY, C3:INT);
A = ORDER L BY C1, C3;
STORE A INTO 'output';

