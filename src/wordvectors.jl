type WordVectors
    vocab::AbstractArray{AbstractString, 1} # vocabulary
    vectors::AbstractArray{AbstractFloat, 2} # the vectors calculated by word2vec
    vocab_hash::Dict{Any, Integer}
    function WordVectors(vocab, vectors)
        vocab_hash = Dict{Any, Integer}()
        for (i, word) in enumerate(vocab)
            vocab_hash[word] = i
        end
        new(vocab, vectors, vocab_hash)
    end
end


"""
`index(wv, word)`

Return the index of `word` in the WordVectors `wv`.
"""
index(wv::WordVectors, word) = wv.vocab_hash[word]

"""
`get_vector(wv, word)`

Return the vector for `word` in the WordVectors `wv`. 
"""
get_vector(wv::WordVectors, word) = (idx = wv.vocab_hash[word]; wv.vectors[idx,:])

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


"""
`wordvectors(fname)`

Generate a WordVectors type object from the file `fname`. 
"""
function wordvectors(fname::AbstractString, kind::Symbol=:text)
    if kind == :binary
        return _from_binary(fname)
    elseif kind == :text
        return _from_text(fname)
    else
        error("Unknown kind $(kind)")
    end
end

# generate a WordVectors object from binary file
function _from_binary(filename::AbstractString) 

end

# generate a WordVectors object from text file
function _from_text(filename::AbstractString)
    open(filename) do f
        header = strip(readline(f))
        vocab_size,vector_size = map(x -> parse(Int, x), split(header, ' '))
        vocab = Array(AbstractString, vocab_size)
        vectors = Array(AbstractFloat, vocab_size, vector_size)
        for (i, line) in enumerate(readlines(f))
            #println(line)
            line = strip(line)
            parts = split(line, ' ')
            word = parts[1]
            vector = float(parts[2:end])
            vocab[i] = word
            vectors[i,:] = vector./norm(vector) #unit vector
        end
       return WordVectors(vocab, vectors) 
    end    
end
