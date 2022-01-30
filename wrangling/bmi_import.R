##########################################
# GATHER FILES (must be available in current directory)
##########################################

dxa <- list.files(pattern = "DXA")
bmi <- list.files(pattern = "BMI")
demo <- list.files(pattern = "DEMO")
mort <- list.files(pattern = "\\.dat$")

##########################################
# FUNCTION: IMPORT NHANES DATA
##########################################

readin_nhanes <- function(ls){
  # Iteratively import list of files
  ls <- lapply(ls, function(f){as_tibble(read.xport(f))})
}

##########################################
# FUNCTION: IMPORT MORTALITY DATA (provided by official CDC documentation)
##########################################

readin_mort <- function(dat_file){
  # Import mortality data according to documentation
  dat_file <- read_fwf(file=dat_file,
                       col_types = "ciiiiiiiddii",
                       fwf_cols(publicid = c(1,14),
                                eligstat = c(15,15),
                                mortstat = c(16,16),
                                ucod_leading = c(17,19),
                                diabetes = c(20,20),
                                hyperten = c(21,21),
                                dodqtr = c(22,22),
                                dodyear = c(23,26),
                                wgt_new = c(27,34),
                                sa_wgt_new = c(35,42),
                                permth_int = c(43,45),
                                permth_exm = c(46,48)
                       ),
                       na = "."
  )
}

##########################################
# COMBINE DATA SETS
##########################################

# Combine into one list
nhanes_files <- list(dxa, bmi, demo)

# Import using custom read-in function
nhanes_files <- lapply(nhanes_files, readin_nhanes)

# Collapse each internal list into one tibble
nhanes_files <- lapply(nhanes_files, bind_rows)

# Reassign variables
dxa <- nhanes_files[[1]]
bmi <- nhanes_files[[2]]
demo <- nhanes_files[[3]]

# Import and collapse mortality data files
mort <- bind_rows(lapply(mort, readin_mort))