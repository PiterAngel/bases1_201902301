-- --------------------------------------------------------
--                     FUNCIONES
-- CREATE SCHEMA IF NOT EXISTS `proyecto2_bases` DEFAULT CHARACTER SET utf8 ;
USE proyecto2_bases;
DROP FUNCTION IF EXISTS validar_correo;
-- --------------------------------------------------------
DELIMITER $$
CREATE FUNCTION validar_letras(
    cadena VARCHAR(200)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
  DECLARE valido BOOLEAN;
  IF (SELECT REGEXP_INSTR(cadena, '[^a-zA-z ]') = 0) THEN
      SELECT TRUE INTO valido;
      -- set valido = true;
  ELSE
      SELECT FALSE INTO valido;
  END IF;
RETURN valido;
END 
$$
SELECT validar_letras('Hola Mundo');
-- --------------------------------------------------------
-- --------------------------------------------------------
DELIMITER $$
CREATE FUNCTION validar_correo(email VARCHAR(50)) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    RETURN email REGEXP '^[^@]+@[^@]+[\.][a-zA-Z]{2,}$';
END $$ 
$$ 
SELECT validar_correo('micorreo@correo.com');
-- --------------------------------------------------------
-- --------------------------------------------------------
DELIMITER $$
CREATE FUNCTION validar_enteroPositivo(
	numero INT
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
  DECLARE valido BOOLEAN;
  IF (numero >= 0) THEN
      SELECT TRUE INTO valido;
  ELSE
      SELECT FALSE INTO valido;
  END IF;
  RETURN valido;
END 
$$
SELECT validar_enteroPositivo(10);
-- --------------------------------------------------------
-- --------------------------------------------------------
DELIMITER $$
CREATE FUNCTION validar_telefono(telefono VARCHAR(15)) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE telefono_final INT;
    IF LEFT(telefono, 1) = '+' THEN
        SET telefono_final = CAST(SUBSTRING(telefono, 5) AS UNSIGNED);
    ELSE
        SET telefono_final = CAST(SUBSTRING(telefono, -7) AS UNSIGNED);
    END IF;
    RETURN telefono_final;
END
$$
SELECT validar_telefono('1234567890') AS telefono_sin_codigo;
SELECT validar_telefono('+50257462891') AS telefono_sin_codigo;
-- --------------------------------------------------------
-- --------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ExisteCarreraPorId(carrera_id INT) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    DECLARE carrera_existente INT;
    SELECT COUNT(*) INTO carrera_existente
    FROM carrera WHERE IdCarrera = carrera_id;
    IF carrera_existente > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END; 
$$
SELECT ExisteCarreraPorId(1) AS Existencia_Carrera;
-- --------------------------------------------------------
-- --------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ExistePlanPorId(plan_id INT) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    DECLARE plan_existente INT;
    SELECT COUNT(*) INTO plan_existente
    FROM Plan WHERE IdPlan = plan_id;
    IF plan_existente > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END; 
$$
SELECT ExistePlanPorId(1) AS Existencia_Plan;
-- --------------------------------------------------------
-- --------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ExisteCatPorCodigo(codigo INT) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    DECLARE cat_existente INT;
    SELECT COUNT(*) INTO cat_existente
    FROM Catedratico WHERE CodigoCat = codigo;
    IF cat_existente > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END; 
$$
SELECT ExisteCatPorCodigo(1) AS Existencia_Cat;
-- --------------------------------------------------------
-- --------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ExisteCarreraPorNombre(carreraN VARCHAR(50)) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    DECLARE carrera_existente INT;
    SELECT COUNT(*) INTO carrera_existente
    FROM Carrera WHERE Nombre = carreraN;
    IF carrera_existente > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END; 
$$
SELECT ExisteCarreraPorNombre('Ciencias y Sistemas') AS Existencia_Carrera;
-- --------------------------------------------------------
-- --------------------------------------------------------









DELIMITER $$
CREATE FUNCTION ExisteEstudiante(carnet INT) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    DECLARE Estudiante_existente INT;
    SELECT COUNT(*) INTO Estudiante_existente
    FROM Estudiante e WHERE e.Carnet = carnet;
    IF Estudiante_existente > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END; 
$$
select *from estudiante;


DELIMITER $$
CREATE FUNCTION CoindidePlanCarrera(IdCarrera INT, IdPlan INT) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    DECLARE Coindide_PlanCarrera INT;
    SELECT COUNT(*) INTO Coindide_PlanCarrera
    from Plan p where p.IdCarrera=IdCarrera and p.IdPlan=IdPlan;
    IF Coindide_PlanCarrera > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END; 
$$



DELIMITER $$
CREATE FUNCTION ExistePensum(CodCurso INT) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    DECLARE Pensum_existente INT;
    SELECT COUNT(*) INTO Pensum_existente
    FROM Pensum p WHERE p.CodigoCurso = CodCurso;
    IF Pensum_existente > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END; 
$$

DELIMITER $$
CREATE FUNCTION ExisteCurso(CodCurso INT) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    DECLARE Curso_existente INT;
    SELECT COUNT(*) INTO Curso_existente
    FROM Curso p WHERE p.CodigoCurso = CodCurso;
    IF Curso_existente > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END; 
$$


--  se debe validar que la sección no se repita para un curso en un ciclo
--  id es autoincremental

DELIMITER $$
CREATE FUNCTION CSDuplicados(CodigoCurso INT, Seccion VARCHAR(2)) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    DECLARE CSDuplicados_existente INT;
    SELECT COUNT(*) INTO CSDuplicados_existente
    FROM Seccion p WHERE p.CodigoCurso = CodigoCurso and p.Seccion=Seccion;
    IF CSDuplicados_existente > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END; 
$$




DELIMITER $$
CREATE FUNCTION ValidarCiclo(Ciclo Varchar(10)) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    IF Ciclo = '1S' or Ciclo = '2S' or Ciclo = 'VJ' or Ciclo = 'VD' THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END; 
$$




DELIMITER $$
CREATE FUNCTION validar_char(cadena VARCHAR(1))
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
  DECLARE valido BOOLEAN;
  IF (SELECT REGEXP_INSTR(cadena, '[^a-zA-z]') = 0) THEN
      RETURN TRUE;
      -- set valido = true;
  ELSE
      RETURN FALSE;
  END IF;
END 
$$








DELIMITER $$
CREATE FUNCTION ExistePeriodo(IdPeriodo INT) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    DECLARE Periodo_existente INT;
    SELECT COUNT(*) INTO Periodo_existente
    FROM Periodo p WHERE p.IdPeriodo = IdPeriodo;
    IF Periodo_existente > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END; 
$$

DELIMITER $$
CREATE FUNCTION ExisteDia(IdDia INT) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    DECLARE Dia_existente INT;
    SELECT COUNT(*) INTO Dia_existente
    FROM Dia p WHERE p.IdDia = IdDia;
    IF Dia_existente > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END; 
$$

DELIMITER $$
CREATE FUNCTION ExisteSalon(IdSalon INT) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    DECLARE Salon_existente INT;
    SELECT COUNT(*) INTO Salon_existente
    FROM Salon p WHERE p.IdSalon = IdSalon;
    IF Salon_existente > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END; 
$$


--  comprobar si la seccion existe
DELIMITER $$
CREATE FUNCTION ExisteSeccion2(IdSeccion INT) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    DECLARE Seccion2_existente INT;
    SELECT COUNT(*) INTO Seccion2_existente
    FROM Seccion p WHERE p.IdSeccion = IdSeccion;
    IF Seccion2_existente > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END; 
$$

-- comprobar si la letra de la seccion existe
DELIMITER $$
CREATE FUNCTION ExisteLetraSeccion(Seccion Varchar(2), Ciclo Varchar(2), CodigoCurso INT) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    DECLARE  ExisteLetraSeccion_existente INT;
    SELECT COUNT(*) INTO  ExisteLetraSeccion_existente
    FROM Seccion p WHERE (p.Seccion = Seccion and p.Ciclo=Ciclo and p.CodigoCurso=CodigoCurso);
    IF ExisteLetraSeccion_existente > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END; 
$$


--  funcion para comprobar que un estudiante que se encuentre ya asignado a un curso en alguna otra sección

DELIMITER $$

CREATE FUNCTION EVSeccion(Carnet INT, idSeccion INT) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    DECLARE EVSeccion_existente INT;
    SELECT COUNT(*) INTO EVSeccion_existente
    FROM (
        SELECT s.CodigoCurso
        FROM Asignacion a
        INNER JOIN Seccion s ON s.IdSeccion = a.IdSeccion
        WHERE a.Carnet = Carnet
    ) AS consulta1
    WHERE consulta1.CodigoCurso IN (
        SELECT s.CodigoCurso
        FROM Asignacion a
        INNER JOIN Seccion s ON s.IdSeccion = a.IdSeccion
        WHERE s.IdSeccion = idSeccion
    );
    IF EVSeccion_existente > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END $$

DELIMITER ;


--  funcion para comprobar que un estudiante no se asigne 2 veces

DELIMITER $$

CREATE FUNCTION AsignacionDuplicada(Carnet INT, idSeccion INT) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    DECLARE AsignacionDuplicada_existente INT;
    SELECT COUNT(*) INTO AsignacionDuplicada_existente
    FROM Asignacion a WHERE a.Carnet=Carnet and a.IdSeccion = IdSeccion;
    IF AsignacionDuplicada_existente > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END $$

DELIMITER ;




--  contar si un curso tiene prerrquisitos

DELIMITER $$

CREATE FUNCTION CPrerrequisito(idSeccion INT) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    DECLARE CPrerrequisito_existente INT;
    SELECT COUNT(*) INTO CPrerrequisito_existente
	from Prerrequisito pr
	where pr.curso=(select s.CodigoCurso
	from seccion s where s.IdSeccion = idSeccion);
    IF CPrerrequisito_existente > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END $$

DELIMITER ;
