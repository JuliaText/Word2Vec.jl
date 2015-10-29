# Functions


<a id="method__cosine.1" class="lexicon_definition"></a>
#### cosine(wv::Word2Vec.WordVectors,  word) [¶](#method__cosine.1)
`cosine(wv, word, n=10)`

Return the position of `n` neighbors of `word` and cosine similarity 


*source:*
[Word2Vec/src/wordvectors.jl:46](https://github.com/weijianzhang/Word2Vec.jl/tree/8f2f9b2f53723f0c6282117e435e57f019d27933/src/wordvectors.jl#L46)

---

<a id="method__cosine.2" class="lexicon_definition"></a>
#### cosine(wv::Word2Vec.WordVectors,  word,  n) [¶](#method__cosine.2)
`cosine(wv, word, n=10)`

Return the position of `n` neighbors of `word` and cosine similarity 


*source:*
[Word2Vec/src/wordvectors.jl:46](https://github.com/weijianzhang/Word2Vec.jl/tree/8f2f9b2f53723f0c6282117e435e57f019d27933/src/wordvectors.jl#L46)

---

<a id="method__cosine_similar_words.1" class="lexicon_definition"></a>
#### cosine_similar_words(wv,  word) [¶](#method__cosine_similar_words.1)
`cosine_similar_words(wv, word, n=10)`

Return the top `n` most similar words to `word`.


*source:*
[Word2Vec/src/wordvectors.jl:59](https://github.com/weijianzhang/Word2Vec.jl/tree/8f2f9b2f53723f0c6282117e435e57f019d27933/src/wordvectors.jl#L59)

---

<a id="method__cosine_similar_words.2" class="lexicon_definition"></a>
#### cosine_similar_words(wv,  word,  n) [¶](#method__cosine_similar_words.2)
`cosine_similar_words(wv, word, n=10)`

Return the top `n` most similar words to `word`.


*source:*
[Word2Vec/src/wordvectors.jl:59](https://github.com/weijianzhang/Word2Vec.jl/tree/8f2f9b2f53723f0c6282117e435e57f019d27933/src/wordvectors.jl#L59)

---

<a id="method__get_vector.1" class="lexicon_definition"></a>
#### get_vector(wv::Word2Vec.WordVectors,  word) [¶](#method__get_vector.1)
`get_vector(wv, word)`

Return the vector for `word` in the WordVectors `wv`. 


*source:*
[Word2Vec/src/wordvectors.jl:39](https://github.com/weijianzhang/Word2Vec.jl/tree/8f2f9b2f53723f0c6282117e435e57f019d27933/src/wordvectors.jl#L39)

---

<a id="method__index.1" class="lexicon_definition"></a>
#### index(wv::Word2Vec.WordVectors,  word) [¶](#method__index.1)
`index(wv, word)`

Return the index of `word` in the WordVectors `wv`.


*source:*
[Word2Vec/src/wordvectors.jl:32](https://github.com/weijianzhang/Word2Vec.jl/tree/8f2f9b2f53723f0c6282117e435e57f019d27933/src/wordvectors.jl#L32)

---

<a id="method__vocabulary.1" class="lexicon_definition"></a>
#### vocabulary(wv::Word2Vec.WordVectors) [¶](#method__vocabulary.1)
`vocabulary(wv)` 

Return all the vocabulary of the WordVectors `wv`.


*source:*
[Word2Vec/src/wordvectors.jl:24](https://github.com/weijianzhang/Word2Vec.jl/tree/8f2f9b2f53723f0c6282117e435e57f019d27933/src/wordvectors.jl#L24)

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
[Word2Vec/src/interface.jl:44](https://github.com/weijianzhang/Word2Vec.jl/tree/8f2f9b2f53723f0c6282117e435e57f019d27933/src/interface.jl#L44)

---

<a id="method__wordvectors.1" class="lexicon_definition"></a>
#### wordvectors(fname::AbstractString) [¶](#method__wordvectors.1)
`wordvectors(fname)`

Generate a WordVectors type object from the file `fname`. 


*source:*
[Word2Vec/src/wordvectors.jl:69](https://github.com/weijianzhang/Word2Vec.jl/tree/8f2f9b2f53723f0c6282117e435e57f019d27933/src/wordvectors.jl#L69)

---

<a id="method__wordvectors.2" class="lexicon_definition"></a>
#### wordvectors(fname::AbstractString,  kind::Symbol) [¶](#method__wordvectors.2)
`wordvectors(fname)`

Generate a WordVectors type object from the file `fname`. 


*source:*
[Word2Vec/src/wordvectors.jl:69](https://github.com/weijianzhang/Word2Vec.jl/tree/8f2f9b2f53723f0c6282117e435e57f019d27933/src/wordvectors.jl#L69)

