sourcedir = joinpath(dirname(@__FILE__), "src", "word2vec-c")
cd(sourcedir)
run(`make`)
