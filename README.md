# pdx-probs

Open the prep.R file first and create the directories listed there. Please also see the instructions
for how to download the data there.

I cleaned much of my data by hand in Excel. Here is a list of what edits I made to which data files:

I renamed the file originally called "PEP_2018_PEPANNRES_with_ann.csv" as "2010-2018 census pop estimates.csv". Within that file, I got rid of the extra coluns (geo columns and extra 2010 columns).
I added "Year" and "PopulationCen" as titles to the remaining rows. I rearranged the Year and PopulationCen rows to be columns instead. I got rid of any meta data and comments within the file.

I renamed the file originally called "SeriesReport-20191118170631_ceb02b.xlsx" as "BLS PDX Unemployment.xlsx". I deleted the meta data within that file. I stripped all the formatting and comments in that file.

I also made the "Crime Rate + Pop.xlsx" by hand. I did this by transferring data in the "PortlandCrimeRate_081219.pdf" into an Excel spreadsheet. I only used the columns containing year, population, person crime count, property crime count, person crime rate, and property crime rate.

I then copied those cleaned files into the cleaned-data directories in the app and in the primary
directory. See the prep.R for those commands.

Once you have run the commands in the prep.R file right order and loaded in the data properly,
you can go through the Rmd files and run those code chunks in the order they have been written to reproduce this project. It does not matter which order you reproduce the Rmd file in (i.e. it doesn't matter if you run the crmeagimg.Rmd code chunks first or the monthspread.Rmd code chunks first, but you must run them in order within those files).
