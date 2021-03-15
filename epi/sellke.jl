using Distributions


m = 5 # I₀ 
n = 1000 # S₀
γ = 1/5

make_infection = function(dist, x...)
    return ()->rand(dist(x...))
end

infection = make_infection(Exponential,1/5)

Q = [rand(Exponential()) for i=1:n]
sort!(Q)

T0 = [infection(γ) for i=1:m]
T = [infection(γ) for i=1:n]