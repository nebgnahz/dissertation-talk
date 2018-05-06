.PHONY: talk-handout.pdf talk.pdf

LATEX = xelatex
BIBTEX = bibtex
SRCS = $(shell find . -name '*.tex')
TEX_FLAGS = -interaction=nonstopmode -halt-on-error
TALK="\def\iscomplete{1} \input{talk.tex}"
HANDOUT="\def\iscomplete{1} \def\ishandout{1} \input{talk.tex}"

ALL: talk-handout.pdf talk.pdf

talk-handout.pdf: $(SRCS)
	$(LATEX) $(TEX_FLAGS) $(HANDOUT)
	$(BIBTEX) talk
	$(LATEX) $(TEX_FLAGS) $(HANDOUT)
	$(LATEX) $(TEX_FLAGS) $(HANDOUT)
	mv talk.pdf talk-handout.pdf

talk.pdf: $(SRCS)
	$(LATEX) $(TEX_FLAGS) $(TALK)
	$(BIBTEX) talk
	$(LATEX) $(TEX_FLAGS) $(TALK)
	$(LATEX) $(TEX_FLAGS) $(TALK)

clean:
	rm -f *.aux *.log *.out *.bbl *.blg *~ *.bak $(FIGS) *.ps *.pdf *.synctex.gz
	rm -f *.bcf *.xml *.nav *.vrb *.snm *.toc
	rm -rf auto
	rm -f talk.pdf talk-handout.pdf
