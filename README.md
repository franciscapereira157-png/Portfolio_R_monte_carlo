
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