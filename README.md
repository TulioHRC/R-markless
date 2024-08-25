# R-markless 

A simple and lighter way to use R-markdown without needing to download Rstudio.

## How to setup?

#### 1. Install R

Depending on your OS the installation process can be different, but it won't be hard, for linux on ubuntu distros, we use:

```bash
sudo apt update
sudo apt install r-base
sudo apt install pandoc
```

If you want a smaller R version, install ```r-base-core``` and also run ```sudo apt-get autoremove``` to uninstall unnecessary packages.


#### 2. Install R packages

With your R installed, we can run it and install some packages (rmarkdown and reticulate), rmarkdown installation can take a while:

```bash
R
> install.packages("rmarkdown")
> install.packages("tinytex")
> tinytex::install_tinytex()
> install.packages("reticulate") # optional: to run any programming language inside your documentation
```

#### 3. Install Watch software

To update your document while you're editting it, we're going to use nodemon, but you can configure whatever you prefer.

Again I'm going to use linux ubuntu distros download method.

```bash
sudo apt install npm
sudo npm i -g nodemon
```

#### 4. Configure your development environment

Create a Makefile to automate the running process:

```Makefile
filename ?= test.Rmd

render:
	Rscript -e "rmarkdown::render('$(filename)')"

dev:
	nodemon -w "$(filename)" --exec "make render"
```

#### 5. Testing

Then, just run make dev, and 'voilà' it's working, just open the pdf file and see what you've made. If you want to see what's changing in real time, some apps have this syncronization, including the default PDF reader of ubuntu and vscode-pdf extension.

Just rename the filename in the Makefile, and run ```make dev``` on your project folder. Or run ```make dev filename=myfile.Rmd```.

#### I hope you enjoyed it!

## References

- [R-markdown documentation](https://rmarkdown.rstudio.com/lesson-1.html)
- [Motivacional video](https://www.youtube.com/watch?v=uccEhThn0ls)  