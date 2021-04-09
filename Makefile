CV_CLASS := cv.cls
PROJECT_NAME := cv-lukas-bjarre

$(PROJECT_NAME).pdf: $(PROJECT_NAME).tex $(CV_CLASS)
	latexmk -lualatex $<
