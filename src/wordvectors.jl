mutable struct WordVectors{S<:AbstractString, T<:Real, H<:Integer}
    vocab::Vector{S} # vocabulary
    vectors::Array{T, 2} # the vectors computed from word2vec
    vocab_hash::Dict{S, H}
end

function WordVectors(vocab::AbstractArray{S,1},
                     vectors::AbstractArray{T,2}) where {S<: AbstractString, T<:Real}
    length(vocab) == size(vectors, 2) ||
        throw(DimensionMismatch("Dimension of vocab and vectors are inconsistent."))
    vocab_hash = Dict{S, Int}()
    for (i, word) in enumerate(vocab)
        vocab_hash[word] = i
    end
    WordVectors(vocab, vectors, vocab_hash)
end


function Base.show(io::IO, wv::WordVectors{S,T}) where {S,T}
    len_vecs, num_words = size(wv.vectors)
    print(io, "WordVectors $(num_words) words, $(len_vecs)-element $(T) vectors")
end


"""
    vocabulary(wv)

Return the vocabulary as a vector of words of the WordVectors `wv`.
"""
vocabulary(wv::WordVectors) = wv.vocab


"""
    in_vocabulary(wv, word)

Return `true` if `word` is part of the vocabulary of the WordVector `wv` and
`false` otherwise.
"""
in_vocabulary(wv::WordVectors, word::AbstractString) = word in wv.vocab


"""
    size(wv)

Return the word vector length and the number of words as a tuple.
"""
size(wv::WordVectors) = size(wv.vectors)


"""
    index(wv, word)

Return the index of `word` from the WordVectors `wv`.
"""
index(wv::WordVectors, word) = wv.vocab_hash[word]


"""
    get_vector(wv, word)

Return the vector representation of `word` from the WordVectors `wv`.
"""
get_vector(wv::WordVectors, word) =
      (idx = wv.vocab_hash[word]; wv.vectors[:,idx])


"""
    cosine(wv, word, n=10)

Return the position of `n` (by default `n = 10`) neighbors of `word` and their
cosine similarities.
"""
function cosine(wv::WordVectors, word, n=10)
    metrics = wv.vectors'*get_vector(wv, word)
    topn_positions = sortperm(metrics[:], rev = true)[1:n]
    topn_metrics = metrics[topn_positions]
    return topn_positions, topn_metrics
end


"""
    similarity(wv, word1, word2)

Return the cosine similarity value between two words `word1` and `word2`.
"""
function similarity(wv::WordVectors, word1, word2)
    return get_vector(wv, word1)'*get_vector(wv, word2)
end


"""
    cosine_similar_words(wv, word, n=10)

Return the top `n` (by default `n = 10`) most similar words to `word`
from the WordVectors `wv`.
"""
function cosine_similar_words(wv::WordVectors, word, n=10)
    indx, metr = cosine(wv, word, n)
    return vocabulary(wv)[indx]
end


"""
    analogy(wv, pos, neg, n=5)

Compute the analogy similarity between two lists of words. The positions
and the similarity values of the top `n` similar words will be returned.
For example,
`king - man + woman = queen` will be
`pos=[\"king\", \"woman\"], neg=[\"man\"]`.
"""
function analogy(wv::WordVectors{S,T,H}, pos::AbstractArray, neg::AbstractArray, n= 5
                ) where {S<:AbstractString, T<:Real, H<:Integer}
    m, n_vocab = size(wv)
    n_pos = length(pos)
    n_neg = length(neg)
    anal_vecs = Matrix{T}(undef, m, n_pos + n_neg)

    for (i, word) in enumerate(pos)
        anal_vecs[:,i] = get_vector(wv, word)
    end
    for (i, word) in enumerate(neg)
        anal_vecs[:,i+n_pos] = -get_vector(wv, word)
    end
    mean_vec = mean(anal_vecs, dims=2)
    metrics = wv.vectors'*mean_vec
    top_positions = sortperm(metrics[:], rev = true)[1:n+n_pos+n_neg]
    for word in [pos;neg]
        idx = index(wv, word)
        loc = findfirst(x->x==idx, top_positions)
        if loc != nothing
            splice!(top_positions, loc)
        end
    end
    topn_positions = top_positions[1:n]
    topn_metrics = metrics[topn_positions]
    return topn_positions, topn_metrics
end


"""
    analogy_words(wv, pos, neg, n=5)

Return the top `n` words computed by analogy similarity between
positive words `pos` and negaive words `neg`. from the WordVectors `wv`.
"""
function analogy_words(wv::WordVectors, pos, neg, n=5)
    indx, metr = analogy(wv, pos, neg, n)
    return vocabulary(wv)[indx]
end


"""
    wordvectors(filename [,type=Float64][; kind=:text, skip=false, normalize=true])

Generate a WordVectors type object from a file.

# Arguments
  * `filename::AbstractString` the embeddings file name
  * `type::Type` type of the embedding vector elements; default `Float64`

# Keyword arguments
  * `kind::Symbol` specifies whether the embeddings file is textual (`:text`)
or binary (`:binary`); default `:text`
  * `skip::Bool` in binary embeddings files specifies whether the newline
byte is missing or not (use `true` for Google pre-trained models); default `false`
  * `normalize:Bool` specifies whether to normalize the embedding vectors
i.e. return unit vectors; default true
"""
function wordvectors(filename::AbstractString,
                     ::Type{T};
                     kind::Symbol=:text,
                     skip::Bool=false,
                     normalize::Bool=true) where T <: Real
    if kind == :binary
        return _from_binary(T, filename, skip, normalize)
    elseif kind == :text
        return _from_text(T, filename, normalize)
    else
        throw(ArgumentError("Unknown embedding file kind $(kind)"))
    end
end


wordvectors(filename::AbstractString;
            kind::Symbol=:text,
            skip::Bool=false,
            normalize::Bool=true) =
    wordvectors(filename, Float64, kind=kind, normalize=normalize)


# Generate a WordVectors object from binary file
function _from_binary(::Type{T},
                      filename::AbstractString,
                      skip::Bool=true,
                      normalize::Bool=true) where T<:Real
    sb = ifelse(skip, 0, 1)
    open(filename) do f
        header = strip(readline(f))
        vocab_size,vector_size = map(x -> parse(Int, x), split(header, ' '))
        vocab = Vector{String}(undef, vocab_size)
        vectors = zeros(T, vector_size, vocab_size)
        binary_length = sizeof(Float32) * vector_size
        for i in 1:vocab_size
            vocab[i] = strip(readuntil(f, ' '))
            vector = reinterpret(Float32, read(f, binary_length))
            if normalize
                vector = vector ./ norm(vector)  # unit vector
            end
            vectors[:,i] = T.(vector)
            read(f, sb) # new line
        end
        return WordVectors(vocab, vectors)
    end
end

# Generate a WordVectors object from text file
function _from_text(::Type{T}, filename::AbstractString, normalize::Bool=true) where T<:Real
    open(filename) do f
        header = strip(readline(f))
        vocab_size,vector_size = map(x -> parse(Int, x), split(header, ' '))
        vocab = Vector{String}(undef, vocab_size)
        vectors = Matrix{T}(undef, vector_size, vocab_size)
        for (i, line) in enumerate(readlines(f))
            line = strip(line)
            parts = split(line, ' ')
            word = parts[1]
            vector = map(x-> parse(T, x), parts[2:end])
            vocab[i] = word
            if normalize
                vector = vector ./ norm(vector)  # unit vector
            end
            vectors[:, i] = vector
        end
       return WordVectors(vocab, vectors)
    end
end
