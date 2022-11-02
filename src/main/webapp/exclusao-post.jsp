<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.naponline.entidades.Post" %>
<%@ page import="com.naponline.dao.PostDao" %>

<%
    String idPost = request.getParameter("id");
    PostDao.excluir(Integer.parseInt(idPost));
    response.sendRedirect("index-admin.jsp");
%>