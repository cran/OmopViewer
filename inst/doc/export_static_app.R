## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(OmopViewer)
omopViewerResults
summary(omopViewerResults)

## -----------------------------------------------------------------------------
result <- omopViewerResults |>
  omopgenerics::filterSettings(
    result_type %in% c("summarise_omop_snapshot", "summarise_characteristics", "incidence")
  )

## -----------------------------------------------------------------------------
exportStaticApp(result = result, directory = tempdir())

## -----------------------------------------------------------------------------
panelDetails <- panelDetailsFromResult(result)
panelDetails

