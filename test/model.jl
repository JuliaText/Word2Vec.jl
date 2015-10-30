# test various model functions 

model = wordvectors("bigvecs.txt") 
rm("bigvecs.txt")
rm("bigclus.txt")
rm("vocab.txt")

len_vecs, num_words = size(model)
wordvecs = model.vectors
@test size(wordvecs) == (len_vecs, num_words)

words = vocabulary(model)
word1 = words[rand(1:end)]
word2 = words[rand(1:end)]
word3 = words[rand(1:end)]

n = rand(1:100)

indxs, mes = cosine(model, word1, n)
@test words[indxs] == cosine_similar_words(model, word1, n)

s = similarity(model, word1, word2)
w2_indx = index(model, word2)
if w2_indx in indxs
    println("$(word2) has index $(w2_indx)")
    @test mes[w2_indx] == s
end


inx, mes = analogy(model, [word1, word2], [word3], n)
@test words[inx] == analogy_words(model, [word1, word2], [word3], n)

println("model passed test...")

