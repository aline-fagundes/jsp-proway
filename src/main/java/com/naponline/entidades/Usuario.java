package com.naponline.entidades;

public class Usuario {

    private int id;
    private String email;
    private String senha;
    private String perfil;

    public Usuario() {

    }

    public Usuario(String email, String senha) {
        this.email = email;
        this.senha = senha;
        this.perfil = "visitante";
    }

    public Usuario(int id, String email, String senha, String perfil) {
        this.id = id;
        this.email = email;
        this.senha = senha;
        this.perfil = perfil;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getPerfil() {
        return perfil;
    }

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }
}
