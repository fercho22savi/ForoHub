package com.forohub.api.repository;

import com.forohub.api.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
    // ESTA LÍNEA ES LA QUE FALTA:
    Optional<Usuario> findByEmail(String email);
}
