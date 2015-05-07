library(dplyr)

src <- "http://discover.nci.nih.gov/cellminer/samples/CELLMINER_CELL_LINE_METADATA.txt"
lcl <- "data-raw/cells.txt"

if (!file.exists(lcl)) {
    download.file(src, lcl)
}

headers = c("cell.line", "tissue", "age", "sex",
            "prior.treatment", "epithelial", "histology", "source",
            "ploidy", "p53","mdr", "doubling.time","institute",
            "contributor", "reference")

cells <- read.delim(lcl, skip=7) %>% slice(1:60)
names(cells) <- headers
cells$cell.line <- gsub(":",".",cells$cell.line)

save(cells, file = "data/cells.rda")