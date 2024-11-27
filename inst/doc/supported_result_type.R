## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----echo = FALSE-------------------------------------------------------------
OmopViewer:::omopViewerOutput |>
  dplyr::inner_join(
    OmopViewer:::omopViewerTabs, by = "result_tab_id"
  ) |>
  tidyr::separate_wider_delim(
    cols = "output_function", 
    delim = "::", 
    names = c("package", "output_function")
  ) |>
  dplyr::select(
    "package", "Result type" = "result_type", "Function" = "output_function", 
    "Output type" = "output_type") |>
  visOmopResults::formatTable(
    groupColumn = "package", merge = "Result type")

