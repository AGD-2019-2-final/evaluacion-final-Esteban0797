import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    letra = None
    intKey = []
    for line in sys.stdin:
        line = line.strip()
        cur_letra, cur_key = line.split("\t")
        cur_key = int(cur_key)

        if letra == cur_letra:
          intKey.append(cur_key)
        else:
          if letra is not None:
            intKey.sort(key = lambda item: item)
            sys.stdout.write("{0}\t{1}\n".format(letra, ','.join([str(elem) for elem in intKey]) ))
          
          letra = cur_letra
          intKey = []
          intKey.append(cur_key)

    intKey.sort(key = lambda item: item)
    sys.stdout.write("{0}\t{1}\n".format(letra, ','.join([str(elem) for elem in intKey]) ))