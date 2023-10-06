# farbriquer un gradient de couleur

def hexinterval(hex_start, hex_end, n):
    n = n+1
    start = int(hex_start, 16)
    end = int(hex_end, 16)
    step = abs(end - start) / n

    if end > 255: raise Exception('pas de valeur supérieures à FF')

    res = [hex_start]

    for i in range(1,n+1):
        val = start + int(i*step) if end > start else start - int(i*step)
        val = '{:02x}'.format(val)
        res.append(val)

    return res

def colorlist(color1, color2, n=4):
    reds = hexinterval(color1[1:3], color2[1:3], n)
    greens = hexinterval(color1[3:5], color2[3:5], n)
    blues = hexinterval(color1[5:7], color2[5:7], n)

    return ['#'+x+y+z for x,y,z in zip(reds, greens, blues)]



print(colorlist('#5f402f', '#e4b6b6'))