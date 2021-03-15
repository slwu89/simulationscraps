using Agents
using Random
using DataFrames
using Distributions
using Plots

# let's simulate an SEIR model with birth and death, with a fixed delay in E
struct model_pars
    β::Float64
    ν::Float64
    τ::Float64
    μ::Float64
    Δt::Float64
end

# stuff all the agents need to see
mutable struct global_state
    I::Int64 # number of infectious individual
    t::Float64 # current time
end

function rate2prob(r, t)
    1 - exp(-r*t)
end

@enum state_space S E I R D

mutable struct agent
    id::Int
    λ::Float64
    state::state_space
    tnew::Float64
    statenew::state_space
end


# update one agent
function update_agent!()

end

# update all agents
function update_agents!()

end

# compute FoI on all agents
function update_FoI!(agents::Vector{agent}, p::model_pars)
    I = 0
    for a in eachindex(agents)
        if agents[a].state == I
            I += 1
        end
    end
    for a in eachindex(agents)
        if agents[a].state == S
            agents[a].λ = p.β * I
        end
    end
end

test_agents = [agent(i,0.0,S,0) for i in 1:10]
test_agents[1].state = I
test_agents[5].state = I


# function seir_model_step!(model)

# end