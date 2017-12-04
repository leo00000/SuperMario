from PyQt5.QtQuick import *
from PyQt5.QtGui import *
from PyQt5.QtCore import *
import os


class GraphicsEffects:
    all = {}

    items = {}

    mario = {
        "small_normal": [],
        "big_normal": [],
        "fire": []
    }

    def __init__(self):
        self.path = os.path.join("resources", "gfx")
        self.load_all_graphics()
        self.load_mario_graphics()
        self.load_items_graphics()

    def load_mario_graphics(self):
        """
        Cut out each frame from mario_bros.png, assign them to list,
        mario bros is facing right, get the left images by flipping.
        """

        mario_bros = self.all["mario_bros"]

        small_normal_frames = (
            (178, 32, 12, 16),  # right standing [0] [11]
            (80, 32, 15, 16),  # right walking 1 [1] [12]
            (96, 32, 16, 16),  # right walking 2 [2] [13]
            (112, 32, 16, 16),  # right walking 3 [3] [14]
            (144, 32, 16, 16),  # right jumping [4] [[15]
            (130, 32, 14, 16),  # right skid [5] [16]
            (160, 32, 15, 16),  # death frame [6] [17]
            (320, 8, 16, 24),  # transition small to big [7] [18]
            (241, 33, 16, 16),  # transition big to small [8] [19]
            (194, 32, 12, 16),  # flag pole slide 1 [9] [20]
            (210, 33, 12, 16),  # flag pole slide 2 [10] [21]
        )

        # small colorful mario frames, used in invincible animation

        big_normal_frames = (
            (176, 0, 16, 32),  # right standing
            (81, 0, 16, 32),  # right walking 1
            (97, 0, 15, 32),  # right walking 2
            (113, 0, 15, 32),  # right walking 3
            (144, 0, 16, 32),  # right jumping
            (128, 0, 16, 32),  # right skid
            (336, 0, 16, 32),  # right throwing
            (160, 10, 16, 22),  # right crouching
            (272, 2, 16, 29),  # transition big to small
            (193, 2, 16, 30),  # flag pole slide 1
            (209, 2, 16, 29),  # flag pole slide 2
        )

        # big colorful mario frames, used in invincible animation

        # white mario frames, used in fire animation

        def assign(frames, mario_list):
            tmp = []
            tmp_mirror = []
            for each in frames:
                each_image = mario_bros.copy(*each).scaled(each[2] * 2.5, each[3] * 2.5)
                tmp.append(each_image)
                tmp_mirror.append(each_image.mirrored(True, False))
            mario_list.extend(tmp)
            mario_list.extend(tmp_mirror)

        assign(small_normal_frames, self.mario["small_normal"])
        assign(big_normal_frames, self.mario["big_normal"])

    def load_all_graphics(self):

        # logo = QImage(self.path + "title_screen.png")
        # self.other_graphics["logo"] = logo.copy(1, 60, 175, 88).scaled(175 * 2.5, 88 * 2.5)

        for image in os.listdir(self.path):
            name, ext = os.path.splitext(image)
            if ext in (".png", ".jpg", ".bmp"):
                self.all[name] = QImage(os.path.join(self.path, image))

    def load_items_graphics(self):
        # cursor for menu
        self.items["cursor"] = self.all["item_objects"].copy(24, 160, 8, 8).scaled(20, 20)


class GraphicsProvider(QQuickImageProvider):
    def __init__(self):
        super(GraphicsProvider, self).__init__(QQuickImageProvider.Image)
        self.gfx = GraphicsEffects()

    def requestImage(self, p_str, size):
        image = QImage()
        word = p_str.split("/")
        if word[0] == "mario":
            image = self.gfx.mario[word[1]][int(word[2])]
        elif word[0] == "items":
            image = self.gfx.items[word[1]] if (len(word) == 2) else self.gfx.items[word[1]][int(word[2])]
        elif self.gfx.all.__contains__(word[0]):
            image = self.gfx.all[word[0]]

        return image, image.size()


class SoundEffects:
    pass


# Create a global singleton class
ImageProvider = GraphicsProvider()
