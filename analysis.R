full_db <- read.csv("/home/dan/Desktop/GitRepo/USPolicy/Full_DB.csv")

library(maptools)
geomDef <- readShapePoints("/home/dan/Desktop/GitRepo/USPolicy/US_place_2000_PTS.shp")
#Make sure it worked...
plot(geomDef)

geomDef_join <- merge(geomDef, full_db, by="GISJOIN", duplicateGeoms=TRUE, all.x=FALSE) 

library(devtools)
install_github("itpir/SCI@master")
library(SCI)
library(spdep)

EM_Pol_PER <- PSM_correlogram(geomDef_join, var=geomDef_join$EM_POL_PER, order = 10, style = "W", start=0,end=500, zero.policy=TRUE) 
plot(EM_Pol_PER)

Wat_Pol_PER <- PSM_correlogram(geomDef_join, var=geomDef_join$WAT_POL_PER, order = 20, style = "W", start=0,end=1000, zero.policy=TRUE) 
plot(Wat_Pol_PER)

POV_Pol_PER<- PSM_correlogram(geomDef_join, var=geomDef_join$POV_POL_PER, order = 10, style = "W", start=0,end=500, zero.policy=TRUE) 
plot(POV_Pol_PER)
