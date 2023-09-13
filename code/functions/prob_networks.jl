"""
    prob_networks(N::UnipartiteNetwork, M::UnipartiteProbabilisticNetwork, method::String; v = 0.1)

Generate a probabilistic local network from a binary network N and a probabilistic metaweb M. A local probability of interaction is obtained by the product of the probability that the interaction occurs locally, given that the two species have the capacity to interact, with the probability of potential interactions.

Probabilities of potential interactions are given by the metaweb.

Two methods are currently implemented to estimate the probabilities that species interact locally if they have the biological capacity to do so.

    Method 1 (metaweb): These probabilities are equal to 1, which results in the local network having the same probabilities as the metaweb.

    Method 2 (redist): These probabilities are obtained by giving a penalty v to observed interactions and redistributing removed probabilities equally among all unobserved potential interactions.  

"""

function prob_networks(N::UnipartiteNetwork, M::UnipartiteProbabilisticNetwork, method::String; v = 0.1)

    # compute number of species and links in local network
    S = length(species(N))
    L = links(N)

    # compute number of species in each group
    S_salix = length(intersect(salix, species(N)))
    S_galler = length(intersect(galler, species(N)))
    S_parasitoid = length(intersect(parasitoid, species(N)))

    # get probabilities of potential interactions
    M_sub = M[species(N)]
    mat_potential = Matrix(M_sub.edges)

    # estimate probabilities of interactions given that species can interact
    mat_condprob = zeros(Float64, S, S)

    # method 1: probabilities of interactions = 1 if species can interact
    if method == "metaweb"
        for i in 1:S, j in 1:S
            if M_sub.edges[i, j] > 0
                mat_condprob[i,j] = 1
            end
        end
    end

    # method 2: redistributed probabilities
    if method == "redist"
        v_redist = v * L / (S_salix * S_galler + S_galler * S_parasitoid - L)
        
        for i in 1:S, j in 1:S
            if M_sub.edges[i, j] == 0
                mat_condprob[i, j] = 0
            elseif N.edges[i, j] == 1
                mat_condprob[i, j] = 1.0 - v
            else 
                mat_condprob[i, j] = v_redist
            end
        end
    end
    N_prob = UnipartiteProbabilisticNetwork(mat_condprob .* mat_potential, species(N))
    
    return (N_prob = N_prob,  mat_condprob = mat_condprob, mat_potential = mat_potential)
end

