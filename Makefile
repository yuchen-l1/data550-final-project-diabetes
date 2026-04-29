.PHONY: all clean install docker-run
.DEFAULT_GOAL := all

all: output/final_report.html

install:
	Rscript -e "renv::restore(prompt = FALSE)"

output/diab_analysis.rds: code/01_load_clean_data.R diabetes.csv
	Rscript code/01_load_clean_data.R

output/summary_tbl.rds: code/02_make_table.R output/diab_analysis.rds
	Rscript code/02_make_table.R

output/glucose_bmi_plot.png: code/03_make_figure.R output/diab_analysis.rds
	Rscript code/03_make_figure.R

output/final_report.html: code/04_render_report.R final_report.Rmd output/summary_tbl.rds output/glucose_bmi_plot.png
	Rscript code/04_render_report.R

report/final_report.html: output/final_report.html
	mkdir -p report
	cp output/final_report.html report/final_report.html

docker-run:
	mkdir -p report
	docker run --rm -v "$$(pwd)/report":/home/rstudio/project/report br1anli/data550-final-project-diabetes

clean:
	rm -f output/*.rds output/*.png output/*.html report/*.html