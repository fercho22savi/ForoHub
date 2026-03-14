package com.forohub.api.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record RespuestaRequestDTO(

        @NotBlank
        String mensaje,

        @NotNull
        Long autorId,

        @NotNull
        Long topicoId

) {}