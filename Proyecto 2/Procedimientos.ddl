-- ------------------Registrar Carrera

DELIMITER $$
CREATE PROCEDURE CrearCarrera(
    IN p_nombre VARCHAR(255)
)
CrearCarrera:BEGIN
	IF (validar_letras(p_nombre) = 0) THEN
        SELECT 'El nombre de carrera solo debe contener letras' as ERROR;
        LEAVE CrearCarrera;
    END IF;
    IF (ExisteCarreraPorNombre(p_nombre) = 1) THEN
        SELECT 'La carrera especificada Ya existe' as ERROR;
        LEAVE CrearCarrera;
    END IF;
    INSERT INTO Carrera (Nombre)
    VALUES (p_nombre);
    SELECT 'Carrera registrada exitosamente' as MENSAJE;
END $$


-- ------------------------Registrar estudiante


DROP PROCEDURE IF EXISTS RegistrarEstudiante;

DELIMITER $$
CREATE PROCEDURE RegistrarEstudiante(
    IN Carnet INT,
    IN Nombre VARCHAR(255),
    IN Apellido VARCHAR(255),
    IN FechaNacimiento DATE,
    IN Correo VARCHAR(255),
    IN Telefono VARCHAR(15),
    IN Direccion VARCHAR(255),
    IN CUI BIGINT,
    IN idCarrera INT,
    IN idPlan INT
)
RegistrarEstudiante:BEGIN
DECLARE telefono_final INT;
    -- Validaciones
    IF (ExisteEstudiante(Carnet) = 1) THEN
        SELECT 'El estudiante ya existe' as ERROR;
        LEAVE RegistrarEstudiante;
    END IF;
    IF (validar_letras(Nombre) = 0) THEN
        SELECT 'El nombre solo debe contener letras' as ERROR;
        LEAVE RegistrarEstudiante;
    END IF;
    IF (validar_letras(Apellido) = 0) THEN
        SELECT 'El apellido solo debe contener letras' as ERROR;
        LEAVE RegistrarEstudiante;
    END IF;
    IF (validar_correo(Correo) = 0) THEN
        SELECT 'El correo no cumple con el formato' as ERROR;
        LEAVE RegistrarEstudiante;
    END IF;
    IF (ExisteCarreraPorId(idCarrera) = 0) THEN
        SELECT 'La carrera especificada no existe' as ERROR;
        LEAVE RegistrarEstudiante;
    END IF;
    IF (ExistePlanPorId(idPlan) = 0) THEN
        SELECT 'El plan especificado no existe' as ERROR;
        LEAVE RegistrarEstudiante;
    END IF;
    IF (CoindidePlanCarrera(IdCarrera, IdPlan) = 0) THEN
        SELECT 'El plan no coincide con la carrera' as ERROR;
        LEAVE RegistrarEstudiante;
    END IF;
    -- Validar y convertir el teléfono
    SET telefono_final = validar_telefono(Telefono);
	-- Inserta Estudiante
    INSERT INTO Estudiante (Carnet, Nombre, Apellido, FechaNacimiento, Correo, Telefono, Direccion, CUI, idCarrera, idPlan)
    VALUES (Carnet, Nombre, Apellido, FechaNacimiento, Correo, Telefono, Direccion, CUI, idCarrera, idPlan);
END $$




-- --------------------------------------------------------
--                Registrar Catedratico
-- --------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE RegistrarDocente(
    IN CodigoCat INT,
    IN Nombre VARCHAR(255),
    IN Apellido VARCHAR(255),
    IN FechaNacimiento DATE,
    IN Correo VARCHAR(255),
    IN Telefono VARCHAR(15),
    IN Direccion VARCHAR(255),
    IN CUI BIGINT,
    IN salario DECIMAL(10,2)
)
RegistrarDocente:BEGIN
DECLARE telefono_final INT;
    -- Validaciones
    IF (ExisteCatPorCodigo(CodigoCat) = 1) THEN
		SELECT 'El catedratico ya existe' as ERROR;
		LEAVE RegistrarDocente;
	END IF;
    IF (validar_letras(Nombre) = 0) THEN
        SELECT 'El nombre solo debe contener letras' as ERROR;
        LEAVE RegistrarDocente;
    END IF;
    IF (validar_letras(Apellido) = 0) THEN
        SELECT 'El apellido solo debe contener letras' as ERROR;
        LEAVE RegistrarDocente;
    END IF;
    IF (validar_correo(Correo) = 0) THEN
        SELECT 'El correo no cumple con el formato' as ERROR;
        LEAVE RegistrarDocente;
    END IF;
    IF (validar_enteroPositivo(salario) = 0) THEN
        SELECT 'El salario debe ser un número positivo' as ERROR;
        LEAVE RegistrarDocente;
    END IF;
    IF (salario > 99000) THEN
        SELECT 'El salario no puede ser mayor a 99000' as ERROR;
        LEAVE RegistrarDocente;
    END IF;
    -- Validar y convertir el teléfono
    SET telefono_final = validar_telefono(Telefono);
	-- Inserta Catedratico
    INSERT INTO Catedratico (CodigoCat, Nombre, Apellido, FechaNacimiento, Correo, Telefono, Direccion, CUI, salario)
    VALUES (CodigoCat, Nombre, Apellido, FechaNacimiento, Correo, Telefono, Direccion, CUI, salario);
    SELECT 'Catedratico registrado exitosamente' as MENSAJE;
END $$




-- --------------------------------------------------------
--                Crear Pensum
-- --------------------------------------------------------

select *from pensum;
DELIMITER $$
CREATE PROCEDURE CrearCurso(
    IN CodigoCurso INT,
    IN Nombre VARCHAR(50),
    IN Creditos_necesarios INT,
    IN Creditos_otorga INT,
    IN Obligatorio INT,
    IN IdPlan INT
)
CrearCurso:BEGIN
    -- Validaciones
    IF (ExistePensum(CodigoCurso) = 1) THEN
        SELECT 'Curso en pensum ya existe' as ERROR;
        LEAVE CrearCurso;
    END IF;
    IF (validar_enteroPositivo(Creditos_necesarios) = 0) THEN
        SELECT 'Los creditos necesarios deben ser un número positivo' as ERROR;
        LEAVE CrearCurso;
    END IF;
    IF (validar_enteroPositivo(Creditos_otorga) = 0) THEN
        SELECT 'Los creditos que otorga debe ser un número positivo' as ERROR;
        LEAVE CrearCurso;
    END IF;
    IF (Obligatorio != 0 and Obligatorio != 1) THEN
        SELECT 'Obligarorio de debe ser 1 o 0' as ERROR;
        LEAVE CrearCurso;
    END IF;
    
    IF (ExistePlanPorId(idPlan) = 0) THEN
        SELECT 'El plan especificado no existe' as ERROR;
        LEAVE CrearCurso;
    END IF;

    INSERT INTO Pensum (CodigoCurso, Nombre, creditos_necesarios, creditos_otorga, obligatorio, IdPlan)
    VALUES (CodigoCurso, Nombre, creditos_necesarios, creditos_otorga, obligatorio, IdPlan);
    SELECT 'Curso creado exitosamente' as MENSAJE;
END $$



-- --------------------------------------------------------
--                AgregarPrerrequisito
-- --------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE AgregarPrerrequisito(
    IN Curso INT,
    IN Prerrequisito INT
)
AgregarPrerrequisito:BEGIN
    -- Validaciones
    IF (ExisteCurso(Curso) = 0) THEN
        SELECT 'El curso no existe' as ERROR;
        LEAVE AgregarPrerrequisito;
    END IF;
    IF (ExisteCurso(Prerrequisito) = 0) THEN
        SELECT 'El Prerrequisito no existe' as ERROR;
        LEAVE AgregarPrerrequisito;
    END IF;

    INSERT INTO Prerrequisito (Curso, Prerrequisito)
    VALUES (Curso, Prerrequisito);
    SELECT 'Prerrequisito creado exitosamente' as MENSAJE;
END $$



-- --------------------------------------------------------
--                CrearSeccionCurso
-- --------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE CrearSeccionCurso(
    IN CodigoCurso INT,
    IN Ciclo VARCHAR(10),
    IN CodigoCat INT,
    IN Seccion VARCHAR(2)
)
CrearSeccionCurso:BEGIN
    -- Validaciones
    IF (ExisteCurso(CodigoCurso) = 0) THEN
        SELECT 'Error, curso no existe' as ERROR;
        LEAVE CrearSeccionCurso;
    END IF;
    IF (ExisteCatPorCodigo(CodigoCat) = 0) THEN
        SELECT 'Error, catedratico no existe' as ERROR;
        LEAVE CrearSeccionCurso;
    END IF;
    IF (CSDuplicados(CodigoCurso, Seccion) = 1) THEN
        SELECT 'la sección se repite para un curso en un ciclo' as ERROR;
        LEAVE CrearSeccionCurso;
    END IF;
    IF (ValidarCiclo(Ciclo) = 0) THEN
        SELECT 'Ciclo invalido' as ERROR;
        LEAVE CrearSeccionCurso;
    END IF;
    IF (validar_char(Seccion) = 0) THEN
        SELECT 'La sección debe ser un char a-zA-Z' as ERROR;
        LEAVE CrearSeccionCurso;
    END IF;

    INSERT INTO Seccion (CodigoCurso, Ciclo, CodigoCat, Seccion)
    VALUES (CodigoCurso, Ciclo, CodigoCat, Seccion);
    SELECT 'Se ha Creado Seccion Curso' as MENSAJE;
END $$




-- --------------------------------------------------------
--                AgregarHorario
-- --------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE AgregarHorario(
    IN IdSeccion INT,
    IN IdPeriodo INT,
    IN IdDia INT,
    IN IdSalon INT
)
AgregarHorario:BEGIN
    -- Validaciones
    IF (ExisteSeccion2(IdSeccion) = 0) THEN
        SELECT 'Error, sección no existe' as ERROR;
        LEAVE AgregarHorario;
    END IF;
    IF (ExistePeriodo(IdPeriodo) = 0) THEN
        SELECT 'Error, periodo no existe' as ERROR;
        LEAVE AgregarHorario;
    END IF;
    IF (ExisteDia(IdDia) = 0) THEN
        SELECT 'Error, dia no existe' as ERROR;
        LEAVE AgregarHorario;
    END IF;
    IF (ExisteSalon(IdSalon) = 0) THEN
        SELECT 'Error, salón no existe' as ERROR;
        LEAVE AgregarHorario;
    END IF;

    INSERT INTO Horario (IdSeccion, IdPeriodo, IdDia, IdSalon)
    VALUES (IdSeccion, IdPeriodo, IdDia, IdSalon);
    SELECT 'Se ha Creado Horario' as MENSAJE;
END $$





-- --------------------------------------------------------
--                ASIGNAR CURSO
-- --------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE AsignarCurso(
    IN IdSeccion INT,
    IN Carnet INT
)
AsignarCurso:BEGIN
    IF (EVSeccion(Carnet, IdSeccion) = 1) THEN
        SELECT 'Error, estudiante se encuentre ya asignado a un curso en alguna otra sección' as ERROR;
        LEAVE AsignarCurso;
    END IF;
    
    IF (AsignacionDuplicada(Carnet, IdSeccion) = 1) THEN
        SELECT 'Error, duplicado, ya esta asignado' as ERROR;
        LEAVE AsignarCurso;
    END IF;
    
    IF (ExisteSeccion2(IdSeccion) = 0) THEN
        SELECT 'error la seccion no existe' as ERROR;
        LEAVE AsignarCurso;
    END IF;
    
    IF (CPrerrequisito(IdSeccion) = 1) THEN
        SELECT 'error, no cumple con el prerequisito' as ERROR;
        LEAVE AsignarCurso;
    END IF;
    

    INSERT INTO Asignacion (IdSeccion, Carnet)
    VALUES (IdSeccion, Carnet);
    SELECT 'Se ha asignado correctamente' as MENSAJE;
END $$




-- --------------------------------------------------------
--                ConsultarPensum
-- --------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE ConsultarPensum(
	IN IdCarrera INT
)
ConsultarPensum:BEGIN
    IF (ExisteCarreraPorId(IdCarrera) = 0) THEN
        SELECT 'Error, no existe carrera' as ERROR;
        LEAVE ConsultarPensum;
    END IF;

    SELECT p.CodigoCurso, p.Nombre, p.Obligatorio, p.creditos_otorga, p.creditos_necesarios, c.Nombre
	FROM pensum p
	inner join plan pl on pl.IdPlan = pl.IdPlan
	inner join Carrera c on c.IdCarrera = pl.IdCarrera
	WHERE pl.IdCarrera = IdCarrera;
END $$


-- --------------------------------------------------------
--                ConsultarEstudiante
-- --------------------------------------------------------

DELIMITER $$

CREATE PROCEDURE ConsultarEstudiante(
    IN Carnet INT
)
ConsultarEstudiante:BEGIN

	DECLARE ConsultarEstudiante_existente INT;
    
	IF (ExisteEstudiante(Carnet) = 0) THEN
        SELECT 'El estudiante no existe' as ERROR;
        LEAVE ConsultarEstudiante;
    END IF;
    

    SELECT COUNT(*) INTO ConsultarEstudiante_existente
    FROM notas e WHERE e.Carnet = Carnet;

    IF ConsultarEstudiante_existente = 0 THEN
        select e.Carnet, e.FechaNacimiento, e.Correo, e.Telefono, e.Direccion, e.CUI, (0) as creditos
		from Estudiante e
		where e.Carnet = Carnet;
    ELSE
		select e.Carnet, e.FechaNacimiento, e.Correo, e.Telefono, e.Direccion, e.CUI,  
		SUM(CASE WHEN (n.nota_Zona + n.examen_final) >= 61 THEN pe.Creditos_Otorga ELSE 0 END ) AS Creditos
		from notas n
		inner Join Estudiante e on e.Carnet=n.Carnet 
		inner join Seccion s on s.IdSeccion=n.IdSeccion
		inner join Curso c on c.CodigoCurso=s.CodigoCurso
		inner join Pensum pe on pe.CodigoCurso=c.CodigoCurso
		where n.Carnet = Carnet
		Group by e.Carnet, e.FechaNacimiento, e.Correo, e.Telefono, e.Direccion,
		e.CUI;
    END IF;
END $$

DELIMITER ;

-- --------------------------------------------------------
--                ConsultarDocente
-- --------------------------------------------------------

DELIMITER $$

CREATE PROCEDURE ConsultarDocente(
    IN CodigoCat INT
)
ConsultarDocentee:BEGIN

	DECLARE ConsultarDocentee_existente INT;
    
	IF (ExisteCatPorCodigo(CodigoCat) = 0) THEN
		SELECT 'El catedratico no existe' as ERROR;
		LEAVE ConsultarDocentee;
	END IF;
    
	SELECT cat.CodigoCat AS Codigo, CONCAT(cat.Nombre, ' ', cat.Apellido) AS Nombre, cat.FechaNacimiento, cat.Correo, 
	cat.Telefono, cat.Direccion, cat.CUI
	FROM Catedratico cat
	WHERE cat.CodigoCat = CodigoCat;
    
END $$

DELIMITER ;


-- --------------------------------------------------------
--                ConsultarAsignaciones
-- --------------------------------------------------------

DELIMITER $$

CREATE PROCEDURE ConsultarAsignaciones(
    IN CodigoCurso INT,
    IN Ciclo Varchar(2),
    IN Año Int,
    IN Seccion Varchar(2)
)
ConsultarAsignaciones:BEGIN

	DECLARE ConsultarAsignaciones_existente INT;
    
    IF (validar_char(Seccion) = 0) THEN
		SELECT 'error seccion no valida' as ERROR;
		LEAVE ConsultarAsignaciones;
	END IF;
    
	IF (ExisteLetraSeccion(Seccion, Ciclo, CodigoCurso) = 0) THEN
		SELECT 'error no hay seccion en ese ciclo' as ERROR;
		LEAVE ConsultarAsignaciones;
	END IF;
    
    IF (Año != 2024) THEN
		SELECT 'error no hay ciclo en este año' as ERROR;
		LEAVE ConsultarAsignaciones;
	END IF;
    
	select e.Carnet, CONCAT(e.Nombre, ' ', e.Apellido) as nombre
	from asignacion a
	inner join Estudiante e on e.Carnet=a.Carnet
	inner join seccion s on s.idSeccion=a.idSeccion
	inner join Plan pl on pl.IdPlan=e.IdPlan
	where s.CodigoCurso = CodigoCurso and s.ciclo=Ciclo and pl.anioInicial=Año and s.Seccion=Seccion;
    
END $$

DELIMITER ;




-- --------------------------------------------------------
--                ConsultarHorario
-- --------------------------------------------------------

DELIMITER $$

CREATE PROCEDURE ConsultarHorario(
    IN Carnet INT,
    IN Ciclo Varchar(2),
    IN Año INT
)
ConsultarHorario:BEGIN

	DECLARE ConsultarHorario_existente INT;
    
	IF (ExisteEstudiante(Carnet) = 0) THEN
        SELECT 'No existe estudiante' as ERROR;
        LEAVE ConsultarHorario;
    END IF;
    
    IF (Año != 2024) THEN
        SELECT 'No existe horario en esta fecha' as ERROR;
        LEAVE ConsultarHorario;
    END IF;

	select cu.nombre, se.seccion, d.Nombre, CONCAT(pe.HorarioInicio,'-',pe.HorarioFinal) as Periodo, CONCAT(s.Edificio,',',s.NombreSalon) as Lugar
	from Estudiante e
	inner join Asignacion a on a.Carnet=e.Carnet
	inner join Seccion se on se.IdSeccion=a.IdSeccion
	inner join Horario h on h.IdSeccion=se.IdSeccion
	inner join Salon s on s.IdSalon=h.IdSalon
	inner join Dia d on d.IdDia=h.IdDia
	inner join periodo pe on pe.IdPeriodo=h.IdPeriodo
	inner join Curso cu on cu.CodigoCurso=se.CodigoCurso
	where e.Carnet=Carnet and se.Ciclo=Ciclo;
    
END $$

DELIMITER ;