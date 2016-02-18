r <- getOption("repos")

package <- commandArgs(TRUE)[1]

lcpackage <- tolower(package)

r["CRAN"] <- "http://ftp.osuosl.org/pub/cran"
options(repos=r)

if (lcpackage %in% tolower(rownames(available.packages()))) {
   print(paste("Package ",package," found in CRAN.",sep=""))
   print(paste("Installing ",package,".",sep=""))
   install.packages(package,dependencies=TRUE)
} else {
  print(paste("Package ",package," not found in CRAN.",sep=""))
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

#set repos then check, e.g., pkg %in% rownames(available.packages(repos=BiocInstaller::biocinstallRepos())) (tolower() ?)