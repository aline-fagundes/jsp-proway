-- SCRIPT DE CRIAÇÃO DE SCHEMA E TABELAS
create schema bloguine;

create table usuario(
id int primary key auto_increment,
email varchar(50),
senha varchar(10),
perfil varchar(10) default "visitante"
);

create table post(
id int primary key auto_increment,
titulo varchar(100),
conteudo varchar(2000)
);

create table comentario(
id int primary key auto_increment,
conteudo varchar(200),
esta_aprovado boolean default false,
id_autor int,
id_post int,
constraint id_autor foreign key(id_autor) references usuario(id),
constraint id_post foreign key(id_post) references post(id)
);



-- SCRIPT PARA POPULAR TABELA DE USUÁRIOS
insert into usuario(email, senha, perfil) values("admin@email.com", "SENHA123#", "admin");
insert into usuario(email, senha, perfil) values("aline@email.com", "SENHA123#", "visitante");



-- SCRIPT PARA POPULAR TABELA DE POSTS E COMENTÁRIOS
insert into post(titulo, conteudo) values("5 dicas para nunca mais errar nos donuts", 
"1) Sempre teste o fermento – Pacotinho com resto de fermento, já aberto (mal fechado) e largado no fundo do armário sabe lá há quanto tempo é um risco. Mantenha bem fechado, observe a validade ou compre um novo. <br><br>
2) A farinha faz diferença – Preste atenção no tipo de farinha pedido na receita, algumas tem mais proteína, outras menos. Uma boa farinha faz toda a diferença, veja as dicas do Amo Pão. <br><br>
3) Morno não é muito quente – Se a receita pedir para você esquentar leite, água ou outro líquido, lembre-se que morno quase sempre significa uma temperatura que a sua pele pode aguentar. Igual à mamadeira de bebê. <br><br>
4) O mínimo de farinha – Receitas são uma ciência, especialmente de doces. Polvilhar muito trigo na superfície porque a massa está muito úmida ou grudenta, vai adicionar mais trigo na massa e pode alterar o resultado final. Para algumas massas enriquecidas e mais gordurosas (donuts), eu uso óleo para untar. <br><br>
5) A mão molhada – Molhar bem a mão antes de mexer na massa ajuda a evitar que ela grude demais em você.");

insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values(
"Eu amo donuts! Essas dicas certamente vão me ajduar muito...",
true, 2, 1);

insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values(
"Muito obrigada pelas dicas...",
true, 2, 1);


insert into post(titulo, conteudo) values("Brownies de chocolate branco", 
"Ingredientes: <br><br>
1/2 xícara manteiga <br>
1 xícara chocolate branco picado <br>
1 ovo <br>
1 lata leite condensado <br>
1 colher (sopa) extrato ou essência de baunilha <br>
1 colher (chá) sal <br>
1 1/2 xícara farinha de trigo <br>
<br><br><br>
Instruções: <br><br>
Pré-aqueça o forno baixo por 15 minutos e unte uma assadeira de 20x20cm <br>
No microondas (ou em banho-maria), derreta a manteiga com o chocolate branco por 30 segundos. <br>
Mexa até dissolver todo o chocolate. Se necessário leve ao microondas novamente por mais 15 segundos. <br>
Adicione, mexendo bem,  o ovo, o leite condensado, a baunilha e o sal. <br>
Acrescente a farinha de trigo mexendo levemente. <br>
Leve ao forno para assar por 30 minutos em forno baixo. <br>
Polvilhe açúcar de confeiteiro para decorar.");

insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values(
"Já testei essa receita e deu super certo!",
true, 2, 2);

insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values(
"Que pena que estou de dieta...",
true, 2, 2);


insert into post(titulo, conteudo) values("Mais 5 dicas para nunca mais errar nos donuts", 
"1) Massa grudenta tem jeito – Algumas massas vão ficar bem grudentas logo depois que você misturar todos os ingredientes. Tenha paciência. Se tiver uma batedeira planetária, pegue o gancho e deixa a massa lá até que desgrude da tigela. Se for à mão, sove a massa até desgrudar. Pode levar muito tempo, mas vai dar certo. <br><br>
2) Deixe a massa crescer – Para crescer, este tipo de massa precisa de um local quente e úmido. Se tiver um microondas, coloque uma caneca com água para aquecer por dois minutos, depois afaste a caneca pro canto e deixe a massa descansar lá dentro. Acredito que dê pra fazer o mesmo no forno, mas eu usaria uma panela maior em vez da caneca. O segundo crescimento pode ser feito em temperatura ambiente mesmo. <br><br>
3) Não deixe crescer demais – A massa precisa de um tempo para atingir o tamanho ideal e os gases se formarem lá dentro. Se passar muito tempo, você vai ter uma massa frágil e cheia de ar. Levar a massa (coberta e em pote fechado) desacelera o processo de crescimento. <br><br>
4) Da mesa pro fogão – Quando eu faço donuts, na hora de cortar, deixo cada um em um quadrado de papel-manteiga (nosso herói) para facilitar no transporte e na fritura (é só jogar tudo lá dentro e recolher o papel. O papel eu unto com óleo ou polvilho farinha, se não usei na superfície em que sovei a massa. <br><br>
5) Temperatura certa – O ideal é fritar em uma temperatura de 185 a 190 graus (jogue uma pipoca e depois que ela estourar, tá ok). Em geral, 60 a 90 segundos de cada lado.");

insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values(
"Muito obrigada pelas dicas... Já vou colocar donuts para assar!",
true, 2, 3);

insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values(
"Eu sempre errava a temperatura do forno!",
true, 2, 3);


insert into post(titulo, conteudo) values("Geleia de pimenta", 
"Ingredientes: <br><br>
1/2 unidade Abacaxi <br>
1 xícara Açúcar <br>
1/2 unidade pimenta dedo de moça <br>
<br><br><br>
Instruções: <br><br>
Descasque o abacaxi e pique em pedaços bem pequenos. <br>
Leve o abacaxi picado e o açúcar ao fogo baixo. <br>
Enquanto o açúcar derrete, pique a pimenta (sem as sementes) em pedaços bem pequenos. <br>
Quando o açúcar estiver já derretido e fazendo tipo um doce de abacaxi, adicione a pimenta picada. <br>
Continue em fogo baixo para ir secando até atingir a consistência de geleia.");

insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values(
"Geleia de pimenta com dadinho de tapioca é uma combinação perfeita!",
true, 2, 4);
insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values(
"Não tinha ideia que tinha como ingrediente abacaxi!",
true, 2, 4);


insert into post(titulo, conteudo) values("5 ideias de doces para o Dia das Bruxas", 
"1) Cookies de aranhas: Eu sei que pode parecer complicado, mas se você olhar bem não passa de um cookie e você pode improvisar um sonho de valsa ou algum chocolate redondo em cima. <br><br>
2) Brownies com dentadura: Massa de brownie pronta ou de bolo de chocolate. Depois um glacê por cima, marshmallow, chantilly, buttercream, cobertura de cream cheese ou mesmo chocolate derretido. Jogue uma destas dentaduras que você encontra em qualquer supermercado no corredor de doces. Finalize com calda de morango – as de sorvete mesmo. <br><br>
3) Morangos fantasmas: Pegue uns morangos bem limpinhos, banhe-os em chocolate branco derretido e adicione os olhinhos com um saquinho de confeitar. Para ter este efeito do “rabinho” do fantasma, use o saco de confeitar para jogar mais chocolate quando o morango já estiver na bandeja. Depois faça os olhinhos. Se não tiver saco, você pode improvisar como já ensinamos aqui. <br><br>
4) Laranjas recheadas: O único trabalho que você vai ter aqui é tirar a polpa da laranja, deixar a casca secar e fazer os entalhes com as caretas. Depois é só jogar os M&Ms ou Skittles. Fica bem bacana, não é? Pode servir até de lembrança. <br><br>
5) Red velvet sangrento: Receita de red velvet não falta por aqui. O toque de dia das bruxas fica por conta da ganache de chocolate branco tingida de vermelho para dar impressão de sangue.");

insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values(
"Que criativo! Vou fazer o red velvet para minha festa de halloween!",
true, 2, 5);

insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values(
"Adorei a ideia dos morangos!",
true, 2, 5);


insert into post(titulo, conteudo) values("Barra de chocolate com morango e pistache", 
"Ingredientes: <br><br>
200g chocolate ao leite, meio amargo ou branco <br>
1 caixa de morangos <br>
100g pistache (ou nozes, castanhas, etc) <br>
<br><br><br>
Instruções: <br><br>
Lave bem os morangos e fatie-os. <br>
Forre uma forma com papel manteiga, coloque cada fatia em contato com o papel manteiga (não bote um em cima do outro). <br>
Leve ao forno mais baixo possível por 60 a 90 minutos ou até que o morangos estejam secos. <br>
Quando estiverem secos, deixe-os no forno desligado para que continuem desidratando. <br>
Derreta o chocolate em banho-maria ou no microondas de 30 em 30 segundos, mexendo sempre para não queimar. <br>
Forre uma forma pequena (15cm) com papel manteiga (lembrando de cobrir as paredes da forma também) e despeje o chocolate. <br>
Com cuidado, coloque as fatias de morango decorando como desejar e também os pistache. <br>
Leve à geladeira até endurecer. <br>
Quando estiver duro, corte em quadradinhos e sirva.");

insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values(
"A temperatura para assar aqui não deu muito certo...",
true, 2, 6);

insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values(
"Trocar os pistaches por nozes também dá super certo...",
true, 2, 6);


insert into post(titulo, conteudo) values("Mais 5 ideias de doces para o Dia das Bruxas", 
"1) Limonada preta: Você pode adicionar carvão ativado a qualquer bebida, como limonada por exemplo, para deixá-la preta. Disponível em lojas de produtos naturais e farmácias. Ele pode ser ingerido sem problemas. <br><br>
2) Olhos no espeto: Pode ser o que você quiser dentro: brigadeiro, trufas, bolo amassado como cake pop, etc. Depois cubra com chocolate branco derretido e os detalhes podem ser pintados com corante alimentício ou com pasta americana como na foto. <br><br>
3) Maçã envenenada: A maçã do amor pode parecer com maçã envenenada com apenas umas gotinhas de corante. O blog Malas e panelas tem a receita. <br><br>
4) Tampas temáticas: É possível dar um toque de Halloween usando as cores tradicionais laranja e preto. Para embalagens, você pode recortar carinhas em papel contact preto e sair colando nas tampas. Para outros doces, faça o mesmo, mas com pasta americana. <br><br>
5) Melancia assustadora: Já que abóbora não é bem a cara do brasileiro, a gente pode fazer aquelas caretas numa melancia com outras frutas tropicais. Sem falar que depois de tanto açúcar, fica mais saudável e bem gostoso.");

insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values(
"Esculpir a melancia aqui foi um desastre, rs! Mas nos divertimos muito.",
true, 2, 7);

insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values(
"Vou fazer os olhos no espeto!",
true, 2, 7);


insert into post(titulo, conteudo) values("Pudim de leite", 
"Ingredientes: <br><br>
1 lata de leite condensado <br>
1 lata de leite (medida da lata de leite condensado) <br>
3 ovos inteiros <br>
1 xícara (chá) de açúcar <br>
1/2 xícara de água <br>
<br><br><br>
Instruções: <br><br>
Derreta o açúcar na panela até ficar moreno, acrescente a água e deixe engrossar. <br>
Coloque em uma forma redonda e despeje a massa do pudim por cima. <br>
Asse em forno médio por 45 minutos, com a assadeira redonda dentro de uma maior com água. <br>
Espete um garfo para ver se está bem assado. <br>
Deixe esfriar e desenforme.");

insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values(
"Essa receita de pudim é perfeita!",
true, 2, 8);

insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values(
"Eu sempre erro no caramelo!",
true, 2, 8);


insert into post(titulo, conteudo) values("5 sabores de brigadeiro", 
"Quem não ama brigadeiro?  <br>
Existem diversas receitas para fazer o doce – com frutas, especiarias e até mesmo vegano, sem glúten ou lactose! Se tornando uma peça chave para atender a necessidade de todos... <br>
<br>
1) Brigadeiro de pistache; <br><br>
2) Brigadeiro de limão; <br><br>
3) Brigadeiro de biomassa; <br><br>
4) Brigadeiro de café; <br><br>
5) Brigadeiro de amendoim;");

insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values(
"Nunca imaginei quantas possibilidades existem para fazer sabores de brigadeiro!",
true, 2, 9);

insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values(
"Fiquei curiosa para experimentar o de café!",
true, 2, 9);


insert into post(titulo, conteudo) values("Brigadeiro de pistache", 
"Ingredientes: <br><br>
1 lata de leite condensado <br>
50g de pistache sem sal e sem casca <br>
1 colher de sopa de manteiga <br>
100g de creme de leite fresco <br>
1 pitada de sal <br>
<br><br><br>
Instruções: <br><br>
Utilize um processador ou liquidificador para triturar o pistache. <br>
Depois, adicione o leite condensado, a farinha de pistache, a manteiga e o sal em um recipiente grande. <br>
Comece a mexer sem parar em fogo baixo. <br>
Quando perceber que está desgrudando da panela, acrescente o creme de leite fresco e cozinhe por mais um minuto. <br>
Sirva para comer com colher ou enrole-os.");

insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values(
"Eu amei essa receita... O brigadeiro ficou maravilhoso!",
true, 2, 10);

insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values(
"Pena que o pistache está muito caro.",
true, 2, 10);



-- SCRIPT PARA POPULAR TABELA DE POSTS COM POSTS SEM COMENTÁRIOS
insert into post(titulo, conteudo) values("5 curiosidades sobre café", 
"1)  O café mais caro do mundo é o KopiLuwak, produzido na Indonésia. O alto valor se deve à raridade do grão. A produção é extremamente limitada, pois depende da ingestão das frutas de café feita por pequenos mamíferos da região,conhecidos como Civetas. Ao ingerirem, o grão do café passa por um processo de fermentação natural que deixa um aroma peculiar. <br><br>
02)  De todas as matérias-primas do mundo, o café é a segunda mais comercializada do mundo. Perde apenas para o petróleo. <br><br>
03)  Existem selos de qualidade que avaliam a produção sustentável do café, e isso melhorou muito as condições de trabalho em muitos plantios. A Rainforest Alliance e a UTZ Certified focam na sustentabilidade e responsabilidade social dos cultivos ao redor do mundo. Ter o selo valoriza muito o produto. <br><br>
04)  O espresso, uma das formas de preparo mais conhecidas do mundo, foi criada na Itália, e a origem desse nome foi pelo fato de ser umabebida feita sob pressão. A maioria das pessoas pensa que esse nome vem da rapidez com que o café é feito. Se enganam. Inclusive, por conta disso, a tradução foi feita para o nosso idioma de maneira equivocada: chamamos aqui de expresso. A tradução correta seria algo como “café pressionado” que, convenhamos, não é atraente. Deixa errado mesmo que fica mais bonito. <br><br>
05)  Os melhores grãos só podem ser cultivados em altitudes muito elevadas, acima de 1400m.");


insert into post(titulo, conteudo) values("Bolo de chocolate", 
"Ingredientes: <br><br>
1/2 xícara (chá) de óleo <br>
3 cenouras médias raladas <br>
4 ovos <br>
2 xícaras (chá) de açúcar <br>
2 e 1/2 xícaras (chá) de farinha de trigo <br>
1 colher (sopa) de fermento em pó <br>
1 colher (sopa) de manteiga <br>
3 colheres (sopa) de chocolate em pó <br>
1 xícara (chá) de açúcar <br>
1 xícara (chá) de leite <br>
<br><br><br>
Instruções: <br><br>
Em um liquidificador, adicione a cenoura, os ovos e o óleo, depois misture. <br>
Acrescente o açúcar e bata novamente por 5 minutos. <br>
Em uma tigela ou na batedeira, adicione a farinha de trigo e depois misture novamente. <br>
Acrescente o fermento e misture lentamente com uma colher.<br> 
Asse em um forno preaquecido a 180° C por aproximadamente 40 minutos. <br>
Despeje em uma tigela a manteiga, o chocolate em pó, o açúcar e o leite, depois misture. <br>
Leve a mistura ao fogo e continue misturando até obter uma consistência cremosa, depois despeje a calda por cima do bolo.");



-- SCRIPT PARA POPULAR TABELA DE COMENTÁRIOS COM COMENTÁRIOS SEM APROVAÇÃO
insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values("Essa receita é horrível!", false, 2, 10);
insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values("Não gostei do post!", false, 2, 8);
insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values("Esse blog não tem conteúdo bom!", false, 2, 6);
insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values("Que legal... Estou gostando muito dos posts!", false, 2, 4);
insert into comentario(conteudo, esta_aprovado, id_autor, id_post) values("Amei o post!", false, 2, 2);



-- SCRIPT PARA VISUALIZAR TABELAS
select * from usuario;
select * from post;
select * from comentario;