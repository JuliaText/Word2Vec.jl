# test various model functions 

# word vectors
model = wordvectors("bigvecs.txt") 
rm("bigvecs.txt")
rm("vocab.txt")

len_vecs, num_words = size(model)
wordvecs = model.vectors
@test size(wordvecs) == (len_vecs, num_words)

words = vocabulary(model)
word1 = words[rand(1:end)]
word2 = words[rand(1:end)]
word3 = words[rand(1:end)]

@test in_vocabulary(model, word1)

n = rand(1:100)

indxs, mes = cosine(model, word1, n)
@test words[indxs] == cosine_similar_words(model, word1, n)
w4_indx = indxs[rand(1:end)]
loc = findin(indxs, w4_indx)
word4 = words[w4_indx]

s = similarity(model, word1, word4)
@test mes[loc] == s

inx, mes = analogy(model, [word1, word2], [word3], n)
@test words[inx] == analogy_words(model, [word1, word2], [word3], n)

# word clusters
model = wordclusters("bigclus.txt")
rm("bigclus.txt")
words = vocabulary(model)
word1 = words[rand(1:end)]
clus_num = get_cluster(model, word1)
clus_words = get_words(model, clus_num)
@test word1 in clus_words

clus = clusters(model)
clu = clus[rand(1:end)]
get_words(model, clu)

println("model passed test...")

