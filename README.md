
# 🎓 Sistema Educacional — Banco de Dados

> Projeto acadêmico para controle de **frequência**, **notas** e **avaliações** em instituições de ensino.

---

## 📌 Visão Geral

Este projeto define o modelo relacional e os scripts SQL de um **sistema educacional completo**, focado em:

- Registro de **frequência** dos alunos
- Controle de **notas e avaliações**
- Gestão de **turmas, cursos e matrículas**

📁 Ideal para instituições que desejam acompanhar com precisão o **desempenho acadêmico** de seus alunos.

---

## 🧱 Estrutura do Banco de Dados

### 🔹 Principais Entidades

| Entidade     | Descrição                                                                 |
|--------------|---------------------------------------------------------------------------|
| **Aluno**    | Dados pessoais (nome, CPF, e-mail, data de nascimento)                   |
| **Curso**    | Nome do curso, carga horária                                              |
| **Turma**    | Vinculada a um curso, com datas de início/fim                             |
| **Matrícula**| Conecta alunos a turmas com data de matrícula                             |
| **Aula**     | Sessões de aula com data e conteúdo                                       |
| **Frequência**| Registro de presença/ausência por aula                                   |
| **Avaliação**| Descrição, data e peso das provas/atividades                             |
| **Nota**     | Notas dos alunos em cada avaliação                                        |

### 🔗 Relacionamentos

- 📘 Um **Curso** → várias **Turmas**
- 🧑‍🏫 Uma **Turma** → várias **Aulas** e **Avaliações**
- 👨‍🎓 Um **Aluno** → várias **Matrículas**
- ✅ **Frequência** conecta **Matrícula** e **Aula**
- 📊 **Nota** conecta **Avaliação** e **Matrícula**

---

## 🛠️ Scripts SQL

Inclui:

- Criação de tabelas com **chaves primárias e estrangeiras**
- Campos padrão `createdAt` e `updatedAt`
- Inserção de **dados fictícios** para testes (alunos, cursos, etc.)
- Scripts otimizados para **SQL Server** usando T-SQL

🔤 **Padrões de nomenclatura**:
- Tabelas e colunas em `CamelCase`
- Chave primária: `id`
- Chave estrangeira: `fk` + nome da tabela referenciada

---

## 💻 Tecnologias Utilizadas

| Ferramenta     | Descrição                              |
|----------------|----------------------------------------|
| 🎯 **SGBD**     | Microsoft SQL Server                   |
| 🧾 **SQL**      | T-SQL (Transact-SQL)                   |
| 📐 **Modelagem**| Relacional, com integridade referencial|

---

## ▶️ Como Usar

1. **Execute** o script de criação no SQL Server.
2. **Popule** as tabelas com os dados fictícios incluídos.
3. **Realize consultas** para análise de dados (presença, notas, desempenho).
4. **Integre** com sistemas web, APIs ou dashboards.

---

## 📈 Consultas SQL Relevantes

### 1️⃣ Alunos por Turma
```sql
SELECT DISTINCT t.nomeTurma, a.nome AS nomeAluno
FROM turma t
INNER JOIN matricula m ON t.id = m.fkTurma
INNER JOIN aluno a ON a.id = m.fkAluno
ORDER BY t.nomeTurma, a.nome;
```

### 2️⃣ Média das Notas por Aluno
```sql
SELECT a.nome, AVG(n.nota) AS mediaNota
FROM nota n
INNER JOIN matricula m ON n.fkMatricula = m.id
INNER JOIN aluno a ON a.id = m.fkAluno
GROUP BY a.nome
ORDER BY mediaNota DESC;
```

### 3️⃣ Total de Aulas por Turma
```sql
SELECT t.nomeTurma, COUNT(au.id) AS totalAulas
FROM turma t
INNER JOIN aula au ON t.id = au.fkTurma
GROUP BY t.nomeTurma;
```

### 4️⃣ Total de Alunos por Curso
```sql
SELECT c.nomeCurso, COUNT(DISTINCT m.fkAluno) AS totalAlunos
FROM curso c
INNER JOIN turma t ON c.id = t.fkCurso
INNER JOIN matricula m ON t.id = m.fkTurma
GROUP BY c.nomeCurso
ORDER BY totalAlunos DESC;
```

### 5️⃣ Soma de Notas por Turma
```sql
SELECT 
    t.nomeTurma,
    a.nome AS nomeAluno,
    SUM(n.nota * av.peso) * 1.0 / NULLIF(SUM(av.peso), 0) AS mediaPonderada
FROM nota n
INNER JOIN avaliacao av ON n.fkAvaliacao = av.id
INNER JOIN matricula m ON n.fkMatricula = m.id
INNER JOIN aluno a ON m.fkAluno = a.id
INNER JOIN turma t ON m.fkTurma = t.id
GROUP BY t.nomeTurma, a.nome
ORDER BY t.nomeTurma, mediaPonderada DESC;
```

### 6️⃣ Alunos com Frequência < 75%
```sql
SELECT a.nome, t.nomeTurma,
    SUM(CASE WHEN f.presente = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(f.id) AS percentualPresenca
FROM frequencia f
INNER JOIN matricula m ON f.fkMatricula = m.id
INNER JOIN aluno a ON m.fkAluno = a.id
INNER JOIN turma t ON m.fkTurma = t.id
GROUP BY a.nome, t.nomeTurma
HAVING SUM(CASE WHEN f.presente = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(f.id) < 75
ORDER BY percentualPresenca;
```

---

## 🎯 Objetivo Acadêmico

📘 Desenvolvido como parte da disciplina de **Banco de Dados** em curso de **pós-graduação**, este projeto visa:

- Consolidar conhecimentos de modelagem relacional
- Aplicar conceitos em um contexto educacional real
- Criar base para sistemas de apoio à decisão pedagógica

---

## 👨‍💻 Equipe

**Integrantes:**
- Bernadete Fernandes Guedes De Souza Leitao  
- Diego Alisson Monteiro  
- Maria das Graças Gonçalves Bezerra  
- Mitchell Bezerra De Oliveira  
- Thiago Antonio Cavalcanti Bizinco Dos Santos
