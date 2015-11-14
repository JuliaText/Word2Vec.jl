# test various training parameters

bigdata = joinpath(dirname(@__FILE__),"..", "data", "big.txt")

vector_size = rand(100:300)
window = rand(1:5)
sample = [0, 1e-5][rand(1:2)]
hs = rand(0:1)
negative = rand(1:5)
threads = rand(1:16)
iter = rand(1:5)
min_count = rand(1:5)
alpha = 0.025
debug = 2
threshold = rand(50:100)
binary = 1
cbow = rand(0:1)
classes = rand(30:100)
save_vocab = "vocab.txt"
read_vocab = "vocab.txt"

word2phrase(bigdata, "bigphrase", min_count=min_count, threshold=threshold,
            debug=debug)

word2vec("bigphrase", "bigvecs.txt", size=vector_size, window=window, sample=sample,
         hs=hs, negative=negative, threads=threads, iter=iter, 
         min_count=min_count, alpha=alpha, debug=debug, cbow=cbow, 
         save_vocab=save_vocab)
word2vec(bigdata, "bigvecs.bin", size=vector_size, window=window,
         sample=sample, hs=hs, negative=negative, threads=threads, 
         iter=iter, binary=binary, read_vocab = read_vocab)

rm("bigphrase")

model = wordvectors("bigvecs.txt")
len_vecs, num_words = size(model)
@test len_vecs == vector_size

word2clusters(bigdata, "bigclus.txt", classes, size=vector_size, window=window,
              sample=sample, hs=hs, negative=negative, threads=threads,
              iter=iter, min_count=min_count, alpha=alpha, debug=debug,
              cbow=cbow, read_vocab=read_vocab, save_vocab=save_vocab)


println("training passed test...")
