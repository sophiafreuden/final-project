
# I didn't initially have this prep.R file, but after talking
# to Georgie and Bernadette, I decided that it would be a
# good thing to have. I have loaded here fs for dir_create
# and tidyverse, though I probably don't need the latter.

library(fs)
library(tidyverse)

dir_create(path = "raw-data")

dir_create(path = "pdx-probs/cleaned-data")

dir_create(path = "pdx-probs/www")

# One data file I have I had to make by hand. I used the data from
# this PDF (https://www.portlandoregon.gov/police/article/739634)
# as my source. I copied the data into an Excel file that I saved
# as "Crime Rate + Pop.xlsx".

# I include specific instructions for data cleaning in my readme.

# I had to download all five yearly crime files from the Portland
# Police by hand because they use a weird format for storing
# them online.

# I similarly couldn't get stable download links for the data
# from the Bureau of Labor Statistics or the U.S. Census.

# I had to download them by hand and them move them into the
# raw-data directory for clean-up.

# See the readme for instructions.

# Don't get confused by the fact that the whole project
# is saved in a local file called pdx-probs and then
# the app is saved in a file called pdx-probs. I think
# I should not make a habit of naming these files the
# same thing. Practice makes perfect.

# ONLY RUN THE FOLLOWING COMMANDS AFTER CONSULTING THE
# README AND FOLLOWING THOSE INSTRUCTIONS.

file_copy(
  path = "raw-data/2010-2018 census pop estimates.csv",
  new_path = "~/desktop/R Projects/pdx-probs/cleaned-data/2010-2018 census pop estimates.csv",
  overwrite = TRUE
)

file_copy(
  path = "raw-data/BLS PDX Unemployment.xlsx",
  new_path = "~/desktop/R Projects/pdx-probs/cleaned-data/BLS PDX Unemployment.xlsx",
  overwrite = TRUE
)

file_copy(
  path = "raw-data/Crime Rate + Pop.xlsx",
  new_path = "~/desktop/R Projects/pdx-probs/cleaned-data/Crime Rate + Pop.xlsx",
  overwrite = TRUE
)

file_copy(
  path = "raw-data/CrimeData-2015.csv",
  new_path = "~/desktop/R Projects/pdx-probs/cleaned-data/CrimeData-2015.csv",
  overwrite = TRUE
)

file_copy(
  path = "raw-data/CrimeData-2016.csv",
  new_path = "~/desktop/R Projects/pdx-probs/cleaned-data/CrimeData-2016.csv",
  overwrite = TRUE
)

file_copy(
  path = "raw-data/CrimeData-2017.csv",
  new_path = "~/desktop/R Projects/pdx-probs/cleaned-data/CrimeData-2017.csv",
  overwrite = TRUE
)

file_copy(
  path = "raw-data/CrimeData-2018.csv",
  new_path = "~/desktop/R Projects/pdx-probs/cleaned-data/CrimeData-2018.csv",
  overwrite = TRUE
)

file_copy(
  path = "raw-data/CrimeData-2019.csv",
  new_path = "~/desktop/R Projects/pdx-probs/cleaned-data/CrimeData-2019.csv",
  overwrite = TRUE
)

file_copy(
  path = "cleaned-data",
  new_path = "pdx-probs/cleaned-data",
  overwrite = TRUE
)


