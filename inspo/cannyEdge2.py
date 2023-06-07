import cv2
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
from scipy import ndimage

def rgb2gray(rgb):

    r, g, b = rgb[:,:,0], rgb[:,:,1], rgb[:,:,2]
    gray = 0.2989 * r + 0.5870 * g + 0.1140 * b

    return gray

def gaussian_kernel(size, sigma):
    size = int(size) // 2
    x, y = np.mgrid[-size:size+1, -size:size+1]
    normal = 1 / (2.0 * np.pi * sigma**2)
    g =  np.exp(-((x**2 + y**2) / (2.0*sigma**2))) * normal
    return g


def sobel_filters(img):
    Kx = np.array([[-1, 0, 1], [-2, 0, 2], [-1, 0, 1]], np.float32)
    Ky = np.array([[1, 2, 1], [0, 0, 0], [-1, -2, -1]], np.float32)
    
    Ix = ndimage.convolve(img, Kx)  #Convolucion Discreta? Hacer funcion
    Iy = ndimage.convolve(img, Ky)
    
    G = np.hypot(Ix, Iy)        # Hacer funcion Hipotenusa
    G = G / G.max() * 255       # G.max() valor maximo de G

    theta = np.arctan2(Iy, Ix)      #Hacer Funcion Arcotangente

    return (G, theta)

def non_max_suppression(img, D):
    M, N = img.shape    #Tamano de la img
    Z = np.zeros((M,N), dtype=np.int32)
    angle = D * 180. / np.pi        #radianes
    angle[angle < 0] += 180

    
    for i in range(1,M-1):
        for j in range(1,N-1):
            try:
                q = 255
                r = 255
                
               #angle 0
                if (0 <= angle[i,j] < 22.5) or (157.5 <= angle[i,j] <= 180):
                    q = img[i, j+1]
                    r = img[i, j-1]
                #angle 45
                elif (22.5 <= angle[i,j] < 67.5):
                    q = img[i+1, j-1]
                    r = img[i-1, j+1]
                #angle 90
                elif (67.5 <= angle[i,j] < 112.5):
                    q = img[i+1, j]
                    r = img[i-1, j]
                #angle 135
                elif (112.5 <= angle[i,j] < 157.5):
                    q = img[i-1, j-1]
                    r = img[i+1, j+1]

                if (img[i,j] >= q) and (img[i,j] >= r):
                    Z[i,j] = img[i,j]
                else:
                    Z[i,j] = 0

            except IndexError as e:
                pass
    
    return Z

def threshold(img, lowThresholdRatio=0.05, highThresholdRatio=0.09):
    
    highThreshold = img.max() * highThresholdRatio;
    lowThreshold = highThreshold * lowThresholdRatio;
    
    M, N = img.shape
    res = np.zeros((M,N), dtype=np.int32)
    
    weak = np.int32(25)
    strong = np.int32(255)
    
    strong_i, strong_j = np.where(img >= highThreshold)     #If pixel >= highThreshold tira posicion
    zeros_i, zeros_j = np.where(img < lowThreshold)         #If pixel < lowThreshold tira posicion
    
    weak_i, weak_j = np.where((img <= highThreshold) & (img >= lowThreshold))   #If pixel entre highThreshold y lowThreshold tira posicion
    
    res[strong_i, strong_j] = strong        # cambiar 255 en posiciones strong
    res[weak_i, weak_j] = weak              # cambiar 25 en posiciones weak
    return (res, weak, strong)

def hysteresis(img, weak, strong=255):
    M, N = img.shape        #Tamano de la img
    for i in range(1, M-1):
        for j in range(1, N-1):
            if (img[i,j] == weak):
                try:
                    if ((img[i+1, j-1] == strong) or (img[i+1, j] == strong) or (img[i+1, j+1] == strong)
                        or (img[i, j-1] == strong) or (img[i, j+1] == strong)
                        or (img[i-1, j-1] == strong) or (img[i-1, j] == strong) or (img[i-1, j+1] == strong)):
                        img[i, j] = strong                                                                          #If contorno del pixel == strong img[i, j] = 255
                    else:
                        img[i, j] = 0
                except IndexError as e:
                    pass
    return img

img = mpimg.imread("goat.jpg")
img = rgb2gray(img)

kernel = ndimage.convolve(img, gaussian_kernel(5, 2))   #Convolucion Discreta?  Hacer funcion
A = sobel_filters(kernel)
B = non_max_suppression(A[0], A[1])
C = threshold(B, 0.05, 0.09)
D = hysteresis(C[0], C[1], C[2])


plt.figure(1)
plt.subplot(121)
plt.imshow(img)
plt.title("Original Image")

plt.subplot(122)
plt.imshow(D)
plt.title("Gaussian Filter Image")
plt.show()
