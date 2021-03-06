epsilon <-0.01

t = read.table("Dane.csv", header = TRUE, sep = ",")

# the performance table
performanceTable <- rbind(
  c(24.2,100-51200,4399),
  c(24.3,100-25600,1999),
  c(24.3,100-25600,4999),
  c(24.3,100-25600,2399),
  c(16.3,100-25600,1599),
  c(24.3,100-25600,3295),
  c(10.2,160-51200,10199), 
  c(16.0,200-25600,2499), 
  c(16.0,200-25600,3849),
  c(16.0,200-25600,2449),
  c(18.84,100-25600,1699),
  c(16.0,200-25600,2499)

)

rownames(performanceTable) <- c(
  "Sony Alpha a6300",
  "Sony Alpha a5100",
  "Sony Alpha a6000",
  "Sony Alpha a7 II",
  "Sony Alpha a7K - ILCE-7K"
  "Fujifilm X-A10",
  "Panasonic DC-GH5S", 
  "Panasonic Lumix DMC-G7 14-42", 
  "Panasonic Lumix DMC-G80",
  "Panasonic Lumix DMC-GX80",
  "Panasonic Lumix DMC-GX800K",
  "Panasonic Lumix DMC-G7",
)
colnames(performanceTable) <- c(
  "Resolution",
  "RangeSensitivity",
  "Price"
)
# ranks of the alternatives
alternativesRanks <- c(1,2,3,4,5,6,7,8,9,10,11,12)

names(alternativesRanks) <- row.names(performanceTable)

# criteria to minimize or maximize
criteriaMinMax <- c("max","max","min")
names(criteriaMinMax) <- colnames(performanceTable)

library(MCDA)
x<-additiveValueFunctionElicitation(performanceTable, criteriaMinMax, epsilon, alternativesRanks = alternativesRanks)
