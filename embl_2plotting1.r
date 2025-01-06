#We will library the packages that will be needed for plotting
library("ggplot2")
library("dplyr")

#Plotting with ggplot

ggplot(data = mice_pheno)  #We will load the data for plotting
ggplot (data = mice_pheno, mapping = aes (x = Diet, y = Bodyweight)) # We have not added any layers so this won't show the plot
weight_plot <- ggplot (data = mice_pheno, mapping = aes (x = Diet, y = Bodyweight))

#We will add geom layer to plot a scatterpot
weight_plot + 
  geom_point()
#correct syntax: weight_plot + geom_point()
#Incorrect syntax: weight_plot
#+ geom_point()

#We will add geom layer to plt box plots
weight_plot +
  geom_boxplot()

#For better visualization of data we will add jitter layer
weight_plot +
  geom_boxplot() +
  geom_jitter(width = 0.3, alpha = 0.2)

#Visualization by Violin plot
weight_plot +
  geom_violin(aes(fill = Diet))

#Structure of the data
str (mice_pheno)

#Violin plot with filtered data
mice_pheno %>%
  filter (Sex == "F") %>%
  ggplot(aes(x = Diet, y = Bodyweight)) +
  geom_violin(aes(fill = Diet))

#Using facet_wrap to plot multiple in a single plot
weight_plot +
  geom_violin (aes(fill = Diet)) +
  facet_wrap(vars(Sex))

#Visualization with different colours
weight_plot + 
  geom_jitter (width = 0.4 , aes(colour = Sex), alpha = 0.5)

#Exercise : 1 Visualize the ToothGrowth data. Plot Lnegth of the tooth vs dose in single plot
ToothGrowth %>%
  ggplot(aes(x = len, y = dose)) +
  geom_point()+
  facet_wrap(vars(supp))

#Exercise : 2 Plot weigth vs group from PlantGrowth data using ggplot
PlantGrowth %>%
  ggplot(mapping = aes(x = weight, y = group)) + geom_point()

#Exercise : 2.1 Plot similar parameters as boxplot. Use jitter layer for data visualization.
PlantGrowth %>%
  ggplot(mapping = aes(x = weight , y = group)) + 
  geom_boxplot() +
  geom_jitter(width = 0.2, alpha = 0.2)

