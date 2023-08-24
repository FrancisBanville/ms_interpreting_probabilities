### Import and format raw interactions data using Kopelke's R script

### full dataset downloaded from https://esajournals.onlinelibrary.wiley.com/doi/10.1002/ecy.1832 (ecy1832-sup-0004-Supinfo.csv)

## load required packages and functions to reshape data

library(magrittr)
source("code/functions/format4R.r")

## reshape the full dataset to generate smaller relational datasets
## csv and rdata files saved in data/raw/

# df_site: locations of the sites (each row refers to a willow species sampled at a specific time and location)

# df_salix: information on willow nodes

# df_galler: information on sawfly nodes

# df_parasit: information on parasitoid/inquiline nodes

# df_interact: interaction details among each node (willows, gallers, enemies)

# df_salix_galler: summary statistics on interactions 

get_formatData("data/raw/salix_webs.csv")

