## Gold Prices Analysis and Forecasting

### Data :
1. https://www.gold.org/goldhub/data
  - Monthly Gold Prices
  - Local Market Premium discounts
  - Central Bank Reserve Holdings
2. federal Reserve Economic forum ( https://fred.stlouisfed.org )
  - US-INR exchange rates historical data

### Pre-req:
- R
- R-Studio
- R libraries required :

library(tswge)
library(ggplot2)
library(data.table)
library(dplyr)
library(formattable)
library(tidyr)
library(stringr)
library(vars)
library(nnfor)

### Project Details:
This project is an analysis on Gold Prices data taken from above website. Link has LBMA ( London Bullion Market association ) Gold Prices which serve as International Standard for Gold Price. This type of data is a good example of Time-Series data.

**Project Tasks**
1. Data Fetch and Cleanup
2. Analysis on Stationarity Conditions of Gold Price
3. Models 
  i. ARIMA
  ii. ARMA
  iii. Neural Network
  iv. Ensemble Model
