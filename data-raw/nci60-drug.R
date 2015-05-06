library(dplyr)
library(reshape2)
library(tidyr)

src <- "http://discover.nci.nih.gov/cellminerdata/rawdata/DTP_NCI60_RAW.zip"
lcl <- "data-raw/DTP_NCI60_RAW.zip"

if (!file.exists(lcl)) {
    download.file(src, lcl)
}

headers = c("NSC.id","Drug.name","FDA.status","Mechanism.of.action","PubChem.id",
            "Total.probes","Total.after.quality.control", "Failure.reason",
            "Experiment.name","BR.MCF7","BR.MDA_MB_231","BR.HS578T","BR.BT_549",
            "BR.T47D","CNS.SF_268","CNS.SF_295","CNS.SF_539","CNS.SNB_19",
            "CNS.SNB_75", "CNS.U251","CO.COLO205","CO.HCC_2998","CO.HCT_116",
            "CO.HCT_15","CO.HT29","CO.KM12","CO.SW_620","LE.CCRF_CEM",
            "LE.HL_60","LE.K_562","LE.MOLT_4","LE.RPMI_8226","LE.SR",
            "ME.LOXIMVI","ME.MALME_3M","ME.M14","ME.SK_MEL_2","ME.SK_MEL_28",
            "ME.SK_MEL_5","ME.UACC_257","ME.UACC_62","ME.MDA_MB_435","ME.MDA_N",
            "LC.A549","LC.EKVX","LC.HOP_62","LC.HOP_92","LC.NCI_H226",
            "LC.NCI_H23","LC.NCI_H322M","LC.NCI_H460","LC.NCI_H522","OV.IGROV1",
            "OV.OVCAR_3","OV.OVCAR_4","OV.OVCAR_5","OV.OVCAR_8","OV.SK_OV_3",
            "OV.NCI_ADR_RES","PR.PC_3","PR.DU_145","RE.786_0","RE.A498",
            "RE.ACHN","RE.CAKI_1","RE.RXF_393","RE.SN12C","RE.TK_10",
            "X")

nci60.drugs <- read.delim2(unz(lcl, "DTP_NCI60_RAW.txt"),skip=8)
names(nci60.drugs) <- headers

nci60.drugs <- nci60.drugs %>% select(-X)

drugdata <- nci60.drugs %>% select(NSC.id,Drug.name,FDA.status,Mechanism.of.action,PubChem.id)

df <- head(nci60.drugs)


df2 <- melt(df, id.vars = c("NSC.id"),value.name = "Toxicity", 
                measure.vars = c("BR.MCF7","BR.MDA_MB_231","BR.HS578T","BR.BT_549",
            "BR.T47D","CNS.SF_268","CNS.SF_295","CNS.SF_539","CNS.SNB_19",
            "CNS.SNB_75", "CNS.U251","CO.COLO205","CO.HCC_2998","CO.HCT_116",
            "CO.HCT_15","CO.HT29","CO.KM12","CO.SW_620","LE.CCRF_CEM",
            "LE.HL_60","LE.K_562","LE.MOLT_4","LE.RPMI_8226","LE.SR",
            "ME.LOXIMVI","ME.MALME_3M","ME.M14","ME.SK_MEL_2","ME.SK_MEL_28",
            "ME.SK_MEL_5","ME.UACC_257","ME.UACC_62","ME.MDA_MB_435","ME.MDA_N",
            "LC.A549","LC.EKVX","LC.HOP_62","LC.HOP_92","LC.NCI_H226",
            "LC.NCI_H23","LC.NCI_H322M","LC.NCI_H460","LC.NCI_H522","OV.IGROV1",
            "OV.OVCAR_3","OV.OVCAR_4","OV.OVCAR_5","OV.OVCAR_8","OV.SK_OV_3",
            "OV.NCI_ADR_RES","PR.PC_3","PR.DU_145","RE.786_0","RE.A498",
            "RE.ACHN","RE.CAKI_1","RE.RXF_393","RE.SN12C","RE.TK_10"))

df3 <- melt(nci60.drugs, id.vars = c("NSC.id"), value.name = "Toxicity",
            measure.vars = c("BR.MCF7","BR.MDA_MB_231","BR.HS578T","BR.BT_549",
                             "BR.T47D","CNS.SF_268","CNS.SF_295","CNS.SF_539","CNS.SNB_19",
                             "CNS.SNB_75", "CNS.U251","CO.COLO205","CO.HCC_2998","CO.HCT_116",
                             "CO.HCT_15","CO.HT29","CO.KM12","CO.SW_620","LE.CCRF_CEM",
                             "LE.HL_60","LE.K_562","LE.MOLT_4","LE.RPMI_8226","LE.SR",
                             "ME.LOXIMVI","ME.MALME_3M","ME.M14","ME.SK_MEL_2","ME.SK_MEL_28",
                             "ME.SK_MEL_5","ME.UACC_257","ME.UACC_62","ME.MDA_MB_435","ME.MDA_N",
                             "LC.A549","LC.EKVX","LC.HOP_62","LC.HOP_92","LC.NCI_H226",
                             "LC.NCI_H23","LC.NCI_H322M","LC.NCI_H460","LC.NCI_H522","OV.IGROV1",
                             "OV.OVCAR_3","OV.OVCAR_4","OV.OVCAR_5","OV.OVCAR_8","OV.SK_OV_3",
                             "OV.NCI_ADR_RES","PR.PC_3","PR.DU_145","RE.786_0","RE.A498",
                             "RE.ACHN","RE.CAKI_1","RE.RXF_393","RE.SN12C","RE.TK_10"))

df3 <- df3 %>% filter(Toxicity != "na")
df3$Toxicity <- as.numeric(df3$Toxicity)
