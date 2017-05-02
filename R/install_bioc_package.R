source("https://bioconductor.org/biocLite.R")

package <- commandArgs(TRUE)[1]
biocLite(package)

q("no")
