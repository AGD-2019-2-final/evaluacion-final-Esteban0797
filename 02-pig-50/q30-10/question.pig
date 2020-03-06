-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el codigo en Pig para manipulación de fechas que genere la siguiente
-- salida.
-- 
--    1971-07-08,08,8,jue,jueves
--    1974-05-23,23,23,jue,jueves
--    1973-04-22,22,22,dom,domingo
--    1975-01-29,29,29,mie,miercoles
--    1974-07-03,03,3,mie,miercoles
--    1974-10-18,18,18,vie,viernes
--    1970-10-05,05,5,lun,lunes
--    1969-02-24,24,24,lun,lunes
--    1974-10-17,17,17,jue,jueves
--    1975-02-28,28,28,vie,viernes
--    1969-12-07,07,7,dom,domingo
--    1973-12-24,24,24,lun,lunes
--    1970-08-27,27,27,jue,jueves
--    1972-12-12,12,12,mar,martes
--    1970-07-01,01,1,mie,miercoles
--    1974-02-11,11,11,lun,lunes
--    1973-04-01,01,1,dom,domingo
--    1973-04-29,29,29,dom,domingo
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
date_results = FOREACH u GENERATE birthday, ToString(ToDate(birthday,'yyyy-MM-dd', 'America/Bogota'), 'yyyy-MM-E') AS birthday2, ToDate(birthday,'yyyy-MM-dd') AS birthday3;
results = FOREACH date_results GENERATE 
    birthday AS date1,
    (
        CASE SIZE((CHARARRAY)GetDay(birthday3)) 
            WHEN 1 THEN CONCAT('0', (CHARARRAY)GetDay(birthday3))
            WHEN 2 THEN (CHARARRAY)GetDay(birthday3)
            ELSE (CHARARRAY)GetDay(birthday3)
        END
    ) AS date3,
    (CHARARRAY)GetDay(birthday3) AS date4,
    (
        CASE REGEX_EXTRACT(birthday2, '(.*)-(.*)-(.*)', 3)
            WHEN 'Mon' THEN 'lun,lunes'
            WHEN 'Tue' THEN 'mar,martes'
            WHEN 'Wed' THEN 'mie,miercoles'
            WHEN 'Thu' THEN 'jue,jueves'
            WHEN 'Fri' THEN 'vie,viernes'
            WHEN 'Sat' THEN 'sab,sabado'
            WHEN 'Sun' THEN 'dom,domingo'
        END
    ) AS date2;
results = FOREACH results GENERATE CONCAT(date1, ',', date3, ',', date4, ',', date2);
STORE results INTO 'output';
