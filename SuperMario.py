from PyQt5.QtGui import *
from PyQt5.QtQml import *
from code.resources import ImageProvider


app = QGuiApplication([])

engine = QQmlApplicationEngine()
engine.addImageProvider("gfx", ImageProvider)
engine.load("code/SuperMario.qml")

app.exec()
