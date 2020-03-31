#source('complete.R')
corr <-function(directory, threshold = 0 ){
	nobs<-complete(directory)
	print(nobs[1,2])
	cors = vector()
	index <-1
	for (i in 1:332){
		if (nobs[i,2]>=threshold){
			nid <- formatC(i, width = 3, flag = '0') # 3 digit
			filename <- paste(nid,'.csv',sep = '')
			my_path <- file.path(directory,filename)
        	my_file <- read.csv(my_path)
        	my_file <-na.omit(my_file)
        	cors[index] <- cor(my_file$sulfate,my_file$nitrate)
        	index <- index+1
		}
	}
	cors<-na.omit(cors)
}