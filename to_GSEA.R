args <- commandArgs(trailingOnly = TRUE)

datos <- read.table(args[1],
                    header = TRUE)

names <- datos[,2]
FDRs <- datos[,20]

final_names <- c()
final_FDRs <- c()

for (i in 1:length(names)){
  varios=0
  repes <- which(names == names[i])
  
  if (length(repes) != 0){
    varios=1
    minimo <- min(FDRs[repes])
  }
  
  if (varios == 0){
    final_names <- c(final_names, names[i])
    final_FDRs <- c(final_FDRs, FDRs[i])
  }
  else{
    if (length(which(final_names == names[i])) == 0){
      final_names <- c(final_names, names[i])
      final_FDRs <- c(final_FDRs, minimo)
    }
  }
}


write.table(data.frame(final_names, final_FDRs, row.names = NULL), file = args[2])