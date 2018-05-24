
targets<-read.delim(file="/Users/cheng/Desktop/Test_base.txt", sep='\t', header=TRUE)

patient.id<-unique(targets$PatientNumber)
res<-list()
for (i in 1:length(patient.id)){
  a<-targets[targets$PatientNumber == patient.id[i], ]
  base<-paste("base", formatC(patient.id[i], width=3, flag="0"), sep="_")
  tp<-c("-tp")
  if ((length(a$scan_number)-1)>0){
    for (s in 1:(length(a$scan_number)-1)){
    tp<-paste(tp,a$scan_number[s], "-tp", sep=" ")
    }
  }
  tp<-paste(tp, a$scan_number[(length(a$scan_number))], sep=" ")
  res[i]<-paste("recon-all -base",base, tp,"-all >",paste0(base,".txt"),sep=" ")
}

res1<-unlist(res)
write.table(res1,file="recon_run_script.txt", sep="\t", quote=FALSE,row.names = FALSE,col.names = FALSE)
