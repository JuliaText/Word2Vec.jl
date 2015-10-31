module Word2Vec

import Base: show, size

export
    # types
    WordVectors, WordClusters,
    
    # functions
    index, get_vector, cosine, vocabulary, in_vocabulary,
    cosine_similar_words, analogy, analogy_words, size,
    word2vec, wordvectors, similarity, get_cluster, get_words,
    clusters, word2clusters, wordclusters

include("interface.jl")
include("wordvectors.jl")
include("wordclusters.jl")

end # module
