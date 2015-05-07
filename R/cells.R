#' NCI 60 Cell Metadata
#'
#' NCI 60 Cancer Cell Line Origin and Basic Information
#'
#' @source http://discover.nci.nih.gov/cellminer/samples/CELLMINER_CELL_LINE_METADATA.txt
#' @format Data frame with columns
#' \describe{
#' \item{cell.line}{cell line name}
#' \item{tissue}{tissue of origin}
#' \item{age}{patient's age}
#' \item{sex}{patient's sex}
#' \item{prior.treatment}{BCNU=Bis(chlorethyl)nitrosourea;CCNU=chloroethylecyclohexylnitrosourea; CyPh=cyclophosphamide;CsPt=cisplatin;Ctx=cytoxan;5FU=5-fluorouracil; Hu=hydroxyurea;Mto=mitoxantrone;Pred=prednisone;VB=vinblastine;6MP=6-mercaptopurine; Rad=radiation;Mtx=methotrexate;PiBr=piprobromine;Adr=adriamycin.}
#' \item{epithelial}{Boolean}
#' \item{histology}{Description of the Tumor}
#' \item{source}{e.g. Primary, Metastasis}
#' \item{ploidy}{}
#' \item{p53}{p53 status as determined by yeast growth functional assay: WT/MT/?}
#' \item{mdr}{MDR Function: from DTP site }
#' \item{doubling.time}{Doubling times described at DPT.}
#' \item{institute}{institute}
#' \item{contributor}{contributor}
#' \item{reference}{reference}
#' }
#' @seealso
#' \href{http://discover.nci.nih.gov/cellminer/}
#' @examples
#'   cells
"cells"