r <- getOption("repos")

package <- commandArgs(TRUE)[1]

lcpackage <- tolower(package)

r["CRAN"] <- "https://ftp.osuosl.org/pub/cran"
r["R-Forge"] <- "https://r-forge.r-project.org"
options(repos=r)

if (lcpackage %in% tolower(rownames(available.packages()))) {
   print(paste("Package ",package," found in CRAN/R-Forge.",sep=""))
   print(paste("Installing ",package,".",sep=""))
   install.packages(package,dependencies=TRUE)
} else {
  print(paste("Package ",package," not found in CRAN/R-Forge.",sep=""))
  print("Checking Bioconductor.")
  r <- BiocInstaller::biocinstallRepos()
  options(repos=r)
  if (lcpackage %in% tolower(rownames(available.packages()))) {
    print(paste("Package ",package," found in Bioconductor.",sep=""))
    print(paste("Installing ",package,".",sep=""))
    install.packages(package,dependencies=TRUE)
    } else {
        print(paste("Package ",package," not found in Bioconductor.",sep=""))
  }
}

q("no")
