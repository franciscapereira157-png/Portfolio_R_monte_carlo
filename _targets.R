
library(targets)
library(tarchetypes)

n_reps <- 100

# Set target options:
tar_option_set(
  packages = c("tibble", "stats", "tidyr", "dplyr"),
  seed = 12   # a seed for reproducibility
  )

tar_source()

list(
  tar_map_rep(
    name = results,
    command = simulate(
      delta = delta,
      sample_size = sample_size
    ),
    values = scenarios(),
    reps = n_reps
  ),
  tar_target(
    name = operating_characteristics,
    command = oc_summarise(results)
  ),
  tar_target(
    name = plot,
    command = plot_oc(operating_characteristics)
  )
)
