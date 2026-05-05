


# Term associations (correlations) using findAssocs----

# We can check for correlations 
# between some of these and other terms that occur in the corpus.
# In this context, correlation is a quantitative measure 
# of the co-occurrence of words in multiple documents.

# Correlation limit - number between 0 and 1 that serves as a lower bound 
# for the strength of correlation between the search and result terms.
#
# For example, if the correlation limit is 1, 
# findAssocs() will return only those words that always co-occur with the search term.
#
# A correlation limit of 0.5 will return terms 
# that have a search term co-occurrence of at least 50% and so on.



### Illustration of findAssocs function
library(tm)
text <-  c("", "word1", "word1 word2","word1 word2 word3","word1 word2 word3 word4","word1 word2 word3 word4 word5")

dtm_example <- DocumentTermMatrix(VCorpus(VectorSource(text)))
m <- as.matrix(dtm_example)
m


# find associations
# above a certain threshold
findAssocs(dtm_example, "word1", 0.6)

# calculate correlations for words
cor(m[,"word1"], m[,"word2"])


# Pairwise term associations:
findAssocs(dtm_example, "word1", 0.6)
findAssocs(dtm_example, "word1", 0.3)
findAssocs(dtm_example, "word1", 0)

# For comparison:
cor(m[,"word1"], m[,"word2"])
cor(m[,"word1"], m[,"word3"])
cor(m[,"word1"], m[,"word4"])
cor(m[,"word1"], m[,"word5"])



