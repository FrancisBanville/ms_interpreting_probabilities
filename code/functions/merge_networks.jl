"""
    merge_networks(N1_obj::Any, N2_obj::Any, M::UnipartiteProbabilisticNetwork)

Merge probabilistic networks, assuming independance between pairwise interactions in different local networks.

For each pair of species in the new network, the conditional probability that an interaction occurs between them in at least one of the networks, given that they have the capacity to interact, is computed. This probability is then multiplied by the probability of potential interaction found in the metaweb.

"""

function merge_networks(N1_obj::Any, N2_obj::Any, M::UnipartiteProbabilisticNetwork)

    # get probabilistic local networks
    N1 = N1_obj.N_prob
    N2 = N2_obj.N_prob

    # get matrices of conditional probabilities
    N1_condprob = N1_obj.mat_condprob
    N2_condprob = N2_obj.mat_condprob
    
    # get species list 
    N1_species = species(N1)
    N2_species = species(N2)
    N12_species = union(N1_species, N2_species)

    # calculate number of species in merged network
    S12 = length(N12_species)

    # get matrices of potential interactions
    M_sub = M[N12_species]
    mat_potential = Matrix(M_sub.edges)

    # merge networks
    N12 = zeros(Float64, S12, S12)
    mat_condprob = zeros(Float64, S12, S12)

    for (i, spi) in enumerate(N12_species), (j, spj) in enumerate(N12_species)
        
        # get conditional probability of interaction between species i and j in network 1
        prob1 = N1_condprob[N1_species .== spi, N1_species .== spj]
        isempty(prob1) ? prob1 = 0.0 : prob1 = prob1[1]
    
        # get conditional probability of interaction between species i and j in network 2
        prob2 = N2_condprob[N2_species .== spi, N2_species .== spj]
        isempty(prob2) ? prob2 = 0.0 : prob2 = prob2[1]
    
        # get probability of potential interaction between species i and j in metaweb 
        probM = mat_potential[N12_species .== spi, N12_species .== spj][1]

        # compute conditional probability of interaction (assuming independance)
        mat_condprob[i, j] = (1 - (1 - prob1) * (1 - prob2))
        
        # compute local probability of interaction 
        N12[i, j] =  mat_condprob[i, j] * probM
    end
    
    N_prob = UnipartiteProbabilisticNetwork(N12, N12_species)
    
    return (N_prob = N_prob,  mat_condprob = mat_condprob, mat_potential = mat_potential)
end

