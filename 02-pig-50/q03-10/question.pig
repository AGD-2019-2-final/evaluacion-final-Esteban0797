-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
U = LOAD 'data.tsv' USING PigStorage('\t')
    AS (C1:CHARARRAY, C2:CHARARRAY, C3:INT);

A = FOREACH U GENERATE C3;

B = ORDER A BY C3;

C = LIMIT B 5;

STORE C INTO 'output';