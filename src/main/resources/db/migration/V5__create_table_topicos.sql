CREATE TABLE topicos (

                         id BIGINT AUTO_INCREMENT PRIMARY KEY,

                         titulo VARCHAR(255) NOT NULL,

                         mensaje TEXT NOT NULL,

                         fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,

                         autor_id BIGINT NOT NULL,

                         categoria_id BIGINT NOT NULL,

                         CONSTRAINT fk_topico_usuario
                             FOREIGN KEY (autor_id)
                                 REFERENCES usuarios(id),

                         CONSTRAINT fk_topico_categoria
                             FOREIGN KEY (categoria_id)
                                 REFERENCES categorias(id)
);