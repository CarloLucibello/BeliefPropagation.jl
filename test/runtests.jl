include("../src/BeliefPropagation.jl")
using BeliefPropagation
using Base.Test

println("@ START TESTING")

println("@ Testing DeepLearning...")
include("deeplearning.jl")
println("@ ... done.")

println("@ Testing KSAT...")
include("kast.jl")
println("@ ... done.")

println("@ ALL TESTS PASSED!")
