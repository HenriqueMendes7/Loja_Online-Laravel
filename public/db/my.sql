DROP DATABASE IF EXISTS dblaravel;
CREATE DATABASE dblaravel;

USE dblaravel;

/*
CREATE TABLE tbCliente(
    idCliente int(9) NOT NULL AUTO_INCREMENT,
    nome varchar(250) NOT NULL,
    dtNasc date NOT NULL,
    estadoCivil enum('solteiro','casado','outro'),
    endereco varchar(250) NOT NULL,
    numero int(4) NOT NULL,
    complemento varchar(250),
    cep varchar(9) NOT NULL,
    cidade varchar(250) NOT NULL,
    estado varchar(250) NOT NULL,
    rg varchar(20) NOT NULL UNIQUE,
    cpf varchar(20) NOT NULL UNIQUE,
    email varchar(250) NOT NULL UNIQUE,
    fone varchar(20) NOT NULL,
    cel varchar(20) NOT NULL,
    senha varchar(250) NOT NULL,
    PRIMARY KEY(idCliente)
);
*/

CREATE TABLE tbCliente(
    idCliente int(9) NOT NULL AUTO_INCREMENT,
    nome varchar(250) NOT NULL,
    email varchar(250) NOT NULL,
    senha varchar(250) NOT NULL,
    PRIMARY KEY(idCliente)
);

CREATE TABLE tbCategoria(
    idCategoria int(5) NOT NULL AUTO_INCREMENT,
    categoria varchar(250) NOT NULL,
    PRIMARY KEY(idCategoria)
);

CREATE TABLE tbProduto(
    idProduto int(9) NOT NULL AUTO_INCREMENT,
    idCategoria int(5) NOT NULL,
    produto varchar(250) NOT NULL,
    quantidade int(4),
    valor float NOT NULL,
    descprod varchar(550),
    imagem varchar(250) DEFAULT 'img/produto.png',
    PRIMARY KEY(idProduto),
    CONSTRAINT `fk_idCategoria_produto` FOREIGN KEY (`idCategoria`) REFERENCES `tbCategoria` (`idCategoria`)
);

CREATE TABLE tbContato(
    idContato int NOT NULL AUTO_INCREMENT,
    nome varchar(40) NOT NULL,
    email varchar(40) NOT NULL,
    fone varchar(40) NOT NULL,
    assunto varchar(40) NOT NULL,
    mensagem varchar(500) NOT NULL,
    PRIMARY KEY(idContato)
);

CREATE TABLE tbPedido(
	idPedido int(5) NOT NULL AUTO_INCREMENT,
	idCliente int(9) NOT NULL,
    idCategoria int(5) NOT NULL,
    idProduto int(9) NOT NULL,
    dataPedido date NOT NULL,
    entregue boolean,
    PRIMARY KEY(idPedido),
    CONSTRAINT `fk_idCliente_pedido` FOREIGN KEY (`idCliente`) REFERENCES `tbCliente` (`idCliente`),
    CONSTRAINT `fk_idProduto_pedido` FOREIGN KEY (`idProduto`) REFERENCES `tbProduto` (`idProduto`),
    CONSTRAINT `fk_idCategoria_pedido` FOREIGN KEY (`idCategoria`) REFERENCES `tbCategoria` (`idCategoria`)
);

/*DADOS DO BANCO*/
/*INSERT INTO tbCliente VALUES
(NULL, 'Bruno Lima', '2005-03-31', 'solteiro', 'Rua da Mooca', '3129', 'Casa 3', '102937192', 'S??o Paulo', 'S??o Paulo', '3192818363', '192931813', 'brumencarini89@gmail.com', '26076341', '981046461', 'bruno123');*/

INSERT INTO tbCategoria VALUES
(NULL, 'Notebook'),
(NULL, 'Mouse'),
(NULL, 'Fone'),
(NULL, 'Projetor'),
(NULL, 'Tablet'),
(NULL, 'TV'),
(NULL, 'Rel??gio'),
(NULL, 'Eletrodom??stico'),
(NULL, 'Pel??cia'),
(NULL, 'PC Gamer'),
(NULL, 'Celular');

INSERT INTO tbProduto VALUES
(NULL, '1', 'Notebook gamer Dell G15', '202', 5697.00, 'O novo e aprimorado design t??rmico inspirado no Alienware oferece a refrigera????o ideal, gra??as a duas entradas de ar, blades ultrafinos de ventilador*, tubos de cobre e quatro aberturas de ventila????o estrategicamente colocadas. E com processadores Intel?? i5 de 12 n??cleos ou i7 de 14 n??cleos de at?? 12?? gera????o, al??m de perfis de desempenho otimizados, voc?? pode se deleitar com desempenho avan??ado e consistente durante todas as experi??ncias gamers.', 'img/notebookG15.png'),
(NULL, '2', 'Mouse Classic Box ??ptico Full Black USB - MO300', '180', 8.99, 'Supimpa, compra a?? e da dinheiro pra nois', 'img/mouseclassic.png'),
(NULL, '3', 'Fone de Ouvido Sem Fio, HUAWEI Freebuds 4i, TWS, Bluetooth, Cancelamento de Ru??do Ativo, Som com Qualidade, Carregamento R??pido, Preto - FREEBUDSPTO', '197', 299.00, 'Fone de Ouvido Sem Fio Huawei Free Buds 4I Pequenos em tamanho. Modernos no design. Com estojo de carga oval, o Huawei FreeBuds 4i possui um visual original, compacto e moderno. Leve, voc?? consegue lev??-lo para qualquer lugar.', 'img/fonehuawei.png'),
(NULL, '10', 'PC Gamer F??cil Intel Core I7, 16GB RAM, Nvidia GeForce Gtx 1050ti 4GB, SSD 480GB, Fonte 500w, Windows 10, Preto', '139', 3248.10, 'PC Gamer F??cil Intel Core I7, 16GB, Gtx 1050ti 4GB, SSD 480GB, Fonte 500w, Windows 10, Preto', 'img/pcfacil.png'),
(NULL, '10', 'PC Gamer Acer Predator Orion 5000 Intel Core i7-11700, RGB, NVIDIA GeForce RTX3070, 16GB RAM, SSD 1TB, Windows 11 Home, Preto - DG.E2QAL.006', '245', 10699.99, 'PC Gamer Acer Predator Orion 5000 Intel Core i7-11700, RGB, NVIDIA GeForce RTX3070, 16GB RAM, SSD 1TB, Windows 11 Home, Preto', 'img/pcacer.png'),
(NULL, '5', 'Tablet Samsung Galaxy A7 Lite 4G, 32GB, Android 11, Tela de 8.7, Grafite - SM-T225NZAPZTO', '243', 829.00, 'Galaxy Tab A7 Lite (4G) 32 GB, Projetado para ir aonde voc?? for com gestos simples para usar com apenas uma m??o e possui uma c??mera para capturar seus momentos ao vivo Feito para ir aonde voc?? for N??o troque estilo por conveni??ncia. O Galaxy Tab A7 Lite oferece os dois em uma estrutura fina. Com espessura de 8,0 mm e 371 g de peso, ele ?? super port??til e pode ser guardado com facilidade na bolsa sem pesar.', 'img/tableta7.png'),
(NULL, '6', 'Smart TV Samsung 50 Polegadas UHD 4K, 3 HDMI, 1 USB, Processador Crystal 4K, Tela sem limites, Visual Livre de Cabos, Alexa - UN50AU7700GXZD', '103', 2449.99, 'O processador Crystal 4K transforma tudo o que voc?? assiste em resolu????o pr??xima ?? 4K. Todos os produtos UHD 4K da Samsung s??o certificados pela CEA (Consumer Eletronics Association) e DE (Digital Europe). Estas entidades estabeleceram crit??rios m??nimos para certificar um produto como o UHD 4K, entre eles, garantir que o produto tenha em cada pixel a capacidade de reproduzir todas as cores.', 'img/tv50pol.png'),
(NULL, '3', 'Fone de Ouvido Sem Fio Sennheiser HD 250BT, Bluetooth 5.0, com Microfone, Preto - 509179', '80', 259.99, 'O HD 250BT foi inspirado na mesma experi??ncia de ??udio vivida pelos mais renomados Djs do mundo. A famosa tecnologia de transdutores da Sennheiser garante um ??udio de qualidade com graves din??micos.', 'img/fonebluetooth.png'),
(NULL, '4', 'Projetor LG CineBeam Smart TV 140, UHD 4K, HDR10, 1500 ANSI Lumens, HDMI/USB, Bluetooth, Wi-Fi, Branco - HU70LA', '32', 5999.99, 'Projetor LG CineBeam Smart TV O sonho de ter um cinema em casa virou realidade O LG CineBeam HU70LA projeta uma impressionante tela at?? 140 polegadas, com uma resolu????o UHD 4K n??tida, v??vida e brilhante. S??o intensos 8,3 milh??es de pixels e tecnologia XPR, assim o HU70LA da LG oferece detalhes e precis??o impec??veis 4 vezes maior que o Full HD.', 'img/projetorlg.png'),
(NULL, '11', 'Smartphone Samsung Galaxy S22, 8GB RAM, 128GB, C??mera Tripla 50MP, Tela 6.1, Preto - SM-S901EZKRZTO', '106', 4499.00, 'Smartphone Samsung Galaxy S22, 8GB RAM, 128GB, C??mera Tripla 50MP, Tela 6.1, Preto - SM-S901EZKRZTO', 'img/samsungs22.png'),
(NULL, '7', 'Smartwatch Samsung Galaxy Watch 4, Bluetooth, 40mm, Preto - SM-R860NZKPZTO', '256', 979.00, 'Smartwatch Samsung Galaxy Watch 4, Bluetooth, 40mm, Preto.', 'img/smartwatch.png'),
(NULL, '3', 'Fone de Ouvido Samsung Galaxy Buds Pro, Cancelamento de Ru??do, Violeta - SM-R190NZVPZTO', '299', 679.00, 'O Galaxy Buds Pro ?? um fone de ouvido totalmente sem fio, o que te d?? maior liberdade atividades tanto no dia-a-dia, no lazer ou para o esporte, enquanto aproveita um som mais imersivo.', 'img/galaxybuds.png'),
(NULL, '11', 'Smartphone Samsung Galaxy S20 FE 128GB, 6GB RAM, Snapdragon 865, C??mera Tripla, Carregamento Super R??pido, Cloud Navy - SM-G780GZBRZTO', '111', 2324.80, 'Este ?? o smartphone para pessoas que querem tudo. Ouvimos voc??s, os f??s, e agora n??o precisam mais ficar em d??vida sobre o que escolher. Este ?? o smartphone feito sob medida para f??s de todos os tipos. Ent??o, se voc?? ?? f?? de fotografia, jogos ou adora deixar seu feed repleto de tudo que o inspira, n??s reunimos a combina????o definitiva de inova????o S20.', 'img/samsungs20.png'),
(NULL, '10', 'PC Gamer OnPress OnGaming Intel Core i5-10400F, RGB, 8GB, GeForce GTX 1650, SSD 256GB, Linux, Preto - OGARM-X1065', '258', 4399.99, 'O Computador ?? equipado com uma Fonte de alimenta????o de 450W reais com 80 Plus Bronze, que traz energia est??vel para n??o ter nenhum problema enquanto joga. O Gabinete Gamer MID Tower traz um visual gamer robusto, al??m do Sistema Operacional Linux, garantindo todos os novos recursos.', 'img/pconpress.png'),
(NULL, '10', 'Cadeira Gamer Husky Gaming Snow, Preto, Cilindro de G??s Classe 4, Base em Metal, Roda em Nylon - HSN-BK', '140', 529.99, 'A Cadeira Gamer Husky Gaming Snow proporciona alto conforto e qualidade para as melhores horas do seu dia! Tudo isso aliado a um ??timo custo benef??cio.', 'img/cadeiragamer.png'),
(NULL, '3', 'Headset Gamer HyperX Cloud Stinger, Drivers 50mm, M??ltiplas Plataformas, P2 e P3 - HX-HSCS-BK/NA', '135', 149.99, 'Completa e vers??til, a linha de headsets Cloud foi projetada para as necessidades de qualquer n??vel de jogador. Independente do seu sistema, estilo de jogo e caracter??sticas este headset ir?? te surpreender.', 'img/headset.png'),
(NULL, '8', 'Rob?? Aspirador de P?? KaBuM! Smart 700, Preto, Mapeamento IR 360??, Controle via Aplicativo, Google Assistant e Alexa - KBSF003', '289', 1399.99, 'O Rob?? Aspirador de P?? IR 360?? KaBuM! Smart 700 ?? uma revolu????o para o seu lar!', 'img/aspirador1.png'),
(NULL, '8', 'Rob?? Aspirador de P?? KaBuM! Smart 500, Preto - Recarregamento Autom??tico, Filtro HEPA, Controle via Aplicativo - KBSF000', '258', 889.99, 'Controle seu Rob?? Aspirador de P?? KaBuM! Smart 500 diretamente se seu Smartphone atrav??s do App KaBuM! Smart. Pelo app voc?? pode visualizar os n??veis de bateria, alterar a pot??ncia de suc????o, fazer agendamento de hor??rios de funcionamento e diversas outras fun????es!', 'img/aspirador2.png'),
(NULL, '9', 'Polvo Revers??vel Bipolar de Pel??cia Humor Feliz e Bravo 2 em 1 TikTok Fofinho Macio - Rosa e Azul', '190', 9.19, 'Esse lindo polvo de pel??cia ?? muito engra??adinho e fofo. Use para demonstrar que est?? cheio de alegria e tamb??m para mostrar quando est?? bravo (a). Produto com cores vivas, material de excelente qualidade e muito macio. Perfeito para brincar e decorar seu ambiente.', 'img/polvopelucia.png'),
(NULL, '9', 'Urso de Pel??cia 21 cm Sentado Docinho P??rola', '178', 43.70, 'Para cada ocasi??o diferente, existe uma pel??cia que encanta. Seja para presentar um amor, um amigo, seja para ver o sorriso lindo estampado no rosto de uma crian??a ou at?? mesmo para se tornar o companheiro imsepar??vel de algu??m!', 'img/ursinhopelucia.jpg');
