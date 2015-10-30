# test various training parameters

big = joinpath(dirname(@__FILE__),"..", "data", "big.txt")

vector_size = rand(100:300)
window = rand(1:5)
sample = [0, 1e-5][rand(1:2)]
hs = rand(0:1)
negative = rand(1:5)
threads = rand(1:16)
iter = rand(1:5)
min_count = rand(1:5)
alpha = rand()
debug = 2
# binary = rand(0:1)  # turn this on when binary file reader is implemented
cbow = rand(0:1)
classes = rand(30:100)
save_vocab = "vocab.txt"
read_vocab = "vocab.txt"

word2vec(big, "bigvecs.txt", size=vector_size, window=window, sample=sample,
         hs=hs, negative=negative, threads=threads, iter=iter, 
         min_count=min_count, alpha=alpha, debug=debug, cbow=cbow, 
         save_vocab=save_vocab)

rm("bigvecs.txt")

word2clusters(big, "bigclus.txt", classes, size=vector_size, window=window,
              sample=sample, hs=hs, negative=negative, threads=threads,
              iter=iter, min_count=min_count, alpha=alpha, debug=debug,
              cbow=cbow, read_vocab=read_vocab)

rm("bigclus.txt")
rm("vocab.txt")

println("training passed test...")
