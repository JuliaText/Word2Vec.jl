# Word2Vec

[![License](http://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat)](LICENSE.md)
[![Build Status](https://travis-ci.org/JuliaText/Word2Vec.jl.svg?branch=master)](https://travis-ci.org/JuliaText/Word2Vec.jl)
[![Coverage Status](https://coveralls.io/repos/github/JuliaText/Word2Vec.jl/badge.svg?branch=master)](https://coveralls.io/github/JuliaText/Word2Vec.jl?branch=master)


Julia interface to [word2vec](https://code.google.com/p/word2vec/)

Word2Vec takes a text corpus as input and produces the word vectors as
output. Training is done using the original C code, other
functionalities are pure Julia. See [demo](http://nbviewer.ipython.org/github/JuliaText/Word2Vec.jl/blob/master/examples/demo.ipynb) for more details.

* [Release Notes](https://github.com/JuliaText/Word2Vec.jl/blob/master/NEWS.md)

## Installation

```julia
Pkg.add("Word2Vec")
```

**Note**: Only linux and OS X are supported.

## Functions

All exported functions are documented, i.e., we can type `? functionname`
to get help. For a list of functions, see [here](https://github.com/JuliaText/Word2Vec.jl/blob/master/doc/README.md).

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
julia> model = wordvectors("./text8-vec")
WordVectors 71291 words, 100-element Float64 vectors
```

The vector representation of a word can be obtained using
``get_vector``.

```julia
julia> get_vector(model, "book")'
100-element Array{Float64,1}:
 -0.05446138539336186
  0.001090934639284009
  0.06498087707990222
  ⋮
 -0.0024113040415322516
  0.04755140828570571
  0.039764719065723826
```

The cosine similarity of ``book``, for example, can be computed using
``cosine_similar_words``.

```julia
julia> cosine_similar_words(model, "book")
10-element Array{String,1}:
 "book"
 "books"
 "diary"
 "story"
 "chapter"
 "novel"
 "preface"
 "poem"
 "tale"
 "bible"
```

Word vectors have many interesting properties. For example, 
``vector("king") - vector("man") + vector("woman")`` is close to
``vector("queen")``.

```julia
5-element Array{String,1}:
 "queen"
 "empress"
 "prince"
 "princess"
 "throne"
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

Please [file an issue](https://github.com/JuliaText/Word2Vec.jl/issues/new) to report a bug or request a feature.
