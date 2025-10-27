data("rock", package = "datasets")
print(head(rock))

median_shape <- median(rock$shape)
rock$shape_group <- factor(ifelse(rock$shape <= median_shape,
                                  "Low Shape Factor",
                                  "High Shape Factor"))

#Scatter Plot
plot(rock$area, rock$perm,
     main = "Base R: Permeability vs. Pore Area",
     xlab = "Area of Pores",
     ylab = "Permeability",
     col  = "darkblue")

#Histogram
hist(rock$shape,
     main = "Base R: Distribution of Shape Factor",
     xlab = "Shape Factor of Pores",
     col  = "lightgreen")



#Lattice
library(lattice)
xyplot(perm ~ area | shape_group,
       data = rock,
       main = "Lattice: Permeability vs. Area by Shape Group",
       xlab = "Area of Pores",
       ylab = "Permeability",
       # Panel function to add a linear regression line to each panel
       panel = function(x, y, ...) {
         panel.xyplot(x, y, ...)
         panel.lmline(x, y, col = "red")
       })

densityplot(~ perm,
            data = rock,
            groups = shape_group,
            auto.key = list(columns = 2),
            main = "Lattice: Density of Permeability by Shape Group",
            xlab = "Permeability")

#ggplot
library(ggplot2)
ggplot(rock, aes(area, perm, color = shape_group)) +
  geom_point(alpha = 0.7, size = 3) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "ggplot2: Permeability vs. Area with LM Trend",
       x = "Area of Pores",
       y = "Permeability",
       color = "Shape Group") +
  theme_bw()

ggplot(rock, aes(x = perm)) +
  geom_histogram(bins = 10, fill = "salmon", color = "white") +
  facet_wrap(~ shape_group, ncol = 1) +
  labs(title = "ggplot2: Permeability Distribution by Shape Group (Faceted)",
       x = "Permeability",
       y = "Count") +
  theme_minimal()