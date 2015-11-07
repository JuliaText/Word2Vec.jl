# Word2Vec


<a id="method__analogy.1" class="lexicon_definition"></a>
#### analogy(wv::Word2Vec.WordVectors{S<:AbstractString, T<:Real, H<:Integer},  pos::AbstractArray{T, N},  neg::AbstractArray{T, N}) [¶](#method__analogy.1)
`analogy(wv, pos, neg, n=5)`

Compute the analogy similarity between two lists of words. The positions
and the similarity values of the top `n` similar words will be returned. 
For example, 
`king - man + woman = queen` will be 
`pos=["king", "woman"], neg=["man"]`.


*source:*
[Word2Vec/src/wordvectors.jl:102](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordvectors.jl#L102)

---

<a id="method__analogy.2" class="lexicon_definition"></a>
#### analogy(wv::Word2Vec.WordVectors{S<:AbstractString, T<:Real, H<:Integer},  pos::AbstractArray{T, N},  neg::AbstractArray{T, N},  n) [¶](#method__analogy.2)
`analogy(wv, pos, neg, n=5)`

Compute the analogy similarity between two lists of words. The positions
and the similarity values of the top `n` similar words will be returned. 
For example, 
`king - man + woman = queen` will be 
`pos=["king", "woman"], neg=["man"]`.


*source:*
[Word2Vec/src/wordvectors.jl:102](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordvectors.jl#L102)

---

<a id="method__analogy_words.1" class="lexicon_definition"></a>
#### analogy_words(wv::Word2Vec.WordVectors{S<:AbstractString, T<:Real, H<:Integer},  pos,  neg) [¶](#method__analogy_words.1)
`analogy_words(wv, pos, neg, n=5)`

Return the top `n` words computed by analogy similarity between
positive words `pos` and negaive words `neg`. from the WordVectors `wv`. 


*source:*
[Word2Vec/src/wordvectors.jl:135](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordvectors.jl#L135)

---

<a id="method__analogy_words.2" class="lexicon_definition"></a>
#### analogy_words(wv::Word2Vec.WordVectors{S<:AbstractString, T<:Real, H<:Integer},  pos,  neg,  n) [¶](#method__analogy_words.2)
`analogy_words(wv, pos, neg, n=5)`

Return the top `n` words computed by analogy similarity between
positive words `pos` and negaive words `neg`. from the WordVectors `wv`. 


*source:*
[Word2Vec/src/wordvectors.jl:135](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordvectors.jl#L135)

---

<a id="method__clusters.1" class="lexicon_definition"></a>
#### clusters(wc::Word2Vec.WordClusters) [¶](#method__clusters.1)
`clusters(wc)`

Return all the clusters from the WordClusters `wc`.


*source:*
[Word2Vec/src/wordclusters.jl:52](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordclusters.jl#L52)

---

<a id="method__cosine.1" class="lexicon_definition"></a>
#### cosine(wv::Word2Vec.WordVectors{S<:AbstractString, T<:Real, H<:Integer},  word) [¶](#method__cosine.1)
`cosine(wv, word, n=10)`

Return the position of `n` neighbors of `word` and cosine similarity 


*source:*
[Word2Vec/src/wordvectors.jl:64](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordvectors.jl#L64)

---

<a id="method__cosine.2" class="lexicon_definition"></a>
#### cosine(wv::Word2Vec.WordVectors{S<:AbstractString, T<:Real, H<:Integer},  word,  n) [¶](#method__cosine.2)
`cosine(wv, word, n=10)`

Return the position of `n` neighbors of `word` and cosine similarity 


*source:*
[Word2Vec/src/wordvectors.jl:64](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordvectors.jl#L64)

---

<a id="method__cosine_similar_words.1" class="lexicon_definition"></a>
#### cosine_similar_words(wv::Word2Vec.WordVectors{S<:AbstractString, T<:Real, H<:Integer},  word) [¶](#method__cosine_similar_words.1)
`cosine_similar_words(wv, word, n=10)`

Return the top `n` most similar words to `word` from the WordVectors `wv`.


*source:*
[Word2Vec/src/wordvectors.jl:87](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordvectors.jl#L87)

---

<a id="method__cosine_similar_words.2" class="lexicon_definition"></a>
#### cosine_similar_words(wv::Word2Vec.WordVectors{S<:AbstractString, T<:Real, H<:Integer},  word,  n) [¶](#method__cosine_similar_words.2)
`cosine_similar_words(wv, word, n=10)`

Return the top `n` most similar words to `word` from the WordVectors `wv`.


*source:*
[Word2Vec/src/wordvectors.jl:87](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordvectors.jl#L87)

---

<a id="method__get_cluster.1" class="lexicon_definition"></a>
#### get_cluster(wc::Word2Vec.WordClusters,  word) [¶](#method__get_cluster.1)
`get_cluster(wc, word)`

Return the cluster number for a word in the vocabulary.


*source:*
[Word2Vec/src/wordclusters.jl:45](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordclusters.jl#L45)

---

<a id="method__get_vector.1" class="lexicon_definition"></a>
#### get_vector(wv::Word2Vec.WordVectors{S<:AbstractString, T<:Real, H<:Integer},  word) [¶](#method__get_vector.1)
`get_vector(wv, word)`

Return the vector representation of `word` from the WordVectors `wv`. 


*source:*
[Word2Vec/src/wordvectors.jl:56](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordvectors.jl#L56)

---

<a id="method__get_words.1" class="lexicon_definition"></a>
#### get_words(wc::Word2Vec.WordClusters,  cluster::Int64) [¶](#method__get_words.1)
`get_words(wc, cluster)`

For the WordCluster `wc`, return all the words from a given cluster
number `cluster`.


*source:*
[Word2Vec/src/wordclusters.jl:60](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordclusters.jl#L60)

---

<a id="method__in_vocabulary.1" class="lexicon_definition"></a>
#### in_vocabulary(wc::Word2Vec.WordClusters,  word::AbstractString) [¶](#method__in_vocabulary.1)
`in_vocabulary(wc, word)`

For the WordCluters `wc`, return `true` if `word` is part of the 
vocabulary of `wc` and `false` otherwise.


*source:*
[Word2Vec/src/wordclusters.jl:31](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordclusters.jl#L31)

---

<a id="method__in_vocabulary.2" class="lexicon_definition"></a>
#### in_vocabulary(wv::Word2Vec.WordVectors{S<:AbstractString, T<:Real, H<:Integer},  word::AbstractString) [¶](#method__in_vocabulary.2)
`in_vocabulary(wv, word)`

Return `true` if `word` is part of the vocabulary of `wv` and `false` otherwise.


*source:*
[Word2Vec/src/wordvectors.jl:34](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordvectors.jl#L34)

---

<a id="method__index.1" class="lexicon_definition"></a>
#### index(wc::Word2Vec.WordClusters,  word) [¶](#method__index.1)
`index(wc, word)`

Return the index of `word` from the WordCluaters `wc`.


*source:*
[Word2Vec/src/wordclusters.jl:38](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordclusters.jl#L38)

---

<a id="method__index.2" class="lexicon_definition"></a>
#### index(wv::Word2Vec.WordVectors{S<:AbstractString, T<:Real, H<:Integer},  word) [¶](#method__index.2)
`index(wv, word)`

Return the index of `word` from the WordVectors `wv`.


*source:*
[Word2Vec/src/wordvectors.jl:49](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordvectors.jl#L49)

---

<a id="method__similarity.1" class="lexicon_definition"></a>
#### similarity(wv::Word2Vec.WordVectors{S<:AbstractString, T<:Real, H<:Integer},  word1,  word2) [¶](#method__similarity.1)
`similarity(wv, word1, word2)`

Return the cosine similarity value between two words `word1` and `word2`.


*source:*
[Word2Vec/src/wordvectors.jl:77](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordvectors.jl#L77)

---

<a id="method__size.1" class="lexicon_definition"></a>
#### size(wv::Word2Vec.WordVectors{S<:AbstractString, T<:Real, H<:Integer}) [¶](#method__size.1)
`size(wv)`

Return the size of the WordVectors `wv`. 


*source:*
[Word2Vec/src/wordvectors.jl:41](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordvectors.jl#L41)

---

<a id="method__vocabulary.1" class="lexicon_definition"></a>
#### vocabulary(wc::Word2Vec.WordClusters) [¶](#method__vocabulary.1)
`vocabulary(wc)` 

Return all the vocabulary of the WordClusters `wc`.


*source:*
[Word2Vec/src/wordclusters.jl:23](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordclusters.jl#L23)

---

<a id="method__vocabulary.2" class="lexicon_definition"></a>
#### vocabulary(wv::Word2Vec.WordVectors{S<:AbstractString, T<:Real, H<:Integer}) [¶](#method__vocabulary.2)
`vocabulary(wv)` 

Return all the vocabulary of the WordVectors `wv`.


*source:*
[Word2Vec/src/wordvectors.jl:27](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordvectors.jl#L27)

---

<a id="method__word2clusters.1" class="lexicon_definition"></a>
#### word2clusters(train::AbstractString,  output::AbstractString,  classes::Int64) [¶](#method__word2clusters.1)
`word2cluster(train, output, classes; size=100, window=5, sample=1e-3, hs=0,  negative=5, threads=1, iter=5, min_count=5, alpha=0.025, debug=2, binary=1, cbow=1, save_vocal=Void(), read_vocab=Void(), verbose=false,)`

    Parameters for training:
        train <file>
            Use text data from <file> to train the model
        output <file>
            Use <file> to save the resulting word vectors / word clusters
        size <Int>
            Set size of word vectors; default is 100
        window <Int>
            Set max skip length between words; default is 5
        sample <AbstractFloat>
            Set threshold for occurrence of words. Those that appear with
            higher frequency in the training data will be randomly
            down-sampled; default is 0 (off), useful value is 1e-5
        hs <Int>
            Use Hierarchical Softmax; default is 1 (0 = not used)
        negative <Int>
            Number of negative examples; default is 0, common values are 5 - 10
            (0 = not used)
        threads <Int>
            Use <Int> threads (default 1)
        iter <Int>
            Run more training iterations (default 5)
        min_count <Int>
            This will discard words that appear less than <Int> times; default
            is 5
        alpha <AbstractFloat>
            Set the starting learning rate; default is 0.025
        classes <Int>
            Output word classes rather than word vectors; default number of 
            classes is 0.    
        debug <Int>
            Set the debug mode (default = 2 = more info during training)
        binary <Int>
            Save the resulting vectors in binary moded; default is 0 (off)
        cbow <Int>
            Use the continuous back of words model; default is 1 (skip-gram
            model)
        save_vocab <file>
            The vocabulary will be saved to <file>
        read_vocab <file>
            The vocabulary will be read from <file>, not constructed from the
            training data
        verbose <Bool>
            Print output from training 


*source:*
[Word2Vec/src/interface.jl:126](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/interface.jl#L126)

---

<a id="method__word2phrase.1" class="lexicon_definition"></a>
#### word2phrase(train::AbstractString,  output::AbstractString) [¶](#method__word2phrase.1)
`word2phrase(train, output; min_count=5, threshold=100, debug=2)`

    Parameters for training:
	train <file>
	      Use text data from <file> to train the model 
	output <file>
              Use <file> to save the resulting word vectors / 
              word clusters / phrases
	min_count <Int>
              This will discard words that appear less than <int> times; 
              default is 5
	threshold <AbstractFloat>
      	      The <AbstractFloat> value represents threshold for 
              forming the phrases (higher means less phrases); default 100
	debug <Int>
	      Set the debug mode (default = 2 = more info during training)


*source:*
[Word2Vec/src/interface.jl:174](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/interface.jl#L174)

---

<a id="method__word2vec.1" class="lexicon_definition"></a>
#### word2vec(train::AbstractString,  output::AbstractString) [¶](#method__word2vec.1)
`word2vec(train, output; size=100, window=5, sample=1e-3, hs=0,  negative=5, threads=12, iter=5, min_count=5, alpha=0.025, debug=2, binary=1, cbow=1, save_vocal=Void(), read_vocab=Void(), verbose=false,)`

    Parameters for training:
        train <file>
            Use text data from <file> to train the model
        output <file>
            Use <file> to save the resulting word vectors / word clusters
        size <Int>
            Set size of word vectors; default is 100
        window <Int>
            Set max skip length between words; default is 5
        sample <AbstractFloat>
            Set threshold for occurrence of words. Those that appear with
            higher frequency in the training data will be randomly
            down-sampled; default is 1e-5.
        hs <Int>
            Use Hierarchical Softmax; default is 1 (0 = not used)
        negative <Int>
            Number of negative examples; default is 0, common values are 
            5 - 10 (0 = not used)
        threads <Int>
            Use <Int> threads (default 12)
        iter <Int>
            Run more training iterations (default 5)
        min_count <Int>
            This will discard words that appear less than <Int> times; default
            is 5
        alpha <AbstractFloat>
            Set the starting learning rate; default is 0.025
        debug <Int>
            Set the debug mode (default = 2 = more info during training)
        binary <Int>
            Save the resulting vectors in binary moded; default is 0 (off)
        cbow <Int>
            Use the continuous back of words model; default is 1 (skip-gram
            model)
        save_vocab <file>
            The vocabulary will be saved to <file>
        read_vocab <file>
            The vocabulary will be read from <file>, not constructed from the
            training data
        verbose <Bool>
            Print output from training 


*source:*
[Word2Vec/src/interface.jl:46](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/interface.jl#L46)

---

<a id="method__wordclusters.1" class="lexicon_definition"></a>
#### wordclusters(fname::AbstractString) [¶](#method__wordclusters.1)
`wordclusters(fname)`

Generate a WordClusters type object from the text file `fname`. 


*source:*
[Word2Vec/src/wordclusters.jl:70](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordclusters.jl#L70)

---

<a id="method__wordvectors.1" class="lexicon_definition"></a>
#### wordvectors{T<:Real}(fname::AbstractString,  ::Type{T<:Real}) [¶](#method__wordvectors.1)
`wordvectors(fname [,type=Float64][; kind=:text])`

Generate a WordVectors type object from the file `fname`, where
`type` is the element of the vectors.
The file format can be either text (kind=`:text`) or 
binary (kind=`:binary`).


*source:*
[Word2Vec/src/wordvectors.jl:149](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordvectors.jl#L149)

---

<a id="method__wordvectors.2" class="lexicon_definition"></a>
#### wordvectors{T<:Real}(fname::AbstractString,  ::Type{T<:Real},  kind::Symbol) [¶](#method__wordvectors.2)
`wordvectors(fname [,type=Float64][, kind=:text])`

Generate a WordVectors type object from the file `fname`, where
`type` is the element of the vectors.
The file format can be either text (kind=`:text`) or 
binary (kind=`:binary`).


*source:*
[Word2Vec/src/wordvectors.jl:149](https://github.com/weijianzhang/Word2Vec.jl/tree/03837ac1e50ca2f996d8a9d8b21be5dab961e015/src/wordvectors.jl#L149)

