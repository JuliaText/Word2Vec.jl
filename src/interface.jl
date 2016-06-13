"""
     word2vec(train, output; size=100, window=5, sample=1e-3, hs=0,  negative=5, threads=12, iter=5, min_count=5, alpha=0.025, debug=2, binary=1, cbow=1, save_vocal=Void(), read_vocab=Void(), verbose=false,)

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
"""
function word2vec(train::AbstractString, output::AbstractString; 
                  size::Int=100, window::Int=5, sample::AbstractFloat=1e-3,
                  hs::Int=0, negative::Int=5, threads::Int=12, iter::Int=5, 
                  min_count::Int=5, alpha::AbstractFloat=0.025,
                  debug::Int=2, binary::Int=0, cbow::Int=1, 
                  save_vocab=Void(), read_vocab=Void(), 
                  verbose::Bool=false)

    command = joinpath(dirname(@__FILE__), "..", "deps", "src", "word2vec-c", "./word2vec")
    parameters = AbstractString[]
    args = ["-train", "-output", "-size", "-window", "-sample", "-hs",
            "-negative", "-threads", "-iter", "-min-count", "-alpha", 
            "-debug", "-binary", "-cbow"]
    values = [train, output, size, window, sample, hs, negative, threads,
              iter, min_count, alpha, debug, binary, cbow]

    for (arg, value) in zip(args, values)
        push!(parameters, arg)
        push!(parameters, string(value))
    end
    if save_vocab != Void()
        push!(parameters, "-save-vocab")
        push!(parameters, string(save_vocab))
    end
    if read_vocab != Void()
        push!(parameters, "-read-vocab")
        push!(parameters, string(read_vocab))
    end        
    run(`$(command) $(parameters)`)
end


"""
     word2cluster(train, output, classes; size=100, window=5, sample=1e-3, hs=0,  negative=5, threads=1, iter=5, min_count=5, alpha=0.025, debug=2, binary=1, cbow=1, save_vocal=Void(), read_vocab=Void(), verbose=false,)

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
"""
function word2clusters(train::AbstractString, output::AbstractString, 
                       classes::Int; size::Int=100, window::Int=5,
                       sample::AbstractFloat=0., hs::Int=0, 
                       negative::Int=5, threads::Int=1, iter::Int=5,
                       min_count::Int=5, alpha::AbstractFloat=0.025,
                       debug::Int=2, binary::Int=0, cbow::Int=1,
                       save_vocab=Void(), read_vocab=Void(), 
                       verbose::Bool=false)
    command = joinpath(dirname(@__FILE__), "..", "deps", "src", "word2vec-c", "./word2vec")
    parameters = AbstractString[]
    args = ["-train", "-output", "-size", "-window", "-sample", "-hs",
            "-negative", "-threads", "-iter", "-min-count", "-alpha", 
            "-debug", "-binary", "-cbow", "-classes"]
    values = [train, output, size, window, sample, hs, negative, threads,
              iter, min_count, alpha, debug, binary, cbow, classes]
    for (arg, value) in zip(args, values)
        push!(parameters, arg)
        push!(parameters, string(value))
    end
    if save_vocab != Void()
        push!(parameters, "-save-vocab")
        push!(parameters, string(save_vocab))
    end
    if read_vocab != Void()
        push!(parameters, "-read-vocab")
        push!(parameters, string(read_vocab))
    end 
    run(`$(command) $(parameters)`)
end

"""
     word2phrase(train, output; min_count=5, threshold=100, debug=2)

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
"""
function word2phrase(train::AbstractString, output::AbstractString;
                     min_count::Int=5, threshold::Int=100, debug::Int=2)
    command = joinpath(dirname(@__FILE__), "..", "deps", "src", "word2vec-c", "./word2phrase")
    parameters = AbstractString[]
    args = ["-train", "-output", "-min-count", "-threshold", "-debug"]
    values = [train, output, min_count, threshold, debug]
    for (arg, value) in zip(args, values)
        push!(parameters, arg)
        push!(parameters, string(value))
    end
    run(`$(command) $(parameters)`)
end
