package com.forohub.api.service;

import com.forohub.api.dto.RespuestaRequestDTO;
import com.forohub.api.model.Respuesta;
import com.forohub.api.model.Usuario;
import com.forohub.api.model.Topico;
import com.forohub.api.repository.RespuestaRepository;
import com.forohub.api.repository.UsuarioRepository;
import com.forohub.api.repository.TopicoRepository;

import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class RespuestaService {

    private final RespuestaRepository respuestaRepository;
    private final UsuarioRepository usuarioRepository;
    private final TopicoRepository topicoRepository;

    public RespuestaService(
            RespuestaRepository respuestaRepository,
            UsuarioRepository usuarioRepository,
            TopicoRepository topicoRepository) {

        this.respuestaRepository = respuestaRepository;
        this.usuarioRepository = usuarioRepository;
        this.topicoRepository = topicoRepository;
    }

    public List<Respuesta> getAllRespuestas() {
        return respuestaRepository.findAll();
    }

    public Respuesta getRespuestaById(Long id) {
        return respuestaRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Respuesta no encontrada con id: " + id));
    }

    public Respuesta createRespuesta(RespuestaRequestDTO requestDTO) {

        Usuario autor = usuarioRepository.findById(requestDTO.autorId())
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

        Topico topico = topicoRepository.findById(requestDTO.topicoId())
                .orElseThrow(() -> new RuntimeException("Topico no encontrado"));

        Respuesta respuesta = new Respuesta();
        respuesta.setMensaje(requestDTO.mensaje());
        respuesta.setFechaCreacion(LocalDateTime.now());
        respuesta.setAutor(autor);
        respuesta.setTopico(topico);

        return respuestaRepository.save(respuesta);
    }

    public Respuesta updateRespuesta(Long id, RespuestaRequestDTO requestDTO) {

        Respuesta respuesta = respuestaRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Respuesta no encontrada"));

        Usuario autor = usuarioRepository.findById(requestDTO.autorId())
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

        Topico topico = topicoRepository.findById(requestDTO.topicoId())
                .orElseThrow(() -> new RuntimeException("Topico no encontrado"));

        respuesta.setMensaje(requestDTO.mensaje());
        respuesta.setAutor(autor);
        respuesta.setTopico(topico);

        return respuestaRepository.save(respuesta);
    }

    public void deleteRespuesta(Long id) {

        Respuesta respuesta = respuestaRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Respuesta no encontrada"));

        respuestaRepository.delete(respuesta);
    }
}