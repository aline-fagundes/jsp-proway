package com.naponline.entidades;

import java.util.ArrayList;
import java.util.List;

public class Post {

    private int id;
    private String titulo;
    private String conteudo;

    public Post() {

    }

    public Post(String titulo, String conteudo) {
        this.titulo = titulo;
        this.conteudo = conteudo;
    }

    public Post(int id, String titulo, String conteudo) {
        this.id = id;
        this.titulo = titulo;
        this.conteudo = conteudo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getConteudo() {
        return conteudo;
    }

    public void setConteudo(String conteudo) {
        this.conteudo = conteudo;
    }
}
