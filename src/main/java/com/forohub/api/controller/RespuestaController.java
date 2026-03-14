package com.forohub.api.controller;

import com.forohub.api.dto.RespuestaRequestDTO;
import com.forohub.api.model.Respuesta;
import com.forohub.api.service.RespuestaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/respuestas")
public class RespuestaController {

    @Autowired
    public RespuestaService respuestaService;

    // Listar todas las respuestas
    @GetMapping
    public List<Respuesta> getAllRespuestas() {
        return respuestaService.getAllRespuestas();
    }

    // Obtener una respuesta por ID
    @GetMapping("/{id}")
    public Respuesta getRespuestaById(@PathVariable Long id) {
        return respuestaService.getRespuestaById(id);
    }

    // Crear una nueva respuesta
    @PostMapping
    public Respuesta createRespuesta(@RequestBody RespuestaRequestDTO requestDTO) {
        return respuestaService.createRespuesta(requestDTO);
    }

    // Actualizar una respuesta existente
    @PutMapping("/{id}")
    public Respuesta updateRespuesta(@PathVariable Long id, @RequestBody RespuestaRequestDTO requestDTO) {
        return respuestaService.updateRespuesta(id, requestDTO);
    }

    // Eliminar una respuesta
    @DeleteMapping("/{id}")
    public void deleteRespuesta(@PathVariable Long id) {
        respuestaService.deleteRespuesta(id);
    }
}