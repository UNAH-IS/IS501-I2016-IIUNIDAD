SET SERVEROUTPUT ON;
DECLARE
  V_NOMBRE TBL_PASAJEROS.NOMBRE%TYPE;
  V_APELLIDO TBL_PASAJEROS.APELLIDO%TYPE;
BEGIN
  SELECT NOMBRE
  INTO V_NOMBRE
  FROM TBL_PASAJEROS
  WHERE CODIGO_PASAJERO = 1;
  
  DBMS_OUTPUT.PUT_LINE(V_NOMBRE);
END;


DECLARE
  TYPE TP_PASAJERO IS RECORD (
    NOMBRE TBL_PASAJEROS.NOMBRE%TYPE,
    APELLIDO TBL_PASAJEROS.APELLIDO%TYPE
  );
  V_PASAJERO TP_PASAJERO;
  /*V_NOMBRE_VARIABLE TIPO:=VALOR;
  V_NOMBRE VARCHAR2(200):='jUAN';*/
BEGIN
  V_PASAJERO.NOMBRE := 'Matusalen';
  V_PASAJERO.APELLIDO := 'PEREZ';
  DBMS_OUTPUT.PUT_LINE(
    V_PASAJERO.NOMBRE||' '||
    V_PASAJERO.APELLIDO);
    
  ---------------------
  SELECT NOMBRE, APELLIDO
  INTO V_PASAJERO
  FROM TBL_PASAJEROS
  WHERE CODIGO_PASAJERO = 1;
  DBMS_OUTPUT.PUT_LINE(
    V_PASAJERO.NOMBRE||' '||
    V_PASAJERO.APELLIDO);
END;




DECLARE
  V_PASAJERO TBL_PASAJEROS%ROWTYPE;
BEGIN
  SELECT CODIGO_PASAJERO, NOMBRE, APELLIDO, EDAD, GENERO
  INTO V_PASAJERO
  FROM TBL_PASAJEROS
  WHERE CODIGO_PASAJERO = 1;
  
  DBMS_OUTPUT.PUT_LINE(
    V_PASAJERO.NOMBRE||' '||
    V_PASAJERO.APELLIDO|| '('||V_PASAJERO.EDAD||')');
END;




SELECT *
FROM TBL_PASAJEROS;