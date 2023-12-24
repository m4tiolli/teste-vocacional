using MySqlConnector;
using System.Collections.Generic;
using TesteVocacionalAPI.DTO;

namespace TesteVocacionalAPI.DAO
{
    public class CarreiraDAO
    {
        public List<CarreiraDTO> ListarCarreiras()
        {
            var conexao = ConnectionFactory.Create();
            conexao.Open();

            var query = "SELECT*FROM Carreiras";

            var comando = new MySqlCommand(query, conexao);
            var dataReader = comando.ExecuteReader();
            var listaDeCarreiras = new List<CarreiraDTO>();

            while (dataReader.Read())
            {
                var usuario = new CarreiraDTO();
                usuario.ID = int.Parse(dataReader["ID"].ToString());
                usuario.Nome = dataReader["Nome"].ToString();
                usuario.Descricao = dataReader["Descricao"].ToString();

                listaDeCarreiras.Add(usuario);
            }
            conexao.Close();

            return listaDeCarreiras;
        }
    }
}
