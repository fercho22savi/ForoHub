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
select * from topicos;
select * from respuestas;
select * from cursos;

describe usuarios;
describe topicos;
describe respuestas;
describe cursos;
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
