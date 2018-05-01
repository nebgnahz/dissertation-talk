.PHONY: talk.pdf

LATEX = xelatex
SRCS = $(shell find . -name '*.tex')

ALL: talk.pdf

talk.pdf: $(SRCS)
	$(LATEX) --halt-on-error talk.tex
	$(BIBTEX) --halt-on-error talk.tex
	$(LATEX) --halt-on-error talk.tex
	$(LATEX) --halt-on-error talk.tex

clean:
	rm -f *.aux *.log *.out *.bbl *.blg *~ *.bak $(FIGS) *.ps *.pdf *.synctex.gz
	rm -f *.bcf *.xml *.nav *.vrb *.snm *.toc
	rm -rf auto
	rm -f talk.pdf
