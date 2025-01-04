#Course work on Biostatistics from EMBL
#We wil first library the packages needed for basic R
install.packages("tidyverse")
library("tidyverse")
library("dplyr")

#We will load the mice phenotype data 
mice_pheno <- read.csv2(file= url("https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"), sep=",")
mice_pheno$Bodyweight <- as.numeric(mice_pheno$Bodyweight)

#Basic statistics of the data
str(mice_pheno)
dim(mice_pheno)  #Dimesnsion of the data
head(mice_pheno) #First few lines of data visualization
names(mice_pheno) 
rownames(mice_pheno)
mice_pheno$Bodyweight
mice_pheno[,3]    #Indexing for a column

#Exercise : 1 Select the desired row of the dataset
PlantGrowth
names(PlantGrowth)
PlantGrowth$weight

PlantGrowth %>%
  filter (group != "ctrl") %>%
  select(weight)

#Filtering and Summarizing the data
sex <- factor (c("male","female","male","female","male","male","female","female"))
sex

mice_pheno %>%
  filter (Sex == "F" & Diet == "hf" & Bodyweight < 18)

mice_pheno %>%
  filter (Sex == "F" & Diet == "hf" & Bodyweight < 18) %>%
  select (Bodyweight, Diet)

#Calculating mean of a data
mean (mice_pheno$Bodyweight, na.rm = TRUE)

mice_pheno %>%
  group_by(Diet) %>%
  summarize (group_mean = mean(Bodyweight , na.rm = TRUE))

mice_pheno %>%
  group_by(Diet, Sex) %>%
  summarize (group_mean = mean(Bodyweight , na.rm = TRUE),
             group_sd = sd(Bodyweight, na.rm = TRUE))
