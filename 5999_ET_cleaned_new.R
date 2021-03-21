#ET
#Monthly Data
library("lubridate")
ET <-read.csv('~/Documents/MPS_excel_files/Gro_2021-02-16_Display_9(ET).csv',sep=",")

ET2 <- ET
ET2 <- subset(ET2, select=c(Region, End.Date, Value))

ET2$End.Date <- as.Date(ET2$End.Date)
ET2$Region <- as.character(ET2$Region)
ET2$Value <- as.numeric(as.character(ET2$Value))
ET2 <- na.omit(ET2)

#ET2 = ET2 %>% filter(End.Date <= "2020-10-31")
#plot((ET2$Value[ET2$Region == "Canada"]), xaxt="n", type="o")

ET2$End.Date <- ymd(ET2$End.Date)
ET2$month <- month(ET2$End.Date)
ET2$year <- year(ET2$End.Date)

# Create montly aggregated data frame.
ET2_month <- aggregate(as.numeric(Value) ~ Region + month + year, data = ET2, mean)
names(ET2_month)[names(ET2_month) == "as.numeric(Value)"] <- "Value"

#ET_byregion <- split(ET2_month, ET2_month$Region)
#ET_byregion

write.csv(ET2_month,"~/Documents/MPS_excel_files/ET-Canada_monthly.csv", row.names = FALSE)


