# Demonstration of iterative rendering of {xaringan} slides with params using
# {purrr} plus rmarkdown::render() for HTML and pagedown::chrome-print for PDF

# Load packages
library(dplyr)      # data wrangle
library(here)       # relative filepaths
library(pagedown)   # chrome_print() HTML to PDF
library(purrr)      # fancy looping
library(rmarkdown)  # render() an RMarkdown file
library(stringr)    # string manipulation
library(tidyr)      # 
library(vctrs)      # vector wrangling

# Star Wars character data from {dplyr}, only complete cases for simplicity
starwars_complete <- drop_na(starwars)

# Vector of the elements we want to iterate over (Star Wars characters)
characters <- pull(starwars_complete, name) %>% vec_sort()

# From the Rmd template produce an HTML per vector element
map(
  .x = characters,
  .f = ~render(
    input = here("docs", "ninja-knitting-template.Rmd"),
    params = list(name = .x),
    output_file = here(
      "docs",
      paste0(tolower(str_remove_all(.x, "[:space:]|[:punct:]")), ".html")
    )
  )
)

# Get a vector of all the filepaths for the newly-generated HTML files
files <- list.files(here("docs", "html"), pattern = ".html", full.names = TRUE)

# Print each HTML to PDF
map(.x = files, .f = ~chrome_print(input = .x))
