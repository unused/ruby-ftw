
# .PHONY: rabbit
# rabbit:
# 	@rabbit slides.md

.PHONY: presentation
presentation: slides.pdf

%.pdf: %.md
	@pandoc -t beamer -o $@ $<

.PHONY: clean
clean:
	@rm -f slides.pdf
