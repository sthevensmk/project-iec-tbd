import { useState } from 'react'

function App() {
  const [contador, setContador] = useState(0)

  return (
    <div style={{ padding: '2rem', fontFamily: 'sans-serif' }}>
      <h1>Painel de Controle IEC</h1>
      <p>Projeto integrado com Trunk-Based Development, Docker e Render Preview.</p>

      <div style={{ marginTop: '1rem', padding: '1rem', border: '1px solid #ccc', borderRadius: '8px' }}>
        <p>Contador de Cliques: {contador}</p>
        <button 
          onClick={() => setContador(contador + 1)}
          style={{ padding: '0.5rem 1rem', cursor: 'pointer' }}
        >
          Incrementar
        </button>
      </div>
    </div>
  )
}

export default App