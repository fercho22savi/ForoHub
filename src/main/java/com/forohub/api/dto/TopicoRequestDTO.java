package com.forohub.api.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

/**
 * DTO utilizado para recibir los datos necesarios
 * para crear un nuevo tópico en el sistema.
 */
public record TopicoRequestDTO(

        @NotBlank(message = "El título es obligatorio")
        String titulo,

        @NotBlank(message = "El mensaje es obligatorio")
        String mensaje,

        @NotNull(message = "El id del autor es obligatorio")
        Long autorId,

        @NotNull(message = "El id de la categoría es obligatorio")
        Long categoriaId

) {}