<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Naponline Bloguine | Cadastro concluído</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./assets/css/base/base.css">
     <link rel="stylesheet" href="./assets/css/componentes/cabecalho.css">
    <link rel="stylesheet" href="./assets/css/cadastro_concluido.css">
    <link rel="stylesheet" href="./assets/css/componentes/cartao.css">
    <link rel="stylesheet" href="./assets/css/componentes/inputs.css">
    <link rel="stylesheet" href="./assets/css/componentes/botao.css">
</head>
<body>
    <header class="cabecalho container">
        <nav>
            <ul class="cabecalho__lista-navegacao">
                <li class="cabecalho__link">Naponline Bloguine</li>
            </ul>
        </nav>
    </header>

    <main class="container flex flex--coluna flex--centro">
        <br>
        <section class="cadastro-cartao cartao">
            <h1 class="cadastro-cartao__titulo cartao__titulo">Sua conta foi criada com sucesso!</h1>
            <a href="login.jsp"><input type="button" class="botao" value="Logar na sua conta"/></a>
        </section>
    </main>
</body>
</html>

