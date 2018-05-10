mutable struct WordClusters
    vocab::AbstractArray{AbstractString, 1}
    clusters::AbstractArray{Integer, 1}
    vocab_hash::Dict{AbstractString, Integer}
    function WordClusters(vocab, clusters)
        vocab_hash = Dict{AbstractString, Integer}()
        for (i, word) in enumerate(vocab)
            vocab_hash[word] = i
        end
        new(vocab, clusters, vocab_hash)
    end
end

function show(io::IO, wc::WordClusters)
    print(io, "WordClusters $(length(wc.vocab)) words, $(length(unique(wc.clusters))) clusters")
end

"""
    vocabulary(wc)

Return all the vocabulary of the WordClusters `wc`.
"""
vocabulary(wc::WordClusters) = wc.vocab

"""
    in_vocabulary(wc, word)

For the WordCluters `wc`, return `true` if `word` is part of the
vocabulary of `wc` and `false` otherwise.
"""
in_vocabulary(wc::WordClusters, word::AbstractString) = word in wc.vocab

"""
    index(wc, word)

Return the index of `word` from the WordCluaters `wc`.
"""
index(wc::WordClusters, word) = wc.vocab_hash[word]

"""
    get_cluster(wc, word)

Return the cluster number for a word in the vocabulary.
"""
get_cluster(wc::WordClusters, word) = (idx = index(wc, word); wc.clusters[idx])

"""
    clusters(wc)

Return all the clusters from the WordClusters `wc`.
"""
clusters(wc::WordClusters) = sort(unique(wc.clusters))

"""
    get_words(wc, cluster)

For the WordCluster `wc`, return all the words from a given cluster
number `cluster`.
"""
function get_words(wc::WordClusters, cluster::Int)
    inds = findin(wc.clusters, cluster)
    return wc.vocab[inds]
end

"""
    wordclusters(fname)

Generate a WordClusters type object from the text file `fname`.
"""
function wordclusters(fname::AbstractString)
    vocab = AbstractString[]
    clusters = Int[]
    open(fname) do f
        entries = split(strip(readline(f)), ' ')
        while length(entries) == 2
            push!(vocab, entries[1])
            push!(clusters, parse(Int, entries[2]))
            entries = split(strip(readline(f)), ' ')
        end
    end
    return WordClusters(vocab, clusters)
end
