using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using TesteVocacionalAPI.DAO;
using TesteVocacionalAPI.DTO;

namespace TesteVocacionalAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PerguntasController : ControllerBase
    {
        [HttpGet]
        public IActionResult ListarPerguntas()
        {
            var dao = new PerguntasDAO();
            var listaDePerguntas = dao.ListarPerguntas();

            return Ok(listaDePerguntas);
        }

        [HttpPost]
        [Route("Resultado")]
        public IActionResult GerarResultado([FromBody] List<RespostasUsuarioDTO> respostasUsuario)
        {
            var carreiraDAO = new CarreiraDAO();
            var carreiras = carreiraDAO.ListarCarreiras();

            var resultados = new List<ResultadoDTO>();

            foreach (var carreira in carreiras)
            {
                var respostasDaCarreira = respostasUsuario.Count(resposta => resposta.Carreira == carreira.ID);

                var resultado = new ResultadoDTO();
                resultado.Carreira = carreira;
                resultado.Percentual = respostasDaCarreira * 100 / respostasUsuario.Count;

                resultados.Add(resultado);
            }

            return Ok(resultados.OrderByDescending(resultado => resultado.Percentual));
        }
    }
}
