SELECT SQ_CODIGO_CARGO.CURRVAL
FROM DUAL;

SELECT SQ_CODIGO_CARGO.NEXTVAL,
        SQ_CODIGO_CARGO.NEXTVAL
FROM DUAL;


create sequence nombre;



SELECT A.*,SQ_CODIGO_CARGO.NEXTVAL
FROM TBL_MODELOS A;


INSERT INTO TBL_CARGOS(CODIGO_CARGO, NOMBRE_CARGO, SUELDO_BASE)
VALUES (
  SQ_CODIGO_CARGO.NEXTVAL, 
  'Cargo con codigo incremental',
  1000
);

select * from tbl_cargos;

