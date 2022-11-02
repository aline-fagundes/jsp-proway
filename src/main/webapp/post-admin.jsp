<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.naponline.entidades.Post" %>
<%@ page import="com.naponline.dao.PostDao" %>
<%@ page import="com.naponline.entidades.Comentario" %>
<%@ page import="com.naponline.dao.ComentarioDao" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Naponline Bloguine | Post</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./assets/css/base/base.css">
    <link rel="stylesheet" href="./assets/css/componentes/cabecalho.css">
    <link rel="stylesheet" href="./assets/css/componentes/cartao.css">
    <link rel="stylesheet" href="./assets/css/componentes/inputs.css">
    <link rel="stylesheet" href="./assets/css/componentes/botao.css">
    <link rel="stylesheet" href="./assets/css/componentes/tabela.css">
</head>
<body>
    <header class="cabecalho container">
        <nav>
            <ul class="cabecalho__lista-navegacao">
                <li class="cabecalho__link"><a href="index-admin.jsp">Posts</a></li>
                <li class="cabecalho__link"><a href="cadastro-post.jsp">Cadastrar post</a></li>
                <li class="cabecalho__link"><a href="modera-comentarios.jsp">Moderação</a></li>
                <li class="cabecalho__link"><a href="logout.jsp">Deslogar</a></li>
            </ul>
        </nav>
    </header>

    <%
        String idPost = request.getParameter("id");
        Post p = PostDao.consultarPorId(Integer.parseInt(idPost));
    %>

    <main class="container flex flex--centro flex--coluna">
        <section class="cartao cadastro">

            <h1 class="cartao__titulo">Bloguine</h1>

            <div class='input-container'>

                <h2 class='cartao__titulo'> <% out.write(p.getTitulo()); %> </h2>
                <p> <% out.write(p.getConteudo()); %> </p>

            </div>

        </section>
        </br>
        <section class="cartao cadastro">

            <h2 class='cartao__titulo'>O que outros leitores acharam...</h2>

            <br>

            <%
                int post = Integer.parseInt(request.getParameter("id"));
                List<Comentario> comentarios = ComentarioDao.consultarPorPost(post);

                for(Comentario comentario : comentarios){
                    out.write("<div class='input-container'>");
                    out.write("<p>" + comentario.getConteudo() + "</p>");
                    out.write("</div>");
                    out.write("<br><br><br>");
                }
            %>

        </section>
    </main>
</body>
</html>