
# Clinical Trial Operating Characteristics Simulation

Welcome! This repository contains a reproducible R workflow built with `{targets}` and `{renv}` to simulate and visualize clinical trial operating characteristics (empirical power and Type I error rate) across varying sample sizes and treatment effects.

---

## Study Design & Simulation Assumptions

* **Study Arms:** Two-arm parallel design (`pbo` vs. `trt`) with **1:1 allocation**.
* **Outcome Model:** Continuous endpoint simulated from a normal distribution with standard deviation $\sigma = 1$ ($\text{mean} = 0$ for `pbo`, $\text{mean} = \delta$ for `trt`).
* **Statistical Test:** Two-sample, **two-sided t-test** evaluated at significance level **$\alpha = 0.05$**.
* **Reproducibility:** A fixed base seed is configured in `_targets.R` via `tar_option_set()` so all Monte Carlo simulations are fully reproducible.

### Simulation Scenarios
The pipeline evaluates a grid of **12 scenarios**:
* **Total Sample Sizes (`sample_size`):** `100`, `200`, `300` (50, 100, and 150 participants per arm)
* **Treatment Effects (`delta`):**
  * `0` — Null scenario used to verify the empirical **Type I error rate** ($\approx 5\%$)
  * `0.2`, `0.4`, `0.6` — Positive treatment effect scenarios used to estimate **empirical power**

---

## Project Structure

```text
├── _targets.R          # Pipeline definition, scenarios, and seed configuration
├── renv.lock           # Exact R package versions for environment reproducibility
├── R/                  # Modular R functions (data generation, t-test, summaries, plotting)
└── README.md           # Project overview and instructions


How to Run the Simulation with {targets}
1. Open the Project & Restore Packages
Download or clone this repository and double-click the .Rproj file to open it in RStudio (this sets the working directory to the project root).

In the R Console, restore the exact package environment from renv.lock:

R
renv::restore()
(If {renv} is not installed yet, run install.packages("renv") first.)

2. Run the Pipeline
Execute the full simulation workflow using targets::tar_make():

R
targets::tar_make()
targets::tar_make() reads _targets.R, runs all simulation repetitions across the 12 scenarios (results), aggregates the operating characteristics (operating_characteristics), and generates the summary figure (plot).

3. View the Results
Once the pipeline finishes, inspect the saved outputs from the _targets/ cache using targets::tar_read():

R
# View the summary table (Type I error at delta = 0, empirical power at delta > 0)
targets::tar_read(operating_characteristics)

# Display the Power vs. Delta plot
targets::tar_read(plot)