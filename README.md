# Sistema Educacional - Banco de Dados

## Visão Geral

Este projeto contém o modelo e scripts para o banco de dados de um sistema educacional focado no registro de frequência (presença) de alunos em aulas e turmas, assim como o controle de notas e avaliações.

O objetivo é gerenciar informações acadêmicas essenciais para acompanhamento de alunos, turmas, cursos, aulas, presenças e desempenho acadêmico.

---

## Estrutura do Banco de Dados

### Principais Entidades

- **Aluno**  
  Armazena dados pessoais dos alunos, como nome, CPF, e-mail e data de nascimento.

- **Curso**  
  Representa os cursos oferecidos pela instituição, incluindo nome e carga horária.

- **Turma**  
  Cada turma está vinculada a um curso e possui informações como nome, período de início e fim.

- **Matrícula**  
  Relaciona alunos a turmas, indicando em qual turma o aluno está matriculado e a data da matrícula.

- **Aula**  
  Representa as aulas ministradas em cada turma, com data e conteúdo previsto.

- **Frequência**  
  Registra a presença ou ausência dos alunos em cada aula, vinculada à matrícula.

- **Avaliação**  
  Define as avaliações aplicadas em cada turma, com descrição, data e peso.

- **Nota**  
  Armazena as notas obtidas pelos alunos em cada avaliação.

### Relacionamentos

- Um **curso** pode ter várias **turmas**.
- Uma **turma** possui várias **aulas** e **avaliações**.
- Um **aluno** pode estar matriculado em várias **turmas** (através da tabela `matricula`).
- Cada **frequência** relaciona um aluno (via matrícula) a uma aula específica, indicando presença ou ausência.
- As **notas** relacionam avaliações a alunos (via matrícula), registrando o desempenho acadêmico.

---

## Scripts SQL

O projeto inclui scripts para:

- Criação das tabelas com chaves primárias e estrangeiras adequadas.
- Inserção de dados fictícios para testes, incluindo alunos, cursos, turmas, matrículas, aulas, frequências, avaliações e notas.
- Os campos `createdAt` e `updatedAt` estão presentes em todas as tabelas para controle de data/hora de criação e atualização.

---

## Tecnologias e Ferramentas

- **Banco de Dados**: SQL Server
- **Linguagem SQL**: Scripts padrão T-SQL para criação e manipulação das tabelas.
- **Nomenclatura**: CamelCase para nomes de colunas e tabelas.
- **Chaves**:  
  - Chave primária sempre chamada `id`.  
  - Chaves estrangeiras prefixadas com `fk` + nome da tabela referenciada.

---

## Como usar

1. Execute o script de criação do banco e das tabelas no seu ambiente SQL Server.
2. Utilize os scripts de inserção para popular as tabelas com dados fictícios.
3. Utilize consultas SQL para obter informações sobre frequência, notas e avaliações.
4. Pode ser adaptado para integrar com aplicações backend ou dashboards de acompanhamento.

---

## Contato

Para dúvidas ou contribuições, entre em contato com:

**Diego Alisson Monteiro**  
Email: diego.alisson@example.com

---

*Este projeto é um exemplo para gerenciamento educacional e pode ser adaptado conforme necessidades específicas da instituição.*
