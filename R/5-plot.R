
library(ggplot2)


# Plot --------------------------------------------------------------------
#plot power as a function of delta, with sample size by colour

plot_oc <- function(oc_df) {
  ggplot(
    data = oc_df,
    aes(
      x = delta,
      y = power,
      color = factor(sample_size),
      group = factor(sample_size)
    )
  ) +
    geom_line(linewidth = 0.9) +
    geom_point(size = 2.2) +
    geom_hline(
      yintercept = c(0.05, 0.80),
      linetype = "dashed",
      color = "grey50"
    ) +
    scale_y_continuous(
      limits = c(0, 1),
      breaks = seq(0, 1, by = 0.2),
      labels = scales::percent_format(accuracy = 1)
    ) +
    labs(
      title = "Empirical Power vs. Treatment Effect (Delta)",
      x = "Treatment Effect (Delta)",
      y = "Empirical Power",
      color = "Total Sample Size"
    ) +
    theme_minimal() +
    theme(
      plot.title = element_text(hjust = 0.5))
}