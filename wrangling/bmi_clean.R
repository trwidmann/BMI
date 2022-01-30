##########################################
# CLEAN AND ORGANIZE DATA
##########################################

# Create and rename id variable in mortatlity data
mort$id <- substr(mort$publicid,1,5)
mort <- select(mort, id, mortstat)

# Trim data sets and rename variables
dxa <- dxa %>%
  select(SEQN, DXDLALE, DXDRALE, DXDLLLE, DXDRLLE, DXDTOPF) %>%
  rename(id = SEQN,
         l_arm = DXDLALE,
         r_arm = DXDRALE,
         l_leg = DXDLLLE,
         r_leg = DXDRLLE,
         perc_fat = DXDTOPF)

bmi <- bmi %>%
  select(SEQN, BMXWT, BMXHT, BMXBMI) %>%
  rename(id = SEQN,
         weight = BMXWT,
         height = BMXHT,
         bmi = BMXBMI)

demo <- demo %>%
  select(SEQN, RIAGENDR, RIDAGEYR, RIDAGEMN) %>%
  rename(id = SEQN,
         gender = RIAGENDR,
         age = RIDAGEYR,
         age_m = RIDAGEMN)

# Index and reduce DXA data set (each participant has 4 rows; we need only one)
index <- seq(1, nrow(dxa), 5)
dxa2 <- dxa[index, ]

# Match "id"" data types
mort$id <- as.integer(mort$id)
dxa2$id <- as.integer(dxa2$id)
bmi$id <- as.integer(bmi$id)
demo$id <- as.integer(demo$id)

# Join all data sets
dat <- inner_join(dxa2, bmi, by = "id")
dat <- inner_join(dat, demo, by = "id")
dat <- inner_join(dat, mort, by = "id")

# Adjust gender coding
dat <- dat %>%
  mutate(gender = factor(ifelse(gender == 1, "male", "female")))

# Fix id type
dat$id <- as.integer(dat$id)

##########################################
# MISSINGNESS
##########################################

# Remove missing data
dat <- dat %>%
  filter(!is.na(mortstat),
         !is.na(bmi),
         !is.na(perc_fat))
colSums(is.na(dat))
nrow(dat)

##########################################
# NEW VARIABLES (BMI and ASMI)
##########################################

# Create BMI categories and add new variable
bmi_levels = c("Underweight", "Healthy", "Overweight", "Obese")

dat <- dat %>%
  mutate(bmi_status = case_when(bmi >= 30 ~ "Obese",
                                bmi < 30 & bmi >= 25 ~ "Overweight",
                                bmi < 25 & bmi >= 18.5 ~ "Healthy",
                                bmi < 18.5 ~ "Underweight")) %>%
  mutate(bmi_status = factor(bmi_status, levels = bmi_levels))

# Create ASM & ASMI & sarcopenia variables
dat <- dat %>%
  mutate(asm = l_arm + r_arm + l_leg + r_leg,
         asmi = (asm * 0.001) / (height * 0.01)^2,
         sarc = ifelse(gender == "male" & asmi < 7.23,
                       TRUE,
                       ifelse(gender == "female" & asmi < 5.67,
                              TRUE, FALSE)))

sum(dat$sarc, na.rm = TRUE)

##########################################
# FINAL CLEANING
##########################################

# Trim data set, rename mortality status, and change mort to factor
dat <- dat %>%
  select(id, perc_fat, bmi, gender, age, age_m, mortstat, bmi_status, asmi, sarc) %>%
  rename(mortcode = mortstat) %>%
  mutate(mortstat = factor(ifelse(mortcode == 0, "Alive", "Deceased")))