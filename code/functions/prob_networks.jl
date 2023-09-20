"""
    prob_networks(N::UnipartiteNetwork, M::UnipartiteProbabilisticNetwork; p = 1.0)

Generate a probabilistic local network from a binary tripartite network N and a probabilistic tripartite metaweb M. A local probability of interaction is obtained by the product of the probability that the interaction occurs locally, given that the two species have the capacity to interact, with the probability of potential interaction. Forbidden interactions have a probability of 0. 

Probabilities of potential interactions are given by the metaweb.

A single method is currently implemented to estimate the probabilities that species interact locally if they have the biological capacity to do so.

    Method 1: These probabilities are equal to p. If p = 1, the local network will have the same probabilities as the metaweb.

"""

function prob_networks(N::UnipartiteNetwork, M::UnipartiteProbabilisticNetwork; p = 1.0)

    # compute number of species in local network
    S = length(species(N))

    # get probabilities of potential interactions
    M_sub = M[species(N)]
    mat_potential = Matrix(M_sub.edges)

    # estimate probabilities of interactions given that species can interact
    mat_condprob = zeros(Float64, S, S)

    # probability of interaction = p if species can interact
    for i in 1:S, j in 1:S
        if M_sub.edges[i, j] > 0
            mat_condprob[i,j] = p
        end
    end
    
    N_prob = UnipartiteProbabilisticNetwork(mat_condprob .* mat_potential, species(N))
    
    return (N_prob = N_prob,  mat_condprob = mat_condprob, mat_potential = mat_potential)
end

