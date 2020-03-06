import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    listSplits = []
    for line in sys.stdin:

        line = line.strip()
        letra, fecha, valor = line.split("\t")
        valor = int(valor)
        listSplits.append([letra, fecha, valor])

    listSplits.sort(key = lambda item: item[2])

    for line in listSplits[0:6]:
        sys.stdout.write("{0}\t{1}\t{2}\n".format(line[0], line[1], line[2]))
