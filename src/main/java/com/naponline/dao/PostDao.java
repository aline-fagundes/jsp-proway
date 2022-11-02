package com.naponline.dao;

import com.naponline.entidades.Post;
import com.naponline.utilidades.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    public static boolean tituloExiste(String titulo){
        Connection con = Conexao.conectar();
        String sql = "select * from post where titulo = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, titulo);
            ResultSet rs = stm.executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return true;
        }
    }

    public static String salvar(Post post) {
        Connection con = Conexao.conectar();

        if(con != null) {
            String sql = "insert into post(titulo, conteudo)" +
                    "values(?,?)";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, post.getTitulo());
                stm.setString(2, post.getConteudo());
                stm.execute();

                return "Registro inserido com sucesso!";
            } catch (SQLException e) {
                return  "Erro: " + e.getMessage();
            }
        }
        return "Erro de conexão!";
    }

    public  static List<Post> consultarTodos() {
        List<Post> posts = new ArrayList<Post>();
        Connection con = Conexao.conectar();

        if(con != null) {
            try {
                PreparedStatement stm =
                        con.prepareStatement(
                                "select * from post order by id desc");
                ResultSet rs = stm.executeQuery();

                while (rs.next()) {
                    Post post = new Post();
                    post.setId(rs.getInt("id"));
                    post.setTitulo(rs.getString("titulo"));
                    post.setConteudo(rs.getString("conteudo"));
                    posts.add(post);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return posts;
    }

    public static Post consultarPorId(int idPost) {
        Connection con = Conexao.conectar();
        Post post = new Post();

        if(con != null){
            try {
                PreparedStatement stm = con.prepareStatement("select * from post where id = ?");
                stm.setInt(1, idPost);
                ResultSet rs = stm.executeQuery();

                if(rs.next()){
                    post.setId(rs.getInt("id"));
                    post.setTitulo(rs.getString("titulo"));
                    post.setConteudo(rs.getString("conteudo"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return post;
    }

    public static String alterar(Post post){
        Connection con = Conexao.conectar();

        if(con != null){
            String sql = "update post set titulo = ?, conteudo = ? where id = ?";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, post.getTitulo());
                stm.setString(2, post.getConteudo());
                stm.setInt(3, post.getId());
                stm.execute();

                return "Registro alterado com sucesso!";
            } catch (SQLException e) {
                return "Não foi possível alterar registro!";
            }
        }
        return "Erro de conexão!";
    }

    public static void excluir(int idPost){
        Connection con = Conexao.conectar();

        if(con != null){
            String sql1 = "delete from comentario where id_post = ?;";
            String sql2 = "delete from post where id = ?";
            try {
                PreparedStatement stm1 = con.prepareStatement(sql1);
                stm1.setInt(1, idPost);
                stm1.executeUpdate();
                PreparedStatement stm2 = con.prepareStatement(sql2);
                stm2.setInt(1, idPost);
                stm2.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
