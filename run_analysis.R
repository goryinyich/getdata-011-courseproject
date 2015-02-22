if (!require('stringr')) {
  install.packages('stringr')
  library(stringr)
}

if (!require('reshape2')) {
  install.packages('reshape2')
  library(reshape2)
}


# path to data
data.path <- './UCI HAR Dataset/'

# load feature names
features <- read.csv(file.path(data.path, 'features.txt'), header=F, sep='')
# keep only rows with 'mean' and 'std' in name, sort
features <- features[c(grep('mean', features$V2, fixed=T), 
                       grep('std', features$V2, fixed=T)), ]
features <- features[-grep('meanFreq', features$V2, fixed=T), ]
features <- features[order(features$V1), ]

# load activities names
activities <- read.csv(file.path(data.path, 'activity_labels.txt'), header=F, sep='')
activities <- activities[, 'V2']

# loads raw data
load.data <- function(case, keep.features) {
  # case is 'train' or 'test'
  # keep.features is what features to keep and their names
  dir <- file.path(data.path, case)
  
  # subjects info
  fn <- file.path(dir, str_c('subject_', case, '.txt'))
  subjects <- read.csv(fn, header=F, sep='')
  colnames(subjects) <- 'subject'
  
  # X_train
  fn <- file.path(dir, str_c('X_', case, '.txt'))
  main.data <- read.csv(fn, header=F, sep='')
  main.data <- main.data[, keep.features$V1]
  colnames(main.data) <- keep.features$V2
  
  # y_train
  fn <- file.path(dir, str_c('y_', case, '.txt'))
  activity <- read.csv(fn, header=F, sep='')
  colnames(activity) <- 'activity'
  
  return(cbind(subjects, activity, main.data))
}

# read data, keep only the relevant variables
raw.data <- rbind(load.data('train', features), 
                  load.data('test', features))
# correctly name activities with corresponding names
raw.data$activity <- activities[raw.data$activity]

# group by the vars of interest and calculate means of all vars
tidy.data <- data.frame(
  do.call(rbind, 
          by(raw.data, list(raw.data[, 'subject'], raw.data[, 'activity']),
             function(x) {
               colMeans(data.matrix(x))
             }, simplify=F)))
tidy.data$activity <- activities[tidy.data$activity]
# save
write.table(tidy.data, file='result.txt', row.names=F)
