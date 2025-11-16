## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(OmopViewer)
library(dplyr, warn.conflicts = FALSE)
library(omopgenerics, warn.conflicts = FALSE)

## -----------------------------------------------------------------------------
result <- omopViewerResults |> 
  filterSettings(result_type == "incidence")

## -----------------------------------------------------------------------------
result |>
  settings() |>
  glimpse()

## -----------------------------------------------------------------------------
getPanel("incidence")

## -----------------------------------------------------------------------------
panelDetailsFromResult(result = result)

## -----------------------------------------------------------------------------
panelDetails <- list(
  incidence_female = getPanel("incidence"),
  incidence_male = getPanel("incidence")
)

## -----------------------------------------------------------------------------
panelDetails$incidence_female$data <- list(denominator_sex = "Female")
panelDetails$incidence_male$data <- list(denominator_sex = "Male")

## -----------------------------------------------------------------------------
panelDetails$incidence_female$title <- "Incidence in Female"
panelDetails$incidence_male$title <- "Incidence in Male"

## -----------------------------------------------------------------------------
panelDetails$incidence_female$icon <- "venus"
panelDetails$incidence_male$icon <- "mars"

## ----eval = FALSE-------------------------------------------------------------
# exportStaticApp(result = result, panelDetails = panelDetails, directory = tempdir())

## -----------------------------------------------------------------------------
panelDetails$incidence_female$content$tidy <- NULL
panelDetails$incidence_male$content$plot <- NULL

## -----------------------------------------------------------------------------
panelDetails$incidence_female$exclude_filters <- c(panelDetails$incidence_female$exclude_filters, "denominator_sex")
panelDetails$incidence_male$exclude_filters <- c(panelDetails$incidence_male$exclude_filters, "denominator_sex")

## ----eval = FALSE-------------------------------------------------------------
# exportStaticApp(result = result, panelDetails = panelDetails, directory = tempdir())

