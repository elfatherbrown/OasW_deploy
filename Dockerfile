FROM rocker/r-ver:3.6.3
RUN apt-get update && apt-get install -y  gdal-bin git-core imagemagick libcairo2-dev libcurl4-openssl-dev libgdal-dev libgeos-dev libgeos++-dev libgit2-dev libglpk-dev libgmp-dev libicu-dev libpng-dev libproj-dev libssl-dev libudunits2-dev libxml2-dev make pandoc pandoc-citeproc zlib1g-dev && rm -rf /var/lib/apt/lists/*
RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl', Ncpus = 4)" >> /usr/local/lib/R/etc/Rprofile.site
RUN R -e 'install.packages("remotes")'
RUN Rscript -e 'remotes::install_version("magrittr",upgrade="never", version = "2.0.1")'
RUN Rscript -e 'remotes::install_version("rlang",upgrade="never", version = "0.4.11")'
RUN Rscript -e 'remotes::install_version("glue",upgrade="never", version = "1.4.2")'
RUN Rscript -e 'remotes::install_version("R6",upgrade="never", version = "2.5.1")'
RUN Rscript -e 'remotes::install_version("processx",upgrade="never", version = "3.5.2")'
RUN Rscript -e 'remotes::install_version("knitr",upgrade="never", version = "1.34")'
RUN Rscript -e 'remotes::install_version("testthat",upgrade="never", version = "3.0.4")'
RUN Rscript -e 'remotes::install_version("pkgload",upgrade="never", version = "1.2.2")'
RUN Rscript -e 'remotes::install_version("htmltools",upgrade="never", version = "0.5.2")'
RUN Rscript -e 'remotes::install_version("dplyr",upgrade="never", version = "1.0.7")'
RUN Rscript -e 'remotes::install_version("RColorBrewer",upgrade="never", version = "1.1-2")'
RUN Rscript -e 'remotes::install_version("tidyr",upgrade="never", version = "1.1.4")'
RUN Rscript -e 'remotes::install_version("htmlwidgets",upgrade="never", version = "1.5.4")'
RUN Rscript -e 'remotes::install_version("ggplot2",upgrade="never", version = "3.3.5")'
RUN Rscript -e 'remotes::install_version("readr",upgrade="never", version = "2.0.1")'
RUN Rscript -e 'remotes::install_version("leaflet.providers",upgrade="never", version = "1.9.0")'
RUN Rscript -e 'remotes::install_version("markdown",upgrade="never", version = "1.1")'
RUN Rscript -e 'remotes::install_version("attempt",upgrade="never", version = "0.3.1")'
RUN Rscript -e 'remotes::install_version("shiny",upgrade="never", version = "1.7.0")'
RUN Rscript -e 'remotes::install_version("DT",upgrade="never", version = "0.19")'
RUN Rscript -e 'remotes::install_version("sf",upgrade="never", version = "1.0-2")'
RUN Rscript -e 'remotes::install_version("leaflet",upgrade="never", version = "2.0.4.1")'
RUN Rscript -e 'remotes::install_version("webshot",upgrade="never", version = "0.5.2")'
RUN Rscript -e 'remotes::install_version("rmarkdown",upgrade="never", version = "2.11")'
RUN Rscript -e 'remotes::install_version("config",upgrade="never", version = "0.3.1")'
RUN Rscript -e 'remotes::install_version("whereami",upgrade="never", version = "0.1.9")'
RUN Rscript -e 'remotes::install_version("thinkr",upgrade="never", version = "0.15")'
RUN Rscript -e 'remotes::install_version("thematic",upgrade="never", version = "0.1.2.1")'
RUN Rscript -e 'remotes::install_version("spelling",upgrade="never", version = "2.2")'
RUN Rscript -e 'remotes::install_version("skimr",upgrade="never", version = "2.1.3")'
RUN Rscript -e 'remotes::install_version("shinyWidgets",upgrade="never", version = "0.6.2")'
RUN Rscript -e 'remotes::install_version("shinyjs",upgrade="never", version = "2.0.0")'
RUN Rscript -e 'remotes::install_version("shinydashboard",upgrade="never", version = "0.7.1")'
RUN Rscript -e 'remotes::install_version("shinipsum",upgrade="never", version = "0.1.0")'
RUN Rscript -e 'remotes::install_version("renv",upgrade="never", version = "0.14.0")'
RUN Rscript -e 'remotes::install_version("naniar",upgrade="never", version = "0.6.1")'
RUN Rscript -e 'remotes::install_version("leafpop",upgrade="never", version = "0.1.0")'
RUN Rscript -e 'remotes::install_version("kableExtra",upgrade="never", version = "1.3.4")'
RUN Rscript -e 'remotes::install_version("golem",upgrade="never", version = "0.3.1")'
RUN Rscript -e 'remotes::install_version("DiagrammeR",upgrade="never", version = "1.0.6.1")'
RUN Rscript -e 'remotes::install_version("countrycode",upgrade="never", version = "1.3.0")'
RUN Rscript -e 'remotes::install_version("assertive",upgrade="never", version = "0.3-6")'
RUN Rscript -e 'remotes::install_github("jimjam-slam/ggflags@e3c6e51abfab9b8048159258cf4127ad8dccf0c5")'
RUN Rscript -e 'remotes::install_github("a4408/roascountries@7d1f4872eeb2f3da666d4a09d9741bbe41f536d8")'
RUN Rscript -e 'remotes::install_github("rstudio/pins@b83da4ea42cc98319752f17fda1c5250b2c37e08")'
RUN Rscript -e 'remotes::install_github("bhaskarvk/leaflet.extras@05c7e4f2cd1cf9ef586f875271cf03673c081e1d")'
RUN Rscript -e 'remotes::install_github("ColinFay/gargoyle@e0398a6970c5e43e081472e594fc13d1704bd938")'
RUN mkdir /build_zone
ADD . /build_zone
WORKDIR /build_zone
RUN R -e 'remotes::install_local(upgrade="never")'
RUN rm -rf /build_zone
EXPOSE 80
CMD R -e "options('shiny.port'=8000,shiny.host='0.0.0.0');OasW::run_app()"