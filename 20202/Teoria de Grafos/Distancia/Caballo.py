"""Solucion del problema del giro del caballo utilizando la regla de Warnsdorf."""

import sys

sys.setrecursionlimit(10000) # Esta funcion se utiliza para limitar la profundidad de la busqueda de N.

tamano = 8 # Tamaño de la Tabla
x_initial, y_initial = 0, 0 # Posicion inicial del Caballo


def limite_tabla(tablero, x, y): # Funcion que define los limites de la tabla.
    return 0 <= x < tamano and 0 <= y < tamano and tablero[x][y] == -1


def giro(): # Funcion que busca uno de los posibles giros del caballo
    tablero = [[-1 for _ in range(tamano)] for _ in range(tamano)]
    tablero[x_initial][y_initial] = 0

    # 8 posibles giros del caballo desde una posicion determinada.
    saltos = ((-1, 2), (1, 2), (2, 1), (2, -1), (1, -2), (-1, -2), (-2, -1), (-2, 1))
    z = busca_giro(tablero, x_initial, y_initial, 1, saltos)

    if not z:
        print("No existe solucion!")


def busca_giro(tablero, x, y, movimiento, saltos): # Funcion recursiva que busca si existe o no una solucion basada en el tamaño del tablero
    if movimiento == tamano * tamano:
        for i in range(tamano):
            for j in range(tamano):
                print("%3d" % tablero[i][j], end=" ")
            print()
        return True

    cuenta_mov = grado_min(tablero, x, y, saltos)

    for x_sig, y_sig in cuenta_mov:
        tablero[x_sig][y_sig] = movimiento

        if busca_giro(tablero, x_sig, y_sig, movimiento + 1, saltos):
            return True

        tablero[x_sig][y_sig] = -1          # backtrack

    return False


def grado_min(tablero, x, y, saltos): # Funcion que devuelve la lista de movimientos realizados en orden asc.
    lista_vecinos = []

    for salto in saltos:
        x_sig = x + salto[0]
        y_sig = y + salto[1]

        if limite_tabla(tablero, x_sig, y_sig):
            lista_vecinos.append([x_sig, y_sig])

    cuenta_mov = sorted(lista_vecinos, key=lambda c: sum(
        [limite_tabla(tablero, c[0] + j[0], c[1] + j[1]) for j in saltos]))
    return cuenta_mov


if __name__ == "__main__":
    giro()