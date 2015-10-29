big = joinpath(Pkg.dir("Word2Vec"), "data", "big.txt")
word2vec(big, "bigvecs.txt")
model = wordvectors("bigvecs.txt") 
rm("bigvecs.txt")
words = vocabulary(model)

word = words[rand(1:end)]
n = rand(1:10)

# run all the functions

c = cosine(model, word, n)

word2 = words[rand(1:end)]

s = similarity(model, word, word2)

csw = cosine_similar_words(model, word, n)

word3 = words[rand(1:end)]

inx, mes = analogy(model, [word, word2], [word3])

println(":)")
