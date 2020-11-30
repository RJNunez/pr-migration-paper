# -- Set up
source("code/init.R")

# -- Loading data
load("data/figure-3.rda")

# -- Figure 3a: Influx of FB cohort members to municipalities in PR
figure3A <- figure3A_dat %>%
  ggplot(aes(date, influx_pop, color=municipio, label = municipio)) +
  ylab("Influx of FB cohort members") + 
  xlab("") +
  geom_line() +
  geom_point() +
  geom_vline(xintercept = make_date(2017,09,20), color="red1", lty=2) +
  scale_x_date(date_labels = "%b", date_breaks = "1 months") +
  scale_y_continuous(labels = comma) +
  scale_color_manual(name   = "City:",
                     values = c("#0571b0","#41ab5d","#56B4E9","#fa9fb5", "#E69F00","#ca0020", "black",
                                "#66c2a5", "#fc8d62", "#8da0cb", "#e78ac3",
                                "#a6d854", "#ffd92f", "#e5c494", "#b3b3b3")) +
  theme_bw()
figure3A

# -- Figure 3b: Influx of FB cohort members to jurisdictions outside of PR
figure3B <- figure3B_dat %>%
  ggplot(aes(date, influx_pop, color=city)) +
  ylab("Influx of FB cohort memeber") + 
  xlab("") +
  geom_line() +
  geom_point() +
  geom_vline(xintercept = make_date(2017,09,20), color="red1", lty=2) +
  scale_x_date(date_labels = "%b", date_breaks = "1 months") +
  scale_y_continuous(labels = comma, limits = c(0, 80000)) +
  scale_color_manual(name   = "City:",
                     values = c("#0571b0","#41ab5d","#56B4E9","#fa9fb5", "#E69F00","#ca0020", "black",
                                "#66c2a5", "#fc8d62", "#8da0cb", "#e78ac3",
                                "#a6d854", "#ffd92f", "#e5c494", "#b3b3b3")) +
  theme_bw()
figure3B

# -- Figure 3
figure3 <- ggarrange(figure3A, figure3B, 
                     labels = c("A","B"), 
                     ncol=1, nrow=2)
