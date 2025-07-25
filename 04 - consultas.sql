select 
	turma.id idTurma,
	turma.nomeTurma,
	turma.dataInicio,
	turma.dataFim,
	curso.nomeCurso,
	curso.cargaHoraria,
	count(distinct aluno.id) totalDeAlunos
from turma
inner join curso on curso.id = turma.fkCurso
inner join matricula on matricula.fkTurma = turma.id
inner join aluno on aluno.id = matricula.fkAluno
group by 
	turma.id,
	turma.nomeTurma,
	turma.dataInicio,
	turma.dataFim,
	curso.nomeCurso,
	curso.cargaHoraria




