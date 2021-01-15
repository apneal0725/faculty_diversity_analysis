install.packages("tidyverse")
install.packages("ggplot2")
remove.packages("ggplot2") # Unisntall ggplot
install.packages("ggplot2") # Install it again
library(ggplot2)
library(data.table)

# Step 0: HODP Theme
if (!require('dplyr')) install.packages('dplyr'); library(dplyr)
if (!require('ggplot2')) install.packages('ggplot2'); library(ggplot2)
if (!require('hrbrthemes')) install.packages('hrbrthemes'); library(hrbrthemes)
if (!require('magick')) install.packages('magick'); library(magick)
if (!require('plotly')) install.packages('plotly'); library(plotly)
logo <- image_read("Desktop/logo.png") 
# Legend: https://stackoverflow.com/questions/14622421/how-to-change-legend-title-in-ggplot

monochrome <- c('#760000', '#BE1E26', '#D84742', '#FF6B61', '#FF9586')
primary <- c('#EE3838', '#FA9E1C', '#78C4D4', '#4B5973', '#E2DDDB')
sidebysidebarplot <- c("#ef3e3e", "#2c3e50")
theme_hodp <- function () { 
  theme_classic(base_size=12, base_family="Helvetica") %+replace%
    theme(
      panel.background  = element_rect(fill="#F2F2F2", colour=NA),
      plot.background = element_rect(fill="#F2F2F2", colour="#d3d3d3"),
      legend.background = element_rect(fill="transparent", colour=NA),
      legend.key = element_rect(fill="transparent", colour=NA),
      plot.title = element_text(size=24,  family="Helvetica", face = "bold", margin = margin(t = 0, r = 0, b = 10, l = 0)),
      plot.subtitle = element_text(size=18,  family="Helvetica", color="#717171", face = "italic", margin = margin(t = 0, r = 0, b = 10, l = 0)),
      plot.caption = element_text(size=8,  family="Helvetica", hjust = 1),
      axis.text.x =element_text(size=10,  family="Helvetica"),
      axis.title.x =element_text(size=14, family="Helvetica", margin = margin(t = 10, r = 0, b = 0, l = 0), face = "bold"),
      axis.title.y = element_text(margin = margin(t = 0, r = 10, b = 0, l = 0), size=14, family="Helvetica", angle=90, face ='bold'),
      legend.title=element_text(size=10, family="Helvetica"), 
      legend.text=element_text(size=10, family="Helvetica"),
      legend.position = "bottom",
      axis.ticks = element_blank()
    )
}

h = ggplot(asian, aes(x = c(2010:2020), y = percentage), levels = 2010:2020) +
    geom_point(aes(y = arts_humanities, color = "arts_humanities")) + geom_line(aes(y = arts_humanities, color = "arts_humanities")) +
    geom_point(aes(y = engineering, color = "engineering"))  + geom_line(aes(y = engineering, color = "engineering")) +
    geom_point(aes(y = science, color = "science")) + geom_line(aes(y = science, color = "science")) +
    geom_point(aes(y = life_science, color = "life_science")) + geom_line(aes(y = life_science, color = "life_science")) +
    geom_point(aes(y = physical_science, color = "physical_science")) + geom_line(aes(y = physical_science, color = "physical_science")) +
    geom_point(aes(y = social_science, color = "social_science")) + geom_line(aes(y = social_science, color = "social_science")) 


h + scale_x_continuous(breaks=c(201000, 201100, 201200, 201300, 201400, 201500, 201600, 201700, 201800, 201900, 202000), 
  labels=c("2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020")) + 
  scale_color_manual(values=c("#FA9E1C", "#E2DDDB", "#EE3838", "#78C4D4", "#4B5973", "#760000"), labels = c("Arts and Humanities", "Engineering", "Life Science", "Physical Science","Science", "Social Science")) +
  labs(title="Asian FAS Tenure and Tenure-Track Faculty Percentage") +
  xlab("Year") +
  ylab("Percentage") +
  labs(color='FAS Dept') +
  theme_hodp ()
grid::grid.raster(logo, x = 0.01, y = 0.01, just = c('left', 'bottom'), width = unit(1.5, 'cm'))




library(tidyverse)
library(ggplot2)
ggplot(asian.student, aes(year, percentage))  + 
  geom_line(color="#BE1E26") +
  scale_x_continuous(breaks=c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020)) +
  theme_hodp() +
  labs(title="Percentage of Asian Students") +
  xlab("Year") +
  ylab("Percentage") +
  ylim(0, 21)
grid::grid.raster(logo, x = 0.01, y = 0.01, just = c('left', 'bottom'), width = unit(1.5, 'cm'))

  