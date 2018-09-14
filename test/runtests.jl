using Word2Vec
if VERSION <v"0.7"
    using Base.Test
else
    using Test
end
include("train.jl") 
include("model.jl")
#include("load.jl")
println(":)")
