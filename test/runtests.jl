using Word2Vec

using Test

@testset "Model training" begin
    include("train.jl")
end

@testset "Model API" begin
    include("model.jl")
end
