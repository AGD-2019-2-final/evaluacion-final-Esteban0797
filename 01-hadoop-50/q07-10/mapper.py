import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    listSplits = []
    for line in sys.stdin:
        line = line.strip()
        splits = line.split()
        listSplits.append(splits)

    listSplits.sort(key = lambda item: item[0] )

    for line in listSplits:
        sys.stdout.write("{0}\t{1}\t{2}\n".format(line[0], line[1], line[2]))