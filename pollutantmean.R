
pollutantmean <- function(directory, pollutant, id= 1:332){
	index <-1
	means <- vector(mode='numeric', length=length(id)) # average of each file
    lens <- vector(mode='numeric', length=length(id)) #length of each file 
    nid <- formatC(id, width = 3, flag = '0') # 3 digit
  for (i in id){
    # print(i)
    #readin one file
    filename <- paste(nid[index],'.csv',sep = '')
    my_path <- file.path(directory,filename)  
    my_file <- read.csv(my_path)

    # calculate mean and length, remove NA
    my_col <-my_file[pollutant] # my col is a data.frame
    # print(my_col)
    no_na <-na.omit(my_col)
    #print(no_na)
    lens[index] <- length(no_na[,1])
    means[index] <- mean(no_na[,1])
    print(paste(lens[index],means[index],index))
    index <- index+1
    

    }
  # print(paste('means:',means))
  #print(paste('lens:',lens))
  good <- lens!=0  #discard file with no useful data
  means<-means[good]
  lens <-lens[good]
  sum(means * lens)/sum(lens)
}