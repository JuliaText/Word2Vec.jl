module Word2Vec

import Base: show

export
    # types
    WordVectors,
    
    # functions
    index, get_vector, cosine, vocabulary, cosine_similar_words,
    word2vec, wordvectors

include("interface.jl")
include("wordvectors.jl")

end # module
