e#######################################################################################
#######################################################################################
#'Análises dos resultados do BFAST para os polígonos do SIAD
#'
#'Script para extrair os dados de ndvi das amostras selecionadas para cada classe;

###
###
#'pacotes

###
###
#'Dados
ndvi <- read.csv("/hds/dados_work/DATASAN/bfastAdriano/Dados/NDVI_2000_2016_SIAD_ID.csv")

amostras <- read.csv("dados/SIAD_10_Amostra_Por_Classes.csv")

###
###
#'Subset dos dados (selecionar amostras) 
ndvi_amostras <- ndvi[ndvi$OBJECTID %in% amostras$ID, ]
dim(ndvi_amostras)
ndvi_amostras[,1:5]

###
###
#'Juntar dados por id
ndvi_amostras_id <- merge(amostras, ndvi_amostras, by.x = "ID", by.y = "OBJECTID")
dim(ndvi_amostras_id)
ndvi_amostras_id[,1:5]

ndvi_amostras_id <- ndvi_amostras_id[order(ndvi_amostras_id$Classe), ]
ndvi_amostras_id[,1:5]

###
###
#'Gravar dados
write.csv(ndvi_amostras_id, file = "dados/SIAD_NDVI_Amostras_Classes.csv", row.names = FALSE)

#######################################################################################
#######################################################################################