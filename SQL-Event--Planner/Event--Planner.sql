-- Criação do banco de dados
CREATE DATABASE EventoDB;

-- Seleciona o banco de dados
USE EventoDB;

-- Criação da tabela Usuario
CREATE TABLE Usuario (
    Id_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Cargo VARCHAR(50),
    Empresa VARCHAR(100)
);

-- Criação da tabela Fornecedor
CREATE TABLE Fornecedor (
    Id_Fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Servico VARCHAR(100),
    Disponibilidade VARCHAR(50)
);

-- Criação da tabela Proposta
CREATE TABLE Proposta (
    Id_Proposta INT AUTO_INCREMENT PRIMARY KEY,
    Valor DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(50),
    Data DATE,
    FK_Id_Fornecedor INT,
    FOREIGN KEY (FK_Id_Fornecedor) REFERENCES Fornecedor(Id_Fornecedor)
);

-- Criação da tabela Evento
CREATE TABLE Evento (
    Id_Evento INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Data DATE,
    Local VARCHAR(100),
    Descricao TEXT,
    Orçamento DECIMAL(10, 2)
   --  FK_Id_Usuario INT,
    -- FOREIGN KEY (FK_Id_Usuario) REFERENCES Usuario(Id_Usuario)
);

-- Criação da tabela Tarefa
CREATE TABLE Tarefa (
    Id_Tarefa INT AUTO_INCREMENT PRIMARY KEY,
    Descricao TEXT,
    Status VARCHAR(50),
    Prazo_Inicial DATE,
    Prazo_Final DATE,
    FK_Id_Evento INT,
    FOREIGN KEY (FK_Id_Evento) REFERENCES Evento(Id_Evento)
);

-- Criação da tabela Convidados
CREATE TABLE Convidados (
    Id_Convidado INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    -- FK_Id_Evento INT,
    Papel VARCHAR(50)
    -- FOREIGN KEY (FK_Id_Evento) REFERENCES Evento(Id_Evento)
);

CREATE TABLE UsuarioEvento (
	FK_Usuario_Id_Usuario INT,
    FK_Evento_Id_Evento INT, 
    PRIMARY KEY(FK_Usuario_Id_Usuario, FK_Evento_Id_Evento),
    FOREIGN key(FK_Usuario_Id_Usuario) references Usuario(Id_Usuario),
    FOREIGN KEY(FK_Evento_Id_Evento) REFERENCES Evento(Id_Evento)
);

CREATE TABLE EventoConvidados (
	FK_Evento_Id_Evento INT,
    FK_Convidados_Id_Convidado INT,
    PRIMARY KEY(FK_Evento_Id_Evento, FK_Convidados_Id_Convidado),
    FOREIGN KEY(FK_Evento_Id_Evento) REFERENCES Evento(Id_Evento),
    FOREIGN KEY(FK_Convidados_Id_Convidado) REFERENCES Convidados(Id_Convidado)
);

CREATE TABLE UsuarioTarefa (
	FK_Usuario_Id_Usuario INT,
    FK_Tarefa_Id_Tarefa INT,
    PRIMARY KEY(FK_Usuario_Id_Usuario, FK_Tarefa_Id_Tarefa),
    FOREIGN KEY(FK_Usuario_Id_Usuario) REFERENCES Usuario(Id_Usuario),
    FOREIGN KEY(FK_Tarefa_Id_Tarefa) REFERENCES Tarefa(Id_Tarefa)
);









