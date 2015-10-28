module Word2Vec

export
    # type
    WordVectors,
    
    # function
    index, get_vector, cosine, vocabulary, cosine_similar_words,
    word2vec, wordvectors

include("interface.jl")
include("wordvectors.jl")

end # module
