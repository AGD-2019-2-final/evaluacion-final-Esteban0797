import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    masterList = []
    letraSplits = []
    letra = None
    for line in sys.stdin:

        line = line.strip()
        cur_letra, cur_fecha, cur_valor = line.split("\t")
        cur_valor = int(cur_valor)
        if letra == cur_letra:
          letraSplits.append([cur_letra, cur_fecha, cur_valor])
        else:

          if letra is not None:
            letraSplits.sort(key = lambda item: item[2] )
            masterList.append(letraSplits)
          
          letra = cur_letra
          letraSplits = []
          letraSplits.append([cur_letra, cur_fecha, cur_valor])
    
    letraSplits.sort(key = lambda item: item[2] )
    masterList.append(letraSplits)
    for line in masterList:
      for l in line:
        sys.stdout.write("{0}\t{1}\t{2}\n".format(l[0], l[1], l[2]))
