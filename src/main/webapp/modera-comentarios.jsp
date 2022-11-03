<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.naponline.entidades.Comentario" %>
<%@ page import="com.naponline.dao.ComentarioDao" %>
<%@ page import="com.naponline.entidades.Usuario" %>
<%@ page import="com.naponline.dao.UsuarioDao" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Naponline Bloguine | Moderação</title>
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
                <li class="cabecalho__link"><a href="index-admin.jsp">Posts</a></li>
                <li class="cabecalho__link"><a href="cadastro-post.jsp">Cadastrar post</a></li>
                <li class="cabecalho__link"><a href="modera-comentarios.jsp">Moderação</a></li>
                <li class="cabecalho__link"><a href="login.jsp">Deslogar</a></li>
            </ul>
        </nav>
    </header>

    <main class="container flex flex--centro flex--coluna">
        <section class="cartao cadastro">

            <h2 class='cartao__titulo'>Moderação</h2>

            <%
                List<Comentario> comentarios = ComentarioDao.consultarTodos();

                for(Comentario comentario : comentarios){
                    out.write("<div class='input-container'>");
                    out.write("<p>" + comentario.getConteudo() + "</p>");
                    out.write("</div> <br>");
                    out.write("<button><a class='botao-simples' href='exclusao-comentario.jsp?id="+comentario.getId()+"'> ~ Deletar 🗑️ ~ </a></button>   ");

                    if(!comentario.isAprovado()){
                        out.write("<button><a class='botao-simples' href='aprova-comentario.jsp?id="+comentario.getId()+"'> ~ Aprovar conteúdo para ser exibido... ☑ ~ </a></button>   ");
                    } else {
                        out.write("<button class='botao-simples'> Já está como aprovado!</button>   ");
                    }
                    out.write("<br><br><br>");
                }
            %>

        </section>
    </main>
</body>
</html>