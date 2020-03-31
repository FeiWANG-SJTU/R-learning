# read a directory full of files and report the number of completely observed cases in each data file
complete <- function(directory,id = 1:332){
	res <- data.frame(id = id, nobs=1:length(id))
	nid <- formatC(id, width = 3, flag = '0') # 3 digit
	index <-1
	#print(res)
	for (i in id ){
		filename <- paste(nid[index],'.csv',sep = '')
        my_path <- file.path(directory,filename)  
        my_file <- read.csv(my_path)
        my_file <-na.omit(my_file)
        nob<- length(my_file[,1])
        res[index,2]<-nob
        index <- index+1
	}
	res
}