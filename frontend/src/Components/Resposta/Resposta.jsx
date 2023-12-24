import "./Resposta.css";

function Resposta({ resposta, setRespostaSelecionadaAtual, selecionado }) {
  let cssClass = "resposta";
  
  if (selecionado) {
    cssClass += " selecionada";
  }
  return (
    <div
      className={cssClass}
      onClick={() => {
        setRespostaSelecionadaAtual(resposta);
      }}
    >
      <p>{resposta.texto}</p>
    </div>
  );
}

export default Resposta;
