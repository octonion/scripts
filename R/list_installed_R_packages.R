library(sessioninfo)
library(dplyr)

## List all installed packages
pkgs <- installed.packages()[,'Package']

## Read description files & parse using sessioninfo
desc <- lapply(pkgs, utils::packageDescription)
source <- vapply(desc, sessioninfo:::pkg_source, character(1))

## local
filter_pkgs <- tibble(pkgs, source) %>%
    filter(grepl("local", source))

print(filter_pkgs, n=Inf)

## CRAN
filter_pkgs <- tibble(pkgs, source) %>%
    filter(grepl("CRAN", source))

print(filter_pkgs, n=Inf)

## R-Forge
filter_pkgs <- tibble(pkgs, source) %>%
    filter(grepl("R-Forge", source))

print(filter_pkgs, n=Inf)

## INLA
filter_pkgs <- tibble(pkgs, source) %>%
    filter(grepl("INLA", source))
print(filter_pkgs, n=Inf)

## Bioconductor
filter_pkgs <- tibble(pkgs, source) %>%
    filter(grepl("Bioconductor", source))

print(filter_pkgs, n=Inf)

#print(tibble(pkgs, source), n=Inf)
