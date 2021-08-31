#!/usr/bin/env python
# coding: utf-8

#this program converts image to .mif (black & white)
# Autores MI Elizabeth Fonseca ChÃ¡vez- MI Mario Alfredo Ibarra Carrillo
#
import sys
from PIL import Image
import numpy
def convertirImagen(modo):
	#checking the origin's file forma
	origin=Image.open("cora.png")
	#Opening the image file
	image=origin.convert(modo).resize((16,16),Image.ANTIALIAS)
	image=numpy.array(image)
	if modo=='RGB':
		rows,cols,channels=image.shape
		depth=rows*cols*channels
	else:
		rows,cols=image.shape
		depth=rows*cols
	#Writing the .mif file
	f=open("cora_rgb.mif","wt")

	f.write("DEPTH = "+str (depth) +";\n")
	f.write("WIDTH = "+str (8) +";\n")

	f.write("ADDRESS_RADIX = UNS;\n")
	f.write("DATA_RADIX = UNS;\n")

	f.write("CONTENT\n")
	f.write("BEGIN\n")

	indx=0
	for k in image.reshape(depth):
		f.write(str(indx) + " : " + str(k) + ";\n")
		indx+=1

	f.write("END;\n")
	f.close()

	print("Conversion finished")

convertirImagen('RGB')