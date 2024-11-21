CREATE DATABASE EventoDB;
USE EventoDB;

CREATE TABLE Usuario (
    Id_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Cargo VARCHAR(50),
    Empresa VARCHAR(100)
);


CREATE TABLE Fornecedor (
    Id_Fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Servico VARCHAR(100),
    Disponibilidade VARCHAR(50)
);

CREATE TABLE Proposta (
    Id_Proposta INT AUTO_INCREMENT PRIMARY KEY,
    Valor DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(50),
    Data DATE,
    FK_Id_Fornecedor INT,
    FOREIGN KEY (FK_Id_Fornecedor) REFERENCES Fornecedor(Id_Fornecedor)
);

CREATE TABLE Evento (
    Id_Evento INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Data DATE,
    Local VARCHAR(100),
    Descricao TEXT,
    Orçamento DECIMAL(10, 2),
    FK_Id_Usuario INT, -- Usuário responsável
    FOREIGN KEY (FK_Id_Usuario) REFERENCES Usuario(Id_Usuario)
);

# Tabela de Tarefas relacionadas ao Evento
CREATE TABLE Tarefa (
    Id_Tarefa INT AUTO_INCREMENT PRIMARY KEY,
    Descricao TEXT,
    Status VARCHAR(50),
    Prazo_Inicial DATE,
    Prazo_Final DATE,
    FK_Id_Evento INT,
    FOREIGN KEY (FK_Id_Evento) REFERENCES Evento(Id_Evento)
);

CREATE TABLE Convidados (
    Id_Convidado INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Papel VARCHAR(50)
);

CREATE TABLE EventoConvidados (
    FK_Evento_Id_Evento INT,
    FK_Convidados_Id_Convidado INT,
    PRIMARY KEY(FK_Evento_Id_Evento, FK_Convidados_Id_Convidado),
    FOREIGN KEY(FK_Evento_Id_Evento) REFERENCES Evento(Id_Evento),
    FOREIGN KEY(FK_Convidados_Id_Convidado) REFERENCES Convidados(Id_Convidado)
);

# Usuários e Eventos (os participantes de um evento)
CREATE TABLE UsuarioEvento (
    FK_Usuario_Id_Usuario INT,
    FK_Evento_Id_Evento INT,
    PRIMARY KEY(FK_Usuario_Id_Usuario, FK_Evento_Id_Evento),
    FOREIGN KEY(FK_Usuario_Id_Usuario) REFERENCES Usuario(Id_Usuario),
    FOREIGN KEY(FK_Evento_Id_Evento) REFERENCES Evento(Id_Evento)
);

CREATE TABLE UsuarioTarefa (
    FK_Usuario_Id_Usuario INT,
    FK_Tarefa_Id_Tarefa INT,
    PRIMARY KEY(FK_Usuario_Id_Usuario, FK_Tarefa_Id_Tarefa),
    FOREIGN KEY(FK_Usuario_Id_Usuario) REFERENCES Usuario(Id_Usuario),
    FOREIGN KEY(FK_Tarefa_Id_Tarefa) REFERENCES Tarefa(Id_Tarefa)
);