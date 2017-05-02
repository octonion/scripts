r <- getOption("repos")

r["CRAN"] <- "http://ftp.osuosl.org/pub/cran"

options(repos=r)
package <- commandArgs(TRUE)[1]
update.packages(checkBuilt=TRUE,ask=FALSE)

q("no")
