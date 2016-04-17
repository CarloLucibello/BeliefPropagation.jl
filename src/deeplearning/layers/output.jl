type OutputLayer <: AbstractLayer
    l::Int
    labels::IVec
    allpd::VecVec # p(σ=up) from fact ↑ to y
end

function OutputLayer(σ::Vector{Int})
    allpd = VecVec()
    K = maximum(σ)
    if K<=1 #binary classification
        push!(allpd, Float64[(1+σ[a])/2 for a=1:length(σ)])
        out = OutputLayer(-1,σ,allpd)
    elseif K >= 2 # K-ary classification
        for k=1:K
            push!(allpd, Float64[σ[a]==k ? 1 : 0 for a=1:length(σ)])
            out = OutputLayer(-1,σ, allpd)
        end
    end

    return out
end

initrand!(layer::OutputLayer) = nothing