thesis.pdf: output/thesis.aux output/thesis.bbl
	pdflatex --output-directory=output thesis.tex
	# 2x to get all references right
	pdflatex --output-directory=output thesis.tex
	cp output/thesis.pdf .

output/thesis.aux: *.tex
	pdflatex --output-directory=output thesis.tex

output/thesis.bbl: output/thesis.aux biblio.bib
	cd output && bibtex thesis.aux

.PHONY: clean
clean:
	$(RM) output/*.{aux,bbl,blg,log,out,pdf,toc}
	$(RM) output/chapters/*.aux
