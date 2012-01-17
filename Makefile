# Arquivo a ser compilado
FILE   = main
# Variáveis para compilar o TeX file
LATEX  = pdflatex
BIBTEX = bibtex
RM     = rm -f
OPEN   = open

# Gerar ps e PDF
# Opcoes de pagina: a4, letter, ...
PAGINA = letter
DVIPS  = dvips -t $(PAGINA) -z -Pps -G0
DVIPDF = dvipdf
PS2PDF = ps2pdf

#Variáveis para criar o Pacote
TAR = tar czf
CAT = cat
HOJE_EH = $(shell date +%G-%m-%d-%a)

all:
#	@$(LATEX) $(FILE)
	@$(LATEX) $(FILE)
	@$(LATEX) $(FILE)
	@$(BIBTEX) $(FILE)
	@$(LATEX) $(FILE)
	@$(LATEX) $(FILE)
#	@$(LATEX) $(FILE)
#	$(DVIPS) $(FILE) -o $(FILE).ps
	$(RM) *.aux *.bbl *.blg *.dvi *.lof *.log *.lot *.toc *.tmp  *.*~ *~
	$(OPEN) $(FILE).pdf

clean:
	$(RM) $(FILE).aux $(FILE).log $(FILE).out $(FILE).toc $(FILE).dvi $(FILE).lof $(FILE).bbl $(FILE).lot $(FILE).blg $(FILE).*~ $(FILE)~ *.tmp *.*~ *~

package: clean
	$(TAR) ../$(FILE)--$(HOJE_EH).tar.gz *

pdf:
	$(PS2PDF) $(FILE).ps $(FILE).pdf

edit:
	gvim -o $(FILE).tex $(FILE).bib
