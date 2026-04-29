FROM rocker/tidyverse:4.5.1

RUN mkdir /home/rstudio/project
WORKDIR /home/rstudio/project

RUN apt-get update && apt-get install -y \
    make \
    pandoc \
    curl \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libicu-dev \
    libuv1-dev \
    && rm -rf /var/lib/apt/lists/*

COPY . /home/rstudio/project

RUN Rscript -e "install.packages(c('renv', 'rmarkdown', 'knitr', 'dplyr', 'ggplot2', 'readr', 'tibble', 'tidyr', 'broom', 'gt', 'gtsummary', 'kableExtra'), repos = 'https://cloud.r-project.org')"

RUN mkdir -p output report

CMD ["make", "report/final_report.html"]