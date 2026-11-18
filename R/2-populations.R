

# Population generators ---------------------------------------------------
#generates a data frame with variables "arm" and "response"
#It is called in simulate()

population_generator <- function(delta, sample_size) {
  tibble::tibble(
    arm = c(rep("pbo", times = sample_size/2), rep("trt", times = sample_size/2)),
    response = c(
      stats::rnorm(sample_size/2, mean = 0, sd = 1),
      stats::rnorm(sample_size/2, mean = delta, sd = 1)
    )
  )
}
