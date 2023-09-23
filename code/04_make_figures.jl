### Conduct network analysis and make figures

# plot attributes
theme(:mute)
default(; frame=:box)
Plots.scalefontsizes(1.3)
fonts=font("Times",7)

## read network data

# probabilistic networks
include("03_build_prob_networks.jl")

# metaweb
M = load(joinpath("data", "processed", "metaweb.jld2"))["N"]

# local networks (minimum 5 species)
Ns = load(joinpath("data", "processed", "local_networks.jld2"))["N"]

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
    foreground_color_legend=nothing, 
    background_color_legend=:white, 
    legendfont=fonts,
    legendfontpointsize=7,
    legendfontfamily="Times")

xaxis!(:log,
    xlabel="Number of samples", 
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
    foreground_color_legend=nothing, 
    background_color_legend=:white, 
    legendfont=fonts,
    legendfontpointsize=7,
    legendfontfamily="Times")

xaxis!(:log,
    xlabel="Number of samples", 
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
       
# get order (same for sampling order for all curves)
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
Ns_co = connectance.(Ns_acc)
Ns_M3_p100_co = connectance.(Ns_M3_p100_acc)
Ns_M3_p75_co = connectance.(Ns_M3_p75_acc)
Ns_M3_p50_co = connectance.(Ns_M3_p50_acc)


plot_links = plot(1:n_samples,
    Ns_links,
    color=RGB(204/255,121/255,167/255),
    alpha=0.9,
    linewidth=4,
    label="binary networks",
    grid=false,
    minorgrid=false,
    dpi=1000, 
    size=(800,500), 
    margin=5Plots.mm, 
    guidefont=fonts,
    xtickfont=fonts, 
    ytickfont=fonts, 
    foreground_color_legend=nothing, 
    background_color_legend=:white, 
    legendfont=fonts,
    legendfontpointsize=7,
    legendfontfamily="Times")

plot!(1:n_samples,
    Ns_M3_p100_links,
    color=RGB(86/255,190/255,233/255),
    alpha=0.6,
    linewidth=3,
    label="p = 1.0 (metaweb)")

plot!(1:n_samples,
    Ns_M3_p75_links,
    color=RGB(0/255,158/255,115/255),
    alpha=0.6,
    linewidth=3,
    label="p = 0.75")

plot!(1:n_samples,
    Ns_M3_p50_links,
    color=RGB(230/255,159/255,0/255),
    alpha=0.6,
    linewidth=3,
    label="p = 0.50")

xaxis!(:log,
    xlabel="Number of samples", 
    xticks=(a,a),
    xlims=(1,n_samples))

yaxis!(ylabel="Number of links")


plot_co = plot(1:n_samples,
    Ns_co,
    color=RGB(204/255,121/255,167/255),
    alpha=0.9,
    linewidth=4,
    label="binary networks",
    grid=false,
    minorgrid=false,
    dpi=1000, 
    size=(800,500), 
    margin=5Plots.mm, 
    guidefont=fonts,
    xtickfont=fonts, 
    ytickfont=fonts, 
    foreground_color_legend=nothing, 
    background_color_legend=:white, 
    legendfont=fonts,
    legendfontpointsize=7,
    legendfontfamily="Times")


plot!(1:n_samples,
    Ns_M3_p100_co,
    color=RGB(86/255,190/255,233/255),
    alpha=0.6,
    linewidth=3,
    label="p = 1.0 (metaweb)")

plot!(1:n_samples,
    Ns_M3_p75_co,
    color=RGB(0/255,158/255,115/255),
    alpha=0.6,
    linewidth=3,
    label="p = 0.75")

plot!(1:n_samples,
    Ns_M3_p50_co,
    color=RGB(230/255,159/255,0/255),
    alpha=0.6,
    linewidth=3,
    label="p = 0.50")


xaxis!(:log,
    xlabel="Number of samples", 
    xticks=(a,a),
    xlims=(1,n_samples))

yaxis!(ylabel="Connectance")



plot(plot_bos, plot_bs, plot_links, plot_co,
    title = ["(a)" "(b)" "(c)" "(d)"],
    titleloc=:right, 
    titlefont=fonts,
    layout = (2, 2),
    dpi=1000,
    size=(800, 600))

savefig(joinpath("figures","network_accumulation.png"))



