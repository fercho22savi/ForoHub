package com.forohub.api.controller;

import com.forohub.api.dto.TopicoListDTO;
import com.forohub.api.model.Topico;
import com.forohub.api.repository.TopicoRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/topicos")
public class TopicoController {

    @Autowired
    private TopicoRepository repository;

    @GetMapping
    public Page<TopicoListDTO> listarTopicos(Pageable pageable) {

        Page<Topico> topicos = repository.findByEliminadoFalse(pageable);

        return topicos.map(TopicoListDTO::new);
    }
}