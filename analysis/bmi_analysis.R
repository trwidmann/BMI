### Distribution of BMI categories
dat %>%
  ggplot(aes(bmi_status, fill = bmi)) +
  geom_bar(show.legend = FALSE) +
  theme_classic()

### Distribution of continuous BMI
dat %>%
  ggplot(aes(bmi)) +
  geom_histogram(binwidth = 1) +
  theme_classic()

### Table of participant pop. by gender
dat %>%
  group_by(gender) %>%
  summarise(mean_bmi = mean(bmi),
            sd_bmi = sd(bmi),
            perc_sarc = mean(sarc),
            n = n())

### Comparison of mortality status between BMI groups
dat %>% ggplot(aes(bmi_status, fill = mortstat)) +
  geom_bar(position = "fill") +
  theme_classic() +
  labs(x = "BMI Status", fill = "Mortality Status")

### Comparison of mortality status between sarcopenic groups
dat %>% ggplot(aes(sarc, fill = mortstat)) +
  geom_bar(position = "fill") +
  theme_classic() +
  labs(x = "Sarcopenic", fill = "Mortality Status")

### Comparison of sarcopenia prevalence within each BMI group
dat %>% ggplot(aes(bmi_status, fill = sarc)) +
  geom_bar() +
  theme_classic() +
  labs(x = "BMI Status", fill = "Sarcopenia")

### Scatter plot: BF% by BMI
dat %>% ggplot(aes(bmi, perc_fat)) +
  geom_point(alpha = 0.2) +
  labs(x = "BMI", y = "BF%") +
  theme_bw() +
  geom_smooth()

### Scatter plot: BF% by ASMI
dat %>% ggplot(aes(asmi, perc_fat)) +
  geom_point(alpha = 0.2) +
  labs(x = "ASMI", y = "BF%") +
  theme_bw() +
  geom_smooth()

### BF% by ASMI, stratified by gender
dat %>% ggplot(aes(asmi, perc_fat, line = gender, color = gender)) +
  geom_point(alpha = 0.2) +
  labs(x = "ASMI", y = "BF%") +
  theme_bw() +
  geom_smooth(method = "lm", color = "black")

### ASMI by BMI, stratified by gender
dat %>% ggplot(aes(bmi, asmi, line = gender)) +
  geom_point(alpha = 0.2) +
  labs(x = "BMI", y = "ASMI") +
  theme_bw()+
  geom_smooth(method = "lm")

### ASMI by Age, stratified by gender
dat %>% ggplot(aes(age_m, asmi, line = gender)) +
  geom_point(alpha = 0.2) +
  labs(x = "Age (months)", y ="ASMI") +
  theme_bw() +
  geom_smooth(method = "lm")

### BF% by ASMI, facet by BMI group
dat %>% ggplot(aes(asmi, perc_fat)) +
  geom_point(alpha = 0.2) +
  labs(x = "ASMI", y = "BF%") +
  theme_bw() +
  facet_wrap(~bmi_status)

### BF% by BMI, facet by gender
dat %>% ggplot(aes(bmi, perc_fat, color = bmi_status)) +
  geom_point(alpha = 0.2) +
  labs(x = "BMI", y = "BF%") +
  theme_bw() +
  facet_wrap(~gender)

### BF% by ASMI, facet by BMI group, male
dat %>% filter(gender == "male") %>%
  ggplot(aes(asmi, perc_fat)) +
  geom_point(alpha = 0.2) +
  labs(x = "ASMI", y = "BF%") +
  theme_bw() +
  facet_wrap(~bmi_status)

### BF% by ASMI, facet by BMI group, female
dat %>% filter(gender == "female") %>%
  ggplot(aes(asmi, perc_fat)) +
  geom_point(alpha = 0.2) +
  labs(x = "ASMI", y = "BF%") +
  theme_bw() +
  facet_wrap(~bmi_status)

### BMI by BF%, stratify by sarcopenia, facet by gender
dat %>% ggplot(aes(perc_fat, bmi, color = sarc)) +
  geom_point(alpha = 0.2) +
  labs(x = "BF%", y = "BMI", fill = "Sarcopenia") +
  theme_bw() +
  facet_wrap(~gender)

### BMI by BF$, stratify by sarcopenia
dat %>% ggplot(aes(perc_fat, bmi, color = sarc)) +
  geom_point(alpha = 0.2) +
  labs(x = "BF%", y = "BMI", fill = "Sarcopenia") +
  theme_bw() +
  geom_smooth(aes(group = sarc), method = "lm", color = "black")