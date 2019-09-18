r <- getOption("repos")

r["CRAN"] <- "https://ftp.osuosl.org/pub/cran"
r["R-Forge"] <- "https://r-forge.r-project.org"
options(repos=r)

package <- commandArgs(TRUE)[1]
update.packages(checkBuilt=TRUE,ask=FALSE)

q("no")
