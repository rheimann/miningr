cred <- 
  
getTwitterOAuth("nkdOXtkJbdRUyglEmIyKA", "RXinqaAhy79AYfY2JzryJgXnZ3O6dg4pOpAE2E3TM")

bigdata <- searchTwitter("#bigdata", n=1500)
class(bigdata)
head(bigdata)
length(bigdata)
remove(top100)
top25 <- bigdata[1]
length(top25)
top25$getText()
?status

s <- searchTwitter('emoticons', n=100)
df <- do.call("rbind", lapply(s, as.data.frame))



morsi <- searchTwitter('#morsi') 
class(morsi)
head(morsi)

morsi.df <- do.call("rbind", lapply(morsi, as.data.frame))
head(morsi.df)



                   
bigdata_list <- sapply(bigdata, function(x) x$getText())
bigdata_corpus <- Corpus(VectorSource(bigdata_list))
bigdata_corpus <- tm_map(bigdata_corpus, tolower)
bigdata_corpus <- tm_map(bigdata_corpus, removePunctuation)
bigdata_corpus <- tm_map(bigdata_corpus, function(x)removeWords(x,stopwords()))
wordcloud(bigdata_corpus)

## Build a term-document matrix
bigdata.tdm <- TermDocumentMatrix(bigdata_corpus)

# inspect the document-term matrix
bigdata.tdm

# inspect most popular words
findFreqTerms(bigdata.tdm, lowfreq=10)

findAssocs(bigdata.tdm, 'people', 0.50) 

To make a Hierarchical Agglomerative cluster plot
we need to reduce the number of terms 
(which otherwise wouldn’t fit on a page or the screen) and build a data frame.

# remove sparse terms to simplify the cluster plot
# Note: tweak the sparse parameter to determine the number of words.
# About 10-30 words is good.
bigdata2.tdm <- removeSparseTerms(bigdata.tdm, sparse=0.92)

# convert the sparse term-document matrix to a standard data frame
bigdata2.df <- as.data.frame(inspect(bigdata2.tdm))

# inspect dimensions of the data frame
nrow(bigdata2.df)
ncol(bigdata2.df)
Now the data frame (a standard data structure in R) 
contains a bag of words (specifically, 1-grams) 
which are simple frequency counts. 
Though the structure is lost, it retains much information and is simple to use. 
The data frame is ready for cluster analysis using a cluster analysis function available in R core. 
The following code is basically copied from Robert I. Kabacof’s “Cluster Analysis” page.

bigdata2.df.scale <- scale(bigdata2.df)
bigdata.dist <- dist(bigdata2.df.scale, method = "euclidean") # distance matrix
bigdata.fit <- hclust(bigdata.dist, method="ward")
plot(bigdata.fit, main="Cluster - Big Data") # display dendogram?

groups <- cutree(bigdata.fit, k=5) # cut tree into 5 clusters
# draw dendogram with red borders around the 5 clusters
rect.hclust(bigdata.fit, k=5, border="blue")

bigdata2.df

?stopwords
delta.tweets = searchTwitter('@delta', n=1500)
length(delta.tweets)
class(delta.tweets)
delta.tweet1 <- delta.tweets[[1]]

delta.tweet1$getScreenName()

install.packages("wordcloud")
install.packages("tm")

library("wordcloud")
library("tm")

attr(,"package")

sessionInfo()

