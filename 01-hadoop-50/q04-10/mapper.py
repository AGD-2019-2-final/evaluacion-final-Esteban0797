import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        line = line.strip()
        splits = line.split()
        sys.stdout.write("{0}\t{1}\t{2}\n".format(splits[0], splits[1], splits[2]))
