<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.naponline.entidades.Usuario" %>
<%@ page import="com.naponline.dao.UsuarioDao" %>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bloguine | Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet"> 
    <link rel="stylesheet" href="./assets/css/base/base.css">
    <link rel="stylesheet" href="./assets/css/componentes/cabecalho.css">
    <link rel="stylesheet" href="./assets/css/componentes/cartao.css">
    <link rel="stylesheet" href="./assets/css/componentes/inputs.css">
    <link rel="stylesheet" href="./assets/css/componentes/botao.css">
</head>
<body>
    <header class="cabecalho container">
        <nav>
            <ul class="cabecalho__lista-navegacao">
                <li class="cabecalho__link">Bloguine</li>
            </ul>
        </nav>
    </header>

    <main class="container flex flex--coluna flex--centro">
    
        </br>
        
        <section class="cartao" >
            <form class="formulario flex flex--coluna" action="login.jsp" method="POST">
                <h2 class="cartao__titulo">Logar</h2>

                    <div class="input-container">
                        <input name="email" id="email" class="input" type="email" placeholder="Email" required>
                        <label class="input-label" for="email">Email</label>
                    </div>

                    <div class="input-container">
                        <input name="senha" id="senha" class="input" type="password" placeholder="Senha" required>
                        <label class="input-label" for="senha">Senha</label>
                    </div>
                
                    <input class="botao" id="btn-logar" type="submit" value="Logar"/>                 
                </form>   
        </section>

        <br>

        <p>Não tem conta?</p>
        <a href="cadastro-usuario.jsp"><input type="button" class="botao" value="Cadastrar"/></a>
    </main>

    <%
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        
        if((email != null) && (senha != null) && !(email.isEmpty()) && !(senha.isEmpty())){
            Usuario usuario = UsuarioDao.consultarPorEmail(email);

            if(UsuarioDao.podeLogar(email, senha)){
                session.setAttribute("usuario", usuario);

                if(usuario.getPerfil().equals("visitante")) {
                    response.sendRedirect("index.jsp");

                } else {
                    response.sendRedirect("index-admin.jsp");
                }
            } else {
                out.write("<script>");
                out.write("alert('Dados de login incorretos!')");
                out.write("</script>");
            }
        }
    %>

</body>
</html>