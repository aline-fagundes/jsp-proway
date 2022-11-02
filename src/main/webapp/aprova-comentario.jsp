<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.naponline.entidades.Comentario" %>
<%@ page import="com.naponline.dao.ComentarioDao" %>

<%
    String idComentario = request.getParameter("id");
    ComentarioDao.aprovar(Integer.parseInt(idComentario));
    response.sendRedirect("index-admin.jsp");
%>