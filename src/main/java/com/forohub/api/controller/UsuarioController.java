package com.forohub.api.controller;

import com.forohub.api.model.Usuario;

import com.forohub.api.service.UsuarioService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/usuarios")
public class UsuarioController {


    private UsuarioService usuarioService;

    // LISTAR TODOS LOS USUARIOS
    @GetMapping
    public List<Usuario> getAllUsers() {
        return usuarioService.getAllUsers();
    }

    // BUSCAR USUARIO POR ID
    @GetMapping("/{id}")
    public Usuario getUserById(@PathVariable Long id) {
        return usuarioService.getUserById(id);
    }

    // BUSCAR USUARIO POR EMAIL
    @GetMapping("/email/{email}")
    public Usuario getUserByEmail(@PathVariable String email) {
        return usuarioService.getUserByEmail(email);
    }

    // ELIMINAR USUARIO
    @DeleteMapping("/{id}")
    public void deleteUser(@PathVariable Long id) {
        usuarioService.deleteUser(id);
    }
}