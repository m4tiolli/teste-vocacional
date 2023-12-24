using System.Collections.Generic;

namespace TesteVocacionalAPI.DTO
{
    public class PerguntaDTO
    {
        public int ID { get; set; }
        public string Texto { get; set; }
        public List<RespostaDTO> Respostas { get; set; }
    }
}
