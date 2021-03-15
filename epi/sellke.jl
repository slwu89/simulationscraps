using Distributions


m = 5 # I₀ 
n = 1000 # S₀
γ = 1/5
β = 1/5 * 0.015

make_infection = function(dist, x...)
    return ()->rand(dist(x...))
end

infection = make_infection(Exponential,1/5)

Q = [rand(Exponential()) for i=1:n]
sort!(Q)

T₀ = [infection() for i=1:m]
T = [infection() for i=1:n]

Λ = Vector{Float64}()
push!(Λ, sum(T₀) * β)
append!(Λ, (cumsum(T[1:end-1]) * β) .+ Λ )

Z = Q .> Λ

# Z is the number of individuals who escape infection
sum(Z)