<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.naponline.entidades.Usuario" %>
<%@ page import="com.naponline.dao.UsuarioDao" %>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Naponline Bloguine | Cadastro de conta</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet"> 
    <link rel="stylesheet" href="./assets/css/base/base.css">
    <link rel="stylesheet" href="./assets/css/componentes/cabecalho.css">
    <link rel="stylesheet" href="./assets/css/componentes/cartao.css">
    <link rel="stylesheet" href="./assets/css/componentes/inputs.css">
    <link rel="stylesheet" href="./assets/css/componentes/botao.css">
</head>
<body>
<body>
    <header class="cabecalho container">
        <nav>
            <ul class="cabecalho__lista-navegacao">
                <li class="cabecalho__link">Naponline Bloguine</li>
            </ul>
        </nav>
    </header>

    <main class="container flex flex--coluna flex--centro">
        </br>
        <section class="cartao">
            <h2 class="cartao__titulo">Cadastre-se</h2>
            <form action="cadastro-usuario.jsp" class="formulario flex flex--coluna">
                <fieldset>
                    <legend class="formulario__legenda">Informe...</legend>

                    <div class="input-container">
                        <input name="email" id="email" class="input" type="email" placeholder="Email" required>
                        <label class="input-label" for="email">Email</label>
                   </div>

                    <div class="input-container">
                        <input name="senha" id="senha" class="input" type="password" placeholder="Senha" required>
                        <label class="input-label" for="senha">Senha</label>
                    </div>

                </fieldset>
                <button class="botao">Cadastrar</button>
            </form>
        </section>
        <br>
        <p>Quer voltar para login?</p>
        <a href="login.jsp"><button class="botao">Retornar</a></button>
    </main>

    <%
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        if((email != null) && (senha != null) && !(email.isEmpty()) && !(senha.isEmpty())) {
            if(!UsuarioDao.usuarioExiste(email)) {
                Usuario usuario = new Usuario(email, senha);
                String retorno = UsuarioDao.salvar(usuario);
                response.sendRedirect("cadastro-usuario-concluido.jsp");
            } else {
                out.write("<script>");
                out.write("alert('Já existe cadastro com o email informado!')");
                out.write("</script>");
            }
        }
    %>

</body>
</html>
