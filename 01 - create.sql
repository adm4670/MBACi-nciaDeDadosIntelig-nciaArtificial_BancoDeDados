--CREATE DATABASE ATIVIDADE_POS_GRADUACAO;
GO

USE ATIVIDADE_POS_GRADUACAO;
GO

-- Tabela: curso
CREATE TABLE curso (
    id INT PRIMARY KEY IDENTITY(1,1),
    nomeCurso VARCHAR(255) NOT NULL,
    cargaHoraria INT NOT NULL,
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE()
);
GO

-- Tabela: turma
CREATE TABLE turma (
    id INT PRIMARY KEY IDENTITY(1,1),
    nomeTurma VARCHAR(255) NOT NULL,
    fkCurso INT NOT NULL,
    dataInicio DATE NOT NULL,
    dataFim DATE NOT NULL,
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_turma_curso FOREIGN KEY (fkCurso) REFERENCES curso(id)
);
GO

-- Tabela: aluno
CREATE TABLE aluno (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(255),
    dataNascimento DATE,
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE()
);
GO

-- Tabela: matricula
CREATE TABLE matricula (
    id INT PRIMARY KEY IDENTITY(1,1),
    fkAluno INT NOT NULL,
    fkTurma INT NOT NULL,
    dataMatricula DATE NOT NULL,
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_matricula_aluno FOREIGN KEY (fkAluno) REFERENCES aluno(id),
    CONSTRAINT FK_matricula_turma FOREIGN KEY (fkTurma) REFERENCES turma(id)
);
GO

-- Tabela: aula
CREATE TABLE aula (
    id INT PRIMARY KEY IDENTITY(1,1),
    fkTurma INT NOT NULL,
    dataAula DATE NOT NULL,
    conteudoPrevisto VARCHAR(500),
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_aula_turma FOREIGN KEY (fkTurma) REFERENCES turma(id)
);
GO

-- Tabela: frequencia
CREATE TABLE frequencia (
    id INT PRIMARY KEY IDENTITY(1,1),
    fkAula INT NOT NULL,
    fkMatricula INT NOT NULL,
    presente BIT NOT NULL,
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_frequencia_aula FOREIGN KEY (fkAula) REFERENCES aula(id),
    CONSTRAINT FK_frequencia_matricula FOREIGN KEY (fkMatricula) REFERENCES matricula(id)
);
GO

-- Tabela: avaliacao
CREATE TABLE avaliacao (
    id INT PRIMARY KEY IDENTITY(1,1),
    fkTurma INT NOT NULL,
    descricao VARCHAR(255),
    dataAplicacao DATE NOT NULL,
    peso DECIMAL(4,2) NOT NULL,
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_avaliacao_turma FOREIGN KEY (fkTurma) REFERENCES turma(id)
);
GO

-- Tabela: nota
CREATE TABLE nota (
    id INT PRIMARY KEY IDENTITY(1,1),
    fkAvaliacao INT NOT NULL,
    fkMatricula INT NOT NULL,
    nota DECIMAL(5,2) NOT NULL,
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_nota_avaliacao FOREIGN KEY (fkAvaliacao) REFERENCES avaliacao(id),
    CONSTRAINT FK_nota_matricula FOREIGN KEY (fkMatricula) REFERENCES matricula(id)
);
GO
