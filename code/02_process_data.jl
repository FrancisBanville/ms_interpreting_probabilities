### Build local networks and metaweb from list of interactions 

## read files

# locations of the sites
df_site = DataFrame(CSV.File(joinpath("data", "raw", "csv", "df_site.csv")))

# interaction details among each node (willows, gallers, enemies)
df_interact = DataFrame(CSV.File(joinpath("data", "raw", "csv", "df_interact.csv")))


## read metadata
# more metadata can be found in Kopeleke et al. (2017) doi/10.1002/ecy.1832
metadata = DataFrame(CSV.File(joinpath("data", "raw", "salix_webs_metadata.csv")))

# find the explanation for a given header name (note that some variables in the relational datasets are not in the metadata file)
# header_name = "Year of coll"
# metadata[metadata[:,"Column header"] .== header_name, :]


## clean datasets

# remove first column to allow the combination of the datasets
select!(df_site, Not(:Column1))
select!(df_interact, Not(:Column1))

# combine datasets
site_interact = innerjoin(df_site, df_interact, on = :REARING_NUMBER)

# keep variables that will be used to make networks
select!(site_interact, :SITE, :RSAL, :RGALLER, :RPAR, :N_GALLS, :NB_GALLS_PAR)

# rename variables
rename!(site_interact, :SITE => :site, 
                    :RSAL => :salix,
                    :RGALLER => :galler,
                    :RPAR => :parasitoid,
                    :N_GALLS => :galler_nb, 
                    :NB_GALLS_PAR => :parasitoid_nb)


## reshape dataframe so that every row is a different interaction

# get salix-galler interactions
salix_galler = select(site_interact, :site, :salix, :galler, :galler_nb)

# get galler-parasitoid interactions
galler_parasitoid = select(site_interact, :site, :galler, :parasitoid, :parasitoid_nb)

# combine salix-galler and galler-parasitoid interactions
rename!(salix_galler, :salix => :to,
                    :galler => :from,
                    :galler_nb => :weight)

rename!(galler_parasitoid, :galler => :to,
                    :parasitoid => :from,
                    :parasitoid_nb => :weight)

metaweb_links = vcat(salix_galler, galler_parasitoid)

# remove rows without interactions
metaweb_links = filter(x -> x.weight != 0, metaweb_links)

# remove weight column since we work with binary interactions
metaweb_links = select(metaweb_links, Not(:weight))

# remove duplicate interactions
metaweb_links = unique(metaweb_links)


## build local networks and metaweb 

function build_networks(site_id::String)

    if site_id == "metaweb"
        # keep all links when building the metaweb
        local_links = select(metaweb_links, Not(:site))
        # remove duplicate interactions
        local_links = unique(local_links)
    else
        # get local links when building a local network
        local_links = filter(x -> x.site == site_id, metaweb_links)
        local_links = select(local_links, Not(:site))
    end

    # make list of all unique species in that site
    sp = unique(vcat(local_links.to, local_links.from))

    # count number of species 
    S = length(sp)

    # make adjacency matrix
    mat = zeros(Bool, S, S)

    for i in 1:S 
        for j in 1:S
            mat[i, j] = sum(local_links.from .== sp[i] .&& local_links.to .== sp[j]) > 0
        end
    end

    # return network with species names 
    return simplify(UnipartiteNetwork(mat, sp))
end


# build metaweb 
M = build_networks("metaweb")
save(joinpath("data", "processed", "metaweb.jld2"), "N", M)

# build local networks
sites = unique(metaweb_links.site)

Ns = []

for i in sites
    push!(Ns, build_networks(i))
end

save(joinpath("data", "processed", "local_networks.jld2"), "N", Ns)



