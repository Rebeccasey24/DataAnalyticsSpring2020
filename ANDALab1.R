EPI_Data_2010 <- read.csv(file.choose(), header= TRUE)
GRUMP2010<- read.csv(file.choose(), header= TRUE)

View(EPI_Data_2010)

summary(EPI_Data_2010) 
EPI<- EPI_Data_2010$EPI
is.na(EPI)
tf<-is.na(EPI)
E<-EPI[!tf]


Summary(EPI_Data_2010$EPI)
fivenum(EPI,na.rm=TRUE)
stem(EPI)
hist(EPI)

EPI_Hist <- hist(EPI, seq(30.,95.,1.0),prob=TRUE)
lines(density(EPI,na.rm=TRUE,bw='SJ'))
help("lines")

plot(ecdf(EPI), do.points=FALSE, verticals=TRUE)
help('ecdf')
help('par')
par(pty='s')
help("qqline")
qqnorm(EPI);qqline(EPI)
X<-seq(30,95,1)
help('seq')
X
qqplot(qt(ppoints(250), df = 5), X, xlab = "Q-Q plot for t dsn")
qqline(X)

Ozone<- EPI_Data_2010$OZONE_pt
is.na(Ozone)
summary(Ozone)         
qqnorm(Ozone)
help("qt")
qqline(Ozone)
boxplot(Ozone,EPI)

DALY<- EPI_Data_2010$DALY
is.na(DALY)
summary(DALY)
stem(DALY)
boxplot(Ozone, DALY)

Ecosystem<- EPI_Data_2010$ECOSYSTEM
boxplot(Ecosystem,DALY)

help(distributions)

EPILand<-EPI[!EPI_Data_2010$Landlock]
Eland<- EPILand[!is.na(EPILand)]
Eland
hist(Eland)
hist(Eland, seq(30., 95., 1.0), prob=TRUE)

NosurWater<- EPI[!EPI_Data_2010$No_surface_water]
NoSWater<-NosurWater[!is.na(NosurWater)]
hist(NoSWater)
summary(NoSWater)
head(NoSWater)
View(NoSWater)

EPISouthAsia<-EPI["South Asia"==EPI_Data_2010$GEO_subregion] ## exercise II

ESouthasia<- EPISouthAsia[!is.na(EPISouthAsia)]
hist(ESouthasia)
names(ESouthasia)
View(ESouthasia)
ESouthasia

### Grumpy Grump time

View(GRUMP2010)
PopPerUnit<- GRUMP2010!GRUMP2010$PopulationPerUnit
is.na(PopPerUnit)
PPUnit<- PopPerUnit[!is.na(PopPerUnit)]
PPUnit
hist(PPUnit)
help(hist)
hist(PPUnit, nclass=30, col="dark blue")
plot(PPUnit, type="l")
help(filter)
PopPerunitName<-data.frame(PopPerUnit,GRUMP2010$CountryEnglish)
ppunit<- PopPerunitName[!is.na(PopPerunitName$PopPerUnit),]
View(ppunit)
help(lapply)
help()
hist(ppunit[0])

library(ggplot2)

ggplot(PopPerunitName, aes(x="country", y="pop per unit"))+geom_boxplot()
help("ggplot")


