### Build probabilistic networks from binary networks 

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

M1 = prob_metaweb(M, "method1") # probabilities of average connectance
M2 = prob_metaweb(M, "method2") # probabilities of subnetwork connectance
M3 = prob_metaweb(M, "method3"; fp = 0.05, fn = 0.1) # false positive and negative rates


## build probabilistic local networks from binary networks and probabilistic metawebs 
# p is the conditional probability of interaction 

Ns_M1_p100 = [prob_networks(Ns[i], M1; p = 1.0) for i in 1:length(Ns)] 
Ns_M1_p75 = [prob_networks(Ns[i], M1; p = 0.75) for i in 1:length(Ns)] 
Ns_M1_p50 = [prob_networks(Ns[i], M1; p = 0.5) for i in 1:length(Ns)] 

Ns_M2_p100 = [prob_networks(Ns[i], M2; p = 1.0) for i in 1:length(Ns)] 
Ns_M2_p75 = [prob_networks(Ns[i], M2; p = 0.75) for i in 1:length(Ns)] 
Ns_M2_p50 = [prob_networks(Ns[i], M2; p = 0.5) for i in 1:length(Ns)] 

Ns_M3_p100 = [prob_networks(Ns[i], M3; p = 1.0) for i in 1:length(Ns)] 
Ns_M3_p75 = [prob_networks(Ns[i], M3; p = 0.75) for i in 1:length(Ns)] 
Ns_M3_p50 = [prob_networks(Ns[i], M3; p = 0.5) for i in 1:length(Ns)] 
