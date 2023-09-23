"""
    sample_networks(M::UnipartiteProbabilisticNetwork, Ns_obj::Vector)

Generate a binary realization for each local network in Ns_obj by performing a single random draw of the probabilistic metaweb M. All interactions are treated as independent Bernoulli events.
"""
function sample_networks(M::UnipartiteProbabilisticNetwork, Ns_obj::Vector)

    # perform a random draw of the metaweb
    M_draws = rand(M)

    # get binary local networks from the random ralization of the metaweb
    Ns_draws = []

    for i in 1:length(Ns_obj)
        # get local species list
        N_species = species(Ns_obj[i].N_prob)
        # get local network from the metaweb
        N_draws = M_draws[N_species]
        push!(Ns_draws, N_draws)
    end
    return simplify.(Ns_draws)
end


"""
    sample_networks(Ns_obj::Vector)

Generate a binary realization for each local network in Ns_obj by performing independent random draws of all probabilistic local networks. All interactions are treated as independent Bernoulli events.
"""

function sample_networks(Ns_obj::Vector)

    # get binary local networks from the random ralization of the probabilistic local networks
    Ns_draws = []

    for i in 1:length(Ns_obj)
        # perform random draws of the local networks
        N_draws = rand(Ns_obj[i].N_prob)
        push!(Ns_draws, N_draws)
    end
    return simplify.(Ns_draws)
end