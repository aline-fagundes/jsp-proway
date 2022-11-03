<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.naponline.entidades.Post" %>
<%@ page import="com.naponline.dao.PostDao" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Naponline Bloguine | Edição de post</title>
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
                <li class="cabecalho__link">Naponline Bloguine</li>
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
        <section class="cartao">
            <h2 class="cartao__titulo">Edição</h2>
            <form action="edita-post.jsp" method="POST" class="formulario flex flex--coluna">
                <input type="text" id="id-post" name="id" class="input" value="<% out.write(idPost); %>" readonly />
                <br>
                <fieldset>
                    <legend class="formulario__legenda">Informe...</legend>

                    <div class="input-container">
                        <input name="titulo" id="titulo" class="input" type="text" placeholder="Título" value="<% out.write(p.getTitulo()); %>">
                        <label class="input-label" for="titulo">Título</label>
                    </div>

                    <div class="input-container">
                        <input name="conteudo" id="conteudo" class="input" type="text" placeholder="Conteúdo" value="<% out.write(p.getConteudo()); %>">
                        <label class="input-label" for="conteudo">Conteúdo</label>
                    </div>

                </fieldset>
                <button class="botao">Alterar</button>
            </form>
        </section>
    </main>

    <%
        if(request.getMethod() == "POST"){
            String titulo = request.getParameter("titulo");
            String conteudo = request.getParameter("conteudo");

            p.setTitulo(titulo);
            p.setConteudo(conteudo);
            PostDao.alterar(p);
            response.sendRedirect("index-admin.jsp");
        }
    %>

</body>
</html>