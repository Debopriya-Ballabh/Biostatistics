#Library all the packages needed for visualization
install.packages("palmerpenguins")
library("palmerpenguins")
install.packages("GGally")
library("GGally")
library("ggplot2")
library("dplyr")
install.packages("hexbin")
library("hexbin")

#Know your data first
names(penguins)
dim(penguins)

#Plot the penguin data in a rug plot with 1D marginal distributions
ggplot(penguins, aes(x = bill_length_mm, y = flipper_length_mm)) +
  geom_point() +
  geom_rug()

#Visualize the penguin data and understqand the variation between different species and sex
penguins %>%
  filter(!is.na(sex)) %>%
  ggplot(aes(x = bill_length_mm, y = flipper_length_mm, colour = species, shape = sex)) +
  geom_point()

#Plot for species gentoo and female penguins only
penguins %>%
  filter(sex == "female", species =="Gentoo") %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point()

#Create a scatterpot matrix to visualize the correlation between variables
penguins %>% 
  filter (species == "Gentoo") %>%
  select (bill_length_mm, body_mass_g, flipper_length_mm) %>%
  ggpairs()

#Exercise : 1 plot on palmerpenguin data for Adelie species and differentiate according to sex
penguins %>% 
  filter(species == "Adelie" & !is.na(sex)) %>% 
  ggplot(aes(x = body_mass_g, y = flipper_length_mm, colour = sex)) + 
  geom_point()

#Learn overplotting with the diamonds data
#Know the diamonds dataset first (Have patience to work with this HUGE dataset)
str(diamonds)

#Import the dataset and filter it
diamonds2 <- diamonds %>%
  filter(carat <= 2.5) %>%
  mutate (lpprice = log2(price) , lcarat = log2(carat))

#Plot scatterplot for carat vs price of the diamonds
ggplot(diamonds2, aes (x = carat, y = price)) +
  geom_point()
#The plot will be too overpopulated that it isn't easy to interprete

ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price), alpha = 1/100)
 
#Now we will scale the data and take log of the dataset
ggplot(data = diamonds2) +
  geom_point(mapping = aes(x = carat, y = price), alpha = 1/100) +
  scale_y_log10() + scale_x_log10()

#We will use Hexbin package to create a hexagonal heatmap of the data
ggplot(data = diamonds2) +
  geom_hex(mapping = aes(x = carat, y = price))

#Moral of the story: The main motive is to visualize the data so that it become more interpretable.
#So, use the varities of graphs to plot your data accordingly
