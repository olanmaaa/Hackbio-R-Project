#importing the data set into RStudio and assigning it to a variable
gene.data <- read.delim('https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/datasets/data.tsv')
#calculating the difference in expression (ΔE) between the etoposide treated samples and the 14 days untreated samples
DeltaE <- ((gene.data$Beta_5d.release_etoposide)-(gene.data$Beta_Untreated_day14))
#creating a new column for DeltaE in the data set variable
gene.data <- cbind(gene.data,DeltaE)
#genes with dependency scores less than -1 are more essential for cancer cells (reference project instructions)
#filter genes with a ΔE score greater than 0.2 and a dependency (Depmap) score less than -1
target.genes <- subset(gene.data, DeltaE > 0 & Depmap < -1)
