package com.forohub.api.repository;

import com.forohub.api.model.Perfil;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PerfileRepository extends JpaRepository<Perfil, Long> {
    // Aquí puedes añadir métodos personalizados si los necesitas, por ejemplo:
    default <Perfil> Optional<Perfil> findByNombre(String nombre) {
        return null;
    }

    boolean existsByNombre(String nombre);
}
