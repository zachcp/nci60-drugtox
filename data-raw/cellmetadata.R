library(dplyr)

src <- "http://discover.nci.nih.gov/cellminer/samples/CELLMINER_CELL_LINE_METADATA.txt"
lcl <- "data-raw/cellmetadata.txt"

if (!file.exists(lcl)) {
    download.file(src, lcl)
}

headers = c("cell.line", "tissue", "age", "sex",
            "prior.treatment", "epithelial", "histology", "source",
            "ploidy", "p53","mdr", "doubling.time","institute",
            "contributor", "reference")

cellmeta <- read.delim(lcl, skip=7) %>% slice(1:60)
names(cellmeta) <- headers
cellmeta$cell.line <- gsub(":",".",cellmeta$cell.line)

save(cellmeta, file = "data/cellmeta.rda")