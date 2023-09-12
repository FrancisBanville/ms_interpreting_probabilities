### Build probabilistic networks from binary networks using null models 

## load binary network data
# metaweb
M = load(joinpath("data", "processed", "metaweb.jld2"))["N"]

# local networks
Ns = load(joinpath("data", "processed", "local_networks.jld2"))["N"]

## load interactions data to get species names
df_interact = DataFrame(CSV.File(joinpath("data", "raw", "csv", "df_interact.csv")))

# salix species
salix = unique(df_interact[:, :RSAL])
# galler species
galler = unique(df_interact[:, :RGALLER])
# parasitoid species (removing "none")
parasitoid = unique(df_interact[:, :RPAR])
parasitoid = filter(x -> x != "none", parasitoid)


## build probabilistic metawebs

# calculate the connectance of the submatrices of potential interactions between salix and gallers (sg) and gallers and parasitoids (gp)

# number of species
S = length(species(M))

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


## null model 1: every potential interaction is equal to the weighted average of the connectance of the two submatrices of potential interactions (excluding forbidden interactions)

M_prob1 = zeros(Float64, S, S)

for (i, si) in enumerate(species(M)), (j, sj) in enumerate(species(M))
    
    # submatrix of salix and gallers
    if si in galler && sj in salix 
        M_prob1[i,j] = C_avg
    
    # submatrix of gallers and parasitoids 
    elseif si in parasitoid && sj in galler
        M_prob1[i,j] = C_avg

    end
end

M_prob1 = UnipartiteProbabilisticNetwork(M_prob1, species(M))
save(joinpath("data", "sim", "metaweb_prob1.jld2"), "N", M_prob1)


## null model 2: every potential interaction in each submatrix of potential interactions is equal to the connectance of the submatrix 

M_prob2 = zeros(Float64, S, S)

for (i, si) in enumerate(species(M)), (j, sj) in enumerate(species(M))
    
    # submatrix of salix and gallers
    if si in galler && sj in salix 
        M_prob2[i,j] = C_sg
    
    # submatrix of gallers and parasitoids 
    elseif si in parasitoid && sj in galler
        M_prob2[i,j] = C_gp

    end
end

M_prob2 = UnipartiteProbabilisticNetwork(M_prob2, species(M))
save(joinpath("data", "sim", "metaweb_prob2.jld2"), "N", M_prob2)


## null model 3: observed interactions have a probability of 1-v, where v is a penalty of e.g. 0.1 and unobserved potential interactions have a probability of vL/(S1S2 + S2S3 - L) (redistributed probability among unobserved interactions)
 
# penalty 
v = 0.1

# redistributed probability
v_redist = v * L / (S_salix * S_galler + S_galler * S_parasitoid - L)

# build probabilistic metaweb
M_prob3 = zeros(Float64, S, S)

for (i, si) in enumerate(species(M)), (j, sj) in enumerate(species(M))
    
    # submatrix of gallers and parasitoids 
    if si in galler && sj in salix 
        
        if M.edges[i, j] == 1
        M_prob3[i,j] = 1.0 - v

        elseif M.edges[i, j] == 0
        M_prob3[i,j] = v_redist
        
        end

    # submatrix of gallers and parasitoids 
    elseif si in parasitoid && sj in galler
        
        if M.edges[i, j] == 1
        M_prob3[i,j] = 1.0 - v
    
        elseif M.edges[i, j] == 0
        M_prob3[i,j] = v_redist
        
        end
    end
end

M_prob3 = UnipartiteProbabilisticNetwork(M_prob3, species(M))
save(joinpath("data", "sim", "metaweb_prob3.jld2"), "N", M_prob3)



## build local networks from metawebs 

