DROP DATABASE IF EXISTS TesteVocacional;
CREATE DATABASE TesteVocacional;
USE TesteVocacional;

CREATE TABLE Carreiras(
	ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Nome VARCHAR(255),
    Descricao LONGTEXT
);

CREATE TABLE Perguntas(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Texto VARCHAR(255)
);

CREATE TABLE Respostas(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Texto VARCHAR(255),
    Carreira INT,
    Pergunta INT,
    FOREIGN KEY (Carreira) REFERENCES Carreiras (ID),
    FOREIGN KEY (Pergunta) REFERENCES Perguntas (ID)
);

INSERT INTO Carreiras VALUES 
(default, 'Desenvolvedor BackEnd', 'O back-end é basicamente a parte funcional do site, que faz a conexão as informações guardadas no banco que dados e os pedidos que vem de um navegador.'),
(default, 'Desenvolvedor FrontEnd', 'O front-end nada mais é do que a parte visual do site, aquilo que o usuário consegue interagir.'),
(default, 'User Experience (UX)', 'O UX ou User Experience, é a área que agrupa vários elementos de uma aplicação relacionado a interação do usuário, e avalia como o user respondeu a aplicação, de forma negativa ou positiva.'),
(default, 'Analista de Testes e Qualidade de Software', 'O analista de testes ou "tester" é o encarregado por identificar e definir os testes necessários para garantir a qualidade do produto do cliente, além de monitorar o processo de teste detalhadamente e cada resultado de cada ciclo, avaliando a qualidade da aplicação em geral.'),
(default, 'Banco de Dados', 'Sua função é manipular sistemas tecnológicos que permitam organizar, estruturar e distribuir as informações de uma empresa.');

INSERT INTO Perguntas (Texto) VALUES
('Você preferiria conhecer um(a):'),
('Qual matéria da escola você mais se interessava?'),
('Uma folha pode ser mais útil para:'),
('Quando você entra em um site, o que te chama mais atenção?'),
('Você lida melhor com:'),
('Em trabalhos em equipe, os seus companheiros te consideram uma pessoa:'),
('Você gostaria de ter conhecido:'),
('Escolha um curso a seguir:'),
('O que mais te incomoda?'),
('Em quais tipos de Jogos você se destaca mais?');

INSERT INTO Respostas (Texto, Pergunta, Carreira) VALUES
('Biblioteca Nacional', 1, 5),
('Feira de ciências', 1, 1),
('Galeria de Arte', 1, 2),
('Projeto Social para ajudar as pessoas', 1, 3),
('Um restaurante famoso', 1, 4);

INSERT INTO Respostas (Texto, Pergunta, Carreira) VALUES
('Arte', 2, 2),
('Matemática', 2, 1),
('Filosofia', 2, 4),
('História e Geografia', 2, 3),
('Ciências', 2, 5);

INSERT INTO Respostas (Texto, Pergunta, Carreira) VALUES
('Fazer um desenho', 3, 2),
('Fazer cálculos', 3, 1),
('Organizar listas', 3, 5),
('Anotações', 3, 4),
('Fazer um origami', 3, 3);

INSERT INTO Respostas (Texto, Pergunta, Carreira) VALUES
('Uma aparência bonita e interativa', 4, 1),
('Como o site pode ser útil para as pessoas', 4, 3),
('Sua privacidade e seus dados', 4, 5),
('Se tudo funciona perfeitamente', 4, 4),
('Se o site é rápido e objetivo', 4, 2);

INSERT INTO Respostas (Texto, Pergunta, Carreira) VALUES
('Raciocínio lógico', 5, 1),
('Pessoas', 5, 3),
('Pensamento analítico', 5, 4),
('Arte e design', 5, 2),
('Organização', 5, 5);

INSERT INTO Respostas (Texto, Pergunta, Carreira) VALUES
('Perfeccionista', 6, 4),
('Alguém criativo', 6, 2),
('Lógica e racional', 6, 1),
('Preocupada com o bem estar do grupo', 6, 3),
('Organizada e confiável', 6, 5);

INSERT INTO Respostas (Texto, Pergunta, Carreira) VALUES
('Pablo Picasso (Artista)', 7, 2),
('Steve Jobs (Fundador da Apple)', 7, 3),
('Alan Turing (Pai da computação)', 7, 4),
('Albert Einstein (Físico)', 7, 5),
('Da Vinci (Inventor)', 7, 1);

INSERT INTO Respostas (Texto, Pergunta, Carreira) VALUES
('Gastronomia', 8, 1),
('Fotografia', 8, 2),
('Sociologia', 8, 3),
('Direito', 8, 4),
('Economia', 8, 5);

INSERT INTO Respostas (Texto, Pergunta, Carreira) VALUES
('Quando as coisas não saem como planejado', 9, 1),
('Quando criticam minhas ideias e projetos', 9, 2),
('Quando não aceitam meu ponto de vista', 9, 4),
('Quando tenho que lidar com bagunça', 9, 5),
('Quando as pessoas se desentendem', 9, 3);

INSERT INTO Respostas (Texto, Pergunta, Carreira) VALUES
('Sudoku', 10, 5),
('The Sims', 10, 3),
('Gartic', 10, 2),
('Xadrez', 10, 1),
('Jogo dos sete erros', 10, 4);
