library(flexdashboard)
library(tidyquant)
library(jsonlite)
library(maptools)
library(ggplot2)
library(tidyr)
library(dplyr)
library(purrr)
library(leaflet)
library(plotly)
library(forecast)
library(treemap)
library(DT)
library(highcharter)

theme_set(cowplot::theme_cowplot())
df_stocks <- tidyquant::tq_get(x = c("AAPL", "GOOG"), 
                               get = "stock.prices", 
                               from = "1950-01-01") %>% 
                          arrange(date)  

plot_stocks <- ggplot(df_stocks, aes(date, close, fill = symbol, color = symbol)) +
                geom_area(alpha = .7, color = "black", size = .2) +
                geom_smooth(se = T, size = 1.5) +
                scale_x_date(limits = c(as.Date("2004-01-01"), as.Date("2022-09-01"))) +
                scale_fill_viridis_d(option = "cividis")

plotly::ggplotly(plot_stocks)