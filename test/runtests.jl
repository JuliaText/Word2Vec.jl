using Word2Vec
using Base.Test

 
big = joinpath(Pkg.dir("Word2Vec"), "data", "big.txt")
word2vec(big, "bigvecs.txt")
wv = wordvectors("bigvecs.txt") 
rm("bigvecs.txt")
