import { useEffect, useState } from "react";

import imgBack from "../../Img/back.gif";
import imgBd from "../../Img/bd.gif";
import imgFront from "../../Img/front.gif";
import imgQa from "../../Img/qa.gif";
import imgUx from "../../Img/ux.gif";

import "./Resultado.css";

function Resultado({ respostasSelecionadas, setRespostasSelecionadas, setPaginaAtual }) {
  const [carreiraPrincipal, setCarreiraPrincipal] = useState();
  const [outrasCarreiras, setOutrasCarreiras] = useState();

  useEffect(() => {
    fetch("https://localhost:44304/api/perguntas/Resultado", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(respostasSelecionadas),
    })
      .then((response) => response.json())
      .then((json) => {
        criarResultado(json);
      })
      .catch((error) => {
        console.log(error);
        alert("Erro ao buscar resultado");
      });
  }, [respostasSelecionadas]);

  function criarResultado(json) {
    setCarreiraPrincipal(json.shift());
    setOutrasCarreiras(json);
  }

  function reiniciarJogo(){
    setRespostasSelecionadas();
    setPaginaAtual("Perguntas");
  }
  let imagemCarreira = "";

  switch (carreiraPrincipal?.carreira?.nome) {
    default:
    case "Banco de Dados":
      imagemCarreira = imgBd;
      break;
    case "Desenvolvedor BackEnd":
      imagemCarreira = imgBack;
      break;
    case "Desenvolvedor FrontEnd":
      imagemCarreira = imgFront;
      break;
    case "Analista de Testes e Qualidade de Software":
      imagemCarreira = imgQa;
      break;
    case "User Experience (UX)":
      imagemCarreira = imgUx;
      break;
  }

  return (
    <div id="resultado">
      <h2>A área de T.I que mais combina com você é</h2>
      <h1>{carreiraPrincipal?.carreira?.nome}</h1>
      <img src={imagemCarreira} alt="" />
      <div id="texto-carreira">
        <p>{carreiraPrincipal?.carreira?.descricao}</p>
      </div>
      <h2>Outros possíveis matches: </h2>
      <div id="outro-matches">
        {outrasCarreiras?.map((carreira, index) => (
          <h3 key={index}>
            {carreira.carreira.nome}: {carreira.percentual}%
          </h3>
        ))}
      </div>
      <button onClick={()=>reiniciarJogo()}>Jogar Novamente</button>
    </div>
  );
}

export default Resultado;
