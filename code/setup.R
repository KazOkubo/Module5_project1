## @knitr setup

# define knitr options
knitr::opts_chunk$set(echo=FALSE)
knitr::opts_chunk$set(warning=FALSE)
knitr::opts_chunk$set(message=FALSE)

# set any missing values in tables to blank instead of NA
options(knitr.kable.NA="")

# load packages
library(fivethirtyeight)
library(tidyverse)
library(knitr)
library(kableExtra)
library(ggthemes)

## @knitr loadData

# load steak survey dataset
data("weather_check", package="fivethirtyeight")

# pick a specific region
sdat <- weather_check %>%
  filter(region == params$region)
