"""
    accumulate(Ns::Vector{Any}; sampling_order::Vector{Int64})

Generate a network accumulation curve by randomly sampling local binary networks and combining them. The order of sampling is given by the sampling_order argument.
"""
function accumulate(Ns::Vector{Any}; sampling_order::Vector{Int64})
    
    # network accumulation vector
    N_acc = []

    # select initial network randomly
    N = Ns[sampling_order[1]]
    push!(N_acc, N)

    for i in 2:length(sampling_order)
        # select following network
        N2 = Ns[sampling_order[i]]

        # combine networks
        N = union(N, N2)
        push!(N_acc, N)
    end
    return N_acc
end


"""
    accumulate(Ns_obj::Vector, M::UnipartiteProbabilisticNetwork; sampling_order::Vector{Int64})

Generate a network accumulation curve by randomly sampling local probabilistic networks and combining them. The order of sampling is given by the sampling_order argument.
"""

function accumulate(Ns_obj::Vector, M::UnipartiteProbabilisticNetwork; sampling_order::Vector{Int64})
    
    # network accumulation vector
    N_acc = []

    # select initial network object randomly
    N_obj = Ns_obj[sampling_order[1]]
    
    # push probabilistic network 
    push!(N_acc, N_obj.N_prob)

    for i in 2:length(sampling_order)
        # select following network object
        N2_obj = Ns_obj[sampling_order[i]]

        # combine networks
        N_obj = merge_networks(N_obj, N2_obj, M)
        push!(N_acc, N_obj.N_prob)
    end
    return N_acc
end


