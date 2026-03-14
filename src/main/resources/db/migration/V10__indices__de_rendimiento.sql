CREATE INDEX idx_usuario_email
    ON usuarios(email);

CREATE INDEX idx_topico_autor
    ON topicos(autor_id);

CREATE INDEX idx_topico_categoria
    ON topicos(categoria_id);

CREATE INDEX idx_respuesta_topico
    ON respuestas(topico_id);

CREATE INDEX idx_respuesta_autor
    ON respuestas(autor_id);