# install.packages("remotes")
#remotes::install_github("AllanCameron/geomtextpath")

library(geomtextpath)
library(ggplot)
library(hrbrthemes)
library(here)
#library(directlabels)
library(cowplot)
library(magick)


constant_vari <- 2100
xy_lim <- 2200

# Set a consistent theme for the plots here
theme_set(theme_modern_rc() + 
            theme(panel.grid.minor=element_blank(), 
                  panel.grid.major=element_blank(),
                  axis.ticks.x = element_blank(),
                  axis.text.x = element_blank(),
                  axis.title.x = element_blank(),     
                  axis.ticks.y = element_blank(),
                  axis.text.y = element_blank(),
                  axis.title.y = element_blank(),                   
                  axis.line = element_blank()#,
                  #plot.margin = margin(0, 0, , 0, "cm")
            ))
          
          


t <- seq(17, -1, length.out = constant_vari) * pi



spiral <- data.frame(x    = sin(t) * 1:constant_vari, 
                     y    = cos(t) * 1:constant_vari,
                     text = paste("Words like violence,",
"Break the silence,",
"Come crashing in,",
"Into my little world,",
"Painful to me,",
"Pierce right through me,",
"Can't you understand, ",
"Oh my little girl, ",
"All I ever wanted,",
"All I ever needed,",
"Is here in my arms,",
"Words are very unnecessary,",
"They can only do harm,",
"Vows are spoken,",
"To be broken,",
"Feelings are intense,",
"Words are trivial,",
"Pleasures remain,",
"So does the pain,",
"Words are meaningless,",
"And forgettable,",
"All I ever wanted,",
"All I ever needed,",
"Is here in my arms,",
"Words are very unnecessary,",
"They can only do harm ..."))
                                  
                                  
                                  
p <- ggplot(spiral, aes(x, y, label = text)) +
  labs(caption = "@leynu | Jan 2022") +
  geom_textpath(size = 5.65, 
                vjust = 2, 
                text_only = TRUE, colour = "gray75")#+
  # coord_equal(xlim = c(-xy_lim, xy_lim), 
  #             ylim = c(-xy_lim, xy_lim))


ggdraw() +
  draw_plot(p) +
  draw_image(file.path(here("DM3.png")),
             x = 0, y = -0.075, scale = 1) 

