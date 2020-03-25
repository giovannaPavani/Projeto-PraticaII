create table MReceitas
(
    idReceita int identity primary key,
    idUsuario int not null,
    data Smalldatetime not null,
    nome varchar(40),
    quantia money not null,
    ADD CONSTRAINT FK_idUsuario FOREIGN KEY (idUsuario)
    REFERENCES MUsuarios(idUsuario)
)

create table MDespesas
(
    idDespesa int identity primary key,
    idUsuario int not null,
    data Smalldatetime not null,
    nome varchar(40),
    idTag varchar(20),
    descricao varchar(60),
    lugar varchar(25),
    quantia money not null,
    idCompartilhamento int,
    ADD CONSTRAINT FK_idUsuario FOREIGN KEY (idUsuario)
    REFERENCES MUsuarios(idUsuario),
    ADD CONSTRAINT FK_idTag FOREIGN KEY (idTag)
    REFERENCES MTags(idTag),
    ADD CONSTRAINT FK_idCompartilhamento FOREIGN KEY (idCompartilhamento)
    REFERENCES MCompartilhamento(idComp)
)

create table MCompartilhamentos
(
    idComp int identity primary key,
    idUsuario int not null,
    idDespesa int not null,
    ADD CONSTRAINT FK_idUsuario FOREIGN KEY (idUsuario)
    REFERENCES MUsuarios(idUsuario),
    ADD CONSTRAINT FK_idDespesa FOREIGN KEY (idDespesa)
    REFERENCES MDespesas(idDespesa),
)

create table MTags
(
    idTag int identity primary key,
    nome varchar(25) not null
)

create table MUsuarios
(
    idUsuario int identity primary key,
    nome varchar(70) not null,
    apelido varchar(20) not null,
    email varchar(40) not null,
    celular varchar(14) not null,
    dataDeNascimento date not null,
    foto varchar(300),
    senha varchar(20) not null,
    cidade varchar(30) not null,
    estado varchar(25) not null,
    pais varchar(25) not null,
    notificacoes bit not null,		 
    modoAnonimo bit not null,
    saldo money
)

create table MAmigos
(
    idAmigos int identity primary key,
    idAmigo1 int not null,
    idAmigo2 int not null,
    ADD CONSTRAINT FK_idUsuario FOREIGN KEY (idAmigo1)
    REFERENCES MUsuarios(idUsuario),
    ADD CONSTRAINT FK_idUsuario FOREIGN KEY (idAmigo2)
    REFERENCES MUsuarios(idUsuario)
)

create table MAssuntos
(
    idAssunto int identity primary key,
    assunto varchar(50) not null
)

create table MTips
(
    idTips int identity primary key,
    idAssunto int not null,
    dica varchar(200),
    ADD CONSTRAINT FK_idAssunto FOREIGN KEY (idAssunto)
    REFERENCES MUsuarios(idAssunto)
)

create table MVideos
(
    idVideo int identity primary key,
    idAssunto int not null,
    video varchar(250) not null,
    ADD CONSTRAINT FK_idAssunto FOREIGN KEY (idAssunto)
    REFERENCES MUsuarios(idAssunto)
)

create table MArtigos
(
    idArtigo int identity primary key,
    idAssunto int not null,
    artigo varchar(300),
    ADD CONSTRAINT FK_idAssunto FOREIGN KEY (idAssunto)
    REFERENCES MUsuarios(idAssunto)
)


