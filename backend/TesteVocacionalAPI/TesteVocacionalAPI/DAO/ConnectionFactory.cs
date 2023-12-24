using MySqlConnector;

namespace TesteVocacionalAPI.DAO
{
    public class ConnectionFactory
    {
        public static MySqlConnection Create()
        {
            string connectionString = "Server=localhost;Database=TesteVocacional;Uid=root;Pwd=;";
            return new MySqlConnection(connectionString);
        }
    }
}
