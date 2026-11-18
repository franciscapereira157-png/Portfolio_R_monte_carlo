
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


## **Running the Simulation**

### **1. Restore the R environment**

This project uses `{renv}` to ensure package versions are consistent across environments.

Open the project in RStudio and run:

```r
install.packages("renv")  # If not already installed
renv::restore()



This restores the package versions recorded in `renv.lock`.

### **2. Run the targets pipeline**

Make sure your working directory is the project root (the directory containing `_targets.R`).

Run the complete pipeline with:

```r
targets::tar_make()


This executes all simulation replicates, calculates the operating characteristics, and generates the plot.
3. Inspect the results
To check which targets have been successfully built:
targets::tar_visnetwork()


To retrieve the simulated operating characteristics:
targets::tar_read(operating_characteristics)


To retrieve the generated plot:
targets::tar_read(plot)


To inspect the pipeline status:
targets::tar_status()


The pipeline uses {targets} to track dependencies and avoid rerunning targets that are already up to date. To rerun the entire pipeline from scratch, use:
targets::tar_destroy()
targets::tar_make()