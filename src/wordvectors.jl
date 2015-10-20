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
