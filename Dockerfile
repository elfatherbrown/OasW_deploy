FROM rstudio/r-base:4.0-focal
WORKDIR /
RUN echo 'options(repos = c(RSPM = "https://packagemanager.rstudio.com/all/__linux__/focal/2021-07-01+Y3JhbiwyOjM2OTMyMjM7MjgxMzY3NjI"), download.file.method = "libcurl")' > /usr/lib/R/etc/Rprofile.site
ENTRYPOINT [ "/bin/bash" ]