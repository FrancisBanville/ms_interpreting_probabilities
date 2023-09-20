"""
    prob_metaweb(M::UnipartiteNetwork, method::String; fp = 0.05, fn = 0.1)

Generate a probabilistic metaweb from a binary tripartite metaweb M.  

Three methods are currently implemented to estimate the probabilities of potential interactions. In each method, forbidden interactions have a probability of 0

    Method 1 (method1): every potential interaction is equal to the weighted average of the connectance of the two submatrices of potential interactions.

    Method 2 (method2): every potential interaction in each submatrix of potential interactions is equal to the connectance of the submatrix. 
    
    Method 3 (method3): observed interactions have a probability of 1-fp, where fp is the average false positive rate, and unobserved potential interactions have a probability of fn, where fn is the average false negativate rate.
"""

function prob_metaweb(M::UnipartiteNetwork, method::String; fp = 0.05, fn = 0.1)

   # calculate the connectance of the submatrices of potential interactions between salix and gallers (sg) and gallers and parasitoids (gp)

    # number of species
    S = length(species(M))

    # salix, galler, and parasitoid are vectors of species names 
    S_salix = length(salix)
    S_galler = length(galler)
    S_parasitoid = length(parasitoid)

    # number of interactions
    L = links(M)

    L_sg = links(M[vcat(salix, galler)])
    L_gp = links(M[vcat(galler, parasitoid)])

    # connectance of the two submatrices 
    C_sg = L_sg / (S_salix * S_galler)
    C_gp = L_gp / (S_galler * S_parasitoid)

    C_avg = (L_sg + L_gp) / (S_salix * S_galler + S_galler * S_parasitoid)

    ## build probabilistic metawebs 
    M_prob = zeros(Float64, S, S)

    ## method 1
    if method == "method1"
        for (i, si) in enumerate(species(M)), (j, sj) in enumerate(species(M))
            # submatrix of salix and gallers
            if si in galler && sj in salix 
                M_prob[i,j] = C_avg
    
            # submatrix of gallers and parasitoids 
            elseif si in parasitoid && sj in galler
                M_prob[i,j] = C_avg

            end
        end

    ## method 2 
    elseif method == "method2"
        for (i, si) in enumerate(species(M)), (j, sj) in enumerate(species(M))
            # submatrix of salix and gallers
            if si in galler && sj in salix 
                M_prob[i,j] = C_sg
            # submatrix of gallers and parasitoids 
            elseif si in parasitoid && sj in galler
                M_prob[i,j] = C_gp
            end
        end

    ## method 3
    elseif method == "method3"
        for (i, si) in enumerate(species(M)), (j, sj) in enumerate(species(M))
            # submatrix of gallers and parasitoids 
            if si in galler && sj in salix 
                if M.edges[i, j] == 1
                    M_prob[i,j] = 1.0 - fp
                elseif M.edges[i, j] == 0
                    M_prob[i,j] = fn
                end
            # submatrix of gallers and parasitoids 
            elseif si in parasitoid && sj in galler
                if M.edges[i, j] == 1
                    M_prob[i,j] = 1.0 - fp
                elseif M.edges[i, j] == 0
                    M_prob[i,j] = fn
                end
            end
        end
    end
    M_prob = UnipartiteProbabilisticNetwork(M_prob, species(M))
    return M_prob
end

