<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.naponline.entidades.Post" %>
<%@ page import="com.naponline.dao.PostDao" %>
<%@ page import="com.naponline.entidades.Usuario" %>
<%@ page import="com.naponline.dao.UsuarioDao" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Naponline Bloguine | Posts</title>
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

    <%
        Usuario usuario = (Usuario) session.getAttribute("usuario");
            if(usuario == null || usuario.getPerfil().equals("visitante")) {
                response.sendRedirect("login.jsp");
            }
    %>

    <header class="cabecalho container">
        <nav>
            <ul class="cabecalho__lista-navegacao">
                <li class="cabecalho__link">Naponline Bloguine</li>
                <li class="cabecalho__link"><a href="cadastro-post.jsp">Cadastrar post</a></li>
                <li class="cabecalho__link"><a href="modera-comentarios.jsp">Moderação</a></li>
                <li class="cabecalho__link"><a href="logout.jsp">Deslogar</a></li>
            </ul>
        </nav>
    </header>

    <main class="container flex flex--centro flex--coluna">
        <section class="cartao cadastro">
            <h1 class="cartao__titulo">Bloguine</h1>
            
            <%
               List<Post> posts = PostDao.consultarTodos();

               for(Post post : posts){

                   String conteudo = post.getConteudo();
                   String previa = conteudo.substring(0, (conteudo.length() < 15 ? conteudo.length() : 15));

                    out.write("<div class='input-container'>");
                    out.write("<h2 class='cartao__titulo'>" + post.getTitulo() + "</h2>");
                    out.write("<p>" + previa + "...</p>");
                    out.write("</div>");
                    out.write("<button><a class='botao' href='post-admin.jsp?id="+post.getId()+"'>Ler</a></button>   ");
                    out.write("<button><a class='botao' href='edita-post.jsp?id="+post.getId()+"'>Editar</a></button>   ");
                    out.write("<button><a class='botao' href='exclusao-post.jsp?id="+post.getId()+"'>Deletar</a></button>");
                    out.write("<br><br><br>");
               }
            %>
                       
        </section>
    </main>
</body>
</html>