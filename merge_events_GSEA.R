dirs <-list.dirs(path = "to_GSEA_JC/", recursive = FALSE)

for (dir in dirs){
  n=1
  files <- list.files(path = dir)
  all_genes <- c()
  for (file in files){
    BD <- read.table(paste(dir,file, sep ="/"), header = TRUE)
    all_genes <- c(all_genes, BD[,1])
  }
  
  matriz <- matrix(nrow = length(unique(all_genes)), ncol = 6)
  rownames(matriz) <- unique(all_genes)
  
  for (file in files){
    BD <- read.table(paste(dir,file, sep ="/"), header = TRUE)
    genes <- BD[,1]
    sig <- BD[,2]
    
    for (i in 1:length(genes)){
      matriz[genes[i], n] = sig[i]
      
    }
    n = n+1
  }
  
  matriz[,6] =  rowSums(matriz[,1:5], na.rm = TRUE)
  write.table(matriz[,6], file = paste(dir, "all.txt", sep="/"), quote = FALSE, col.names = FALSE)
}


