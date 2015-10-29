# Word2Vec


<a id="method__analogy.1" class="lexicon_definition"></a>
#### analogy(wv::Word2Vec.WordVectors,  pos::AbstractArray{T, N},  neg::AbstractArray{T, N}) [¶](#method__analogy.1)
`analogy(wv, pos, neg, n=5)`

Compute the analogy similarity between two lists of words. The positions
and the similarity values of the top `n` similar words will be returned. 
For example, 
`king - man + woman = queen` will be 
`pos=["king", "woman"], neg=["man"]`.


*source:*
[Word2Vec/src/wordvectors.jl:99](https://github.com/weijianzhang/Word2Vec.jl/tree/3f7e990c64567e7f2ecc267b289e6ef1cfdb567d/src/wordvectors.jl#L99)

---

<a id="method__analogy.2" class="lexicon_definition"></a>
#### analogy(wv::Word2Vec.WordVectors,  pos::AbstractArray{T, N},  neg::AbstractArray{T, N},  n) [¶](#method__analogy.2)
`analogy(wv, pos, neg, n=5)`

Compute the analogy similarity between two lists of words. The positions
and the similarity values of the top `n` similar words will be returned. 
For example, 
`king - man + woman = queen` will be 
`pos=["king", "woman"], neg=["man"]`.


*source:*
[Word2Vec/src/wordvectors.jl:99](https://github.com/weijianzhang/Word2Vec.jl/tree/3f7e990c64567e7f2ecc267b289e6ef1cfdb567d/src/wordvectors.jl#L99)

---

<a id="method__analogy_words.1" class="lexicon_definition"></a>
#### analogy_words(wv,  pos,  neg) [¶](#method__analogy_words.1)
`analogy_words(wv, pos, neg, n=5)`

Return the top `n` words computed by analogy similarity between
positive words `pos` and negaive words `neg`. from the WordVectors `wv`. 


*source:*
[Word2Vec/src/wordvectors.jl:132](https://github.com/weijianzhang/Word2Vec.jl/tree/3f7e990c64567e7f2ecc267b289e6ef1cfdb567d/src/wordvectors.jl#L132)

---

<a id="method__analogy_words.2" class="lexicon_definition"></a>
#### analogy_words(wv,  pos,  neg,  n) [¶](#method__analogy_words.2)
`analogy_words(wv, pos, neg, n=5)`

Return the top `n` words computed by analogy similarity between
positive words `pos` and negaive words `neg`. from the WordVectors `wv`. 


*source:*
[Word2Vec/src/wordvectors.jl:132](https://github.com/weijianzhang/Word2Vec.jl/tree/3f7e990c64567e7f2ecc267b289e6ef1cfdb567d/src/wordvectors.jl#L132)

---

<a id="method__cosine.1" class="lexicon_definition"></a>
#### cosine(wv::Word2Vec.WordVectors,  word) [¶](#method__cosine.1)
`cosine(wv, word, n=10)`

Return the position of `n` neighbors of `word` and cosine similarity 


*source:*
[Word2Vec/src/wordvectors.jl:61](https://github.com/weijianzhang/Word2Vec.jl/tree/3f7e990c64567e7f2ecc267b289e6ef1cfdb567d/src/wordvectors.jl#L61)

---

<a id="method__cosine.2" class="lexicon_definition"></a>
#### cosine(wv::Word2Vec.WordVectors,  word,  n) [¶](#method__cosine.2)
`cosine(wv, word, n=10)`

Return the position of `n` neighbors of `word` and cosine similarity 


*source:*
[Word2Vec/src/wordvectors.jl:61](https://github.com/weijianzhang/Word2Vec.jl/tree/3f7e990c64567e7f2ecc267b289e6ef1cfdb567d/src/wordvectors.jl#L61)

---

<a id="method__cosine_similar_words.1" class="lexicon_definition"></a>
#### cosine_similar_words(wv::Word2Vec.WordVectors,  word) [¶](#method__cosine_similar_words.1)
`cosine_similar_words(wv, word, n=10)`

Return the top `n` most similar words to `word` from the WordVectors `wv`.


*source:*
[Word2Vec/src/wordvectors.jl:84](https://github.com/weijianzhang/Word2Vec.jl/tree/3f7e990c64567e7f2ecc267b289e6ef1cfdb567d/src/wordvectors.jl#L84)

---

<a id="method__cosine_similar_words.2" class="lexicon_definition"></a>
#### cosine_similar_words(wv::Word2Vec.WordVectors,  word,  n) [¶](#method__cosine_similar_words.2)
`cosine_similar_words(wv, word, n=10)`

Return the top `n` most similar words to `word` from the WordVectors `wv`.


*source:*
[Word2Vec/src/wordvectors.jl:84](https://github.com/weijianzhang/Word2Vec.jl/tree/3f7e990c64567e7f2ecc267b289e6ef1cfdb567d/src/wordvectors.jl#L84)

---

<a id="method__get_vector.1" class="lexicon_definition"></a>
#### get_vector(wv::Word2Vec.WordVectors,  word) [¶](#method__get_vector.1)
`get_vector(wv, word)`

Return the vector representation of `word` from the WordVectors `wv`. 


*source:*
[Word2Vec/src/wordvectors.jl:53](https://github.com/weijianzhang/Word2Vec.jl/tree/3f7e990c64567e7f2ecc267b289e6ef1cfdb567d/src/wordvectors.jl#L53)

---

<a id="method__in_vocabulary.1" class="lexicon_definition"></a>
#### in_vocabulary(wv::Word2Vec.WordVectors,  word::AbstractString) [¶](#method__in_vocabulary.1)
`in_vocabulary(wv, word)`

Return `true` if `word` is part of the vocabulary of `wv` and `false` otherwise.


*source:*
[Word2Vec/src/wordvectors.jl:31](https://github.com/weijianzhang/Word2Vec.jl/tree/3f7e990c64567e7f2ecc267b289e6ef1cfdb567d/src/wordvectors.jl#L31)

---

<a id="method__index.1" class="lexicon_definition"></a>
#### index(wv::Word2Vec.WordVectors,  word) [¶](#method__index.1)
`index(wv, word)`

Return the index of `word` from the WordVectors `wv`.


*source:*
[Word2Vec/src/wordvectors.jl:46](https://github.com/weijianzhang/Word2Vec.jl/tree/3f7e990c64567e7f2ecc267b289e6ef1cfdb567d/src/wordvectors.jl#L46)

---

<a id="method__similarity.1" class="lexicon_definition"></a>
#### similarity(wv::Word2Vec.WordVectors,  word1,  word2) [¶](#method__similarity.1)
`similarity(wv, word1, word2)`

Return the cosine similarity value between two words `word1` and `word2`.


*source:*
[Word2Vec/src/wordvectors.jl:74](https://github.com/weijianzhang/Word2Vec.jl/tree/3f7e990c64567e7f2ecc267b289e6ef1cfdb567d/src/wordvectors.jl#L74)

---

<a id="method__vocabulary.1" class="lexicon_definition"></a>
#### vocabulary(wv::Word2Vec.WordVectors) [¶](#method__vocabulary.1)
`vocabulary(wv)` 

Return all the vocabulary of the WordVectors `wv`.


*source:*
[Word2Vec/src/wordvectors.jl:24](https://github.com/weijianzhang/Word2Vec.jl/tree/3f7e990c64567e7f2ecc267b289e6ef1cfdb567d/src/wordvectors.jl#L24)

---

<a id="method__word2vec.1" class="lexicon_definition"></a>
#### word2vec(train,  output) [¶](#method__word2vec.1)
`word2vec(train, output; size=100, window=5, sample=1e-3, hs=0,  negative=5, threads=12, iter=5, min_count=5, alpha=0.025, debug=2, binary=1, cbow=1, save_vocal=None, read_vocab=None, verbose=false,)`

    Parameters for training:
        train <file>
            Use text data from <file> to train the model
        output <file>
            Use <file> to save the resulting word vectors / word clusters
        size <int>
            Set size of word vectors; default is 100
        window <int>
            Set max skip length between words; default is 5
        sample <float>
            Set threshold for occurrence of words. Those that appear with
            higher frequency in the training data will be randomly
            down-sampled; default is 0 (off), useful value is 1e-5
        hs <int>
            Use Hierarchical Softmax; default is 1 (0 = not used)
        negative <int>
            Number of negative examples; default is 0, common values are 5 - 10
            (0 = not used)
        threads <int>
            Use <int> threads (default 1)
        min_count <int>
            This will discard words that appear less than <int> times; default
            is 5
        alpha <float>
            Set the starting learning rate; default is 0.025
        debug <int>
            Set the debug mode (default = 2 = more info during training)
        binary <int>
            Save the resulting vectors in binary moded; default is 0 (off)
        cbow <int>
            Use the continuous back of words model; default is 1 (skip-gram
            model)
        save_vocab <file>
            The vocabulary will be saved to <file>
        read_vocab <file>
            The vocabulary will be read from <file>, not constructed from the
            training data
        verbose
            Print output from training 


*source:*
[Word2Vec/src/interface.jl:44](https://github.com/weijianzhang/Word2Vec.jl/tree/3f7e990c64567e7f2ecc267b289e6ef1cfdb567d/src/interface.jl#L44)

---

<a id="method__wordvectors.1" class="lexicon_definition"></a>
#### wordvectors(fname::AbstractString) [¶](#method__wordvectors.1)
`wordvectors(fname)`

Generate a WordVectors type object from the file `fname`. 


*source:*
[Word2Vec/src/wordvectors.jl:143](https://github.com/weijianzhang/Word2Vec.jl/tree/3f7e990c64567e7f2ecc267b289e6ef1cfdb567d/src/wordvectors.jl#L143)

---

<a id="method__wordvectors.2" class="lexicon_definition"></a>
#### wordvectors(fname::AbstractString,  kind::Symbol) [¶](#method__wordvectors.2)
`wordvectors(fname)`

Generate a WordVectors type object from the file `fname`. 


*source:*
[Word2Vec/src/wordvectors.jl:143](https://github.com/weijianzhang/Word2Vec.jl/tree/3f7e990c64567e7f2ecc267b289e6ef1cfdb567d/src/wordvectors.jl#L143)

## Internal

---

<a id="method__size.1" class="lexicon_definition"></a>
#### size(wv::Word2Vec.WordVectors) [¶](#method__size.1)
`size(wv)`

Return the size of the WordVectors `wv`. 


*source:*
[Word2Vec/src/wordvectors.jl:38](https://github.com/weijianzhang/Word2Vec.jl/tree/3f7e990c64567e7f2ecc267b289e6ef1cfdb567d/src/wordvectors.jl#L38)

