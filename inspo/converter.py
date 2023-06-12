from PIL import Image
import numpy as np
from scipy import ndimage
from PIL import Image


def internal_convolve(matrix_pixels):
    Kx = np.array([[-1, 0, 1], [-2, 0, 2], [-1, 0, 1]], np.int32)
    Ky = np.array([[1, 2, 1], [0, 0, 0], [-1, -2, -1]], np.int32)
    
    Ix = ndimage.convolve(matrix_pixels, Kx) 
    Iy = ndimage.convolve(matrix_pixels, Ky)

    np.savetxt("../static/result_x.txt", Ix, fmt="%d")
    np.savetxt("../static/result_y.txt", Iy, fmt="%d")


def bn_converter(input_image_path):
    original_image = Image.open(input_image_path)
    converted_image = original_image.convert("L")   
    matrix_pixels = np.array(converted_image)
    np.savetxt("../static/input.txt", matrix_pixels, fmt="%d")
    return matrix_pixels
    

def resize_image(input_image_path, output_image_path, size):
    original_image = Image.open(input_image_path)
    resized_image = original_image.resize(size)
    resized_image.save(output_image_path)


input_path = "../static/barbara.jpg"
output_path = "../static/resized.jpg"
new_size = (300, 300)

resize_image(input_path, output_path, new_size)
A = bn_converter(output_path)
internal_convolve(A)

