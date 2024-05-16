-- --------------------------------------------------------
-- TRIGGERS
-- --------------------------------------------------------
DELIMITER $$
CREATE TRIGGER insert_Estudiante
AFTER INSERT ON Estudiante 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Estudiante', 'INSERT');
END $$

DELIMITER $$
CREATE TRIGGER update_Estudiante
AFTER UPDATE ON Estudiante 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Estudiante', 'UPDATE');
END $$

DELIMITER $$
CREATE TRIGGER delete_Estudiante
AFTER DELETE ON Estudiante 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Estudiante', 'DELETE');
END $$
-- --------------------------------------------------------
DELIMITER $$
CREATE TRIGGER insert_Carrera
AFTER INSERT ON Carrera 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Carrera', 'INSERT');
END $$

DELIMITER $$
CREATE TRIGGER update_Carrera
AFTER UPDATE ON Carrera 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Carrera', 'UPDATE');
END $$

DELIMITER $$
CREATE TRIGGER delete_Carrera
AFTER DELETE ON Carrera 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Carrera', 'DELETE');
END $$
-- --------------------------------------------------------
DELIMITER $$
CREATE TRIGGER insert_Asignacion
AFTER INSERT ON Asignacion 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Asignacion', 'Inscrito');
END $$

DELIMITER $$
CREATE TRIGGER update_Asignacion
AFTER UPDATE ON Asignacion 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Asignacion', 'UPDATE');
END $$

DELIMITER $$
CREATE TRIGGER delete_Asignacion
AFTER DELETE ON Asignacion 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Asignacion', 'DELETE');
END $$
-- --------------------------------------------------------
DELIMITER $$
CREATE TRIGGER insert_Catedratico
AFTER INSERT ON Catedratico 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Catedratico', 'INSERT');
END $$

DELIMITER $$
CREATE TRIGGER update_Catedratico
AFTER UPDATE ON Catedratico 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Catedratico', 'UPDATE');
END $$

DELIMITER $$
CREATE TRIGGER delete_Catedratico
AFTER DELETE ON Catedratico 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Catedratico', 'DELETE');
END $$
-- --------------------------------------------------------
DELIMITER $$
CREATE TRIGGER insert_Pensum
AFTER INSERT ON Pensum 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Pensum', 'INSERT');
END $$

DELIMITER $$
CREATE TRIGGER update_Pensum
AFTER UPDATE ON Pensum 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Pensum', 'UPDATE');
END $$

DELIMITER $$
CREATE TRIGGER delete_Pensum
AFTER DELETE ON Pensum 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la la tabla Pensum', 'DELETE');
END $$
-- --------------------------------------------------------
DELIMITER $$
CREATE TRIGGER insert_Curso
AFTER INSERT ON Curso 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la la tabla Curso', 'INSERT');
END $$

DELIMITER $$
CREATE TRIGGER update_Curso
AFTER UPDATE ON Curso 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Curso', 'UPDATE');
END $$

DELIMITER $$
CREATE TRIGGER delete_Curso
AFTER DELETE ON Curso 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Curso', 'DELETE');
END $$
-- --------------------------------------------------------
DELIMITER $$
CREATE TRIGGER insert_Seccion
AFTER INSERT ON Seccion 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Seccion', 'INSERT');
END $$

DELIMITER $$
CREATE TRIGGER update_Seccion
AFTER UPDATE ON Seccion 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Seccion', 'UPDATE');
END $$

DELIMITER $$
CREATE TRIGGER delete_Seccion
AFTER DELETE ON Seccion 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Seccion', 'DELETE');
END $$
-- --------------------------------------------------------
DELIMITER $$
CREATE TRIGGER insert_Horario
AFTER INSERT ON Horario 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Horario', 'INSERT');
END $$

DELIMITER $$
CREATE TRIGGER update_Horario
AFTER UPDATE ON Horario 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Horario', 'UPDATE');
END $$

DELIMITER $$
CREATE TRIGGER delete_Horario
AFTER DELETE ON Horario 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Horario', 'DELETE');
END $$
-- --------------------------------------------------------
DELIMITER $$
CREATE TRIGGER insert_Prerrequisito
AFTER INSERT ON Prerrequisito
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Prerrequisito', 'INSERT');
END $$

DELIMITER $$
CREATE TRIGGER update_Prerrequisito
AFTER UPDATE ON Prerrequisito 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Prerrequisito', 'UPDATE');
END $$

DELIMITER $$
CREATE TRIGGER delete_Prerrequisito
AFTER DELETE ON Prerrequisito 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Prerrequisito', 'DELETE');
END $$
-- --------------------------------------------------------
-- --------------------------------------------------------
DELIMITER $$
CREATE TRIGGER insert_Desasignacion
AFTER INSERT ON Desasignacion 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Desasignacion', 'INSERT');
END $$

DELIMITER $$
CREATE TRIGGER update_Desasignacion
AFTER UPDATE ON Desasignacion 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Desasignacion', 'UPDATE');
END $$

DELIMITER $$
CREATE TRIGGER delete_Desasignacion
AFTER DELETE ON Desasignacion 
FOR EACH ROW
BEGIN
    INSERT INTO Historial (Fecha, Descripcion, Tipo) 
    VALUES (now(),  'Se ha operado sobre la tabla Desasignacion', 'DELETE');
END $$
-- --------------------------------------------------------
-- --------------------------------------------------------
