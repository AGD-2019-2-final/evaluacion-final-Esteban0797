import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == "__main__":
    listSplits = []
    for line in sys.stdin:
        line = line.strip()
        splits = line.split("\t")
        listSplits.append(splits)
    listSplits.sort(key = lambda item: item[1] )
    
    for i in listSplits:
        sys.stdout.write("{0}\t{1}\t{2}\n".format(i[0], i[1], i[2]))

