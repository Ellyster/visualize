require_relative 'Plot.rb'

## EXAMPLE 1:
# Data (source: http://en.wikipedia.org/wiki/Usage_share_of_web_browsers)
web_browsers_shares = [50.15, 13.09, 11.56, 13.64, 3.79, 6.97]
web_browsers_names = ["Chrome", "IE", "Firefox", "Safari", "Opera", "Others"]
web_browsers_title = "Usage share of all browsers for February 2015"

# Pie chart with the Protovis backend.
plot_protovis = Plot.new('Protovis','pie',web_browsers_title,web_browsers_shares,web_browsers_names)
plot_protovis.save_svg("pieProtovis_browsers.svg")


## EXAMPLE 2:
# Data (source: http://en.wikipedia.org/wiki/FIFA_World_Cup)
world_cup_wins = [5, 4, 4, 2, 2, 1, 1, 1]
world_cup_names = ['Brazil', 'Germany', 'Italy', 'Argentina', 'Uruguay', 'France', 'England', 'Spain']
world_cup_title = "FIFA World Cup champions"

# Pie chart with the Protovis backend.
plot_protovis = Plot.new('Protovis','pie',web_browsers_title,world_cup_wins,world_cup_names)
plot_protovis.save_svg("pieProtovis_FIFA.svg")
