-- Se utilizan estos datos para algunas tablas y se usa el id mostrado
-- tabla dia registrar los dias de la semana con id del 1 al 7, para la referencia, para quienes lo usen como atributo cambiar el id por el nombre
-- tabla salon se estara trabajando para el id 1, salon 201 edificio T3, id 2, salon 202 edificio T3, id 3, salon 203 edificio T3
-- si tienen ciclo como id tener en cuenta id 1 para 1S, 2 para 2S, 3 para VJ, 4 para VD, en este archivo se envia como atributo
-- para periodo registrar id 1 - 7:00 a 8:00, id 2 - 8:00 a 9:00, id 3 - 9:00 a 10:00, id 4 - 10:00 a 11:00, id 5 - 11:00 a 12:00, id 6 - 12:00 a 13:00, id 7 - 13:00 a 14:00, id 8 - 14:00 a 15:00, id 9 - 15:00 a 16:00, id 10 - 16:00 a 17:00, id 11 - 17:00 a 18:00, id 12 - 18:00 a 19:00, id 13 - 19:00 a 20:00, id 14 - 20:00 a 21:00, id 15 - 21:00 a 22:00
-- para plan lo unico relevante es el id, la jornada y creditos de cierre, registrar id 1 para plan matutino para industrial con 250 creditos, y 2 para plan matutino para sistemas con 40 creditos para cerrar, tambien depende de como lo hayan manejado para los años sera siempre 2024 y ciclo inicio 1s y fin 2s la verdad no son tan relevantes para la calificacion
-- registrar estos cursos, Id - nombre
-- 1-Mate 1, 2-Mate 2, 4-Fisica, 8-Fisica 2, 41-IPC 1, 42-Logica de sistemas, 105-Archivos, 106-Compi 1, 107-Bases 1, 108-Bases 2, 202 - practicas, 111 - filosofia, 205 - Seminario, 55 - Dibujo
-- trabajar solo con año 2024, como mensiona el enunciado

-- ########################### CREAR CARRERA ###########################
CALL CrearCarrera('Ciencias y Sistemas'); -- ok
CALL CrearCarrera('Industrial'); -- ok
CALL CrearCarrera('Ciencias y Sistemas'); -- error duplicado
CALL CrearCarrera('Ciencias y Sistem@s'); -- nombre inválido


-- ########################### CREAR PLAN ###########################
INSERT INTO PLAN(IdPlan, Nombre, AnioInicial, CicloInicial, AnioFinal, CicloFInal, NumCreditosCierre, IdCarrera) values
(1, 'Matutino', '2024', '1s', '2024', '2s', 250, 2);
INSERT INTO PLAN(IdPlan, Nombre, AnioInicial, CicloInicial, AnioFinal, CicloFInal, NumCreditosCierre, IdCarrera) values
(2, 'Matutino', '2024', '1s', '2024', '2s', 40, 1);


-- ########################### CREAR ESTUDIANTE ###########################
-- Formato RegistrarEstudiante(carnet, nombre, apellido, fechaNacimiento, correo, telefono, direccion, cui, carrera, plan) al registrar estudiante se le asigna un plan de estudios lo que significa que se le asigna una carrera o se inscribe en ella por lo que hay que ver las tablas afectadas
CALL RegistrarEstudiante(201506554, 'Angel', 'Marroquin', '1996-1-6', 'Angel@gmail.com', 56401996, '19 avenida', 45119960101, 1, 2); -- ok
CALL RegistrarEstudiante(201818477, 'Diego', 'Arriaga', '2012-12-19', 'Diego@gmail.com', 48712012, '8 avenida', 741220120101, 1, 2); -- ok, se acepta aunque la fecha no es tan logica verdad...
CALL RegistrarEstudiante(201902238, 'Luis', 'Lopez', '2001-01-25', 'luis@gmail.com', 42141631, '2 calle', 3006251851047, 2, 1); -- ok
CALL RegistrarEstudiante(202004765, 'Javier!', 'Gutierrez?', '2001-03-14', 'javier@gmail.com', 42543549, '29 avenida', 3024021520101, 1, 2); -- nombre inválido
CALL RegistrarEstudiante(202004765, 'Javier', 'Gutierrez', '2001-03-14', 'javiergmail.com', 42543549, '29 avenida', 3024021520101, 1, 2); -- correo inválido
CALL RegistrarEstudiante(201409335, 'Fabian', 'Reyna', '2001-6-13', 'Fabian@gmail.com', 49502001, '7 avenida', 53620010101, 99, 2); -- no existe carrera
CALL RegistrarEstudiante(201409335, 'Fabian', 'Reyna', '2001-6-13', 'Fabian@gmail.com', 49502001, '7 avenida', 53620010101, -5, 1); -- número inválido / no existe carrera
CALL RegistrarEstudiante(201506554, 'Angel', 'Marroquin', '1996-1-6', 'Angel@gmail.com', 46401996, '19 avenida', 45119960101, 1, 2); -- error duplicado
CALL RegistrarEstudiante(201905743, 'Jose', 'Choc', '1996-1-6', 'jose@gmail.com', 46401996, '12 avenida', 45119960101, 1, 1); -- error plan no pertenece a carrera


-- ########################### REGISTRAR DOCENTE ###########################
-- formato RegistrarDocente(codigo, nombre, apellido, fechaNacimiento, correo, telefono, direccion, cui, salario)
CALL RegistrarDocente(1234, 'Arturo', 'Samayoa', '1977-5-4', 'Arturo@gmail.com', 41412003, '4 avenida', 48520030101, 25000); -- ok
CALL RegistrarDocente(1235, 'William', 'Escobar', '1991-7-10', 'william@gmail.com', 41512012, '24 avenida', 55720120101, 20000); -- ok
CALL RegistrarDocente(1236, 'Lui5', '3spino', '2000-12-1', 'luis@gmail.com', 57812000, '12 avenida', 861220000101, 15000); -- nombre inválido
CALL RegistrarDocente(1236, 'Luis', 'Espino', '2000-12-1', 'luis@gmail.com', 57812000, '12 avenida', 861220000101, 15000); -- ok
CALL RegistrarDocente(1237, 'Jorge', 'Alvarez', '1994-10-16', 'Jorgegmail.com', 34501994, '20 avenida', 531019940101, 10000); -- correo inválido
CALL RegistrarDocente(1234, 'Arturo', 'Samayoa', '1977-5-4', 'Arturo@gmail.com', 41412003, '4 avenida', 48520030101, 25000); -- error duplicado
CALL RegistrarDocente(1237, 'Jorge', 'Alvarez', '1994-10-16', 'jorge@gmail.com', 34501994, '20 avenida', 531019940101, -10000); -- salario negativo
CALL RegistrarDocente(1237, 'Jorge', 'Alvarez', '1994-10-16', 'jorge@gmail.com', 34501994, '20 avenida', 531019940101, 100000); -- salario mayor a 99,000
CALL InsertarColumna();
-- ########################### CREAR CURSO PENSUM ###########################
-- Formato CrearCursoPensum(codigo, nombre, creditos_necesarios, creditos_otorga, obligatorio, plan)
CALL CrearCurso(2, 'Mate 2', 0, 5, 1, 2); -- ok
CALL CrearCurso(1, 'Mate 1', 0, 3, 1, 2); -- ok
CALL CrearCurso(4, 'Fisica', 0, 3, 1, 2); -- ok
CALL CrearCurso(8, 'Fisica 2', 0, 3, 1, 2); -- ok
CALL CrearCurso(41, 'IPC 1', 0, 4, 1, 2); -- ok
CALL CrearCurso(42, 'Logica de sistemas', 0, 3, 1, 2); -- ok
CALL CrearCurso(105, 'Archivos', 0, 4, 1, 2); -- ok
CALL CrearCurso(106, 'Compi 1', 0, 5, 1, 2); -- ok
CALL CrearCurso(107, 'Bases 1', 0, 4, 1, 2); -- ok
CALL CrearCurso(108, 'Bases 2', 0, 4, 1, 2); -- ok
CALL CrearCurso(202, 'Practicas', 21, 0, 1, 2); -- ok
CALL CrearCurso(111, 'Filosofia', 12, 3, 0, 2); -- ok
CALL CrearCurso(205, 'Seminario', 25, 3, 1, 2); -- ok
CALL CrearCurso(55, 'Dibujo', 0, 2, 0, 1); -- ok
CALL CrearCurso(202, 'Practicas', 21, 0, 1, 2); -- error duplicado
CALL CrearCurso(5, 'Error 1', -25, 3, 0, 1); -- número inválido
CALL CrearCurso(6, 'Error 2', 0, -50, 0, 1); -- número inválido
CALL CrearCurso(7, 'Error 3', 1, 1, 0, 3); -- no existe plan-carrera

-- ########################### AGREGAR PRERREQUISITO ###########################
-- Formato AgregarPrerrequisito(curso, prerrequisito)
CALL AgregarPrerrequisito(41, 2); -- ok
CALL AgregarPrerrequisito(41, 4); -- ok
CALL AgregarPrerrequisito(2, 1); -- ok
CALL AgregarPrerrequisito(8, 4); -- ok
CALL AgregarPrerrequisito(42, 1); -- ok
CALL AgregarPrerrequisito(105, 107); -- ok
CALL AgregarPrerrequisito(105, 41); -- ok
CALL AgregarPrerrequisito(106, 107); -- ok
CALL AgregarPrerrequisito(106, 41); -- ok
CALL AgregarPrerrequisito(107, 42); -- ok
CALL AgregarPrerrequisito(108, 107); -- ok
CALL AgregarPrerrequisito(108, 105); -- ok
CALL AgregarPrerrequisito(205, 105); -- ok
CALL AgregarPrerrequisito(108, 222); -- error no existe prerrequisito
CALL AgregarPrerrequisito(121, 108); -- error no existe curso


-- ########################### CREAR SECCION CURSO ###########################
-- Formato CrearSeccionCurso(curso, ciclo, docente, seccion), id autoincremental se considera para lo demas un orden ascendente iniciando en 1
CALL CrearSeccionCurso(1, '1S', 1234, 'A'); -- ok
CALL CrearSeccionCurso(1, '1S', 1236, 'B'); -- ok
CALL CrearSeccionCurso(2, 'VJ', 1234, 'A'); -- ok
CALL CrearSeccionCurso(4, '1S', 1235, 'B'); -- ok
CALL CrearSeccionCurso(8, 'VJ', 1235, 'N'); -- ok
CALL CrearSeccionCurso(42, 'VJ', 1236, 'A'); -- ok
CALL CrearSeccionCurso(41, '2S', 1236, 'B'); -- ok
CALL CrearSeccionCurso(107, '2S', 1234, 'A'); -- ok
CALL CrearSeccionCurso(111, '2S', 1235, 'P'); -- ok
CALL CrearSeccionCurso(105, 'VD', 1235, 'A'); -- ok
CALL CrearSeccionCurso(106, 'VD', 1234, 'A'); -- ok
CALL CrearSeccionCurso(202, '1S', 1234, 'A'); -- ok
CALL CrearSeccionCurso(205, '1S', 1235, 'B'); -- ok
CALL CrearSeccionCurso(108, '1S', 1236, 'A'); -- ok
CALL CrearSeccionCurso(108, '1S', 1236, 'D'); -- ok
CALL CrearSeccionCurso(55, '1S', 1236, 'A'); -- ok
CALL CrearSeccionCurso(106, 'VD', 1236, 'A'); -- error duplicado
CALL CrearSeccionCurso(303, 'VD', 1236, 'A'); -- error curso no existe
CALL CrearSeccionCurso(111, 'VB', 1236, 'A'); -- error ciclo no valido
CALL CrearSeccionCurso(1, 'VD', 1237, 'A'); -- error docente no existe
CALL CrearSeccionCurso(1, 'VD', 1236, '2'); -- error seccion no valida


-- ########################### AGREGAR HORARIO ###########################
-- Formato AgregarHorario(seccion, periodo, dia, salon)
CALL AgregarHorario(1, 1, 2, 1); -- ok
CALL AgregarHorario(2, 1, 1, 1); -- ok
CALL AgregarHorario(3, 2, 2, 2); -- ok
CALL AgregarHorario(4, 3, 1, 3); -- ok
CALL AgregarHorario(100, 4, 2, 1); -- error seccion no existe
CALL AgregarHorario(1, 50, 2, 1); -- error periodo no existe
CALL AgregarHorario(1, 1, 8, 1); -- error dia no existe, solo si tienen tablas
CALL AgregarHorario(1, 1, 2, 100); -- error salon no existe, solo si tienen tablas

-- ########################### ASIGNAR CURSO ###########################
-- Formato AsignarCurso(id_seccion, carnet)
CALL AsignarCurso(1, 201506554); -- ok
CALL AsignarCurso(1, 201818477); -- ok
CALL AsignarCurso(2, 201902238); -- ok
CALL AsignarCurso(4, 201902238); -- ok
CALL AsignarCurso(4, 201506554); -- ok
CALL AsignarCurso(4, 201818477); -- ok
CALL AsignarCurso(2, 201506554); -- error ya esta asignado a otra seccion 
CALL AsignarCurso(1, 201506554); -- error duplicado, ya esta asignado
CALL AsignarCurso(3, 201506554); -- error no tiene aprobado el curso prerrequisito
CALL AsignarCurso(100, 201506554); -- error la seccion no existe

-- ########################### Visualizacion hasta ahora ###########################
CALL ConsultarPensum(2); -- ok
CALL ConsultarPensum(1); -- ok
CALL ConsultarPensum(3); -- error no existe carrera


-- el promedio Crditos del estudiante da 0 porque todavía no se han ingresado notas

CALL ConsultarEstudiante(201506554); -- ok
CALL ConsultarEstudiante(201818477); -- ok
CALL ConsultarEstudiante(201905743); -- no existe estudiante

CALL ConsultarDocente(1234); -- ok
CALL ConsultarDocente(1235); -- ok
CALL ConsultarDocente(1238); -- no existe docente


-- NOTA UNA DE ESTAS DA ERROR PERO NO DEBERÍA

CALL ConsultarAsignaciones(1, '1S', 2024, 'B'); -- ok
CALL ConsultarAsignaciones(1, '1S', 2024, 'A'); -- ok
CALL ConsultarAsignaciones(4, '1S', 2024, 'B'); -- ok, deberia mostrar 3 estudiantes
CALL ConsultarAsignaciones(1, '1S', 2024, 'N'); -- error la seccion no existe
-- creo que es esta:
CALL ConsultarAsignaciones(1, '2S', 2024, 'B'); -- error no hay seccion en ese ciclo   
CALL ConsultarAsignaciones(1, '1S', 2023, 'B'); -- error no hay ciclo en ese año
CALL ConsultarAsignaciones(1, '1S', 2024, '8'); -- error seccion no valida

CALL ConsultarHorario(201506554, '1S', 2024); -- ok
CALL ConsultarHorario(201905743, '1S', 2024); -- error el estudiante no existe
CALL ConsultarHorario(201506554, '1S', 2023); -- no deberia mostrar nada o error
-- --------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------

-- ########################### INGRESO DE NOTAS ###########################
-- Formato IngresarNota(id_seccion, carnet, nota_zona, examen_final)
CALL IngresarNota(1, 201506554, 47, 17); -- ok
CALL IngresarNota(1, 201818477, 47, 17); -- ok
CALL IngresarNota(2, 201902238, 47, 17); -- ok
CALL IngresarNota(4, 201902238, 47, 12); -- ok, reprobo
CALL IngresarNota(4, 201506554, 54, 12); -- ok
CALL IngresarNota(1, 201818477,-35, 12); -- error nota inválida
CALL IngresarNota(1, 987988787, 87, 12); -- error carnet no existe

-- ########################### DESASIGNAR CURSO ###########################
-- Formato DesasignarCurso(id_seccion, carnet)
CALL DesasignarCurso(4, 201818477); -- ok
CALL DesasignarCurso(8, 201818477); -- error, el estudiante no esta asignado
CALL ConsultarAsignaciones(4, '1S', 2024, 'B'); -- deberia mostrar solo 2 estudiantes

CALL ConsultarCursosAAsignar(201506554); -- ok, para ver que cursos se puede asignar, deberia mostrar mate 2, fisica 2 y logica
CALL ConsultarCursosAAsignar(201902238); -- ok deberia mostrar solo mate 2 y logica ya que reprobo fisica

-- ########################### Continuamos con asignar curso e ingresar notas ###########################
CALL AsignarCurso(3, 201506554); -- ok
CALL AsignarCurso(5, 201506554); -- ok
CALL AsignarCurso(6, 201506554); -- ok
CALL AsignarCurso(9, 201506554); -- error, no cumple prerrequisitos, creditos

CALL IngresarNota(3, 201506554, 54, 17); -- ok
CALL IngresarNota(5, 201506554, 61, 7); -- ok
CALL IngresarNota(6, 201506554, 58, 18); -- ok

CALL ConsultarEstudiante(201506554); -- ok, para ver como va

CALL AsignarCurso(9, 201506554); -- ok, ahora si cumple prerrequisitos
CALL AsignarCurso(7, 201506554); -- ok
CALL AsignarCurso(8, 201506554); -- ok

CALL IngresarNota(9, 201506554, 54, 17); -- ok
CALL IngresarNota(7, 201506554, 61, 7); -- ok
CALL IngresarNota(8, 201506554, 58, 18); -- ok

CALL ConsultarEstudiante(201506554); -- ok, para ver como va
CALL ConsultarCursosAAsignar(201506554);

CALL AsignarCurso(11, 201506554); -- ok
CALL AsignarCurso(10, 201506554); -- ok
CALL AsignarCurso(12, 201506554); -- ok

CALL IngresarNota(11, 201506554, 54, 17); -- ok
CALL IngresarNota(10, 201506554, 61, 7); -- ok
CALL IngresarNota(12, 201506554, 58, 18); -- ok

CALL ConsultarEstudiante(201506554); -- ok, para ver como va

CALL AsignarCurso(13, 201506554); -- ok
CALL AsignarCurso(14, 201506554); -- ok
CALL AsignarCurso(15, 201506554); -- error ya esta asignado a la A

CALL IngresarNota(13, 201506554, 54, 17); -- ok
CALL IngresarNota(14, 201506554, 61, 7); -- ok

CALL ConsultarEstudiante(201506554); -- ok, para ver como va ya cerro en teoria

-- ########################### MAs CONSULTAS ###########################
CALL ConsultarAprobaciones(1, '1S', 2024, 'A'); 
CALL ConsultarAprobaciones(4, '1S', 2024, 'B'); 

CALL InsertarColumna();

-- ########################### ADICIONAL ###########################

-- Deben realizar consultas select para visualizar el contenido de las tablas cuando se requiera y tambien la de los triggers
-- ejemplo select * from Historial;
