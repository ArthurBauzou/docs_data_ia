def verif4(n):
    if n < 1111 or n > 9999 :
        return False
    a = str(n)[0]
    b = str(n)[1]
    c = str(n)[2]
    d = str(n)[3]

    if int(a+b+c+d) * 4 == int(d+c+b+a) :
        return True
    else : return False

intlist = range(1111, 10000)

for n in intlist :
    if verif4(n) : print(n)