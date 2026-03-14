ALTER TABLE forohub.respuestas
DROP
FOREIGN KEY FKrdk71ni50iqx5wldlobe6lxyb;

CREATE TABLE forohub.perfiles
(
    id     BIGINT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    CONSTRAINT pk_perfiles PRIMARY KEY (id)
);

ALTER TABLE forohub.usuarios
    ADD contrasena VARCHAR(255) NULL;

ALTER TABLE forohub.usuarios
    MODIFY contrasena VARCHAR (255) NOT NULL;

ALTER TABLE forohub.topicos
    ADD id1 BIGINT NULL;

ALTER TABLE forohub.topicos
    ADD state VARCHAR(255) NULL;

ALTER TABLE forohub.topicos
    ADD title VARCHAR(255) NULL;

ALTER TABLE forohub.topicos
    MODIFY state VARCHAR (255) NOT NULL;

ALTER TABLE forohub.topicos
    MODIFY title VARCHAR (255) NOT NULL;

ALTER TABLE forohub.perfiles
    ADD CONSTRAINT uc_perfiles_nombre UNIQUE (nombre);

ALTER TABLE forohub.usuarios
    ADD CONSTRAINT uc_usuarios_email UNIQUE (email);

ALTER TABLE forohub.respuestas
    ADD CONSTRAINT FK_RESPUESTAS_ON_TOPICO FOREIGN KEY (topico_id) REFERENCES forohub.topicos (id1);

ALTER TABLE forohub.topicos
DROP
COLUMN estado;

ALTER TABLE forohub.topicos
DROP
COLUMN status;

ALTER TABLE forohub.usuarios
DROP
COLUMN password;

ALTER TABLE forohub.cursos
    MODIFY categoria VARCHAR (255) NOT NULL;

ALTER TABLE forohub.usuarios
    MODIFY email VARCHAR (255) NOT NULL;

ALTER TABLE forohub.respuestas
    MODIFY fecha_creacion datetime NOT NULL;

ALTER TABLE forohub.topicos
    MODIFY fecha_creacion datetime NOT NULL;

ALTER TABLE forohub.topicos
    MODIFY id BIGINT NULL;

ALTER TABLE forohub.cursos
    MODIFY nombre VARCHAR (255) NOT NULL;

ALTER TABLE forohub.usuarios
    MODIFY nombre VARCHAR (255) NOT NULL;

ALTER TABLE forohub.respuestas
    MODIFY solucion BIT (1) NOT NULL;

ALTER TABLE forohub.topicos
    MODIFY titulo VARCHAR (255) NULL;

ALTER TABLE forohub.topicos
    ADD PRIMARY KEY (id1);