#!/usr/bin/env Rscript

# Chapter 5. Deep learning for computer vision 

## From the book Deep learning with R, by Francois Collet with J.J. allaire, 2018

####################################################################
# This script follows the nmist example in the chapter
####################################################################

# prepare the library import

library(keras)
list.of.packages <- c("keras")
# installed.packages() returns a matrix of characters
new.packages <- list.of.packages[!(list.of.packages %in% 
                                     installed.packages()[,"Package"])]
if(length(new.packages)) 
  install.packages(new.packages)
# clean up environment
rm(list.of.packages, new.packages)


model <- keras_model_sequential() %>%
  layer_conv_2d(filters = 32, kernel_size = c(3, 3), activation = "relu", input_shape = c(28, 28, 1)) %>%
  layer_max_pooling_2d(pool_size = c(2, 2)) %>%
  layer_conv_2d(filters = 64, kernel_size = c(3, 3), activation = "relu") %>%
  layer_max_pooling_2d(pool_size = c(2, 2)) %>%
  layer_conv_2d(filters = 64, kernel_size = c(3, 3), activation = "relu")

# now add the conventional densely connected ANN at the end

model <- model %>%  layer_flatten() %>%
  layer_dense(units = 64, activation = "relu") %>%
  layer_dense(units = 10, activation = "softmax")

