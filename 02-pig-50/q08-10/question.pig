-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
U = LOAD 'data.tsv' USING PigStorage('\t')
    AS (C1:CHARARRAY,
        C2:BAG{Tuple()},
        C3:MAP[CHARARRAY]);
A = FOREACH U GENERATE C2,KEYSET(C3);
B = FOREACH A GENERATE FLATTEN($0), FLATTEN($1);
C = GROUP B BY ($0,$1);
D = FOREACH C GENERATE $0, SIZE($1);
STORE D INTO 'output';