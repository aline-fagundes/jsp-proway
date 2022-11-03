<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.naponline.entidades.Post" %>
<%@ page import="com.naponline.dao.PostDao" %>
<%@ page import="com.naponline.entidades.Usuario" %>
<%@ page import="com.naponline.dao.UsuarioDao" %>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bloguine | Cadastro de post</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet"> 
    <link rel="stylesheet" href="./assets/css/base/base.css">
    <link rel="stylesheet" href="./assets/css/componentes/cabecalho.css">
    <link rel="stylesheet" href="./assets/css/componentes/cartao.css">
    <link rel="stylesheet" href="./assets/css/componentes/inputs.css">
    <link rel="stylesheet" href="./assets/css/componentes/botao.css">
</head>
<body>

    <%
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuario");
        if(usuarioLogado == null || usuarioLogado.getPerfil().equals("visitante")) {
                response.sendRedirect("login.jsp");
        }
    %>

    <header class="cabecalho container">
        <nav>
            <ul class="cabecalho__lista-navegacao">
                <li class="cabecalho__link">Bloguine</li>
                <li class="cabecalho__link"><a href="index-admin.jsp">Posts</a></li>
                <li class="cabecalho__link"><a href="modera-comentarios.jsp">Moderação</a></li>
                <li class="cabecalho__link"><a href="logout.jsp">Deslogar</a></li>
            </ul>
        </nav>
    </header>
    
    <main class="container flex flex--centro flex--centro">
        </br>
        <section class="cartao">
            <h2 class="cartao__titulo">Cadastre um post</h2>

            <form action="cadastro-post.jsp" class="formulario flex flex--coluna">
                <fieldset>
                    <legend class="formulario__legenda">Informe...</legend>

                    <div class="input-container">
                        <input name="titulo" id="titulo" class="input" type="text" placeholder="Título" required>
                        <label class="input-label" for="titulo">Título</label>
                    </div>

                    <div class="input-container">
                        <input name="conteudo" id="conteudo" class="input" type="text" placeholder="conteudo" required>
                        <label class="input-label" for="conteudo">Conteúdo</label>
                    </div>

                </fieldset>
                <button class="botao">Cadastrar</button>
            </form>
        </section>
    </main>

    <%
        String titulo = request.getParameter("titulo");
        String conteudo = request.getParameter("conteudo");

        if((titulo != null) && (conteudo != null) && !(titulo.isEmpty()) && !(conteudo.isEmpty())) {

            if(!PostDao.tituloExiste(titulo)) {
                Post post = new Post(titulo, conteudo);
                String retorno = PostDao.salvar(post);
                response.sendRedirect("cadastro-post-concluido.jsp");
            } else {
                out.write("<script>");
                out.write("alert('Já existe um post com esse título!')");
                out.write("</script>");
            }
        }
    %>

</body>
</html>
