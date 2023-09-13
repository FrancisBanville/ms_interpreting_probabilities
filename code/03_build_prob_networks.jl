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

M_prob1 = prob_metaweb(M, "method1") # probabilities of average connectance
M_prob2 = prob_metaweb(M, "method2") # probabilities of subnetwork connectance
M_prob3 = prob_metaweb(M, "method3") # redistributed probabilities

save(joinpath("data", "sim", "metaweb_prob", "M_prob1.jld2"), "N", M_prob1)
save(joinpath("data", "sim", "metaweb_prob", "M_prob2.jld2"), "N", M_prob2)
save(joinpath("data", "sim", "metaweb_prob", "M_prob3.jld2"), "N", M_prob3)


## build local networks from metawebs 

Ns_metaweb_prob3 = [prob_networks(Ns[i], M_prob3, "metaweb") for i in 1:length(Ns)] # conditional probabilities of interactions = 1
Ns_redist_prob3 = [prob_networks(Ns[i], M_prob3, "redist") for i in 1:length(Ns)] # redistributed conditional probabilities of interactions 

save(joinpath("data", "sim", "networks_prob", "Ns_metaweb_prob3.jld2"), "N", Ns_metaweb_prob3)
save(joinpath("data", "sim", "networks_prob", "Ns_redist_prob3.jld2"), "N", Ns_redist_prob3)


