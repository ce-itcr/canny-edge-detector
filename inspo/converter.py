from PIL import Image
import numpy as np
from scipy import ndimage

def convertir_a_bn(imagen):
    imagen_original = Image.open(imagen)
    
    # Convierte la imagen a escala de grises
    imagen_bn = imagen_original.convert("L")
    
    # Crea una matriz de NumPy para almacenar los valores de los píxeles
    matriz_pixeles = np.array(imagen_bn)

    print(matriz_pixeles)
    
    np.savetxt("../static/input.txt", matriz_pixeles, fmt="%d")
    
    Kx = np.array([[-1, 0, 1], [-2, 0, 2], [-1, 0, 1]], np.int32)
    Ky = np.array([[1, 2, 1], [0, 0, 0], [-1, -2, -1]], np.int32)
    
    Ix = ndimage.convolve(matriz_pixeles, Kx)  #Convolucion Discreta
    Iy = ndimage.convolve(matriz_pixeles, Ky)

    np.savetxt("../static/result_x.txt", Ix, fmt="%d")
    np.savetxt("../static/result_y.txt", Iy, fmt="%d")
    

convertir_a_bn("../static/goat300x300.jpg")

