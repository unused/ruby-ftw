PANDOC_OPTS=-t beamer -H templates/slides-header.tex

# .PHONY: rabbit
# rabbit:
# 	@rabbit slides.md

.PHONY: presentation
presentation: slides.pdf

%.pdf: %.md
	@pandoc $(PANDOC_OPTS) -o $@ $<

.PHONY: backup
backup: slides-backup.pdf

slides-backup.md:
	@ruby slides-backup.rb

.PHONY: clean
clean:
	@rm -f slides.pdf slides-backup.pdf slides-backup.md

.PHONY: watch
watch:
	@echo slides.md | entr -c 'make'
