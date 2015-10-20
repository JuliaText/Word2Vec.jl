source = joinpath(dirname(@__FILE__), "src", "word2vec-c")
cd(source)
run(`make`)
