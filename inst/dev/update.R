## script to udate the package

## load helper packages
library(devtools) ## develop the package
library(usethis) ## use for easy pkg-building
library(pkgdown) ## create a page for the package
library(gapminder) ## save data locally, so we don't need the gapminder dependency
library(readr)

## after each change, do the following:
## 1. document the changes
devtools::document()

## 2. Perform some checks
devtools::load_all()
devtools::check()

## If you want to add a package, please specify this below
usethis::use_package("ggtext") ## include a package as dependency
# usethis::use_vignette() ## include a new vignette
