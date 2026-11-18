

# Simulation --------------------------------------------------------------
#performs 1 simulation for each input. it will be iterated in targets (100 times for each scenario)

simulate <- function(delta, sample_size) {
  pop <- population_generator(delta, sample_size)
  res <- t.test(response ~ arm, data = pop)
  tibble::tibble(
    p_value = res$p.value
    )
}

