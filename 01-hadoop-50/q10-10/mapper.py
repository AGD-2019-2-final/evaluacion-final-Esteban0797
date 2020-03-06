import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        line = line.strip()
        splits = line.split()
        letras = splits[1].split(",")

        for l in letras:
          sys.stdout.write("{0}\t{1}\n".format(l, int(splits[0])))       