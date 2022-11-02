<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.naponline.entidades.Comentario" %>
<%@ page import="com.naponline.dao.ComentarioDao" %>

<%
        String idAutor = PEGAR ID DE QUEM ESTÁ LOGADO;
        String comentario = request.getParameter("comentario");

        if((comentario != null) && !(comentario.isEmpty())) {

            //if(USUARIO ESTÁ LOGADO) {

                Comentario comentario = new Comentario(idPost, idAutor, comentario);
                String retorno = ComentarioDao.salvar(comentario);
                out.write("<script>");
                ut.write("alert('Agora é só esperar a aprovação do moderador!')");
                out.write("</script>");

            } else {
                out.write("<script>");
                out.write("alert('É preciso estar logado para comentar!')");
                out.write("</script>");
            }
        }
    %>