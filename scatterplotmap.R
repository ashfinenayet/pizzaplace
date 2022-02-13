library(plotly)
pizza <- read.csv('/Users/ashfi/Documents/R projects/Datafiniti_Pizza_Restaurants_and_the_Pizza_They_Sell_Jun19.csv')
g <- list(
  
  scope = 'usa',
  
  projection = list(type = 'albers usa'),
  
  showland = TRUE,
  
  landcolor = toRGB("gray95"),
  
  subunitcolor = toRGB("gray85"),
  
  countrycolor = toRGB("gray85"),
  
  countrywidth = 0.5,
  
  subunitwidth = 0.5
  
)


fig <- plot_geo(pizza, lat = ~latitude, lon = ~longitude)

fig <- fig %>% add_markers(
  
  text = ~paste(name, city, province, paste("Cost:", menus.amountMax), sep = "<br />"),
  
  symbol = I("square"), size = I(8), hoverinfo = "text"
  
)




fig <- fig %>% layout(
  
  title = 'Menu Prices<br />(Hover for max menu price)', geo = g
  
)


fig

