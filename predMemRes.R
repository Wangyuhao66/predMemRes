library(tidymodels)
library(tidyverse)
allArgs=commandArgs(trailingOnly=TRUE)
inputgenome=allArgs[1]
outputnam=allArgs[2]
prodigalcode=sprintf("prodigal -a target.pep -d target.cds -g 11 -p single -i %s",inputgenome)
makedb="makeblastdb -in model.fasta  -dbtype prot -title model -out model"
blastpcode="blastp -db model -query target.pep -out model.out -evalue 0.00001 -outfmt 6 -max_target_seqs 10000000 -max_hsps 1000 -qcov_hsp_perc 80 -num_threads 4"
system(prodigalcode)
system(makedb)
system(blastpcode)
#
library(tidyverse)
load("156feature")
load("newfit")
readout=read_tsv("model.out",col_names=FALSE)
readout01=readout%>%filter(X3>95)%>%group_by(X1)%>%filter(X3==max(X3))
readout02=as.data.frame(readout01)
uniquematch=unique(readout02$X2)
table01=rep(1,each=length(uniquematch))
names(table01)=uniquematch
feature_best01=feature_best[-130]
table02=table01[names(table01)%in%feature_best01]
ppp=intersect(names(table02),feature_best01)
add01=setdiff(feature_best01,ppp)
amat=matrix(0,nrow=1,ncol=length(add01))
colnames(amat)=add01
amat0=matrix(table02,ncol=length(table02))
colnames(amat0)=names(table02)
final_table=cbind(amat0,amat)
pre=augment(newfit,final_table)
write_tsv(pre,sprintf("%s_prediction.txt",outputnam))
cat(names(table02),collapse="\n",sep="\n",file=sprintf("%s_resistanceGenes.txt",outputnam))
