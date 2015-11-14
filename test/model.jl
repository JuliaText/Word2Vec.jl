# test various model functions 

# word vectors
model = wordvectors("bigvecs.txt", Float32)
println(model) 
rm("bigvecs.txt")
rm("vocab.txt")

modelbin = wordvectors("bigvecs.bin", kind = :binary)
rm("bigvecs.bin")

try
    wordvectors("bigvecs.txt", kind = :unkown)
catch ArgumentError
    println("unknown kind value")
end
    

len_vecs, num_words = size(model)
wordvecs = model.vectors

len_vecs_bin, num_words_bin = size(modelbin)
@test size(wordvecs) == (len_vecs, num_words)
@test len_vecs == len_vecs_bin

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
@test index(model, word4) == w4_indx

s = similarity(model, word1, word4)
@test_approx_eq(mes[loc], s)

inx, mes = analogy(model, [word1, word2], [word3], n)
@test words[inx] == analogy_words(model, [word1, word2], [word3], n)

# word clusters
model = wordclusters("bigclus.txt")
println(model)
rm("bigclus.txt")
words = vocabulary(model)
word1 = words[rand(1:end)]
@test in_vocabulary(model, word1)
idx = index(model, word1)
@test words[idx] == word1

clus_num = get_cluster(model, word1)
clus_words = get_words(model, clus_num)
@test word1 in clus_words

clus = clusters(model)
clu = clus[rand(1:end)]
get_words(model, clu)

println("model passed test...")

