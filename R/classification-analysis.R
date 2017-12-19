rm(list = ls(all = TRUE))

source(file = "R/packages.R")
source(file = "R/utils.R")
source(file = "R/variables.R")

library(ggplot2)

merge.time.data = read.csv("merge-time-2-cv-50000.csv")
merge.decision.data = read.csv("merge-decision-2-cv-50000.csv")

aggregate(auc ~ classifier, merge.time.data, mean)
aggregate(acc ~ classifier, merge.time.data, mean)
aggregate(prec ~ classifier, merge.time.data, mean)
aggregate(rec ~ classifier, merge.time.data, mean)

aggregate(auc ~ classifier, merge.decision.data, mean)
aggregate(acc ~ classifier, merge.decision.data, mean)
aggregate(prec ~ classifier, merge.decision.data, mean)
aggregate(rec ~ classifier, merge.decision.data, mean)

rf.merge.decision <- subset(merge.decision.data, classifier == "randomforest")
rf.merge.time <- subset(merge.time.data, classifier == "randomforest")

print(sprintf("std dev auc merge time: %f", sd(rf.merge.time$auc)))
print(sprintf("std dev auc merge decision: %f", sd(rf.merge.decision$auc)))
