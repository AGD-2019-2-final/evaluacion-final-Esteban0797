-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
lines = LOAD 'data.tsv' AS (c1:CHARARRAY, c2:BAG{l:TUPLE(sl:CHARARRAY)}, c3:MAP[]);
columnas = FOREACH lines GENERATE c1, COUNT(c2) AS cc2, SIZE(c3) AS cc3;
ordered_columnas = ORDER columnas BY c1, cc2, cc3;
STORE ordered_columnas INTO 'output' USING PigStorage(',');