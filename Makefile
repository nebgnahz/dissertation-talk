.PHONY: talk.pdf

LATEX = xelatex
SRCS = $(shell find . -name '*.tex')
TEX_FLAGS = -interaction=nonstopmode -halt-on-error

ALL: talk.pdf

talk.pdf: $(SRCS)
	$(LATEX) $(TEX_FLAGS) talk.tex
	$(BIBTEX) $(TEX_FLAGS) talk.tex
	$(LATEX) $(TEX_FLAGS) talk.tex
	$(LATEX) $(TEX_FLAGS) talk.tex

clean:
	rm -f *.aux *.log *.out *.bbl *.blg *~ *.bak $(FIGS) *.ps *.pdf *.synctex.gz
	rm -f *.bcf *.xml *.nav *.vrb *.snm *.toc
	rm -rf auto
	rm -f talk.pdf
