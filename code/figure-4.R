# -- Set up
source("code/init.R")

# -- Loading data
load("data/figure-4.rda")

# -- Figure 4a: Percentage of users with unknown location
figure4A <- figure4A_dat %>%
  ggplot(aes(date, prop_unknown, color = acs_pop, group=municipio)) +
  geom_line() + 
  scale_color_viridis_c(name="Baseline\npopulation", trans="log10", labels = comma) +
  scale_y_continuous(labels = scales::percent,
                     breaks = seq(0, 60, by = 0.10)) +
  scale_x_date(date_labels = "%b", date_breaks = "1 months") +
  geom_vline(xintercept = make_date(2017, 09, 20), color="red", lty=2) +
  ylab("% of users with unknown location") +
  xlab("Date") +
  theme_bw() +
  theme(legend.position  = "right",
        legend.direction = "vertical")  
figure4A

# -- Figure 4b: Percentage of users with unknown location relative to San Juan, the capital of Puerto Rico
figure4B <- figure4B_dat %>%
  ggplot(aes(fill=prop.ratio-1)) +
  geom_sf(color="black") + 
  scale_fill_viridis_c(name="% Change \n relative to \n San Juan",
                       labels=scales::percent,
                       direction = -1) +
  coord_sf(xlim = c(-67.33, -65.2)) +
  theme_void() +
  theme(legend.position  = "right",
        legend.direction = "vertical")
figure4B

# -- Figure 4 
figure4 <- ggarrange(figure4A, figure4B, 
                  labels = c("A","B"), 
                  ncol = 1, nrow = 2)
figure4