use forohub;
SHOW DATABASES;
select * from topicos;
describe topicos;
CREATE TABLE topicos (
    id BIGINT NOT NULL AUTO_INCREMENT,
    estado ENUM('ABIERTO', 'CERRADO', 'RESUELTO') DEFAULT 'ABIERTO',
    fecha_creacion DATETIME(6) DEFAULT CURRENT_TIMESTAMP(6),
    mensaje VARCHAR(255) NOT NULL,
    status VARCHAR(255),
    titulo VARCHAR(255) NOT NULL,
    autor_id BIGINT,
    curso_id BIGINT,
    PRIMARY KEY (id)
);
select * from usuarios;
select * from PerfilUsuario;
select * from topicos;
select * from respuestas;
select * from cursos;
select * from foro;

describe usuarios;
describe topicos;
describe respuestas;
describe cursos;
describe foro;

show tables;

INSERT INTO topicos (estado, fecha_creacion, mensaje, status, titulo, autor_id, curso_id) VALUES 
('ABIERTO', '2024-03-07 10:00:00.000000', '¿Cómo implementar la paginación en Spring Data?', 'PENDIENTE', 'Paginación API Rest', 1, 1),
('ABIERTO', '2024-03-07 11:15:30.123456', 'Error al validar el token JWT en el filtro.', 'ERROR_AUTH', 'Filtro de Seguridad', 2, 2),
('RESUELTO', '2024-03-08 09:45:00.000000', 'La solución fue usar @JsonAlias en el DTO.', 'SOLUCIONADO', 'Mapeo Jackson JSON', 3, 1),
('CERRADO', '2024-03-08 14:20:00.000000', 'Consulta duplicada, se movió al tópico #45.', 'DUPLICADO', 'Configuración MySQL', 1, 3),
('ABIERTO', '2024-03-09 08:30:15.555555', 'Diferencias entre FetchType.LAZY y EAGER.', 'NUEVO', 'Optimización Hibernate', 4, 1);

INSERT IGNORE INTO topicos (id, estado, fecha_creacion, mensaje, status, titulo, autor_id, curso_id) VALUES 
(1, 'ABIERTO', NOW(), 'Tópico de prueba 1', 'PROCESANDO', 'Título 1', 1, 1),
(2, 'ABIERTO', NOW(), 'Tópico de prueba 2', 'PROCESANDO', 'Título 2', 1, 1),
(3, 'ABIERTO', NOW(), 'Tópico de prueba 3', 'PROCESANDO', 'Título 3', 1, 1),
(5, 'ABIERTO', NOW(), 'Tópico de prueba 5', 'PROCESANDO', 'Título 5', 1, 1);

INSERT INTO respuestas (fecha_creacion, mensaje, solucion, autor_id, topico_id) VALUES 
('2024-03-10 09:00:00.000000', 'Prueba limpiando el caché de Maven con mvn clean install.', b'0', 1, 1),
('2024-03-10 10:15:30.123456', 'El error 403 suele ser por falta de permisos en el SecurityConfig.', b'1', 2, 2),
('2024-03-11 14:20:00.000000', '¿Has revisado si la base de datos está corriendo en el puerto 3306?', b'0', 3, 1),
('2024-03-11 16:45:10.000000', 'Exacto, con la anotación @Valid se activan las validaciones del DTO.', b'1', 4, 3),
('2024-03-12 08:30:00.555555', 'Para usar JWT necesitas la dependencia de jjwt en tu pom.xml.', b'1', 1, 5),
('2024-03-12 11:00:00.000000', 'No olvides anotar tu clase con @RestController.', b'0', 5, 2),
('2024-03-13 13:10:22.000000', 'El método findAll() de JpaRepository ya viene con paginación.', b'1', 2, 1),
('2024-03-13 15:50:00.000000', 'Verifica que el nombre de la columna en la BD coincida con el @Column.', b'0', 3, 3),
('2024-03-14 09:25:45.000000', 'Usa @GeneratedValue(strategy = GenerationType.IDENTITY) para MySQL.', b'1', 6, 5),
('2024-03-14 18:00:00.000000', 'Revisa los logs de Hibernate para ver la consulta SQL real.', b'0', 4, 1);

CREATE TABLE foro (
                      id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                      estado ENUM('ABIERTO','CERRADO','RESUELTO') DEFAULT 'ABIERTO',
                      fecha_creacion DATETIME(6),
                      mensaje VARCHAR(255) NOT NULL,
                      status VARCHAR(255),
                      titulo VARCHAR(255) NOT NULL,
                      autor_id BIGINT,
                      curso_id BIGINT,
                      INDEX idx_autor (autor_id),
                      INDEX idx_curso (curso_id)
);

INSERT INTO foro (estado, fecha_creacion, mensaje, status, titulo, autor_id, curso_id) VALUES
('ABIERTO', NOW(), 'No entiendo cómo funciona Spring Boot', 'ACTIVO', 'Duda sobre Spring Boot', 1, 1),
('RESUELTO', NOW(), 'Ya resolví el problema con la configuración de JPA', 'CERRADO', 'Error con Hibernate', 2, 1),
('ABIERTO', NOW(), '¿Cómo crear una API REST en Java?', 'ACTIVO', 'Crear API REST', 3, 2),
('CERRADO', NOW(), 'Tenía un problema con la conexión a MySQL', 'INACTIVO', 'Error conexión MySQL', 1, 2),
('ABIERTO', NOW(), '¿Qué es JWT y cómo se usa en Spring Security?', 'ACTIVO', 'Autenticación con JWT', 4, 3),
('RESUELTO', NOW(), 'Problema solucionado con dependencias de Maven', 'CERRADO', 'Dependencias Maven', 2, 3),
('ABIERTO', NOW(), '¿Cómo funciona JPA Repository?', 'ACTIVO', 'Uso de JpaRepository', 5, 1),
('ABIERTO', NOW(), 'Necesito ayuda con relaciones @ManyToOne', 'ACTIVO', 'Relaciones en JPA', 3, 4),
('RESUELTO', NOW(), 'Se solucionó el error en el controlador REST', 'CERRADO', 'Error en Controller', 4, 2),
('ABIERTO', NOW(), '¿Cómo implementar seguridad en una API?', 'ACTIVO', 'Spring Security básico', 5, 3);

select * from foro;

CREATE TABLE perfiles (
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

select * from perfiles;

describe perfiles;

INSERT INTO perfiles (nombre) VALUES
('ROLE_ADMIN'),
('ROLE_USER'),
('ROLE_MODERATOR');


DELETE FROM perfiles WHERE id = 3;
DELETE FROM perfiles WHERE id = 4;

DROP TABLE perfiles;


CREATE TABLE login (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    correo_electronico VARCHAR(255) NOT NULL,
    contrasena VARCHAR(255) NOT NULL
);

select * from login;

describe login;

INSERT INTO login (correo_electronico, contrasena) VALUES
('juan@email.com', '123456'),
('maria@email.com', '123456'),
('carlos@email.com', '123456'),
('ana@email.com', '123456'),
('luis@email.com', '123456');

show tables;

select *  from login;