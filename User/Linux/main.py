import sys, os, subprocess

from PyQt4 import QtGui, QtCore
from PyQt4.QtCore import pyqtSlot


class Window(QtGui.QWidget):
    def __init__(self, parent=None):
        super(Window, self).__init__(parent)

        button_names = [
            u'Connect',
            u'Disconnect',
            u'Status'
        ]

        self.buttons = {}
        for name in button_names:
            button = QtGui.QPushButton(name)
            button.clicked.connect(self.button_clicked)
            self.buttons[name] = button

        vlayout = QtGui.QVBoxLayout()

        for button in button_names:
            vlayout.addWidget(self.buttons[button])

        self.setLayout(vlayout) 

    @pyqtSlot()
    def button_clicked(self):
        if self.sender() is self.buttons[u'Connect']:
            os.system("systemctl start myovpn.service")
        elif self.sender() is self.buttons[u'Disconnect']:
            os.system("systemctl stop myovpn.service")
        elif self.sender() is self.buttons[u'Status']:
            os.system("systemctl status myovpn.service")
        else:
            print u'other button clicked'


application = QtGui.QApplication(sys.argv)

window = Window()
window.setWindowTitle(u'OpenVPN GUI')
window.setGeometry(50, 50, 500, 300)
window.setWindowIcon(QtGui.QIcon('openvpn.png'))
window.resize(300, 200)  
window.show() 

sys.exit(application.exec_())
