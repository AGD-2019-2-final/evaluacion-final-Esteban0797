-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
lines = LOAD 'data.tsv' AS (f1:CHARARRAY, f2:BAG{l:TUPLE(sl:CHARARRAY)}, f3:MAP[]);
split_columna = FOREACH lines GENERATE FLATTEN(f3) AS (key:CHARARRAY);
group_columna = GROUP split_columna BY key;
result = FOREACH group_columna GENERATE group, COUNT(split_columna);
STORE result INTO 'output' USING PigStorage(',');