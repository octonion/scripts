
install_package <- function(package) {
    lcpackage <- tolower(package)
    if (lcpackage %in% tolower(rownames(available.packages()))) {
        print(paste("Package ",package," found in CRAN/R-Forge.",sep=""))
        print(paste("Installing ",package,".",sep=""))
        install.packages(package,dependencies=TRUE)
    } else {
        print(paste("Package ",package," not found in CRAN/R-Forge.",sep=""))
        print("Checking Bioconductor.")
        r <- BiocManager::repositories()
        options(repos=r)
        if (lcpackage %in% tolower(rownames(available.packages()))) {
            print(paste("Package ",package," found in Bioconductor.",sep=""))
            print(paste("Installing ",package,".",sep=""))
            install.packages(package,dependencies=TRUE)
        } else {
            print(paste("Package ",package," not found in Bioconductor.",sep=""))
        }
    }
    # Return installation status
    return(TRUE)
}

r <- getOption("repos")

r["CRAN"] <- "https://ftp.osuosl.org/pub/cran"
r["R-Forge"] <- "https://r-forge.r-project.org"
options(repos=r)

#package <- commandArgs(TRUE)[1]
packages = commandArgs(trailingOnly=TRUE)
lapply(packages, install_package)

q("no")
