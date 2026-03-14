package com.forohub.api.dto;

import com.forohub.api.model.Topico;

import java.time.LocalDateTime;

public record TopicoListDTO(

        Long id,
        String titulo,
        String mensaje,
        String autor,
        LocalDateTime fechaCreacion

) {

    public TopicoListDTO(Topico topico) {
        this(
                topico.getId(),
                topico.getTitulo(),
                topico.getMensaje(),
                topico.getAutor().getNombre(),
                topico.getFechaCreacion()
        );
    }

}