# BeliefPropagation
Poorly tested, use it at your own risk.

## Usage
```julia
include("src/BeliefPropagation.jl")
using BeliefPropagation
```
then see below. Take a look to `test/runtest.jl` for other examples.

## KSAT
Solve random instance with BP inspired procedures.
`solve` is the main function, and a solver `method` can be chosen
beetween `:reinforcement` (default),  `:decimation`

### Reinforcement
`r` is the initial value of the reinforcement parameter (`r=0.` default).
`r_step` determines its moltiplicative increment.
```julia
E, σ = KSATBP.solve(N=10000, α=9.6, k=4, seed_cnf=19, r_step=0.0002, maxiters=1000);
```

Read file in CNF format and solve with BP + reinforcement
```julia
E, σ = KSATBP.solve("file.cnf", r_step=0.01, maxiters=1000);
```

If having errors, try to reduce `reinf_step`.

### Decimation
*NOT WORKING AT THE MOMENT*  
After each convergence of the BP algorithm the `r*N` most biased variables are fixed.
```julia
E, σ = KSATBP.solve(method=:decimation, N=10000,α=9.6, k=4, seed_cnf=19, r=0.02, maxiters=1000);
```

## Ising
BP on pairwise Ising. Preliminary work


## Perceptron
### BP + Reinforcement
BP + reinforcement to solve binary perceptron.
```julia
g, W, E, stab = DeepBinary.solve(α=0.7, K=[1001,1]
            , layers=[:bp]
            ,r=.5,r_step=0.01, seedξ=1,maxiters=500);
```
### TAP + Reinforcement
TAP + reinforcement to solve binary perceptron.
```julia
g, W, E, stab = DeepBinary.solve(α=0.7, K=[1001,1]
            , layers=[:tap]
            ,r=.5,r_step=0.01, seedξ=1,maxiters=500);
```
### EdTAP + Reinforcement
*Work In Progress*  
Entropy driven TAP for binary perceptron.
```julia
W = PerceptronTAP.solve(N=1001,α=0.7, γ=0.4, y=4., maxiters=1000);
```

## Committee machine
```julia
g, W, E, stab = DeepBinary.solve(α=0.2, K=[1001,7,1]
            , layers=[:tap,:tapex]
            ,r=.8,r_step=0.01, seedξ=1,maxiters=500);
```
