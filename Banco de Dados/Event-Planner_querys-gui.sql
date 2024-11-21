#Tela de Gerenciamento de Eventos
#ista de eventos com detalhes e responsáveis
SELECT e.Id_Evento, e.Nome AS Nome_Evento, e.Data, e.Local,
e.Descricao, e.Orçamento, u.Nome AS Nome_Responsavel FROM Evento e
INNER JOIN Usuario u ON e.FK_Id_Usuario = u.Id_Usuario;


# Tela de Propostas de Fornecedores
#Propostas de fornecedores com status e valores
SELECT p.Id_Proposta, p.Valor, p.Status, p.Data, f.Nome AS Nome_Fornecedor,
f.Servico AS Servico_Fornecedor FROM Proposta p
INNER JOIN Fornecedor f ON p.FK_Id_Fornecedor = f.Id_Fornecedor;


#Tela de Tarefas do Evento
#Tarefas associadas a um evento específico
SELECT t.Id_Tarefa, t.Descricao, t.Status, t.Prazo_Inicial,
t.Prazo_Final, e.Nome AS Nome_Evento FROM Tarefa t
INNER JOIN Evento e ON t.FK_Id_Evento = e.Id_Evento WHERE 
e.Id_Evento = 1; # Ideia de filtro por evento específico


#Tela de Convidados do Evento
#Lista de convidados para um evento
SELECT c.Id_Convidado, c.Nome AS Nome_Convidado, c.Papel,
 e.Nome AS Nome_Evento FROM EventoConvidados ec
INNER JOIN Evento e ON ec.FK_Evento_Id_Evento = e.Id_Evento
INNER JOIN Convidados c ON ec.FK_Convidados_Id_Convidado = c.Id_Convidado
WHERE e.Id_Evento = 1; #ideia de filtro por evento específico



#Tela de Participação de Usuários em Eventos
#esse select não tem tanto sentido relativamente, mas a priori, no meu sistema
#um usuario deve ter acesso a alguns eventos abertos na aplicação... não apenas 
#criar seus proprios! Porem não soube trazer essa tela ou lógica para meu figma.
#Usuários participantes de eventos
SELECT u.Id_Usuario, u.Nome AS Nome_Usuario, e.Nome AS Nome_Evento,
e.Data AS Data_Evento FROM UsuarioEvento ue
INNER JOIN Usuario u ON ue.FK_Usuario_Id_Usuario = u.Id_Usuario
INNER JOIN Evento e ON ue.FK_Evento_Id_Evento = e.Id_Evento
WHERE e.Id_Evento = 1; #ideia de filtro por evento específico


#Tela de Usuários Responsáveis por Tarefas
#uma outra tela que não consegui desenvolver no meu figma mas faz sentido ter no olhar da explicação acima.
#Usuários atribuídos a tarefas
SELECT u.Id_Usuario, u.Nome AS Nome_Usuario, t.Descricao AS Descricao_Tarefa, 
t.Status AS Status_Tarefa, t.Prazo_Final FROM  UsuarioTarefa ut
INNER JOIN Usuario u ON ut.FK_Usuario_Id_Usuario = u.Id_Usuario
INNER JOIN Tarefa t ON ut.FK_Tarefa_Id_Tarefa = t.Id_Tarefa
WHERE t.FK_Id_Evento = 1; #ideia de filtro por evento específico




    

