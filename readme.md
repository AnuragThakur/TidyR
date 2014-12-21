---
title: "TidyRFile"
author: "Anurag"
date: "Saturday, December 20, 2014"
output: html_document
---

This md file explains how the code contained in R file works
As a first step we load the dplyr libary which will be used by this code and download the data from web.

We then read the meta data about this data set and store in local variables

Both training and test data sets are then read and descriptive column names are assigned to them.

As a next step we merge the data and extract columns that have mean or standard deviations in their column names

Next we create a tidy data set using aggregate function and write the output to the file.