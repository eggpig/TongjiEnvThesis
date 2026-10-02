LATEXMK ?= latexmk
FLAGS = -xelatex -halt-on-error -interaction=nonstopmode -file-line-error -outdir=build

.PHONY: all main blind print spine biber package check clean
all: main blind print spine
main blind print spine biber:
	$(LATEXMK) $(FLAGS) $@.tex
check:
	python3 scripts/check_build.py build
package:
	python3 scripts/package.py
clean:
	$(LATEXMK) -C -outdir=build main.tex blind.tex print.tex spine.tex biber.tex
