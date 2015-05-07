#' NCI 60 Cell-Drug Toxicity
#'
#' Negative log10 (GI50) values of sulforhodamine B assay for ~ 50K compounds, 
#' including more than 20,000 that passed quality control, 158 Food and Drug 
#' Administration approved and 79 clinical trial drugs. Higher values equate 
#' to higher sensitivity of cell lines.
#'
#' @source http://discover.nci.nih.gov/cellminer/samples/CELLMINER_CELL_LINE_METADATA.txt
#' @format Data frame with columns
#' \describe{
#' \item{NSC.id}{NSC name of drug used in the assay}
#' \item{drug}{the drugs name}
#' \item{pubchem}{pubchemid of the compound}
#' \item{cell.line}{cell line name}
#' \item{toxicity}{the Negative log10 (GI50) value. The primary independent
#'                 variable in this dataset}
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
#' }
#' @seealso
#' \href{http://discover.nci.nih.gov/cellminer/}
#' @examples
#'   nci60
"nci60"
     