module Word2Vec

if VERSION >= v"0.7"
    Void = Nothing  # Should be removed once Julia v0.6 support is dropped
end

import Base: show, size
import Compat.Statistics
using Compat

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
