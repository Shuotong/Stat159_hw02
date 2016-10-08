.PHONY: all data clean

all: eda-output.txt regression.RData report.html

report.html: report/report.Rmd regression.RData images/scatterplot-tv-sales.png
	cd report ; Rscript -e "library(rmarkdown); render('report.Rmd','html_document')"

regression.RData: code/regression-script.R data/Advertising.csv
	cd code ; Rscript regression-script.R

eda-output.txt: code/eda-script.R data/Advertising.csv
	cd code ; Rscript eda-script.R

data:
	cd data ; curl -O http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv

clean:
	cd report ; rm report.html