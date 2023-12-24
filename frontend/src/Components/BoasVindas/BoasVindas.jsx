import React from 'react'
import BoasVindasImg from "../../Img/welcome.gif"

import "./BoasVindas.css";

function BoasVindas({ setPaginaAtual }) {
    return (
        <div id="boas-vindas">
          <h2>Seja bem-vindo</h2>
          <img src={BoasVindasImg} alt="Iniciar" />
          <p>Clique no botão para começar:</p>
          <button onClick={() => setPaginaAtual("Perguntas")}>Iniciar</button>
        </div>
      );
}

export default BoasVindas