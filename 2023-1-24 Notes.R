### ggplot2
### 24 January 2023

library(tidyverse)
library(ggplot2)
library(ggthemes)
library(patchwork)

#### Template for ggplot code
### p1 <- ggplot(data= <DATA>, mapping = aes(x = xVar, y = yVar)) + 
### GEOM FUNCTION ||| ...+ geom_boxplot()
### print(p1)

#### Load in a buitl-in data set

data("mpg")

d <- mpg

### qplot: quick, plotting
qplot(x=d$hwy, fill = I("darkblue"), color= I("black"))

# scatterplot 
qplot(x=d$displ, y=d$hwy, geom=c("smooth", "point"), method="lm")

# box plot
qplot(x=d$fl, y=d$cty, geom= "boxplot", fill=I("forestgreen"))

# bar plot
qplot(x=d$fl, geom = "bar", fill=I("forestgreen"))

### Create some data (specified counts)
x_trt <- c("Control", "Low", "High")
y_resp <- c(12, 2.5, 22.9)
qplot(x=x_trt, y=y_resp, geom="col", fill=I(c("forestgreen", "slategray", "goldenrod")))

#### ggplot: uses data frames instead of vectors

p1 <- ggplot(data=d, mapping=aes(x=displ, y=cty, color= cyl)) + 
  geom_point()
p1

p1 + theme_base()
p1 + theme_bw()
p1 + theme_minimal()
p1 + theme_bw(base_size=20, base_family="serif")

p2 <- ggplot(data=d, aes(x=fl, fill=fl)) + 
  geom_bar()
p2 + coord_flip() + theme_classic(base_size = 15, base_family = "sans")


## Theme mods
p3 <- ggplot(data=d, aes(x=displ, y=cty)) + 
  geom_point(size=2, shape=18, color="magenta", fill="green") +
  xlab("Count") + 
  ylab("Fuel") + 
  labs(title="My title", subtitle ="my subtitle")
  
p3 + xlim(1, 10) + ylim(0, 35)

library(viridis)
cols <- viridis(7, option = "plasma")
ggplot(data=d, aes(x=class, y=hwy, fill = class)) + 
  geom_boxplot() + 
  scale_fill_manual(values=cols)


p1 + p2 / p3
