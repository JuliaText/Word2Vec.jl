module Word2Vec

export
    # type
    WordVectors,
    
    # function
    index, get_vector, cosine,
    word2vec, wordvectors

include("interface.jl")
include("wordvectors.jl")

end # module
