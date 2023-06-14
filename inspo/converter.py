from PIL import Image
import numpy as np
from scipy import ndimage
from PIL import Image
import matplotlib.image as mpimg


def rgb2gray(rgb):
    r, g, b = rgb[:, :, 0], rgb[:, :, 1], rgb[:, :, 2]
    gray = 0.2989 * r + 0.5870 * g + 0.1140 * b
    print(gray)
    return gray


def internal_convolve(matrix_pixels):
    Kx = np.array([[-1, 0, 1], [-2, 0, 2], [-1, 0, 1]], np.int32)
    Ky = np.array([[1, 2, 1], [0, 0, 0], [-1, -2, -1]], np.int32)

    Ix = ndimage.convolve(matrix_pixels, Kx)
    Iy = ndimage.convolve(matrix_pixels, Ky)

    np.savetxt("../static/result_temp_x.txt", Ix, fmt="%d")
    np.savetxt("../static/result_y.txt", Iy, fmt="%d")

    with open("../static/result_temp_x.txt", "r") as r:
        with open("../static/result_x.txt", "w") as w:
            w.write(r.read().replace("\n", " "))


def bn_converter(input_image_path):
    img = mpimg.imread(input_image_path)
    converted_image = rgb2gray(img)
    matrix_pixels = np.array(converted_image)
    np.savetxt("../static/input.txt", matrix_pixels, fmt="%d")
    return matrix_pixels


def resize_image(input_image_path, output_image_path, size):
    original_image = Image.open(input_image_path)
    resized_image = original_image.resize(size)
    resized_image.save(output_image_path)


input_path = "../static/cas.jpg"
output_path = "../static/resized.jpg"
new_size = (300, 300)

# resize_image(input_path, output_path, new_size)
A = bn_converter(input_path)
internal_convolve(A)
