library(dplyr)

# Summarise operating characteristics -------------------------------------

oc_summarise <- function(df) {
  df |> 
    group_by(delta, sample_size) |> 
    summarise(
      power = mean(p_value < 0.05),
      .groups = "drop"
    )
}

