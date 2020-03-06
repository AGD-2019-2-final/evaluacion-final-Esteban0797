import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    suma = 0
    letra = None
    count = 0

    for line in sys.stdin:

        line = line.strip()
        cur_letra, cur_valor = line.split("\t")
        cur_valor = float(cur_valor)

        if cur_letra == letra:
          suma = suma + cur_valor
          count = count + 1
        else:
            if letra is not None:
              sys.stdout.write("{0}\t{1}\t{2}\n".format(letra, suma, suma/count))
            
            letra = cur_letra
            suma = cur_valor
            count = 1
    sys.stdout.write("{0}\t{1}\t{2}\n".format(letra, suma, suma/count))