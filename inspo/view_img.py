from PIL import Image, ImageFilter
import os

# Inserta cada byte en una lista y se transforma a bytes, devuelve el ancho y el largo de la imagen
def str2byte(textfile):
	width = 0
	height = 0

	with open(textfile, 'r') as f:
	    byte = f.read()
	    res = [int(n) for n in byte.split()]
	
	height = int(len(res)/640) 
	res = bytes(res)
	return [res, 300, 300]


# Se guardan los valores obtenidos en bytes
encImg = str2byte("result_x.txt")
decImg = str2byte("res.txt")

# Se crean las imagenes basadas en los bytes obtenidos
imge = Image.frombytes('L', (encImg[1], encImg[2]), encImg[0])
imgd = Image.frombytes('L', (decImg[1], decImg[2]), decImg[0])

# Crea un fondo
bg = Image.new("RGB", (encImg[1]+decImg[1], encImg[2]))
bg2 = Image.new("RGB", (decImg[1], decImg[2]))


# Inserta las figura en el fondo
bg.paste(imge, (0, 0))
bg.paste(imgd, (encImg[1], 0))
bg.paste(bg2, (decImg[1], decImg[2]))


# Guarda la imagen con el nombre decrypt_image
bg.save("decrypt_image.png", "PNG")
imgd.save("tarea2.png", "PNG")
