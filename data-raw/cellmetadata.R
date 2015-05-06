library(dplyr)

src <- "http://discover.nci.nih.gov/cellminer/samples/CELLMINER_CELL_LINE_METADATA.txt"
lcl <- "data-raw/cellmetadata.txt"

if (!file.exists(lcl)) {
    download.file(src, lcl)
}

headers = c("Cell.Line.Name", "tissue.of.origin", "age", "sex",
            "prior.treatment", "Epithelial", "histology", "source",
            "ploidy", "p53","mdr", "doubling.time","Institute",
            "Contributor", "Reference")

cellmeta <- read.delim(lcl, skip=7) %>% slice(1:60)
names(cellmeta) <- headers

save(cellmeta, file = "data/cellmeta.rda")
