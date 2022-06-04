NAME := lukas-bjarre
DOCS := cv coverletter

OTHER := cv.cls preamble.tex
SRC   := $(foreach DOC,$(DOCS),$(DOC)-$(NAME).tex)
PDF   := $(SRC:.tex=.pdf)

all: $(PDF)

%.pdf: %.tex $(OTHER)
	latexmk -lualatex $<
