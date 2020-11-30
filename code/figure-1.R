# -- Set up
source("code/init.R")

# -- Loading data
load("data/figure-1.rda")

# -- Figure 1: Viz the population estimates
figure1 <- figure1_dat %>%
  as_tibble() %>%
  filter(date>=baseline) %>%
  ggplot(aes(date, population, color=source)) +
  geom_vline(xintercept = make_date(2017,09,20), color="red1", lty=2) +
  geom_line() +
  geom_point() +
  geom_point(pch=1, color="black") +
  scale_color_manual(name   = "",
                     values = c("#41ab5d", "#0571b0", "#E69F00", "#525252")) + #"#ca0020", 
  scale_x_date(date_labels = "%b", date_breaks = "1 months") +
  scale_y_continuous(labels = scales::comma) +
  xlab("") +
  ylab("Population") +
  theme_bw() +
  annotate("rect",
           xmin=make_date(2017,08,21), xmax=make_date(2017,10,20),
           ymin=2900000-50000, ymax=2900000+50000,
           fill="white", color="black") +
  annotate("text",
           x=make_date(2017,09,20), y=2900000,
           label="Hurricane \n Maria") +
  theme(legend.position = "bottom")
figure1