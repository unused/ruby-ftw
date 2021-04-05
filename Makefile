PANDOC_OPTS=-t beamer

# .PHONY: rabbit
# rabbit:
# 	@rabbit slides.md

.PHONY: presentation
presentation: slides.pdf

%.pdf: %.md
	@pandoc $(PANDOC_OPTS) -o $@ $<

.PHONY: clean
clean:
	@rm -f slides.pdf

.PHONY: watch
watch:
	@echo slides.md | entr -c 'make'
