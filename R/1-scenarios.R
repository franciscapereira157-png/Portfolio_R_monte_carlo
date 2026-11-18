
library(tidyr)

# Setting the scenarios ---------------------------------------------------


scenarios <- function() {
  sample_size <- c(100, 200, 300)
  delta <- c(0, 0.2, 0.4, 0.6)  #null scenario and positive scenarios
                                #null scenario allows us to estimate type I error rate through computed power
  tidyr::expand_grid(
    sample_size = sample_size,
    delta = delta
  )
}