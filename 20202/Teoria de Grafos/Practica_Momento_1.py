class Vertice:
    def __init__(self,key):
        self.id = key
        self.unirCon = {}

    def agregaCompanero(self,nbr,Peso=0):
        self.unirCon[nbr] = Peso

    def __str__(self):
        return str(self.id) + ' unirCon: ' + str([x.id for x in self.unirCon])

    def traeConexiones(self):
        return self.unirCon.keys()

    def traeId(self):
        return self.id

    def traePeso(self,nbr):
        return self.unirCon[nbr]

class Grafo:
    def __init__(self):
        self.vertList = {}
        self.numVertices = 0

    def agregaVertice(self,key):
        self.numVertices = self.numVertices + 1
        nuevoVertice = Vertice(key)
        self.vertList[key] = nuevoVertice
        return nuevoVertice

    def traeVertice(self,n):
        if n in self.vertList:
            return self.vertList[n]
        else:
            return None

    def __contains__(self,n):
            return n in self.vertList

    def agregaArista(self,f,t,Peso=0):
        if f not in self.vertList:
            nuevoVertice = self.agregaVertice(f)
        if t not in self.vertList:
            nuevoVertice = self.agregaVertice(t)
        self.vertList[f].agregaCompanero(self.vertList[t], Peso)

    def traeVertices(self):
            return self.vertList.keys()

    def __iter__(self):
            return iter(self.vertList.values())

g = Grafo()
for i in range(10):
 g.agregaVertice(i)
g.vertList
g.agregaArista('A','B',5)
g.agregaArista('A','C',3)
g.agregaArista('B','D',6)
g.agregaArista('B','E',7)
g.agregaArista('C','F',4)
g.agregaArista('C','G',8)
g.agregaArista('C','H',2)
g.agregaArista('F','I',2)
g.agregaArista('F','J',1)
for v in g:
    for w in v.traeConexiones():
        print("( %s , %s )" % (v.traeId(), w.traeId()))