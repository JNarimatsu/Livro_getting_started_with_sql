--selecionando registros do ano de 2010
SELECT * FROM station_data
WHERE year = 2010;

--Selecionando registros de todos os anos que não sejam 2010
SELECT * FROM station_data
WHERE year != 2010;
--SELECT * FROM station_data
--WHERE year <> 2010

--Selecionando intervalos: selecionando registros entre os anos 2005 e 2010
SELECT * FROM station_data
WHERE year BETWEEN 2005 AND 2010;

--Selecionando registros com ano maior ou ingual a 2005 e menor ou igual a 2010
SELECT * FROM station_data
WHERE year >= 2005 AND year <=2010;

--REGISTROS DOS MESES 3, 6, 9, 12.
SELECT * FROM STATION_DATA
WHERE MONTH IN (3, 6, 9, 12);
--OU
SELECT * FROM STATION_DATA
WHERE MONTH % 3 = 0;

--REGISTROS QUE NÃO SEJAM DOS MESES 3, 6, 9, 12.
SELECT * FROM STATION_DATA
WHERE MONTH NOT IN (3, 6, 9, 12);

--SELECIONANDO REGISTRO PELO SEU CODIGO DE RELATÓRIO
SELECT * FROM STATION_DATA
WHERE REPORT_CODE IN ('513A63', '1F8A7B', 'EF616A');

--VERIFICANDO SE EXISTE ALGUM REPORT_CODE QUE NÃO TENHA 6 CARACTERES
SELECT * FROM STATION_DATA
WHERE LENGTH (REPORT_CODE) != 6;

--SELECIONAR TODOS OS REGISTROS QUE COMEÇAM COM A LETRA "A"
SELECT * FROM STATION_DATA
WHERE REPORT_CODE LIKE 'A%';

--SELECIONANDO REGSITROS COM 'B' COMO PRIMEIRO CARACTERE E 'C' COMO TERCEIRO CARACTERE
SELECT * FROM STATION_DATA
WHERE REPORT_CODE LIKE 'B_C%';

-- O SQLITE NÃO PERMITE O USO DE TRUE OU FALSE, PARA VALORES BOLEANOS, NO CASO DO SQLITE UTILIZA-SE 1 PARA VERDADEIRO E 0 PARA FALSO
-- SELECIONANDO REGISTROS ONDE TIVEMOS TORNADO E GRANIZO
SELECT * FROM STATION_DATA
WHERE TORNADO = 1 AND HAIL = 1;

--VALORES NULOS NÃO PODEM SER DETERMINADOS COM '='. É NECESSÁRIO USAR AS INSTRUÇÕES  IS NULL OU IS NOT NULL PARA IDENTIFICAR VALORES NULOS
SELECT * FROM STATION_DATA
WHERE SNOW_DEPTH IS NULL;

--VERIFICAND VALORES NÃO NULOS
SELECT * FROM STATION_DATA
WHERE SNOW_DEPTH IS NOT NULL;

--cONSULTANDO REGISTROS EM QUE A PRECIPTAÇÃO É MENOR QUE 0,5 INCLUINDO OS NULOS
SELECT * FROM STATION_DATA
WHERE PRECIPITATION IS NULL OR PRECIPITATION <=0.5;
--cONSULTANDO REGISTROS EM QUE A PRECIPTAÇÃO É MENOR QUE 0,5 EXCLUINDO OS NULOS
SELECT * FROM STATION_DATA
WHERE PRECIPITATION IS NOT NULL OR PRECIPITATION <=0.5;

--TRATANDO NULOS COMO '0'
SELECT * FROM STATION_DATA
WHERE COALESCE(PRECIPITATION, 0) <= 0.5;

--Utilizando coalesce() junto com o SELECT para placeholder no lugar dos valores nulos
SELECT REPORT_CODE, COALESCE(PRECIPITATION, 0) AS RAINFALL
FROM STATION_DATA;

--cONSULTAR REGISTROS COM CHUVA E TEMPERATURA MAIOR OU IGUAL A 32  OU COM PROFUNDIDADE DA NEVE MAIOR QUE 0
SELECT * FROM STATION_DATA
WHERE (RAIN = 1 AND TEMPERATURE <=32)
OR SNOW_DEPTH > 0;