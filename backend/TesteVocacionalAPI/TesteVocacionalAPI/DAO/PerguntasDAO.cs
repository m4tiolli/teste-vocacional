using MySqlConnector;
using TesteVocacionalAPI.DTO;
using System.Collections.Generic;

namespace TesteVocacionalAPI.DAO
{
    public class PerguntasDAO
    {
        public List<PerguntaDTO> ListarPerguntas()
        {
            var conexao = ConnectionFactory.Create();
            conexao.Open();

            var query = @"SELECT Perguntas.ID as IDPergunta, Perguntas.Texto as Pergunta, Respostas.ID as IDResposta, Respostas.Texto as Resposta, Carreira 
                            FROM Perguntas
                            INNER JOIN Respostas
                            ON Respostas.pergunta = Perguntas.ID;";

            var comando = new MySqlCommand(query, conexao);
            var dataReader = comando.ExecuteReader();
            var listaDePerguntas = new List<PerguntaDTO>();

            while (dataReader.Read())
            {
                var idDaPergunta = int.Parse(dataReader["IDPergunta"].ToString());
                var indexDaPergunta = listaDePerguntas.FindIndex(p => p.ID == idDaPergunta);

                if (indexDaPergunta != -1)
                {
                    //Já existe a pergunta na lista
                    var resposta = new RespostaDTO();
                    resposta.ID = int.Parse(dataReader["IDResposta"].ToString());
                    resposta.Texto = dataReader["Resposta"].ToString();
                    resposta.CarreiraID = int.Parse(dataReader["Carreira"].ToString());

                    listaDePerguntas[indexDaPergunta].Respostas.Add(resposta);
                }
                else
                {
                    //Não existe pergunta na lista
                    var pergunta = new PerguntaDTO();
                    pergunta.ID = idDaPergunta;
                    pergunta.Texto = dataReader["Pergunta"].ToString();
                    pergunta.Respostas = new List<RespostaDTO>();

                    var resposta = new RespostaDTO();
                    resposta.ID = int.Parse(dataReader["IDResposta"].ToString());
                    resposta.Texto = dataReader["Resposta"].ToString();
                    resposta.CarreiraID = int.Parse(dataReader["Carreira"].ToString());

                    pergunta.Respostas.Add(resposta);

                    listaDePerguntas.Add(pergunta);
                }
            }
            conexao.Close();

            return listaDePerguntas;
        }
    }
}
