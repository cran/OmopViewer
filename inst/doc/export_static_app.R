## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(OmopViewer)
library(omopgenerics, warn.conflicts = FALSE)
library(shiny)

## -----------------------------------------------------------------------------
# Inspect the structure of the sample data
summary(omopViewerResults)

## -----------------------------------------------------------------------------
result <- omopViewerResults |>
  filterSettings(
    result_type %in% c("summarise_omop_snapshot", "summarise_characteristics", "incidence")
  )

## -----------------------------------------------------------------------------
summary(result)

## -----------------------------------------------------------------------------
dir <- tempdir()
exportStaticApp(result = result, directory = dir)

## -----------------------------------------------------------------------------
cat(list.files(path = here::here(dir, "shiny"), recursive = TRUE), sep = "\n")

## -----------------------------------------------------------------------------
omopViewerPanels

## -----------------------------------------------------------------------------
panelDetailsFromResult(result = result)

## ----eval=FALSE---------------------------------------------------------------
# result |>
#   filterSettings(
#     result_type == "incidence" &
#       denominator_age_group %in% c("0 to 19", "20 to 39")
#   )

## ----eval=FALSE---------------------------------------------------------------
# ps1 <- list(
#   grp_1 = c("summarise_omop_snapshot", "incidence"),
#   grp_2 = c("summarise_characteristics")
# )
# 
# exportStaticApp(result = result, directory = tempdir(), panelStructure = ps1)

