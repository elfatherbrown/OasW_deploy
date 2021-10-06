FROM rocker/r-ver:3.6.3
RUN apt-get update && apt-get install -y  gdal-bin git-core imagemagick libcairo2-dev libcurl4-openssl-dev libgdal-dev libgeos-dev libgeos++-dev libgit2-dev libglpk-dev libgmp-dev libicu-dev libpng-dev libproj-dev libssl-dev libudunits2-dev libxml2-dev make pandoc pandoc-citeproc zlib1g-dev rclone bash wget &&  rm -rf /var/lib/apt/lists/*
WORKDIR /datasets
RUN wget -O datasets.zip "https://www.dropbox.com/sh/t7q4wlihvixg9u7/AAAnHQicRDxxt2W80OYFTg_Va?dl=0"
RUN unzip datasets.zip -x / 
RUN rm datasets.zip
WORKDIR /testadd
ADD . .
#RUN git clone -b profiles git@github.com:elfatherbrown/OasW.git
WORKDIR /OasW
RUN R -e 'install.packages(c("remotes","here"))'
ADD . .
#RUN R -e 'setwd("/OasW/");remotes::install_local(".",upgrade="never")'
#RUN R -e 'remotes::install_github("elfatherbrown/OasW@profiles",upgrade="never")'
#RUN rm -rf /build_zone
EXPOSE 8000
CMD R -e "options('shiny.port'=8000,shiny.host='0.0.0.0');OasW::run_app()"