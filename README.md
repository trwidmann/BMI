# BMI
An analysis of the validity of BMI as a measure of body fat using NHANES data sets

## Background
This is a data analysis project I undertook in order to compare BMI to more detailed body composition measurements taken via DXA. DXA stands for dual-energy x-ray absorptiometry and is considered a gold standard tool for measuring body composition. BMI, which stands for body mass index, is simply calculated as weight over height squared. 
The main advatntage of BMI is its ease of use. It costs nothing and is quickly calculated. The main disadvantage is that it uses a height and weight ratio as a proxy for adiposity. Notably, BMI does not distinguish between types of body tissue; fat, muscle, organs, bone---it all counts the same. For this reason it's considered a screening tool, a wide net, 
and not as a basis of diagnosis.

Yet BMI is generally how obesity is defined by the largest health organizations in the world, such as the CDC and the WHO. And when it comes to the epidemiological obesity research, BMI is the go-to measure. Our interpretation of observations, our conclusions, and our recommendations for health and policy practices at the population level all essentially 
take for granted that it's body fat we're measuring in the first place. And this not entirely without merit. After all, higher BMIs scores are certainly more likely to capture greater levels of body fat. In other words, false positives are pretty rare. We'll come to see through this investigation, howoever, that false negatives are a different story.

I first became interested in conducting an investigation like this when reading about the "obesity paradox." I put the term in quotes because there is a good deal of controversy over whether there is a paradox at all. In any case, the term arose out of the counterintuitive findings that certain BMI ranges above the normal or healthy range are actually 
associated with lower mortality, making it seem as if higher levels of body fat are actually protective of health compared to what is traditionally classified as healthy weight. This paradox comes about because excess body fat is also associated with greater incidence of a wide range of disease states, some of which are the leading causes of death. How 
can it be that body fat is associated with worse health and yet better mortality?

I've been suspicious for a while that the low resolution of BMI might be the primary cause of these discrepancies. More specifically, I think taking into account the presence of muscle tissue status is likely to bring such observations closer to agreement. It's already well-known that loss of muscle mass is an important health concern when it comes to aging. 
Sarcopenia, or the age-related loss of muscle mass, is an established risk factor for poorer health outcomes and greater mortality. My guess is also that increasingly sedentary lifestyles effectively accelerate the progression of sarcopenia and increase the prevalence and consequence of low muscle tissue.

## Data Sourcing
I needed a data set that included reliable measurements of body fat and muscle mass as well as BMI. The latter is easy enough to attain. The former measures require a more sophisticated testing apparatus. Thankfully, the National Health and Nutrition Examination Survey (NHANES) performed DXA scans for a selection of years. NHANES is a yearly survey that 
the CDC uses to track behaviors and disease prevalence in the U.S. population using representative samples numbering 5,000 participants. There are other years that included other forms of body composition testing, but combining data from different measuring methods would introduce a bit too much noise for my comfort. Of course DXA is not completely free 
of measurement error, but it tends to fare better than the other methods NHANES has used, and at least our data set will be more consistent. 
