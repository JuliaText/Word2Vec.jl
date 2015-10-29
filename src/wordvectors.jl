type WordVectors
    vocab::AbstractArray{AbstractString, 1} # vocabulary
    vectors::AbstractArray{AbstractFloat, 2} # the vectors computed from word2vec
    vocab_hash::Dict{Any, Integer}
    function WordVectors(vocab, vectors)
        vocab_hash = Dict{AbstractString, Integer}()
        for (i, word) in enumerate(vocab)
            vocab_hash[word] = i
        end
        new(vocab, vectors, vocab_hash)
    end
end

function show(io::IO, wv::WordVectors)
    len_vecs, num_words = size(wv.vectors)
    print(io, "WordVectors $(num_words) words, $(len_vecs)-element vectors")
end

"""
`vocabulary(wv)` 

Return all the vocabulary of the WordVectors `wv`.
"""
vocabulary(wv::WordVectors) = wv.vocab

"""
`in_vocabulary(wv, word)`

Return `true` if `word` is part of the vocabulary of `wv` and `false` otherwise.
"""
in_vocabulary(wv::WordVectors, word::AbstractString) = word in wv.vocab

"""
`size(wv)`

Return the size of the WordVectors `wv`. 
"""
size(wv::WordVectors) = size(wv.vectors)


"""
`index(wv, word)`

Return the index of `word` from the WordVectors `wv`.
"""
index(wv::WordVectors, word) = wv.vocab_hash[word]

"""
`get_vector(wv, word)`

Return the vector representation of `word` from the WordVectors `wv`. 
"""
get_vector(wv::WordVectors, word) = 
      (idx = wv.vocab_hash[word]; wv.vectors[:,idx])

"""
`cosine(wv, word, n=10)`

Return the position of `n` neighbors of `word` and cosine similarity 
"""
function cosine(wv::WordVectors, word, n=10)
    metrics = wv.vectors'*get_vector(wv, word)
    topn_positions = sortperm(metrics[:], rev = true)[1:n]
    topn_metrics = metrics[topn_positions]
    return topn_positions, topn_metrics
end


"""
`similarity(wv, word1, word2)`

Return the cosine similarity value between two words `word1` and `word2`.
"""
function similarity(wv::WordVectors, word1, word2)
    return get_vector(wv, word1)'*get_vector(wv, word2)
end


"""
`cosine_similar_words(wv, word, n=10)`

Return the top `n` most similar words to `word` from the WordVectors `wv`.
"""
function cosine_similar_words(wv::WordVectors, word, n=10)
    indx, metr = cosine(wv, word, n)
    return vocabulary(wv)[indx]
end


"""
`analogy(wv, pos, neg, n=5)`

Compute the analogy similarity between two lists of words. The positions
and the similarity values of the top `n` similar words will be returned. 
For example, 
`king - man + woman = queen` will be 
`pos=[\"king\", \"woman\"], neg=[\"man\"]`.
"""
function analogy(wv::WordVectors, pos::AbstractArray, neg::AbstractArray, n= 5)
    m, n_vocab = size(wv)
    n_pos = length(pos)
    n_neg = length(neg)
    anal_vecs = Array(AbstractFloat, m, n_pos + n_neg)
 
    for (i, word) in enumerate(pos)
        anal_vecs[:,i] = get_vector(wv, word)
    end
    for (i, word) in enumerate(neg)
        anal_vecs[:,i+n_pos] = -get_vector(wv, word)
    end
    mean_vec = mean(anal_vecs, 2)
    metrics = wv.vectors'*mean_vec
    top_positions = sortperm(metrics[:], rev = true)[1:n+n_pos+n_neg]
    for word in [pos;neg]
        idx = index(wv, word)
        loc = findfirst(top_positions, idx)
        if loc != 0
            splice!(top_positions, loc)
        end
    end
    topn_positions = top_positions[1:n]
    topn_metrics = metrics[topn_positions]
    return topn_positions, topn_metrics
end

"""
`analogy_words(wv, pos, neg, n=5)`

Return the top `n` words computed by analogy similarity between
positive words `pos` and negaive words `neg`. from the WordVectors `wv`. 
"""
function analogy_words(wv, pos, neg, n=5)
    indx, metr = analogy(wv, pos, neg, n)
    return vocabulary(wv)[indx]
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
        vectors = Array(AbstractFloat, vector_size, vocab_size)
        for (i, line) in enumerate(readlines(f))
            #println(line)
            line = strip(line)
            parts = split(line, ' ')
            word = parts[1]
            vector = float(parts[2:end])
            vocab[i] = word
            vectors[:,i] = vector./norm(vector) #unit vector
        end
       return WordVectors(vocab, vectors) 
    end    
end
