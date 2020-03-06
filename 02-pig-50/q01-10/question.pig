-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (C1:CHARARRAY,
        C2:CHARARRAY,
        C3:INT);

A = FOREACH u GENERATE C1 as word;

B = GROUP A BY word;

C = FOREACH B GENERATE group, COUNT(A);

STORE C INTO 'output';