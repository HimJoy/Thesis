TEX = texfot latexmk -pdf -output-directory=build

all: thesis

thesis: document.tex references.bib $(shell find sec/ -name "*.tex")
	mkdir -p build
	$(TEX) -jobname=thesis $<
	cp build/$@.pdf $@.pdf

clean:
	rm -rf build thesis.pdf
