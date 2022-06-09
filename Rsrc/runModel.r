library(r3PG)
library(dplyr)
library(ggplot2)
library(readxl)
library(data.table)

###select path for data and set to working directory
## pathX <- "C:/Users/39348/OneDrive/Desktop/LAVORO_CHECCO/CALIBRAZIONE/"
pathX <- "C:/Users/minunno/Documents/yucatrote/SLU/codes/"
setwd(pathX)

data_site <- read_excel('INPUT_R_1225sk2020_LM.xlsx', sheet = 'd_site')
data_species <- read_excel('INPUT_R_1225sk2020_LM.xlsx', sheet = 'd_species')
#data_climate <- read_excel('INPUT_R_1225sk2020_LM.xlsx', sheet = 'd_climate')
data_thinning <- read_excel('INPUT_R_1225sk2020_LM.xlsx', sheet = 'd_thinnings')
data_parameters <- read_excel('INPUT_R_1225sk2020_LM.xlsx', sheet = 'd_parameters')
data_sizeDist <- read_excel('INPUT_R_1225sk2020_LM.xlsx', sheet = 'd_sizeDist')
##### set data #####
all_site = data_site[,3:10]
all_species = data_species [,3:9]
#all_climate = data_climate [,3:12]
all_thinning = data_thinning [,3:8]
all_parameters = data_parameters
all_sizeDist = data_sizeDist
#### Correzione errore anno ###
my_climate = rbind(d_climate,d_climate)
my_climate = rbind(my_climate,d_climate)
nYears = nrow(my_climate)/12
my_climate$year = as.double(rep(1987:(1987+nYears-1), each = 12))
my_climate = as.matrix(my_climate)
### correzione errore stringa ###
my_species <- all_species[1,]
my_species$planted = as.character(my_species$planted)
my_species$fertility = as.double(my_species$fertility)
#
#
#
####################################################
#
#
#
####select a site and run model
input_1225 = read_excel('INPUT_R_1225sk2020_LM.xlsx', sheet = 'input_marklund')
#####
#### SELECT SITE ###
first_site = 1 ####solo per il primo sito
last_site = 4 ####solo per il primo sito
#site_sliding = function(input_1225,first_site,last_site){    ####dal secondo sito in poi
#  if(input_1225$rev[last_site+6]==6){
#   last_site = (first_site + 5)
#}else{
# last_site = (first_site + 3)
#  }
#}
#first_site = (last_site + 1)    ####dal secondo sito in poi
#last_site = site_sliding(input_1225,first_site,last_site)  ####dal secondo sito in poi
######
# my_out = list()
# all_thinning = list() ####chiedi spiegazioni
# all_thinning[[1]] = ## e' = a nthinnigSites?
#   nthinnigSites =  c(2,5,5,3,5,2,2,5,5,5,2,2,2,5,5,2,3,5,6,5,2,2,5,5)
# nSites <- length(nthinnigSites)
# first_thin <- c(1,cumsum(nthinnigSites)[1:(nSites-1)]+1) ####chiedi spiegazioni
# last_thin <- cumsum(nthinnigSites)
i=1
# for(i in 1:nSites){
my_site <- all_site[i,]
my_species <- all_species[i,]
my_species$planted = as.character(my_species$planted)
my_species$fertility = as.double(my_species$fertility)
#my_climate = all_climate [i,]
my_thinning = all_thinning[1:2,]
#my_thinning = all_thinning [i,]
my_parameters = all_parameters
my_sizeDist = all_sizeDist
my_out = run_3PG(
  site        = my_site,
  species     = my_species,
  climate     = my_climate,
  thinning    = my_thinning,
  parameters  = my_parameters,
  size_dist   = my_sizeDist,
  settings    = list(light_model = 2, transp_model = 2, phys_model = 2,
                     height_model = 1, correct_bias = 0, calculate_d13c = 0),
  check_input = TRUE, df_out = F)
# }





library(r3PG)
library(dplyr)
library(ggplot2)
library(readxl)
library(data.table)
###select path for data and set to working directory
## pathX <- "C:/Users/39348/OneDrive/Desktop/LAVORO_CHECCO/CALIBRAZIONE/"
pathX <- "C:/Users/minunno/Documents/yucatrote/SLU/codes/"
setwd(pathX)
data_site <- read_excel('INPUT_R_1225sk2020_LM.xlsx', sheet = 'd_site')
data_species <- read_excel('INPUT_R_1225sk2020_LM.xlsx', sheet = 'd_species')
#data_climate <- read_excel('INPUT_R_1225sk2020_LM.xlsx', sheet = 'd_climate')
data_thinning <- read_excel('INPUT_R_1225sk2020_LM.xlsx', sheet = 'd_thinnings')
data_parameters <- read_excel('INPUT_R_1225sk2020_LM.xlsx', sheet = 'd_parameters')
data_sizeDist <- read_excel('INPUT_R_1225sk2020_LM.xlsx', sheet = 'd_sizeDist')
##### set data #####
all_site = data_site[,2:10]
all_species = data_species [,2:9]
#all_climate = data_climate [,3:12]
all_thinning = data_thinning [,2:8]
all_parameters = data_parameters
all_sizeDist = data_sizeDist
#### Correzione errore anno ###
my_climate = rbind(d_climate,d_climate)
my_climate = rbind(my_climate,d_climate)
nYears = nrow(my_climate)/12
my_climate$year = as.double(rep(1987:(1987+nYears-1), each = 12))
my_climate = as.matrix(my_climate)
### correzione errore stringa ###
my_species <- all_species[1,]
my_species$planted = as.character(my_species$planted)
my_species$fertility = as.double(my_species$fertility)
#
#
#
####################################################
#
#
#
####select a site and run model
input_1225 = read_excel('INPUT_R_1225sk2020_LM.xlsx', sheet = 'input_marklund')
#####
#### SELECT SITE ###
first_site = 1 ####solo per il primo sito
last_site = 4 ####solo per il primo sito
#site_sliding = function(input_1225,first_site,last_site){    ####dal secondo sito in poi
#  if(input_1225$rev[last_site+6]==6){
#   last_site = (first_site + 5)
#}else{
# last_site = (first_site + 3)
#  }
#}
#first_site = (last_site + 1)    ####dal secondo sito in poi
#last_site = site_sliding(input_1225,first_site,last_site)  ####dal secondo sito in poi
######
# my_out = list()
# all_thinning = list() ####chiedi spiegazioni
# all_thinning[[1]] = ## e' = a nthinnigSites?
#   nthinnigSites =  c(2,5,5,3,5,2,2,5,5,5,2,2,2,5,5,2,3,5,5,5,2,2,5,5)
# nSites <- length(nthinnigSites)
# first_thin <- c(1,cumsum(nthinnigSites)[1:(nSites-1)]+1) ####chiedi spiegazioni
# last_thin <- cumsum(nthinnigSites)
i=1
# for(i in 1:nSites){
my_site <- all_site[i,]
my_species <- all_species[i,]
my_species$planted = as.character(my_species$planted)
my_species$fertility = as.double(my_species$fertility)
#my_climate = all_climate [i,]
my_thinning = all_thinning[1:2,]
#my_thinning = all_thinning [i,]
my_parameters = all_parameters
my_sizeDist = all_sizeDist
my_out = run_3PG(
  site        = my_site,
  species     = my_species,
  climate     = my_climate,
  thinning    = my_thinning,
  parameters  = my_parameters,
  size_dist   = my_sizeDist,
  settings    = list(light_model = 2, transp_model = 2, phys_model = 2,
                     height_model = 1, correct_bias = 0, calculate_d13c = 0),
  check_input = TRUE, df_out = F)
# }

