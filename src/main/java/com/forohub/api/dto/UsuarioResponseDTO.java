package com.forohub.api.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.forohub.api.model.Usuario;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

/**
 * Record para devolver la información pública de un usuario.
 * Se usa para mostrar el autor en tópicos y respuestas.
 */
public record UsuarioResponseDTO(
        @NotNull
        Long id,

        @NotBlank
        String nombre,

        @NotBlank
        @Email
        String email
) {
    /**
     * Constructor compacto para mapear directamente desde la Entidad Usuario.
     * Esto limpia mucho el código de tus Services.
     */
    public UsuarioResponseDTO(Usuario usuario) {
        this(usuario.getId(), usuario.getNombre(), usuario.getEmail());
    }
}
