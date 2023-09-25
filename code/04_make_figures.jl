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



####### Figure of network sampling #######

# generate binary realizations of each local network using the two sampling methods (sampling interactions from the metaweb once or independently for each local network)

# calculate connectance for each random draw of each local network
nsim = 500

Ns_draws1_co = zeros(Float64, nsim, length(Ns))
Ns_draws2_co = zeros(Float64, nsim, length(Ns))

# generate binary realizations from probabilistic networks obtained using the method of false positives and negatives
for i in 1:nsim
    ## first sampling method: one random realization of the metaweb
    Ns_draws1 = sample_networks(M3_fpfn, Ns_M3_fpfn_p100)
    ## second sampling method: one random realization for each local network
    Ns_draws2 = sample_networks(Ns_M3_fpfn_p100)

    ## calculate connectance
    Ns_draws1_co[i, :] = connectance.(Ns_draws1)
    Ns_draws2_co[i, :] = connectance.(Ns_draws2)
    
end

# first subplot: average connectance for each network across simulations
plotA = density(mean.(eachcol(Ns_draws1_co)), 
                label="",
                fill=(0, .5),
                linewidth=2, 
                framestyle=:box, 
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
                legendfontpointsize=8,
                legendfontfamily="Times")

    # second sampling method
    density!(mean.(eachcol(Ns_draws2_co)), 
            label="",
            fill=(0, .2),
            linewidth=2)

    xaxis!(xlabel="Average connectance across simulations", 
        xlims=(0, 0.27))

    yaxis!(ylabel="Density", 
        ylims=(0, Inf))


# second subplot: average connectance for each simulation across networks
plotB = density(mean.(eachrow(Ns_draws1_co)), 
                label="",
                fill=(0, .5),
                linewidth=2, 
                framestyle=:box, 
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
                legendfontpointsize=8,
                legendfontfamily="Times")

    # second sampling method
    density!(mean.(eachrow(Ns_draws2_co)), 
            label="",
            fill=(0, .2),
            linewidth=2)

    xaxis!(xlabel="Average connectance across networks")

    yaxis!(ylabel="Density", 
        ylims=(0, Inf))
        

# third subplot: standard deviation of connectance for each simulation across networks
plotC = density(std.(eachrow(Ns_draws1_co)), 
                label="",
                fill=(0, .5),
                linewidth=2, 
                framestyle=:box, 
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
                legendfontpointsize=8,
                legendfontfamily="Times")

    # second sampling method
    density!(std.(eachrow(Ns_draws2_co)), 
            label="",
            fill=(0, .2),
            linewidth=2)

    xaxis!(xlabel="Standard deviation of connectance across networks")

    yaxis!(ylabel="Density", 
        ylims=(0, Inf))


# legend
legend = plot([0 0], 
            fill=(0, .5), 
            linewidth=2, 
            showaxis = false, 
            grid = false, 
            label = ["sampling from the metaweb" "sampling from local networks"], 
            legend = :top,
            foreground_color_legend=nothing, 
            background_color_legend=:white,
            legendfont=fonts,
            legendfontpointsize=7,
            legendfontfamily="Times")


plot(plotA, plotB, plotC, legend,
        title = ["(a)" "(b)" "(c)" ""],
        titleloc=:right, 
        titlefont=fonts,
        layout = @layout([[A B C]; D{.1h}]),
        dpi=1000,
        size=(800, 400))

    
savefig(joinpath("figures","network_sampling.png"))




## difference between sampling methods for individual networks (SUP MAT)

function density_plots_co(i::Int64)

    density(Ns_draws1_co[:, i], 
                label="",
                fill=(0, .5),
                linewidth=2, 
                framestyle=:box, 
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
                legendfontpointsize=8,
                legendfontfamily="Times")

    # second sampling method
    density!(Ns_draws2_co[:, i], 
            label="",
            fill=(0, .2),
            linewidth=2)
        
    xaxis!(xlabel="Connectance")

    yaxis!(ylabel="Density", 
            ylims=(0, Inf))
end

# select 9 networks randomly 
i = sample(1:length(Ns), 9, replace=false)
Si = richness.(Ns[i])

# plot them
plot1 = density_plots_co(i[1]) 
plot2 = density_plots_co(i[2]) 
plot3 = density_plots_co(i[3]) 
plot4 = density_plots_co(i[4]) 
plot5 = density_plots_co(i[5]) 
plot6 = density_plots_co(i[6]) 
plot7 = density_plots_co(i[7]) 
plot8 = density_plots_co(i[8]) 
plot9 = density_plots_co(i[9]) 


plot(plot1, plot2, plot3, plot4, plot5, plot6, plot7, plot8, plot9, legend,
        title = ["S = $(Si[1])" "S = $(Si[2])" "S = $(Si[3])" "S = $(Si[4])" "S = $(Si[5])" "S = $(Si[6])" "S = $(Si[7])" "S = $(Si[8])" "S = $(Si[9])" ""],
        titleloc=:right, 
        titlefont=fonts,
        layout = @layout([[A B C]; [D E F]; [G H I]; D{.1h}]),
        dpi=1000,
        size=(800, 800))

savefig(joinpath("figures","network_sampling_examples.png"))



####### Figure of spatiotemporal interactions #######

### heatmap of the probability of interactions with changing λ and γ (fixed p_ixy, p_jxy and t0)

# explored values of λ and γ
λ = [0:0.01:4;]
γ = [0:0.01:4;]

# calculate probability of interactions
p = zeros(Float64, length(γ), length(λ))

for i in 1:length(γ), j in 1:length(λ)
    p[i, j] = spatiotemporal_model(γ = γ[i], λ = λ[j], p_ixy = 0.5, p_jxy = 0.5, t0 = 1)
end

# make heatmap
plotA = heatmap(λ, γ, p, c = :viridis, 
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
        foreground_color_legend=nothing, 
        background_color_legend=:white)

xaxis!(xlabel="Interaction rate λ")
yaxis!(ylabel="Strength of co-occurrence γ")


### time series of the probability of interactions with changing λ and γ (fixed p_ixy and p_jxy)

# explored values of λ and γ
γ = [1.0; 2.0]
λ = [1.0; 2.0]

params = vec(collect(Base.product(γ, λ)))

# time steps
t = [0:0.1:5;]

# calculate probability of interactions
p = zeros(length(t), length(params))

for (i, t0) in enumerate(t), j in 1:length(params)
    p[i,j] = spatiotemporal_model(p_ixy = 0.5, p_jxy = 0.5, γ = params[j][1], λ = params[j][2], t0 = t0)
end

# plot time series
plotB = plot(t, p[:,1],
    alpha=0.8,
    linewidth=4,
    label="γ = $(params[1][1]), λ = $(params[1][2])",
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

for i in 2:length(params)
    plot!(t, p[:,i],
        alpha=0.8,
        linewidth=4,
        label="γ = $(params[i][1]), λ = $(params[i][2])")
end

xaxis!(xlabel="Duration t0",
    xlims=(0, Inf))

yaxis!(ylabel="Probability of interaction", 
        ylims=(0, 0.52))


plot(plotA, plotB,
        title = ["(a)" "(b)"],
        titleloc=:right, 
        titlefont=fonts,
        dpi=1000,
        size=(800, 350))

savefig(joinpath("figures","spatiotemporal_model.png"))


