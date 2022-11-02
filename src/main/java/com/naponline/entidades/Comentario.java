package com.naponline.entidades;

public class Comentario {

    private int id;
    private int idPost;
    private int idAutor;
    private String conteudo;
    private boolean aprovado = false;

    public Comentario() {

    }

    public Comentario(int idPost, int idAutor, String conteudo) {
        this.idPost = idPost;
        this.idAutor = idAutor;
        this.conteudo = conteudo;
    }

    public Comentario(int id, int idPost, int idAutor, String conteudo, boolean aprovado) {
        this.id = id;
        this.idPost = idPost;
        this.idAutor = idAutor;
        this.conteudo = conteudo;
        this.aprovado = aprovado;
    }

    public Comentario(int id, int idPost, int idAutor, String conteudo) {
        this.id = id;
        this.idPost = idPost;
        this.idAutor = idAutor;
        this.conteudo = conteudo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdPost() {
        return idPost;
    }

    public void setIdPost(int idPost) {
        this.idPost = idPost;
    }

    public int getIdAutor() {
        return idAutor;
    }

    public void setIdAutor(int idAutor) {
        this.idAutor = idAutor;
    }

    public String getConteudo() {
        return conteudo;
    }

    public void setConteudo(String conteudo) {
        this.conteudo = conteudo;
    }

    public boolean isAprovado() {
        return aprovado;
    }

    public void setAprovado(boolean aprovado) {
        this.aprovado = aprovado;
    }
}
