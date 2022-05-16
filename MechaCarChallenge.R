library('tidyverse')

MechaCar_mpg_data <- read.csv('MechaCar_mpg.csv') # import dataset

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg_data)

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg_data))

demo_table <- read.csv(file='Suspension_Coil.csv', check.names=F,stringsAsFactors = F)

total_summary <- demo_table %>% summarize(Mean=mean(PSI), Median=median(PSI), variance=sd(PSI)*sd(PSI), SD=sd(PSI), .groups = 'keep') # create summary table

lot_summary <- demo_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), variance=sd(PSI)*sd(PSI), SD=sd(PSI), .groups = 'keep') # create lot table

population_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

sample_table <- population_table %>% sample_n(50)

LOT1 <- subset(population_table,Manufacturing_Lot=="Lot1")

LOT2 <- subset(population_table,Manufacturing_Lot=="Lot2")

LOT3 <- subset(population_table,Manufacturing_Lot=="Lot3")

t.test(sample_table$PSI,mu=mean(population_table$PSI))  # Random sample t-test
t.test(LOT1$PSI,mu=mean(population_table$PSI))  # Lot 1 t-test
t.test(LOT2$PSI,mu=mean(population_table$PSI))  # LOT 2 t-test
t.test(LOT3$PSI,mu=mean(population_table$PSI))  # Lot 3 t-test

