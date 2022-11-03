package com.naponline.dao;

import com.naponline.entidades.Comentario;
import com.naponline.utilidades.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ComentarioDao {

    public static String salvar(Comentario comentario) {
        Connection con = Conexao.conectar();

        if(con != null) {
            String sql = "insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values(?,?,?,?)";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, comentario.getConteudo());
                stm.setBoolean(2, comentario.isAprovado());
                stm.setInt(3, comentario.getIdAutor());
                stm.setInt(4, comentario.getIdPost());
                stm.execute();
                return "Registro inserido com sucesso!";
            } catch (SQLException e) {
                return  "Erro: " + e.getMessage();
            }
        }
        return "Erro de conexão!";
    }

    public  static List<Comentario> consultarTodos() {
        List<Comentario> comentarios = new ArrayList<Comentario>();
        Connection con = Conexao.conectar();

        if(con != null) {
            try {
                PreparedStatement stm =
                        con.prepareStatement("select * from comentario");
                ResultSet rs = stm.executeQuery();

                while (rs.next()) {
                    Comentario comentario = new Comentario();
                    comentario.setId(rs.getInt("id"));
                    comentario.setConteudo(rs.getString("conteudo"));
                    comentario.setAprovado(rs.getBoolean("esta_aprovado"));
                    comentario.setIdPost(rs.getInt("id_post"));
                    comentario.setIdAutor(rs.getInt("id_autor"));
                    comentarios.add(comentario);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return comentarios;
    }

    public static Comentario consultarPorId(int idComentario) {
        Connection con = Conexao.conectar();
        Comentario comentario = new Comentario();

        if(con != null){
            try {
                PreparedStatement stm = con.prepareStatement("select * from post where id = ?");
                stm.setInt(1, idComentario);
                ResultSet rs = stm.executeQuery();

                if(rs.next()){
                    comentario.setId(rs.getInt("id"));
                    comentario.setConteudo(rs.getString("conteudo"));
                    comentario.setAprovado(rs.getBoolean("esta_aprovado"));
                    comentario.setIdAutor(rs.getInt("id_autor"));
                    comentario.setIdPost(rs.getInt("id_post"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return comentario;
    }

    public  static List<Comentario> consultarPorPost(int idPost) {
        List<Comentario> comentarios = new ArrayList<Comentario>();
        Connection con = Conexao.conectar();

        if(con != null) {
            try {
                PreparedStatement stm = con.prepareStatement("select * from comentario where id_post = ? and esta_aprovado = true");
                stm.setInt(1, idPost);
                ResultSet rs = stm.executeQuery();

                while (rs.next()) {
                    Comentario comentario = new Comentario();
                    comentario.setId(rs.getInt("id"));
                    comentario.setConteudo(rs.getString("conteudo"));
                    comentario.setAprovado(rs.getBoolean("esta_aprovado"));
                    comentario.setIdPost(rs.getInt("id_post"));
                    comentario.setIdAutor(rs.getInt("id_autor"));
                    comentarios.add(comentario);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return comentarios;
    }

    public static String aprovar(int idComentario){
        Connection con = Conexao.conectar();

        if(con != null){
            String sql = "update comentario set esta_aprovado = true where id = ?";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, idComentario);
                stm.execute();
                return "Registro alterado com sucesso!";
            } catch (SQLException e) {
                return "Não foi possível alterar registro!";
            }
        }
        return "Erro de conexão!";
    }

    public static String alterar(Comentario comentario){
        Connection con = Conexao.conectar();

        if(con != null){
            String sql = "update comentario set "+
                    "conteudo = ?, esta_aprovado = ?, id_autor = ?, id_post = ? where id = ?";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, comentario.getConteudo());
                stm.setBoolean(2, comentario.isAprovado());
                stm.setInt(3, comentario.getIdAutor());
                stm.setInt(4, comentario.getIdPost());
                stm.setInt(5, comentario.getId());
                stm.execute();
                return "Registro alterado com sucesso!";
            } catch (SQLException e) {
                return "Não foi possível alterar registro!";
            }
        }
        return "Erro de conexão!";
    }

    public static  void excluir(int idComentario){
        Connection con = Conexao.conectar();

        if(con != null){
            String sql = "delete from comentario where id = ?";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, idComentario);
                stm.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
