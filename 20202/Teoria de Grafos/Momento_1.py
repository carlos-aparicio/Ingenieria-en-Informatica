#Se Instala el modulo pythonds con el comando sudo pip3 install pythonds

#Se Importa la libreria Graphs del modulo Pythonds
from pythonds.graphs import Graph

# Se define la estructura de iteracion bi-direccional entre Vertices (Keys) del Grafo No Dirigido 
def add_both_edges(g, key1, key2):
    g.addEdge(key1, key2)
    g.addEdge(key2, key1)

# Se define la union entre los Vertices (Keys) para crear el Grafo No Dirigido
g = Graph()
add_both_edges(g, 'A', 'B')
add_both_edges(g, 'A', 'C')
add_both_edges(g, 'B', 'D')
add_both_edges(g, 'B', 'E')
add_both_edges(g, 'C', 'F')
add_both_edges(g, 'C', 'G')
add_both_edges(g, 'C', 'H')
add_both_edges(g, 'F', 'I')
add_both_edges(g, 'F', 'J')

# Se define la creacion de tuplas compuestas por los Vertices (Keys) y luego se imprimen.
for from_id in g.getVertices():
    t = tuple(v.id for v in 
        g.getVertex(from_id).connectedTo.keys())
    print(f"Desde Arista: {from_id} Hacia : {t}")