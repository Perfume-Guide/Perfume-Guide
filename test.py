# -*- coding: utf-8 -*-
from sklearn.cluster import KMeans
import matplotlib.pyplot as plt
import numpy as np
import cv2
from collections import Counter
from skimage.color import rgb2lab, deltaE_cie76
import os

'''
image = cv2.imread('sample_image.jpg')  # 이미지 call
image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)  # flag 지정
print("The type of this input is {}".format(type(image)))  # type print
print("Shape: {}".format(image.shape))  # 높이, 너비, 채널 - 채널 3 = 다색 / 채널 1 = 단색
plt.imshow(image)
#plt.imsave("sample.jpg", image)  # 이미지 save
#plt.show()  # matplot 출력
'''


def RGB2HEX(color):
    return "#{:02x}{:02x}{:02x}".format(int(color[0]), int(color[1]), int(color[2]))


def get_image(image_path):
    image = cv2.imread(image_path)
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
    return image


def get_colors(image, number_of_colors, show_chart):

    modified_image = cv2.resize(
        image, (50, 50), interpolation=cv2.INTER_AREA)
    modified_image = modified_image.reshape(
        modified_image.shape[0]*modified_image.shape[1], 3)

    clf = KMeans(n_clusters=number_of_colors)
    labels = clf.fit_predict(modified_image)

    counts = Counter(labels)
    # sort to ensure correct color percentage
    counts = dict(sorted(counts.items()))

    center_colors = clf.cluster_centers_
    # We get ordered colors by iterating through the keys
    ordered_colors = [center_colors[i] for i in counts.keys()]
    #hex_colors = [RGB2HEX(ordered_colors[i]) for i in counts.keys()]
    #rgb_colors = [ordered_colors[i] for i in counts.keys()]
    
    '''
    if (show_chart):
        plt.figure(figsize=(8, 6))
        plt.pie(counts.values(), labels=hex_colors, colors=hex_colors)
        # plt.show()
    '''

    return ordered_colors

#get_colors(get_image('sample_image.jpg'), 8, True)


IMAGE_DIRECTORY = 'images'
COLORS = {
    'RED': [200, 50, 50],
    'GREEN': [0, 255, 0],
    'BLUE': [50, 50, 200],
    'YELLOW': [255, 255, 0]
}  # RGB 순서
images = []
name_images = []

def init():
    for file in os.listdir(IMAGE_DIRECTORY):
        if not file.startswith('.'):
            images.append(get_image(os.path.join(IMAGE_DIRECTORY, file)))
            name_images.append(os.path.basename(file).split('.')[0])  # 브랜드_향수명 저장 리스트

#print(name_images)

'''
plt.figure(figsize=(20, 10))
for i in range(len(images)):
    plt.subplot(1, len(images), i+1)
    plt.imshow(images[i])
'''

# plt.show()


def match_image_by_color(image, color, threshold=50, number_of_colors=2):

    image_colors = get_colors(image, number_of_colors, False)
    selected_color = rgb2lab(np.uint8(np.asarray([[color]])))

    select_image = False
    '''
    for i in range(number_of_colors):
        curr_color = rgb2lab(np.uint8(np.asarray([[image_colors[i]]])))
        diff = deltaE_cie76(selected_color, curr_color)
        if (diff < threshold):
            select_image = True
    '''
    curr_color = rgb2lab(np.uint8(np.asarray([[image_colors[1]]])))
    diff = deltaE_cie76(selected_color, curr_color)
    if (diff < threshold):
        select_image = True

    return select_image


def show_selected_images(color, threshold, colors_to_match):
    index = 1

    for i in range(len(images)):
        selected = match_image_by_color(images[i],
                                        color,
                                        threshold,
                                        colors_to_match)
        if (selected):
            #plt.subplot(10, 46, index)
            #plt.imshow(images[i])
            plt.imsave("./sample_img/" + name_images[i] + ".jpg", images[i])
            print(name_images[i])
            index += 1


# Search for GREEN
#plt.figure(figsize=(20, 10))
init()
show_selected_images(COLORS['RED'], 50, 2)
#plt.show()
