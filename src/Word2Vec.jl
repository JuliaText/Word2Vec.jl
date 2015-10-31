module Word2Vec

import Base: show, size

export
    # types
    WordVectors, WordClusters,
    
    # functions
    index, size, 
    vocabulary, in_vocabulary,
    get_vector, get_cluster, get_words,
    cosine, cosine_similar_words,
    analogy, analogy_words, similarity,
    wordvectors, clusters, wordclusters,
    word2vec, word2phrase, word2clusters

include("interface.jl")
include("wordvectors.jl")
include("wordclusters.jl")

end # module
