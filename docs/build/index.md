<a id='Word2Vec.vocabulary-Tuple{Any}' href='#Word2Vec.vocabulary-Tuple{Any}'>#</a>
**`Word2Vec.vocabulary`** &mdash; *Method*.



```
vocabulary(wc)
```

Return all the vocabulary of the WordClusters `wc`.

```
vocabulary(wv)
```

Return the vocabulary as a vector of words of the WordVectors `wv`.

<a id='Word2Vec.in_vocabulary-Tuple{Any,Any}' href='#Word2Vec.in_vocabulary-Tuple{Any,Any}'>#</a>
**`Word2Vec.in_vocabulary`** &mdash; *Method*.



```
in_vocabulary(wc, word)
```

For the WordCluters `wc`, return `true` if `word` is part of the  vocabulary of `wc` and `false` otherwise.

```
in_vocabulary(wv, word)
```

Return `true` if `word` is part of the vocabulary of the WordVector `wv` and  `false` otherwise.

<a id='Base.size-Tuple{Any}' href='#Base.size-Tuple{Any}'>#</a>
**`Base.size`** &mdash; *Method*.



```
size(A, [dim...])
```

Returns a tuple containing the dimensions of `A`. Optionally you can specify the dimension(s) you want the length of, and get the length of that dimension, or a tuple of the lengths of dimensions you asked for.:

```
julia> A = rand(2,3,4);

julia> size(A, 2)
3

julia> size(A,3,2)
(4,3)
```

```
size(wv)
```

Return the word vector length and the number of words as a tuple.  

<a id='Word2Vec.index-Tuple{Any,Any}' href='#Word2Vec.index-Tuple{Any,Any}'>#</a>
**`Word2Vec.index`** &mdash; *Method*.



```
index(wc, word)
```

Return the index of `word` from the WordCluaters `wc`.

```
index(wv, word)
```

Return the index of `word` from the WordVectors `wv`.

