import "./Perguntas.css";
import { useState } from "react";
import Resposta from "../Resposta/Resposta";

function Perguntas({ perguntasDoBancoDeDados, setPaginaAtual, respostasSelecionadas }) {
  const [perguntaAtual, setPerguntaAtual] = useState(0);
  const [respostaSelecionadaAtual, setRespostaSelecionadaAtual] = useState();

  function nextQuestion() {
    respostasSelecionadas.push({
      pergunta: perguntasDoBancoDeDados[perguntaAtual].id,
      resposta: respostaSelecionadaAtual.id,
      carreira: respostaSelecionadaAtual.carreiraID
    });

    setRespostaSelecionadaAtual();

    if (perguntaAtual + 1 === perguntasDoBancoDeDados.length) {
      setPaginaAtual("Resultado");
    }

    setPerguntaAtual(perguntaAtual + 1);
  }

  return (
    <div id="pergunta">
      <p>Pergunta {perguntaAtual + 1} de {perguntasDoBancoDeDados.length}</p>
      <h2>{perguntasDoBancoDeDados[perguntaAtual].texto}</h2>

      <div id="options-container">
        {perguntasDoBancoDeDados[perguntaAtual].respostas.map((resposta, index) => (
          <Resposta
            key={index}
            resposta={resposta}
            setRespostaSelecionadaAtual={setRespostaSelecionadaAtual}
            selecionado={respostaSelecionadaAtual?.texto === resposta.texto}
          />
        ))}
      </div>

      {respostaSelecionadaAtual && (
        <button onClick={() => nextQuestion()}>Continuar</button>
      )}
    </div>
  );
}

export default Perguntas;
