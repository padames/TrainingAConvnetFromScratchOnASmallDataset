#!/usr/bin/env Rscript

## Example of a multi-class classification example from the Keras package
# Based on the example in section 3.5 of the book Deep Learning with R, by Francois Chollet.



list.of.packages <- c("keras")
# installed.packages() returns a matrix of characters
new.packages <- list.of.packages[!(list.of.packages %in% 
                                     installed.packages()[,"Package"])]
if(length(new.packages)) 
  install.packages(new.packages)

library(keras)

dictionary_size = 10000

reuters <- dataset_reuters(num_words = dictionary_size)

# Keras multiple assignment operator
c(c(train_data, train_labels), c(test_data, test_labels)) %<-% reuters

train_size <- length(train_data)

# each sample is a list of integers (word indices)

# newswire.number <- readline(prompt = paste0("What newswire # would you like to see? [choose between 1 and ", train_size, "]"))
# newswire.number <- as.numeric(newswire.number)
# cat(newswire.number)
# tryCatch({stopifnot(newswire.number > 0, newswire.number <= train_size)}, 
#          error = function(error_condition) {
#            print(paste0("Error: Choose between 1 and ", 
#                         train_size, 
#                         ", ", 
#                         error_condition)
#            )
#          })
# 
