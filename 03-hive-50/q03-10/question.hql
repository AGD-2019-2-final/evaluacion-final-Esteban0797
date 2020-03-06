-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
-- de la tercera columna.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
DROP TABLE IF EXISTS datos;
CREATE TABLE datos (letra STRING, fecha STRING, numero INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
TBLPROPERTIES ("skip.header.line.count"="-1");
LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE datos;
DROP TABLE IF EXISTS datosd;
CREATE TABLE datosd AS SELECT numero FROM datos GROUP BY numero;
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT * FROM datosd ORDER BY numero LIMIT 5;