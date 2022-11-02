package com.naponline.dao;

import com.naponline.entidades.Usuario;
import com.naponline.utilidades.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDao {

    public static boolean podeLogar(String email, String senha){
        Connection con = Conexao.conectar();
        String sql = "select * from usuario where email = ? and senha = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, senha);
            ResultSet rs = stm.executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return true;
        }
    }

    public static boolean usuarioExiste(String email){
        Connection con = Conexao.conectar();
        String sql = "select * from usuario where email = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return true;
        }
    }

    public static String salvar(Usuario usuario) {
        Connection con = Conexao.conectar();

        if(con != null) {
            String sql = "insert into usuario(email, senha)" +
                    "values(?,?)";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, usuario.getEmail());
                stm.setString(2, usuario.getSenha());
                stm.execute();
            } catch (SQLException e) {
                return  "Erro: " + e.getMessage();
            }
            return "Registro inserido com sucesso!";
        }
        return "Erro de conexão!";
    }

    public  static List<Usuario> consultarTodos() {
        List<Usuario> usuarios = new ArrayList<Usuario>();
        Connection con = Conexao.conectar();

        if(con != null) {
            try {
                PreparedStatement stm =
                        con.prepareStatement(
                                "select * from usuario");
                ResultSet rs = stm.executeQuery();

                while (rs.next()) {
                    Usuario usuario = new Usuario();
                    usuario.setId(rs.getInt("id"));
                    usuario.setEmail(rs.getString("email"));
                    usuario.setSenha(rs.getString("email"));
                    usuario.setPerfil(rs.getString("perfil"));
                    usuarios.add(usuario);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return usuarios;
    }

    public static Usuario consultarPorId(int idUsuario) {
        Connection con = Conexao.conectar();
        Usuario usuario = new Usuario();

        if(con != null){
            try {
                PreparedStatement stm = con.prepareStatement("select * from usuario where id = ?");
                stm.setInt(1, idUsuario);
                ResultSet rs = stm.executeQuery();

                if(rs.next()){
                    usuario.setId(rs.getInt("id"));
                    usuario.setEmail(rs.getString("email"));
                    usuario.setSenha(rs.getString("email"));
                    usuario.setPerfil(rs.getString("perfil"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return usuario;
    }

    public static Usuario consultarPorEmail(String email) {
        Connection con = Conexao.conectar();
        Usuario usuario = new Usuario();

        if(con != null){
            try {
                PreparedStatement stm = con.prepareStatement("select * from usuario where email = ?");
                stm.setString(1, email);
                ResultSet rs = stm.executeQuery();

                if(rs.next()){
                    usuario.setId(rs.getInt("id"));
                    usuario.setEmail(rs.getString("email"));
                    usuario.setSenha(rs.getString("email"));
                    usuario.setPerfil(rs.getString("perfil"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return usuario;
    }
}
