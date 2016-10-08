.PHONY: all data clean

all: clean data eda-output.txt regression.RData report.pdf

report.pdf: report/report.Rmd regression.RData images/scatterplot-tv-sales.png
	cd report ; Rscript -e "library(rmarkdown); render('report.Rmd','pdf_document')"
	cd report ; Rscript -e "library(rmarkdown); render('report.Rmd','html_document')"

regression.RData: code/regression-script.R data/Advertising.csv
	cd code ; Rscript regression-script.R

eda-output.txt: code/eda-script.R data/Advertising.csv
	cd code ; Rscript eda-script.R

data:
	cd data ; curl -O http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv

clean:
	cd report ; rm -f report.pdf report.html