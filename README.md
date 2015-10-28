# Word2Vec

[![Build Status](https://travis-ci.org/weijianzhang/Word2Vec.jl.svg?branch=master)](https://travis-ci.org/weijianzhang/Word2Vec.jl)

Julia interface to [word2vec](https://code.google.com/p/word2vec/)

Word2Vec takes a text corpus as input and produces the word vectors as
output. Training is done using the original C code, other
functionalities are pure Julia.

## Installation

```julia
Pkg.clone(https://github.com/weijianzhang/Word2Vec.jl)
Pkg.build("Word2Vec")
```

**Note**: Only linux and OS X are supported.

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
julia> model = wordvectors("text8-vec.txt");
```

The cosine similarity, for example, can be computed using
``cosine_similar_words``.

```julia
julia> cosine_similar_words(model, "dog")
10-element Array{AbstractString,1}:
 "dog"    
 "cat"    
 "hound"  
 "goat"   
 "ass"    
 "rat"    
 "pig"    
 "hamster"
 "bee"    
 "dogs"   

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
