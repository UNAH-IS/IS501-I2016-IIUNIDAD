--Mostrar la cantidad de empleados por departamento.

--NVL verifica si el primer parametro es nulo, en caso de 
--ser asi, sustuye el valor por el segundo parametro.
SELECT  A.DEPARTMENT_ID, 
        NVL(B.DEPARTMENT_NAME,'Ninguno') as DEPARTMENT_NAME, 
        COUNT(1) AS CANTIDAD_EMPLEADOS
FROM EMPLOYEES A
LEFT JOIN DEPARTMENTS B
ON (A.DEPARTMENT_ID = B.DEPARTMENT_ID)
GROUP BY A.DEPARTMENT_ID, NVL(B.DEPARTMENT_NAME,'Ninguno')
ORDER BY DEPARTMENT_NAME;

--Mostrar los departamentos que tienen mas de 5 empleados, 
--para dichos departamentos mostrar la cantidad de empleados
-- y el salario invertido por cada departamento.

SELECT  A.DEPARTMENT_ID, 
        NVL(B.DEPARTMENT_NAME,'Ninguno') as DEPARTMENT_NAME, 
        COUNT(1) AS CANTIDAD_EMPLEADOS,
        SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES A
LEFT JOIN DEPARTMENTS B
ON (A.DEPARTMENT_ID = B.DEPARTMENT_ID)
GROUP BY A.DEPARTMENT_ID, NVL(B.DEPARTMENT_NAME,'Ninguno')
HAVING COUNT(1)>5
ORDER BY DEPARTMENT_NAME;

--Mostrar el salario total por cada region sin perder ningun centavo.
SELECT NVL(E.REGION_NAME,'NO ASIGNADO') AS REGION_NAME, 
      SUM(A.SALARY)
FROM EMPLOYEES A
LEFT JOIN DEPARTMENTS B
ON (A.DEPARTMENT_ID = B.DEPARTMENT_ID)
LEFT JOIN LOCATIONS C
ON (B.LOCATION_ID = C.LOCATION_ID)
LEFT JOIN COUNTRIES D
ON (C.COUNTRY_ID = D.COUNTRY_ID)
LEFT JOIN REGIONS E
ON (D.REGION_ID = E.REGION_ID)
GROUP BY NVL(E.REGION_NAME,'NO ASIGNADO');

--Mostrar los empleados con su nombre completo y con la 
-- cantidad de puestos en los que han estado sin tomar en cuenta el puesto actual
SELECT A.EMPLOYEE_ID, 
      FIRST_NAME || ' ' || LAST_NAME AS NOMBRE_COMPLETO,
      COUNT(1) CANTIDAD_PUESTOS_ANTERIORES
FROM EMPLOYEES A
INNER JOIN JOB_HISTORY  B
ON (A.EMPLOYEE_ID = B.EMPLOYEE_ID)
GROUP BY A.EMPLOYEE_ID, 
      FIRST_NAME || ' ' || LAST_NAME,
      A.JOB_ID
ORDER BY A.EMPLOYEE_ID;

SELECT *
FROM JOB_HISTORY
WHERE EMPLOYEE_ID = 101;


