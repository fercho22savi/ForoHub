package com.forohub.api.repository;

import com.forohub.api.model.Respuesta;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RespuestaRepository extends JpaRepository<Respuesta, Long> {

    // Aquí puedes agregar métodos personalizados si lo deseas
    // Ejemplo: List<Respuesta> findByTopicoId(Long topicoId);
}