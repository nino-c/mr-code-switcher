
line = '![Alt text](screenshots/%s "Interactive math, music, and art programming")'
import os

im = os.listdir('.')
print "\n".join(map(lambda x: line % (x,), im).__reversed__())

