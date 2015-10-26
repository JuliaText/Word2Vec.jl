type WordVectors{T}
    vocab::AbstractArray{T, 1} # vocabulary
    vectors::AbstractArray{T, 2} # the vectors calculated by word2vec
    clusters::AbstractArray{T, 1} # the clusters calulated by word2vec
    vocab_hash::Dict{Any, Integer}
    function WordVectors(vocab, vectors, clusters)
        vocab_hash = Dict{Any, Integer}()
        for (i, word) in enumerate(vocab)
            vocab_hash[word] = i
        end
        new(vocab, vectors, clusters, vocab_hash)
    end
end

"""
`index(wv, word)`

Return the index of `word` in the WordVectors `wv`.
"""
index(wv::WordVectors, word) = v.vocab_hash[word]

"""
`get_vector(wv, word)`

Return the vector for `word` in the WordVectors `wv`. 
"""
get_vector(wv::WordVectors, word) = (idx = wv.vocab_hash[word]; wv.vectors[idx])

"""
`cosine(wv, word, n=10)`

Return the position of `n` neighbors of `word` and cosine similarity 
"""
function cosine(wv::WordVectors, word, n=10)
    metrics = wv.vectors'*get_vector(wv, word)
    topn_positions = sortperm(metrics, rev = true)[1:n]
    topn_metrics = metrices[topn_positions]
    return topn_postions, topn_metrices
end
