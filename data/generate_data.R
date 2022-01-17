rm(list = ls())
library(customerAnalytics)
library(tidyverse)

# get Recency scores, Frequency scores and Monetary scores of customers who visited during period 0 by
# using transaction records during period 0. 
t0 <- getRfmTable(customer_data_t0, transaction_data_t0, CustomerID,
                  InvoiceDate, revenue)

# get Recency scores, Frequency scores and Monetary scores of customers who visited during period 0 by
# using transaction records during period 1.
t1 <- getRfmTable(customer_data_t0, transaction_data_t1, CustomerID,
                  InvoiceDate, revenue,
                  cData_visitDate = visitDate)

t <-
  t0 %>%
  left_join(t1, by = "CustomerID") %>%
  left_join(customer_data_t0, by = "CustomerID")