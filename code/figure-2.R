# -- Set up
source("code/init.R")

# -- Loading data
load("data/figure-2.rda")

# -- Figure 2a: Relative change in population for each municipality (except Toa Baja and Las Marias)
figure2A <- figure2A_dat %>%
  ggplot(aes(date, prop_pop, group=municipio, color=acs_pop, label=municipio)) +
  geom_vline(xintercept = make_date(2017,09,20), color="red1", lty=2) +
  geom_line() +
  xlab("") +
  ylab("Relative change in population") +
  scale_y_continuous(limits = c(0.60, 1.10),
                     breaks = seq(0.60, 1.10, by=0.05)) +
  scale_x_date(date_labels = "%b", date_breaks = "1 months") +
  scale_color_viridis_c(name="Baseline\npopulation", 
                        trans="log10",
                        labels = comma) +
  theme_bw()

# -- Figure 2b: Average percent change in population
figure2B <- figure2B_dat %>%
  ggplot(aes(x=acs_pop, y=percent_change, label = municipio, color=region)) +
  geom_point(size=2, alpha=0.70) +
  geom_hline(yintercept = 0, lty=2) +
  geom_text_repel(color="black",
                  segment.color = "black",
                  show.legend   = FALSE,
                  data          = filter(figure2B_dat, 
                                         (percent_change>=-.20 | percent_change <= -.335 | acs_pop <= 10000 | acs_pop >= 89000))) +
  scale_x_continuous(trans="log10", labels = comma) +
  scale_y_continuous(labels = percent) +
  scale_color_manual(name   = "Region:",
                     values = c("#0571b0","#41ab5d","#56B4E9","#fa9fb5", "#E69F00","#ca0020", "black")) +
  ylab("Average % Change in population") +
  xlab("Baseline population size") +
  theme_bw()
figure2B


# -- Figure 2 
figure2 <- ggarrange(figure2A, figure2B, 
                     labels = c("A", "B"), 
                     nrow = 2, ncol = 1)
figure2