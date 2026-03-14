CREATE TABLE respuestas (

                            id BIGINT AUTO_INCREMENT PRIMARY KEY,

                            mensaje TEXT NOT NULL,

                            fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,

                            autor_id BIGINT NOT NULL,

                            topico_id BIGINT NOT NULL,

                            CONSTRAINT fk_respuesta_usuario
                                FOREIGN KEY (autor_id)
                                    REFERENCES usuarios(id),

                            CONSTRAINT fk_respuesta_topico
                                FOREIGN KEY (topico_id)
                                    REFERENCES topicos(id)
);