#ET
#Monthly Data
library(ggplot2)
ET <-read.csv('~/Documents/MPS_excel_files/Gro_2021-02-16_Display_9(ET).csv',sep=",")
summary(ET)

ET2 <- ET
#region, value, start data, end date
ET2 <- subset(ET2, select=c(Region, End.Date, Value))
#summary(ET2)

ET2$End.Date <- as.Date(ET2$End.Date)
ET2$Region <- as.character(ET2$Region)
ET2$Value <- as.numeric(as.character(ET2$Value))
ET2 <- na.omit(ET2)
#summary(ET2)

#ET2 = ET2 %>% filter(End.Date <= "2020-10-31")
#summary(ET2)

plot((ET2$Value[ET2$Region == "Canada"]), xaxt="n", type="o")

ET_byregion <- split(ET2, ET2$Region)
ET_byregion

#ET_mo <- subset(ET2, select=c(Region, End.Date, Value))
#ET_mo <- ET_mo %>%
#mutate(year = year(End.Date), 
#monthnum = month(End.Date),
#month = month(End.Date, label=T)) %>%
#group_by(Region, year, month) %>%
#arrange(year, monthnum) %>%
#select(-monthnum) %>%
#summarise(Value = mean(Value))
#ET_mo$Date <- with(ET_mo, sprintf("%d-%02d", year, month))
#ET_mo <- subset(ET_mo, select = -c(year,month) )
#ETbyregion <- split(ET_mo, ET_mo$Region)

ggplot(data = ET_byregion$Canada, aes(x = End.Date, y = Value)) +
  geom_bar(stat = "identity", fill = "purple") +
  labs(x = "Date",
       y = "ET",
       title = "ET Data for Canada")

