library(ggplot2)
library(dplyr)
library(showtext) # tipografías

temp <- readr::read_csv2("datos/temperaturas_chile_unificadas.csv")

temp |> distinct(nombre)

.nombre <- "Desierto de Atacama, Caldera  Ad."

temp_f <- temp |>  
  filter(nombre == .nombre) |> 
  filter(año >= 2020)

grafico <- temp_f |> 
  ggplot() +
  aes(x = fecha, y = t_max) +
  geom_line(linewidth = 0.2)
  
grafico

font_add_google(name = "Montserrat") # descargar

# activar el uso de tipografías
showtext_auto()
showtext_opts(dpi = 300) # resolución para que se vean bien

# cambiar tipografía global
grafico +
  theme_classic(base_family = "Montserrat") +
  labs(title = "Temperaturas máximas",
       subtitle = .nombre)

library(thematic)

thematic::thematic_on(bg = "#f8edee",
                      fg = "#b45367", 
                      accent = "#b45367")

grafico +
  # theme_classi(base_family = ) +
  labs(title = "Temperaturas máximas",
       subtitle = .nombre) +
  theme(text = element_text(family = "Montserrat")) +
  theme(plot.title = element_text(colour = "#6a2f3b", face = "bold"),
        axis.title = element_text(colour = "#6a2f3b", face = "italic"))

iris |> 
  ggplot() +
  aes(x = Sepal.Width) +
  geom_histogram()
