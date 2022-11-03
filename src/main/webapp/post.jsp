<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.naponline.entidades.Post" %>
<%@ page import="com.naponline.dao.PostDao" %>
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
                <li class="cabecalho__link">Naponline Bloguine </li>
                <li class="cabecalho__link"><a href="index.jsp">Home</a></li>
                <li class='cabecalho__link'><a href='todos-os-posts.jsp'>Posts</a></li>

                <%
                    Usuario usuarioLogado = (Usuario) session.getAttribute("usuario");
                        if(usuarioLogado != null) {
                            out.write("<li class='cabecalho__link'><a href='logout.jsp'>Deslogar</a></li>");
                        } else {
                            out.write("<li class='cabecalho__link'><a href='login.jsp'>Logar</a></li>");
                        }
                %>
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
                <p> Post número: </p>
                <input type="text" id="id" name="id" class="input" value="<% out.write(idPost); %>" readonly />
                <br>
                <p> <% out.write(p.getConteudo()); %> </p>

            </div>

        </section>
        </br>
        <section class="cartao cadastro">

            <h2 class="cartao__titulo">O que achou do post?</h2>

            <form action= <% out.write("'post.jsp?id="+p.getId()+"'"); %> method="POST" class="formulario flex flex--coluna">

                <fieldset>
                    <div class="input-container">
                        <input name="comentario" id="comentario" class="input" type="text" placeholder="comentario" required>
                        <label class="input-label" for="comentario">Escreva o que achou...</label>
                    </div>
                </fieldset>

                <input class="botao" type="submit" value="Comentar"/>

            </form>
        </section>

        <%
            if(request.getMethod() == "POST"){
                Usuario usuario = (Usuario) session.getAttribute("usuario");

                String conteudoComentario = request.getParameter("comentario");

                if((conteudoComentario != null) && !(conteudoComentario.isEmpty())) {

                    if(usuario != null) {

                    int idAutorComentario = usuario.getId();
                    int idPostComentario = Integer.parseInt(request.getParameter("id"));

                    Comentario comentario = new Comentario(idPostComentario, idAutorComentario, conteudoComentario);
                    String retorno = ComentarioDao.salvar(comentario);
                    response.sendRedirect("index.jsp");

                    } else {
                        out.write("<script>");
                        out.write("alert('É preciso estar logado para comentar!')");
                        out.write("</script>");
                        }
                    }
                }
            %>

        </br>
        <section class="cartao cadastro">

            <h2 class='cartao__titulo'>O que outros leitores acharam...</h2>

            <br>

            <%
                int post = Integer.parseInt(request.getParameter("id"));
                List<Comentario> comentarios = ComentarioDao.consultarPorPost(post);

                if(comentarios.isEmpty()) {
                    out.write("<div class='input-container'>");
                    out.write("<input type='text' class='input' value='Seja o primeiro a comentar!' readonly />");
                    out.write("</div>");
                    out.write("<br><br>");
                }

                for(Comentario comentario : comentarios){
                    out.write("<div class='input-container'>");
                    out.write("<p>" + comentario.getConteudo() + "</p>");
                    out.write("</div>");
                    out.write("<br><br>");
                }
            %>

        </section>
    </main>
</body>
</html>
