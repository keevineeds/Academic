/* CREATE TABLE */

create table Usuario(
    idUsuario int primary key auto_increment,
    cpf varchar(14) not null,
    nome varchar(50) not null,
    senha varchar(32) not null,
    email varchar(75) not null
);

create table Produto(
    idProd int primary key auto_increment,
    nomeProd varchar(70) not null,
    descricao text not null,
    idFoto int not null,
    valorUnitario decimal(6,2) not null
)


/* INSERTS */

insert into produto values (1, 'iPhone XR 128GB Preto', 'A nova tela do iPhone XR é a mais avançada LCD da indústria, com um novo design de retroiluminação que possibilita ampliar a tela até a borda, acompanhando a curvatura dos cantos. Assim, você vê cores fiéis de ponta a ponta.', 1, 4299.99);

insert into produto values(2, 'Galaxy Note 20 256GB Dourado', 'Com design minimalista, sua estrutura de metal é realçada por detalhes refinados, cores sublimes e o Corning Gorilla Glass Victus, o vidro mais resistente já criado para um smartphone. Cada Galaxy Note20 Ultra vem acompanhado de uma S Pen na mesma cor. O Note20 Ultra foi projetado para para oferecer sofisticação e conforto incríveis em sua mão. O display de 6.9 pol do Galaxy Note20 Ultra oferece amplo espaço para trabalhar e um display enorme para jogar. Com um único toque da S Pen, sua caligrafia é ajustada se você estiver escrevendo torto, mantendo suas anotações legíveis e organizada. Elas também podem ser transformadas automaticamente em texto digitado copiável e colável. Depois, você pode enviá-las para um slide do PowerPoint ou arquivo do Word para compartilhar com facilidade.', 2, 7999.99);

insert into produto values(3, 'iPhone 12 Pro 128GB Azul', 'iPhone 12 Pro. Tela Super Retina XDR brilhante de 6,1 polegadas. Ceramic Shield, que é quatro vezes mais resistente a quedas. Fotos surpreendentes em pouca luz com o novo sistema de câmera Pro e alcance de zoom óptico de 4x. Reprodução, edição e gravação de vídeos em Dolby Vision com qualidade de cinema. Retratos com modo Noite e experiências ainda melhores em realidade aumentada com o Scanner LiDAR. Poderoso chip A14 Bionic. Compatível com 5G. E novos acessórios MagSafe com encaixe fácil e recarga sem fio mais rápida.', 3, 8799.99);

insert into produto values(4, 'Moto E6S 32GB Cinza', 'Smartphone Motorola Moto E6S, 32GB, 13MP, Tela 6.1´, Cinza Titanium + Capa Protetora', 4, 879.89);

insert into produto values(5, 'K8+ 16GB Preto', 'Tela TFT HD de 5.45 polegadas, com uma tela de alta definição oferece a experiência visual que você merece, com cores brilhantes e clareza notável. Câmera Traseira de 8MP com Autofoco, capture sua visão com uma câmera excepcional de alta resolução que foca com rapidez e mantém suas memórias nítidas. Com uma bateria removível de 2.500 mAh, enfrente seu dia cheio de ação com toneladas de energia. Com 16GB de memória, desfrute de muito espaço de armazenamento para fotos, vídeos e aplicativos com até 32 GB de suporte para cartão microSD.', 5, 649.95);

insert into produto values(6, 'Galaxy A51 128GB Branco', 'O A51 possui um Display Infinito Full HD+ de 6.5" com tecnologia Super AMOLED, para você poder jogar, assistir, navegar e nos seus conteúdos favoritos sem interrupções. Aproveite um smartphone que minimiza as bordas e maximiza cada centímetro da tela. O padrão moderno do design do A51 vem em tons suaves e elegantes, incluindo preto, branco e azul. Um acabamento brilhante adiciona o toque perfeito de estilo ao design fino e elegante, com a combinação perfeita de estilo e conforto. Tire fotos nítidas de alta resolução com a câmera principal de 48MP, tanto de dia quanto de noite. Uma câmera Ultra Wide de 123° fotografa imagens mais amplas. Escolha a câmera Macro de 5 MP para tirar fotos de perto com alta definição, e destaque o objeto com os vários efeitos de Foco Dinâmico da câmera de profundidade de 5 MP.', 6, 1949.87);

