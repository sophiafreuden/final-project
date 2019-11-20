
# I didn't initially have this prep.R file, but after talking
# to Georgie and Bernadette, I decided that it would be a
# good thing to have. I have loaded here fs for dir_create
# and tidyverse, though I probably don't need the latter.

library(fs)
library(tidyverse)

dir_create(path = "pdx-probs/cleaned-data")

dir_create(path = "pdx-probs/www")

# Don't get confused by the fact that the whole project
# is saved in a local file called pdx-probs and then
# the app is saved in a file called pdx-probs. I think
# I should not make a habit of naming these files the
# same thing. Practice makes perfect.


