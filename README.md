# Word2Vec

[![Build Status](https://travis-ci.org/weijianzhang/Word2Vec.jl.svg?branch=master)](https://travis-ci.org/weijianzhang/Word2Vec.jl)
[![codecov.io](https://codecov.io/github/weijianzhang/Word2Vec.jl/coverage.svg?branch=master)](https://codecov.io/github/weijianzhang/Word2Vec.jl?branch=master)

Julia interface to [word2vec](https://code.google.com/p/word2vec/)

Word2Vec takes a text corpus as input and produces the word vectors as
output. Training is done using the original C code, other
functionalities are pure Julia. See [demo](http://nbviewer.ipython.org/github/weijianzhang/Word2Vec.jl/blob/master/examples/demo.ipynb) for more details.

## Installation

```julia
Pkg.add("Word2Vec")
```

**Note**: Only linux and OS X are supported.

## Functions

All exported functions are documented, i.e., we can type `? functionname`
to get help. For a list of functions, see [here](https://github.com/weijianzhang/Word2Vec.jl/blob/master/doc/README.md).

## Examples

We first download some text corpus, for example http://mattmahoney.net/dc/text8.zip.

Suppose the file ``text8`` is stored in the current working directory.
We can train the model with the function ``word2vec``.

```julia
julia> word2vec("text8", "text8-vec.txt", verbose = true)
Starting training using file text8
Vocab size: 71291
Words in train file: 16718843
Alpha: 0.000002  Progress: 100.04%  Words/thread/sec: 350.44k  
```

Now we can import the word vectors ``text8-vec.txt`` to Julia.

```julia
julia> model = wordvectors("text8-vec.txt")
WordVectors 71291 words, 100-element vectors
```
The vector representation of a word can be obtained using
``get_vector``.

```julia
julia> get_vector(model, "book")'
1x100 Array{AbstractFloat,2}:
 0.0371017  -0.025825  0.0345965  …  0.0148279  0.0223793  -0.0312822
```

The cosine similarity of ``book``, for example, can be computed using
``cosine_similar_words``.

```julia
julia> cosine_similar_words(model, "book")
10-element Array{AbstractString,1}:
 "book"   
 "books"  
 "diary"  
 "story"  
 "chapter"
 "novel"  
 "poem"   
 "preface"
 "bible"  
 "genesis"
```

Word vectors have many interesting properties. For example, 
``vector("king") - vector("man") + vector("woman")`` is close to
``vector("queen")``.

```julia
julia> analogy_words(model, ["king", "woman"], ["man"])
5-element Array{AbstractString,1}:
 "queen"    
 "empress"  
 "elizabeth"
 "throne"   
 "princess" 
```

## References

- Tomas Mikolov, Kai Chen, Greg Corrado, and Jeffrey Dean,
  "Efficient Estimation of Word Representations in Vector Space",
  *In Proceedings of Workshop at ICLR*, 2013.
  [[pdf]](http://arxiv.org/pdf/1301.3781.pdf)

- Tomas Mikolov, Ilya Sutskever, Kai Chen, Greg Corrado, and Jeffrey Dean.
  "Distributed Representations of Words and Phrases and their
  Compositionality", *In Proceedings of NIPS*, 2013.
  [[pdf]](http://arxiv.org/pdf/1310.4546.pdf)

- Tomas Mikolov, Wen-tau Yih, and Geoffrey Zweig,
  "Linguistic Regularities in Continuous Space Word Representations",
  *In Proceedings of NAACL HLT*, 2013.
  [[pdf]](http://research.microsoft.com/pubs/189726/rvecs.pdf)

## Acknowledgements

The design of the package is inspired by Daniel Rodriguez
(@danielfrg)'s
[Python word2vec interface](https://github.com/danielfrg/word2vec).

## Reporting Bugs

Please [file an issue](https://github.com/weijianzhang/Word2Vec.jl/issues/new)
to report a bug or request a feature. 
