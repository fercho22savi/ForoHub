ALTER TABLE respuestas
DROP
FOREIGN KEY FKrdk71ni50iqx5wldlobe6lxyb;

CREATE TABLE perfiles
(
    id     BIGINT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    CONSTRAINT pk_perfiles PRIMARY KEY (id)
);

ALTER TABLE usuarios
    ADD contrasena VARCHAR(255) NULL;

ALTER TABLE usuarios
    MODIFY contrasena VARCHAR (255) NOT NULL;

ALTER TABLE topicos
    ADD id1 BIGINT NULL;

ALTER TABLE topicos
    ADD state VARCHAR(255) NULL;

ALTER TABLE topicos
    ADD title VARCHAR(255) NULL;

ALTER TABLE topicos
    MODIFY state VARCHAR (255) NOT NULL;

ALTER TABLE topicos
    MODIFY title VARCHAR (255) NOT NULL;

ALTER TABLE perfiles
    ADD CONSTRAINT uc_perfiles_nombre UNIQUE (nombre);

ALTER TABLE usuarios
    ADD CONSTRAINT uc_usuarios_email UNIQUE (email);

ALTER TABLE respuestas
    ADD CONSTRAINT FK_RESPUESTAS_ON_TOPICO FOREIGN KEY (topico_id) REFERENCES topicos (id1);

ALTER TABLE topicos
DROP
COLUMN estado;

ALTER TABLE topicos
DROP
COLUMN status;

ALTER TABLE usuarios
DROP
COLUMN password;

ALTER TABLE cursos
    MODIFY categoria VARCHAR (255) NOT NULL;

ALTER TABLE usuarios
    MODIFY email VARCHAR (255) NOT NULL;

ALTER TABLE respuestas
    MODIFY fecha_creacion datetime NOT NULL;

ALTER TABLE topicos
    MODIFY fecha_creacion datetime NOT NULL;

ALTER TABLE topicos
    MODIFY id BIGINT NULL;

ALTER TABLE cursos
    MODIFY nombre VARCHAR (255) NOT NULL;

ALTER TABLE usuarios
    MODIFY nombre VARCHAR (255) NOT NULL;

ALTER TABLE respuestas
    MODIFY solucion BIT (1) NOT NULL;

ALTER TABLE topicos
    MODIFY titulo VARCHAR (255) NULL;

ALTER TABLE topicos
    ADD PRIMARY KEY (id1);