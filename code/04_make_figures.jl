### Conduct network analysis and make figures

# plot attributes
theme(:mute)
default(; frame=:box)
Plots.scalefontsizes(1.3)
fonts=font("DejaVu Sans",6)

## read network data

# probabilistic networks
include("03_build_prob_networks.jl")

# metaweb
M = load(joinpath("data", "processed", "metaweb.jld2"))["N"]

# local networks (minimum 5 species)
Ns = load(joinpath("data", "processed", "local_networks.jld2"))["N"]

# spatial information (site name and latitude)
sites_lat = DataFrame(CSV.File(joinpath("data", "processed", "sites_lat.csv")))



####### Figure of network accumulation curves (beta diversity) #######

# number of simulations and samples
n_sim = 100
n_samples = length(Ns)

# we use bw (Whittaker 1960) as a measure of network dissimilarity
# bw = (a + b + c) / [(2a + b + c) / 2] - 1
# a = number of shared items
# b and c = number of items unique to the two networks
# in bs items are species
# in bos items are interactions between shared species

# calculate bos and bs
bos = zeros(Float64, n_sim, n_samples)
bs = zeros(Float64, n_sim, n_samples)

# simulate different network accumulation curves
p = Progress(n_sim)
Threads.@threads for i in 1:n_sim
    
    # simulate sampling order
    sampling_order = sample(1:length(Ns), n_samples, replace=false)

    # generate network accumulate curve
    N_acc = accumulate(Ns; sampling_order = sampling_order)
        
    # calculate beta diversity of each network in the curve 
    for j in 1:n_samples
        bos[i, j] = KGL02(βos(N_acc[j], M))
        bs[i, j] = KGL02(βs(N_acc[j], M))
    end

    next!(p)
end

# calculate quantiles
bos_025 = quantile.(eachcol(bos), 0.025)
bos_250 = quantile.(eachcol(bos), 0.25)
bos_500 = quantile.(eachcol(bos), 0.50)
bos_750 = quantile.(eachcol(bos), 0.75)
bos_975 = quantile.(eachcol(bos), 0.975)

bs_025 = quantile.(eachcol(bs), 0.025)
bs_250 = quantile.(eachcol(bs), 0.25)
bs_500 = quantile.(eachcol(bs), 0.50)
bs_750 = quantile.(eachcol(bs), 0.75)
bs_975 = quantile.(eachcol(bs), 0.975)

# make bos beta diversity figure

a = [1,2,3,5,10,25,50,100,200] # specified x-ticks 

plot_bos = plot(1:n_samples,
    bos_975,
    fillrange=bos_025,
    color=:lightgrey, 
    fillalpha = 0.50,
    label="95% PI",
    linewidth=0, 
    grid=false,
    minorgrid=false,
    dpi=1000, 
    size=(800,500), 
    margin=5Plots.mm, 
    guidefont=fonts,
    xtickfont=fonts, 
    ytickfont=fonts, 
    foreground_color_legend=:black, 
    background_color_legend=:white, 
    legendfont=fonts,
    legendfontpointsize=6,
    legendfontfamily="DejaVu Sans")

xaxis!(:log,
    xlabel="Number of sampled local networks", 
    xticks=(a,a),
    xlims=(1,n_samples))

yaxis!(ylabel="Dissimilarity of interactions between common species (βos)", 
    ylims=(0, 0.5))


plot!(1:n_samples,
    bos_250,
    fillrange=bos_750,
    color=:grey, 
    fillalpha = 0.50,
    label="50% PI",
    linewidth=0)

plot!(1:n_samples,
    bos_500,
    label="median",
    color=RGB(204/255,121/255,167/255),
    alpha=0.9,
    linewidth=4)



# make bs beta diversity figure

plot_bs = plot(1:n_samples,
    bs_975,
    fillrange=bs_025,
    color=:lightgrey, 
    fillalpha = 0.50,
    label="95% PI",
    linewidth=0, 
    grid=false,
    minorgrid=false,
    dpi=1000, 
    size=(800,500), 
    margin=5Plots.mm, 
    guidefont=fonts,
    xtickfont=fonts, 
    ytickfont=fonts, 
    foreground_color_legend=:black, 
    background_color_legend=:white, 
    legendfont=fonts,
    legendfontpointsize=6,
    legendfontfamily="DejaVu Sans")

xaxis!(:log,
    xlabel="Number of sampled local networks", 
    xticks=(a,a),
    xlims=(1,n_samples))

yaxis!(ylabel="Dissimilarity in species composition (βs)", 
    ylims=(0, 1))


plot!(1:n_samples,
    bs_250,
    fillrange=bs_750,
    color=:grey, 
    fillalpha = 0.50,
    label="50% PI",
    linewidth=0)

plot!(1:n_samples,
    bs_500,
    label="median",
    color=RGB(204/255,121/255,167/255),
    alpha=0.9,
    linewidth=4)



####### Figure of network accumulation curves (network structure) #######

# simulate network accumulation curves
       
# get order (same sampling order for all curves)
sampling_order = sample(1:length(Ns), n_samples, replace=false)

# generate network accumulation curves
Ns_acc = accumulate(Ns; sampling_order = sampling_order)
Ns_M3_p100_acc = accumulate(Ns_M3_p100, M3; sampling_order = sampling_order)
Ns_M3_p75_acc = accumulate(Ns_M3_p75, M3; sampling_order = sampling_order)
Ns_M3_p50_acc = accumulate(Ns_M3_p50, M3; sampling_order = sampling_order)


# calculate number of links
Ns_links = links.(Ns_acc)
Ns_M3_p100_links = links.(Ns_M3_p100_acc)
Ns_M3_p75_links = links.(Ns_M3_p75_acc)
Ns_M3_p50_links = links.(Ns_M3_p50_acc)

# calculate connectance

function connectance_tripartite(N::AbstractEcologicalNetwork) 
    
    # connectance of 0 if the network is empty
    if richness(N) == 0
        co = 0
    else 

    # find species names
    sp = species(N)

    # calculate number of species in each group
    S_salix = sum(map(x -> x in salix, sp))
    S_galler = sum(map(x -> x in galler, sp))
    S_parasitoid = sum(map(x -> x in parasitoid, sp))

    # calculate number of possible non-forbidden links 
    S_possible = S_salix * S_galler + S_galler * S_parasitoid 
    
    # calculate connectance
    co = links(N) / S_possible
    end
    # calculate connectance
    return co
end

Ns_co = connectance_tripartite.(Ns_acc)
Ns_M3_p100_co = connectance_tripartite.(Ns_M3_p100_acc)
Ns_M3_p75_co = connectance_tripartite.(Ns_M3_p75_acc)
Ns_M3_p50_co = connectance_tripartite.(Ns_M3_p50_acc)


plot_links = plot(1:n_samples,
    Ns_links,
    color=RGB(204/255,121/255,167/255),
    alpha=0.9,
    linestyle=:solid,
    linewidth=2,
    label="binary local interactions",
    grid=false,
    minorgrid=false,
    dpi=1000, 
    size=(800,500), 
    margin=5Plots.mm, 
    guidefont=fonts,
    xtickfont=fonts, 
    ytickfont=fonts, 
    foreground_color_legend=:black, 
    background_color_legend=:white, 
    legendfont=fonts,
    legendfontpointsize=6,
    legendfontfamily="DejaVu Sans")

plot!(1:n_samples,
    Ns_M3_p100_links,
    color=RGB(86/255,190/255,233/255),
    alpha=0.6,
    linestyle=:dash,
    linewidth=2,
    label="P(Lᵢ,ⱼ,ₖ | Mᵢ,ⱼ) = 1.0")

plot!(1:n_samples,
    Ns_M3_p75_links,
    color=RGB(0/255,158/255,115/255),
    alpha=0.6,
    linestyle=:dashdot,
    linewidth=1.5,
    label="P(Lᵢ,ⱼ,ₖ | Mᵢ,ⱼ) = 0.75")

plot!(1:n_samples,
    Ns_M3_p50_links,
    color=RGB(230/255,159/255,0/255),
    alpha=0.6,
    linestyle=:dot,
    linewidth=2,
    label="P(Lᵢ,ⱼ,ₖ | Mᵢ,ⱼ) = 0.50")

xaxis!(:log,
    xlabel="Number of sampled local networks", 
    xticks=(a,a),
    xlims=(1,n_samples))

yaxis!(ylabel="Expected number of local interactions")


plot_co = plot(1:n_samples,
    Ns_co,
    color=RGB(204/255,121/255,167/255),
    alpha=0.9,
    linestyle=:solid,
    linewidth=2,
    label="binary local interactions",
    grid=false,
    minorgrid=false,
    dpi=1000, 
    size=(800,500), 
    margin=5Plots.mm, 
    guidefont=fonts,
    xtickfont=fonts, 
    ytickfont=fonts, 
    foreground_color_legend=:black, 
    background_color_legend=:white, 
    legendfont=fonts,
    legendfontpointsize=6,
    legendfontfamily="DejaVu Sans")


plot!(1:n_samples,
    Ns_M3_p100_co,
    color=RGB(86/255,190/255,233/255),
    alpha=0.6,
    linestyle=:dash,
    linewidth=2,
    label="P(Lᵢ,ⱼ,ₖ | Mᵢ,ⱼ) = 1.0")

plot!(1:n_samples,
    Ns_M3_p75_co,
    color=RGB(0/255,158/255,115/255),
    alpha=0.6,
    linestyle=:dashdot,
    linewidth=1.5,
    label="P(Lᵢ,ⱼ,ₖ | Mᵢ,ⱼ) = 0.75")

plot!(1:n_samples,
    Ns_M3_p50_co,
    color=RGB(230/255,159/255,0/255),
    alpha=0.6,
    linestyle=:dot,
    linewidth=2,
    label="P(Lᵢ,ⱼ,ₖ | Mᵢ,ⱼ) = 0.50")


xaxis!(:log,
    xlabel="Number of sampled local networks", 
    xticks=(a,a),
    xlims=(1,n_samples))

yaxis!(ylabel="Expected local connectance")



plot(plot_bs, plot_bos, plot_links, plot_co,
    title = ["(a)" "(b)" "(c)" "(d)"],
    titleloc=:right, 
    titlefont=fonts,
    layout = (2, 2),
    dpi=1000,
    size=(800, 600))

savefig(joinpath("figures","network_accumulation.png"))






####### Figure of network sampling #######

# generate binary realizations of each local network using the two sampling methods (sampling interactions from the metaweb once or independently for each local network)

# calculate connectance for each random draw of each local network
function sample_connectance(M::UnipartiteProbabilisticNetwork, Ns_obj::Vector; nsim=100)

    # vectors for the connectance of networks obtained from the two methods
    Ns_draws1_co = zeros(Float64, nsim, length(Ns))
    Ns_draws2_co = zeros(Float64, nsim, length(Ns))

    # generate binary network realizations from probabilistic networks obtained using the method of false positives and negatives
    for i in 1:nsim
        ## first sampling method: one random realization of the metaweb
        Ns_draws1 = sample_networks(M, Ns_obj)
        ## second sampling method: one random realization for each local network
        Ns_draws2 = sample_networks(Ns_obj)
        
        ## calculate connectance
        Ns_draws1_co[i, :] = connectance_tripartite.(Ns_draws1)
        Ns_draws2_co[i, :] = connectance_tripartite.(Ns_draws2)
    end
    return (samples_metaweb_co = Ns_draws1_co, samples_local_co = Ns_draws2_co)
end


### scatterplot of network connectance obtained from the metaweb and local network sampling methods (averaged across simulations) 
# probability of local interaction between potentially interacting species = 1.0

samples_co_100_1 = sample_connectance(M3_fpfn, Ns_M3_fpfn_p100, nsim = 1)
samples_co_100_10 = sample_connectance(M3_fpfn, Ns_M3_fpfn_p100, nsim = 10)
samples_co_100_50 = sample_connectance(M3_fpfn, Ns_M3_fpfn_p100, nsim = 50)
samples_co_100_100 = sample_connectance(M3_fpfn, Ns_M3_fpfn_p100, nsim = 100)

# random networks
Ns_rdm = sample(1:length(Ns), 20)

# minimum and maximum values for plotting
min = 0.05
max = 1.05

# colors 

plotA = scatter(mean.(eachcol(samples_co_100_100.samples_metaweb_co))[Ns_rdm], 
        mean.(eachcol(samples_co_100_100.samples_local_co))[Ns_rdm], 
        label = "100 samples",
        color = RGB(86/255,190/255,233/255),
        markersize = 15,
        m = :circle,
        alpha = 0.5,
        framestyle=:box, 
        grid=false,
        minorgrid=false,
        dpi=1000, 
        size=(600,600), 
        margin=5Plots.mm, 
        guidefont=fonts, 
        xtickfont=fonts, 
        ytickfont=fonts,
        foreground_color_legend=:black,
        background_color_legend=:white, 
        legendfont=fonts,
        legendfontpointsize=5,
        legendfontfamily="DejaVu Sans")
      
scatter!(mean.(eachcol(samples_co_100_50.samples_metaweb_co))[Ns_rdm], 
        mean.(eachcol(samples_co_100_50.samples_local_co))[Ns_rdm], 
        label = "50 samples",
        color = :grey,
        markersize = 10,
        m = :hexagon,
        alpha = 0.4)
    
scatter!(mean.(eachcol(samples_co_100_10.samples_metaweb_co))[Ns_rdm], 
        mean.(eachcol(samples_co_100_10.samples_local_co))[Ns_rdm], 
        label = "10 samples",
        markersize = 5,
        color = :grey,
        m = :diamond,
        alpha = 0.6)

scatter!(mean.(eachcol(samples_co_100_1.samples_metaweb_co))[Ns_rdm], 
        mean.(eachcol(samples_co_100_1.samples_local_co))[Ns_rdm], 
        label = "1 sample",
        m = :star4,
        color = :grey,
        markersize = 4,
        alpha = 0.8)

# 1:1 line
plot!(min:0.01:max, 
        min:0.01:max, 
        linestyle=:dash, 
        linecolor=:darkgrey,
        label="")

xaxis!(xlabel="Average connectance across regional samples", 
        xlims=(min, max))

yaxis!(ylabel="Average connectance across local samples", 
        ylims=(min, max))


### scatterplot of network connectance obtained from the metaweb and local network sampling methods (averaged across simulations) 

# probability of local interaction between potentially interacting species = 0.75

samples_co_75_1 = sample_connectance(M3_fpfn, Ns_M3_fpfn_p75, nsim = 1)
samples_co_75_10 = sample_connectance(M3_fpfn, Ns_M3_fpfn_p75, nsim = 10)
samples_co_75_50 = sample_connectance(M3_fpfn, Ns_M3_fpfn_p75, nsim = 50)
samples_co_75_100 = sample_connectance(M3_fpfn, Ns_M3_fpfn_p75, nsim = 100)

plotB = scatter(mean.(eachcol(samples_co_75_100.samples_metaweb_co))[Ns_rdm], 
    mean.(eachcol(samples_co_75_100.samples_local_co))[Ns_rdm], 
    label = "100 samples",
    markersize = 15,
    m = :circle,
    color = RGB(0/255,158/255,115/255),
    alpha = 0.5,
    framestyle=:box, 
    grid=false,
    minorgrid=false,
    dpi=1000, 
    size=(600,600), 
    margin=5Plots.mm, 
    guidefont=fonts, 
    xtickfont=fonts, 
    ytickfont=fonts,
    foreground_color_legend=:black,
    background_color_legend=:white, 
    legendfont=fonts,
    legendfontpointsize=5,
    legendfontfamily="DejaVu Sans")

scatter!(mean.(eachcol(samples_co_75_50.samples_metaweb_co))[Ns_rdm], 
        mean.(eachcol(samples_co_75_50.samples_local_co))[Ns_rdm], 
        label = "50 samples",
        markersize = 10,
        m = :hexagon,
        color = :grey,
        alpha = 0.4)

scatter!(mean.(eachcol(samples_co_75_10.samples_metaweb_co))[Ns_rdm], 
        mean.(eachcol(samples_co_75_10.samples_local_co))[Ns_rdm], 
        label = "10 samples",
        markersize = 5,
        color = :grey,
        m = :diamond,
        alpha = 0.6)

scatter!(mean.(eachcol(samples_co_75_1.samples_metaweb_co))[Ns_rdm], 
        mean.(eachcol(samples_co_75_1.samples_local_co))[Ns_rdm], 
        label = "1 sample",
        markersize = 4,
        color = :grey,
        m = :star4,
        alpha = 0.8)

# 1:1 line
plot!(min:0.01:max, 
        min:0.01:max, 
        linestyle=:dash, 
        linecolor=:darkgrey,
        label="")

xaxis!(xlabel="Average connectance across regional samples", 
        xlims=(min, max))

yaxis!(ylabel="Average connectance across local samples", 
        ylims=(min, max))


### scatterplot of network connectance obtained from the metaweb and local network sampling methods (averaged across simulations) 
# probability of local interaction between potentially interacting species = 0.5

samples_co_50_1 = sample_connectance(M3_fpfn, Ns_M3_fpfn_p50, nsim = 1)
samples_co_50_10 = sample_connectance(M3_fpfn, Ns_M3_fpfn_p50, nsim = 10)
samples_co_50_50 = sample_connectance(M3_fpfn, Ns_M3_fpfn_p50, nsim = 50)
samples_co_50_100 = sample_connectance(M3_fpfn, Ns_M3_fpfn_p50, nsim = 100)

plotC = scatter(mean.(eachcol(samples_co_50_100.samples_metaweb_co))[Ns_rdm], 
    mean.(eachcol(samples_co_50_1.samples_local_co))[Ns_rdm], 
    label = "100 samples",
    color = RGB(230/255,159/255,0/255),
    markersize = 15,
    m = :circle,
    alpha = 0.5,
    framestyle=:box, 
    grid=false,
    minorgrid=false,
    dpi=1000, 
    size=(600,600), 
    margin=5Plots.mm, 
    guidefont=fonts, 
    xtickfont=fonts, 
    ytickfont=fonts,
    foreground_color_legend=:black,
    background_color_legend=:white, 
    legendfont=fonts,
    legendfontpointsize=5,
    legendfontfamily="DejaVu Sans")

scatter!(mean.(eachcol(samples_co_50_50.samples_metaweb_co))[Ns_rdm], 
    mean.(eachcol(samples_co_50_50.samples_local_co))[Ns_rdm], 
    label = "50 samples",
    color = :grey,
    markersize = 10,
    m = :hexagon,
    alpha = 0.4)

scatter!(mean.(eachcol(samples_co_50_10.samples_metaweb_co))[Ns_rdm], 
    mean.(eachcol(samples_co_50_10.samples_local_co))[Ns_rdm], 
    label = "10 samples",
    color = :grey,
    markersize = 5,
    m = :diamond,
    alpha = 0.6)

scatter!(mean.(eachcol(samples_co_50_1.samples_metaweb_co))[Ns_rdm], 
    mean.(eachcol(samples_co_50_1.samples_local_co))[Ns_rdm], 
    label = "1 sample",
    color = :grey,
    markersize = 4,
    m = :star4,
    alpha = 0.8)

# 1:1 line
plot!(min:0.01:max, 
        min:0.01:max, 
        linestyle=:dash, 
        linecolor=:darkgrey,
        label="")

xaxis!(xlabel="Average connectance across regional samples", 
        xlims=(min, max))

yaxis!(ylabel="Average connectance across local samples", 
        ylims=(min, max))


### scatterplot of the mean squared logarithmic error between the connectance obtained from the local network and metaweb sampling methods as a function of the number of simulations
# for different probabilities of local interaction between potentially interacting species 

# calculate the divergence between the two sampling methods for a given number of simulations
function divergence_sim(M::UnipartiteProbabilisticNetwork, Ns_obj::Vector; nsim=100)

    # sample network connectance with the two methods
    samples_co = sample_connectance(M, Ns_obj; nsim = nsim)
    
    # calculate mean connectance across simulations for both methods
    samples_metaweb_co = mean.(eachcol(samples_co.samples_metaweb_co))
    samples_local_co = mean.(eachcol(samples_co.samples_local_co))

    # remove missing values
    samples_metaweb_co_clean = samples_metaweb_co[Not(isnan.(samples_metaweb_co) .|| isnan.(samples_local_co))]

    samples_local_co_clean = samples_local_co[Not(isnan.(samples_metaweb_co) .|| isnan.(samples_local_co))]

    # calculate divergence (mean squared logarithmic error)
    return mean((log.(samples_metaweb_co_clean) .- log.(samples_local_co_clean)).^2)
end


# calculate divergence for different numbers of simulations
nsims = 1:1:100

# divergence between the two methods when p = 1.0
divergences_100 = zeros(Float64, length(nsims))

p = Progress(length(nsims))
Threads.@threads for i in nsims
    divergences_100[i] = divergence_sim(M3_fpfn, Ns_M3_fpfn_p100, nsim = i) 
next!(p)
end

# divergence between the two methods when p = 0.75
divergences_75 = zeros(Float64, length(nsims))

p = Progress(length(nsims))
Threads.@threads for i in nsims
    divergences_75[i] = divergence_sim(M3_fpfn, Ns_M3_fpfn_p75, nsim = i) 
next!(p)
end

# divergence between the two methods when p = 0.5
divergences_50 = zeros(Float64, length(nsims))

p = Progress(length(nsims))
Threads.@threads for i in nsims
    divergences_50[i] = divergence_sim(M3_fpfn, Ns_M3_fpfn_p50, nsim = i) 
next!(p)
end

a = [1,5,10,20,50,100]

plotD = scatter(nsims, 
        divergences_100, 
        color = RGB(86/255,190/255,233/255),
        label = "",
        alpha = 0.8,
        framestyle=:box, 
        grid=false,
        minorgrid=false,
        dpi=1000, 
        size=(600,600), 
        margin=5Plots.mm, 
        guidefont=fonts, 
        xtickfont=fonts, 
        ytickfont=fonts,
        foreground_color_legend=:black,
        background_color_legend=:white, 
        legendfont=fonts,
        legendfontpointsize=6,
        legendfontfamily="DejaVu Sans")

xaxis!(:log,
        xlabel="Number of samples", 
        xticks = (a, a))

yaxis!(ylabel="Mean squared logarithmic error (MSLE)",
        ylims=(0,0.14))


plotE = scatter(nsims, 
        divergences_75, 
        color = RGB(0/255,158/255,115/255),
        label = "",
        alpha = 0.8,
        framestyle=:box, 
        grid=false,
        minorgrid=false,
        dpi=1000, 
        size=(600,600), 
        margin=5Plots.mm, 
        guidefont=fonts, 
        xtickfont=fonts, 
        ytickfont=fonts,
        foreground_color_legend=:black,
        background_color_legend=:white, 
        legendfont=fonts,
        legendfontpointsize=6,
        legendfontfamily="DejaVu Sans")

xaxis!(:log,
        xlabel="Number of samples", 
        xticks = (a, a))

yaxis!(ylabel="Mean squared logarithmic error (MSLE)",
      ylims=(0,0.14))



plotF = scatter(nsims, 
        divergences_50, 
        color = RGB(230/255,159/255,0/255),
        label = "",
        alpha = 0.8,
        framestyle=:box, 
        grid=false,
        minorgrid=false,
        dpi=1000, 
        size=(600,600), 
        margin=5Plots.mm, 
        guidefont=fonts, 
        xtickfont=fonts, 
        ytickfont=fonts,
        foreground_color_legend=:black,
        background_color_legend=:white, 
        legendfont=fonts,
        legendfontpointsize=6,
        legendfontfamily="DejaVu Sans")

xaxis!(:log,
        xlabel="Number of samples", 
        xticks = (a, a))

yaxis!(ylabel="Mean squared logarithmic error (MSLE)",
        ylims=(0,0.14))



l = @layout [grid(2,3)]

plot(plotA, plotB, plotC, plotD, plotE, plotF,
        title = ["(a) P(Lᵢ,ⱼ,ₖ| Mᵢ,ⱼ) = 1.0" "(b) P(Lᵢ,ⱼ,ₖ | Mᵢ,ⱼ) = 0.75" "(c) P(Lᵢ,ⱼ,ₖ | Mᵢ,ⱼ) = 0.50" "(d) P(Lᵢ,ⱼ,ₖ | Mᵢ,ⱼ) = 1.0" "(e) P(Lᵢ,ⱼ,ₖ | Mᵢ,ⱼ) = 0.75" "(f) P(Lᵢ,ⱼ,ₖ | Mᵢ,ⱼ) = 0.50"],
        titleloc=:right, 
        titlefont=fonts,
        layout = l,
        dpi=1000,
        size=(900, 500))
        
savefig(joinpath("figures","network_sampling.png"))





####### Figure of spatial scaling #######

# lowest latitude (5% quantile)
low_lat = quantile(sites_lat.latitude, 0.05)

# highest latitude (95% quantile)
high_lat = quantile(sites_lat.latitude, 0.95)

# latitudes to explore 
lats = [low_lat:1.0:high_lat;]

# latitude widths to explore
areas = [1.0:1.0:12.0;]

# calculate the expected number of links in each network obtained after merging all networks in a window of given width and position
links_merged = zeros(Float64, length(lats), length(areas))

# calculate the expected number of links in each submetaweb in a window of given width and position
links_metaweb = zeros(Float64, length(lats), length(areas))

# use the probabilistic networks built using the false positive and false negative method
p = Progress(length(areas))

for (a, area) in enumerate(areas)
    links_scale = spatial_scaling(Ns_M3_fpfn_p100, M3_fpfn, lats, area)
    
    links_merged[:,a] = links_scale.links_merged 
    links_metaweb[:,a] = links_scale.links_metaweb    
    next!(p)
end

# make spatial scaling figures
a = [2:2:Int64(maximum(areas));]

## expected number of links in the merged network
plot_links_merged = plot(areas,
    links_merged',
    label="",
    color=:cividis, 
    line_z=lats',
    alpha=0.8,
    linestyle=:solid,
    linewidth=0.5, 
    grid=false,
    minorgrid=false,
    dpi=1000, 
    size=(800,500), 
    margin=5Plots.mm, 
    guidefont=fonts,
    xtickfont=fonts, 
    ytickfont=fonts, 
    foreground_color_legend=:white, 
    background_color_legend=:white, 
    colorbar_title="Central latitudinal coordinate",
    colorbar_titlefont=fonts, 
    legendfont=fonts,
    legendfontpointsize=6,
    legendfontfamily="DejaVu Sans")

plot!(areas,
    median.(eachcol(links_merged)),
    color=RGB(204/255,121/255,167/255),
    label="median",
    linewidth=5)

xaxis!(xlabel="Latitudinal window width",
    xticks=(a,a))

yaxis!(ylabel="Expected number of local interactions", 
    ylims=(-0.05, 1650))

## expected number of links in the submetawebs

plot_links_metaweb = plot(areas,
    links_metaweb',
    label="",
    color=:cividis, 
    line_z=lats',
    linewidth=0.5, 
    linestyle=:solid,
    alpha=0.8,
    grid=false,
    minorgrid=false,
    dpi=1000, 
    size=(800,500), 
    margin=5Plots.mm, 
    guidefont=fonts,
    xtickfont=fonts, 
    ytickfont=fonts, 
    colorbar_title="Central latitudinal coordinate",
    colorbar_titlefont=fonts, 
    foreground_color_legend=:white, 
    background_color_legend=:white, 
    legendfont=fonts,
    legendfontpointsize=6,
    legendfontfamily="DejaVu Sans")

plot!(areas,
    median.(eachcol(links_metaweb)),
    color=RGB(204/255,121/255,167/255),
    label="median",
    linewidth=5)

xaxis!(xlabel="Latitudinal window width",
    xticks=(a,a))

yaxis!(ylabel="Expected number of regional interactions", 
    ylims=(-0.05, 1650))


# heatmaps of the expected numbers of links in the merged networks and submetawebs as a function of position and latitude width 
heatmap_links_merged = heatmap(areas, lats, links_merged, c = :viridis, 
        clims=(0,1650),
        colorbar_title="Expected number of local interactions",
        framestyle=:box, 
        grid=false,
        minorgrid=false,
        dpi=1000, 
        size=(800,500), 
        margin=5Plots.mm, 
        guidefont=fonts, 
        xtickfont=fonts, 
        ytickfont=fonts,
        colorbar_titlefont=fonts, 
        foreground_color_legend=:black, 
        background_color_legend=:white)

xaxis!(xlabel="Latitudinal window width",
        xticks=(a,a))

yaxis!(ylabel="Central latitudinal coordinate")


heatmap_links_metaweb = heatmap(areas, lats, links_metaweb, c = :viridis, 
        clims=(0,1650),
        colorbar_title="Expected number of regional interactions",
        framestyle=:box, 
        grid=false,
        minorgrid=false,
        dpi=1000, 
        size=(800,500), 
        margin=5Plots.mm, 
        guidefont=fonts, 
        xtickfont=fonts, 
        ytickfont=fonts,
        colorbar_titlefont=fonts, 
        foreground_color_legend=:black, 
        background_color_legend=:white)

xaxis!(xlabel="Latitudinal window width",
        xticks=(a,a))

yaxis!(ylabel="Central latitudinal coordinate")



plot(plot_links_merged, plot_links_metaweb, 
    heatmap_links_merged, heatmap_links_metaweb,
    title = ["(a)" "(b)" "(c)" "(d)"],
    titleloc=:right, 
    titlefont=fonts,
    dpi=1000,
    size=(700, 600))

savefig(joinpath("figures","spatial_scaling.png"))




####### Figure of spatiotemporal interactions #######

### heatmap of the probability of interactions with changing λ and P(Xij) (fixed t0)

# explored values of λ and P(Xij) for heatmap
λ_heat = [0:0.01:4;]
pxij_heat = [0:0.01:1;]

# explored values of λ and γ for line plot
pxij_line = [0.3; 0.5]
λ_line = [1.0; 2.0]

# reshape points for plotting
params = vec(collect(Base.product(pxij_line, λ_line)))

n_points = size(params)[1]
pxij_point = [params[i][1] for i in 1:n_points]
λ_point = [params[i][2] for i in 1:n_points]

# calculate probability of interactions
p = zeros(Float64, length(pxij_heat), length(λ_heat))

for i in 1:length(pxij_heat), j in 1:length(λ_heat)
    p[i, j] = spatiotemporal_model(pxij = pxij_heat[i], λ = λ_heat[j], t0 = 1)
end

# make heatmap
plotA = heatmap(λ_heat, pxij_heat, p, 
        c=:viridis, 
        clims=(0,1),
        label="",
        framestyle=:box, 
        grid=false,
        minorgrid=false,
        dpi=1000, 
        size=(800,500), 
        margin=5Plots.mm, 
        guidefont=fonts, 
        xtickfont=fonts, 
        ytickfont=fonts,
        foreground_color_legend=:black, 
        background_color_legend=:white)

scatter!(λ_point, 
        pxij_point,
        markershape = :star4,
        markercolor = :white,
        markersize = 5,
        label = "")

xaxis!(xlabel="Interaction rate λₖ", 
        xlims=(minimum(λ_heat), maximum(λ_heat)))

yaxis!(ylabel="Probability of co-occurrence P(Xᵢ,ⱼ,ₖ)",
        ylims=(minimum(pxij_heat), maximum(pxij_heat)))


### time series of the probability of interactions with changing λ and pxij 

# time steps
t = [0:0.1:5;]

# calculate probability of interactions
p = zeros(length(t), length(params))

for (i, t0) in enumerate(t), j in 1:length(params)
    p[i,j] = spatiotemporal_model(pxij = params[j][1], λ = params[j][2], t0 = t0)
end

# plot time series
linestyles = [:solid, :dash, :dot, :dashdot]
plotB = plot(t, p[:,1],
    linewidth=1.5,
    linestyle=linestyles[1],
    label="P(Xᵢ,ⱼ,ₖ) = $(params[1][1]), λₖ = $(params[1][2])",
    grid=false,
    minorgrid=false,
    dpi=1000, 
    size=(800,500), 
    margin=5Plots.mm, 
    guidefont=fonts,
    xtickfont=fonts, 
    ytickfont=fonts, 
    foreground_color_legend=:black, 
    background_color_legend=:white, 
    legendfont=fonts,
    legendfontpointsize=6,
    legendfontfamily="DejaVu Sans")

for i in 2:length(params)
    plot!(t, p[:,i],
        linewidth=1.5,
        linestyle=linestyles[i],
        label="P(Xᵢ,ⱼ,ₖ) = $(params[i][1]), λₖ = $(params[i][2])")
end

xaxis!(xlabel="Duration t₀",
    xlims=(0, Inf))

yaxis!(ylabel="Probability of local interaction P(Lᵢ,ⱼ,ₖ)", 
        ylims=(0, 0.52))


plot(plotA, plotB,
        title = ["(a)" "(b)"],
        titleloc=:right, 
        titlefont=fonts,
        dpi=1000,
        size=(800, 350))

savefig(joinpath("figures","spatiotemporal_model.png"))


