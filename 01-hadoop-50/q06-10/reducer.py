import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    Clave_act = None
    max_value = 0
    min_value = 0
    
    for line in sys.stdin:

        clave, valor = line.split("\t")
        valor = float(valor)

        if clave == Clave_act:
            if max_value > valor:
               max_value = max_value
            else:
               max_value = valor

            if min_value < valor:
               min_value = min_value
            else:
               min_value = valor
        else:
         
            if Clave_act is not None:
           
                sys.stdout.write("{}\t{}\t{}\n".format(Clave_act, max_value, min_value))

            Clave_act = clave
            max_value = valor
            min_value = valor

    sys.stdout.write("{}\t{}\t{}\n".format(Clave_act, max_value, min_value))