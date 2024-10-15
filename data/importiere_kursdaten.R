# header ------------------------------------------------------------------

# Dieses Skript greift auf die als Google Sheets gespeicherten Tabellen zu, 
# die Daten für den Vorschlag enthalten. Google Sheets werden manuell bearbeitet 
# und die Daten werden dann von hier aus gelesen und lokal als CSVs gespeichert.

# library -------------------------------------------------------------------

library(googlesheets4)
library(readr)
library(dplyr)

# script ------------------------------------------------------------------

## course schedule  --------------------------------------------------

kursplan <- "https://docs.google.com/spreadsheets/d/1zNG1qrFBDH8l76G-DQNaHDejbS3PR75_zmK0_7LiARY/edit?gid=0#gid=0"

read_sheet(ss = kursplan) |> 
    mutate(titel = case_when(
        is.na(link) == FALSE ~  paste0("[", titel, "](", link, ")"),
        TRUE ~ titel
    )) |>
    write_csv(here::here("data/tbl-00-rstatszh-k009-kursplan.csv"))

## learning objectives  ------------------------------

lernziele <- "https://docs.google.com/spreadsheets/d/1Psu_bKUJ0evgDUorkoeV3KUGNDdSte--6GBYuuihQc0/edit?gid=0#gid=0"

read_sheet(ss = lernziele) |> 
    write_csv(here::here("data/tbl-01-rstatszh-k009-lernziele.csv"))
