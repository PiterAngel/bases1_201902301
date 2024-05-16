-- --------------------------------------------------------
--                    OTRAS INSERCIONES
-- --------------------------------------------------------
SELECT * FROM Carrera;
SELECT * FROM Plan;
SELECT * FROM Estudiante;
SELECT * FROM Catedratico;
SELECT * FROM Curso;
SELECT * FROM Pensum;
SELECT * FROM Seccion;
SELECT * FROM Horario;
SELECT * FROM Asignacion;
SELECT * FROM Notas;
SELECT * FROM Desasignacion;

-- CALL ConsultarEstudiante(201902238);

-- insert adicionales que estaban en el encabezado

-- INSERT INTO PLAN(IdPlan, Nombre, AnioInicial, CicloInicial, AnioFinal, CicloFInal, NumCreditosCierre, IdCarrera) values
-- (1, 'Matutino', '2024', '1s', '2024', '2s', 250, 2);
-- INSERT INTO PLAN(IdPlan, Nombre, AnioInicial, CicloInicial, AnioFinal, CicloFInal, NumCreditosCierre, IdCarrera) values
-- (2, 'Matutino', '2024', '1s', '2024', '2s', 40, 1);


INSERT INTO Curso (CodigoCurso, Nombre) VALUES
(1, 'Mate'),
(2, 'Mate 2'), 
(4, 'Fisica'), 
(8, 'Fisica 2'),
(41, 'IPC 1'), 
(42, 'Logica de sistemas'), 
(105,'Archivos'), 
(106, 'Compi 1'), 
(107, 'Bases 1'), 
(108, 'Bases 2'), 
(202, 'practicas'), 
(111, 'filosofia'), 
(205, 'Seminario'), 
(55, 'Dibujo');

INSERT INTO Dia(IdDia, Nombre) VALUES 
(1, 'Lunes'),
(2, 'Martes'),
(3, 'Miercoles'),
(4, 'Jueves'),
(5, 'Viernes'),
(6, 'Sabado'),
(7, 'Domingo');

INSERT INTO salon(IdSalon, NombreSalon, Edificio) VALUES
(1, 'Salon 201', 'Edificio T-3'),
(2, 'Salon 202', 'Edificio T-3'),
(3, 'Salon 203', 'Edificio T-3');


INSERT INTO Periodo(IdPeriodo, HorarioInicio, HorarioFinal) VALUES
(1, '7:00', '8:00'),
(2, '8:00', '9:00'),
(3, '9:00', '10:00'),
(4, '10:00', '11:00'),
(5, '11:00', '12:00'),
(6, '12:00', '13:00'),
(7, '13:00', '14:00'),
(8, '14:00', '15:00'),
(9, '15:00', '16:00'),
(10, '16:00', '17:00'),
(11, '17:00', '18:00'),
(12, '18:00', '19:00'),
(13, '19:00', '20:00'),
(14, '20:00', '21:00'),
(15, '21:00', '22:00');
