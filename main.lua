-- cria o grafo na memória com os vértices e as arestas
local arestas = {
[1] = {2},
[2] = {1,4},
[3] = {1,5,6},
[4] = {2,6},
[5] = {3,6,8},
[6] = {1,3,4,5,8},
[7] = {5,9,10},
[8] = {6,5,9},
[9] = {7,8,10},
[10]= {7,9}
}
-- define qual sera o início
local inicial = 2

-- vetores auxiliares
local fila = {}
local visitados = {}


-- # significa quantidade
for i=1, #arestas, 1 do
  visitados[i] = false
end -- é o fim? SIM


-- insere o inicial na fila
table.insert(fila, inicial)
-- define o inicial como já visitado
visitados[inicial] = 0 

-- enquanto houver vertices na fila vai continuar

while (#fila > 0) do
-- define o vertice atual e exibe na tela
  local verticeAtual = fila[1]
  io.write("Atual: ", verticeAtual,"\n")

  -- PASSA POR TODAS AS CONEXOES DO VERTICE ATUAL
  for i=1, #arestas[verticeAtual], 1 do
   -- define o vizinho atual
    local vizinho = arestas[verticeAtual][i]
   -- verifica se o vizinho já foi visitado, cso sim ignora
    if visitados[vizinho] == false then
    --caso não, insere ele na fila
        table.insert(fila, vizinho)
      -- adiciona a distancia do vertice e insere nos visitados
        visitados[vizinho] = visitados[verticeAtual] + 1
    end
  end
  -- remove o atual da fila
  table.remove(fila, 1)

  -- EXIBE A FILA NA TELA
  io.write("Fila: ")
  for i=1, #fila, 1 do
    io.write(fila[i], " | ")
  end
  io.write("\n\n")
  
end 

-- exibe o resultado final
print('Resultado: ')
for i=1, #visitados, 1 do
   print("[", i, "] -> ", visitados[i])
end