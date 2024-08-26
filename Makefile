filename ?= template.Rmd

render:
	Rscript -e "rmarkdown::render('$(filename)')"

dev:
	nodemon -w "$(filename)" --exec "make render"
