Args <- commandArgs()
case2<-read.table("C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 6.0\\webapps\\\bcc_gaoxy\\WEB-INF\\classes\\com\\turing\\yuce\\case2.txt",head=T)
attach(case2)
sbp<-lm(case.sbp~case.gene+case.age+case.bmi+case.salt+case.oil+ case.tobacco+ case.alcohol+ case.loneliness+ case.pressure,data=case2)
dbp<-lm(case.dbp~case.gene+case.age+case.bmi+case.salt+case.oil+ case.tobacco+ case.alcohol+ case.loneliness+ case.pressure,data=case2)
test=data.frame(case.gene=as.numeric(Args[6]),case.age=as.numeric(Args[7]),case.bmi=as.numeric(Args[8]),case.salt=as.numeric(Args[9]),case.oil=1,case.tobacco=2,case.alcohol=0,case.loneliness=1,case.pressure=0) 
tt=predict(sbp,test)
dd=predict(dbp,test)
# cat(tt,"\n")
# cat(dd,"\n")
tt
dd

