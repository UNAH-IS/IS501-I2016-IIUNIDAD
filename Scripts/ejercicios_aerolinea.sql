--Mostrar para cada vuelo lo siguiente:
--Cantidad de tripulantes
--Cantidad de puntos o escalas
--Cantidad de Asientos
--Cantidad de Pasajeros que pagaron
--Monto total de los tickets vendidos del vuelo.
--Quien es el piloto de ese vuelo

--NO HACER CRUCES ENTRE VARIAS TABLAS INTERMEDIAS    
      
SELECT *
FROM TBL_VUELOS;

SELECT A.CODIGO_VUELO, 
      A.CANTIDAD_TRIPULANTES,
      B.CANTIDAD_PUNTOS,
      C.CANTIDAD_ASIENTOS,
      D.CANTIDAD_PASAJEROS,
      D.TOTAL,
      E.NOMBRE_PILOTO
FROM (
    SELECT CODIGO_VUELO, 
          COUNT(1) AS CANTIDAD_TRIPULANTES
    FROM TBL_TRIPULACION_X_VUELOS
    GROUP BY CODIGO_VUELO
) A
INNER JOIN (
    SELECT A.CODIGO_VUELO, 
          COUNT(1) CANTIDAD_PUNTOS
    FROM TBL_VUELOS A
    INNER JOIN TBL_RUTAS B
    ON (A.CODIGO_RUTA = B.CODIGO_RUTA)
    INNER JOIN TBL_PUNTOS_X_RUTAS C
    ON (B.CODIGO_RUTA = C.CODIGO_RUTA)
    GROUP BY A.CODIGO_VUELO
) B
ON (A.CODIGO_VUELO = B.CODIGO_VUELO)
INNER JOIN (
    SELECT A.CODIGO_VUELO, COUNT(1) CANTIDAD_ASIENTOS
    FROM TBL_VUELOS A
    INNER JOIN TBL_AVIONES B
    ON (A.CODIGO_AVION = B.CODIGO_AVION)
    INNER JOIN TBL_ASIENTOS C
    ON (B.CODIGO_AVION = C.CODIGO_AVION)
    GROUP BY A.CODIGO_VUELO
) C
ON (A.CODIGO_VUELO = C.CODIGO_VUELO)
INNER JOIN (
    SELECT CODIGO_VUELO, 
          COUNT(DISTINCT CODIGO_PASAJERO) AS CANTIDAD_PASAJEROS,
          SUM(COSTO_TICKET)-SUM(DESCUENTO) AS TOTAL
          --SUM(COSTO_TICKET-DESCUENTO) AS TOTAL
    FROM TBL_FACTURA_DETALLE
    GROUP BY CODIGO_VUELO
) D
ON (A.CODIGO_VUELO = D.CODIGO_VUELO)
INNER JOIN (
    SELECT  B.CODIGO_VUELO, 
            A.CODIGO_TRIPULANTE, 
            A.NOMBRE AS NOMBRE_PILOTO
    FROM TBL_TRIPULACION A
    INNER JOIN    TBL_TRIPULACION_X_VUELOS B
    ON (A.CODIGO_TRIPULANTE=B.CODIGO_TRIPULANTE)
    WHERE CODIGO_CARGO = 1
) E
ON (A.CODIGO_VUELO = E.CODIGO_VUELO);

SELECT CODIGO_VUELO, COUNT(1) AS CANTIDAD_TRIPULANTES
FROM TBL_TRIPULACION_X_VUELOS
GROUP BY CODIGO_VUELO;


        
SELECT A.CODIGO_VUELO, 
      COUNT(1) CANTIDAD_PUNTOS
FROM TBL_VUELOS A
INNER JOIN TBL_RUTAS B
ON (A.CODIGO_RUTA = B.CODIGO_RUTA)
INNER JOIN TBL_PUNTOS_X_RUTAS C
ON (B.CODIGO_RUTA = C.CODIGO_RUTA)
GROUP BY A.CODIGO_VUELO;

SELECT * 
FROM TBL_RUTAS;

SELECT *
FROM TBL_PUNTOS_X_RUTAS;

SELECT *
FROM TBL_PUNTO_ESCALA;


SELECT A.CODIGO_VUELO, COUNT(1) CANTIDAD_ASIENTOS
FROM TBL_VUELOS A
INNER JOIN TBL_AVIONES B
ON (A.CODIGO_AVION = B.CODIGO_AVION)
INNER JOIN TBL_ASIENTOS C
ON (B.CODIGO_AVION = C.CODIGO_AVION)
GROUP BY A.CODIGO_VUELO;

SELECT *
FROM TBL_ASIENTOS;

SELECT CODIGO_VUELO, 
      COUNT(DISTINCT CODIGO_PASAJERO) AS CANTIDAD_PASAJEROS
FROM TBL_FACTURA_DETALLE
GROUP BY CODIGO_VUELO;

SELECT *
FROM TBL_FACTURA_DETALLE;

SELECT  B.CODIGO_VUELO, 
        A.CODIGO_TRIPULANTE, 
        A.NOMBRE AS NOMBRE_PILOTO
FROM TBL_TRIPULACION A
INNER JOIN    TBL_TRIPULACION_X_VUELOS B
ON (A.CODIGO_TRIPULANTE=B.CODIGO_TRIPULANTE)
WHERE CODIGO_CARGO = 1;

SELECT *
FROM TBL_CARGOS_TRIPULANTES;
