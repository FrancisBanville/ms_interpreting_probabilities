### Conduct network analyses and make figures

# plot attributes
theme(:mute)
default(; frame=:box)
Plots.scalefontsizes(1.3)
fonts=font("Times",7)

## read network data

# metaweb
M = load(joinpath("data", "processed", "metaweb.jld2"))["N"]

# local networks
Ns = load(joinpath("data", "processed", "local_networks.jld2"))["N"]

# keep networks with 5 or more interactions only
Ns = Ns[links.(Ns) .>= 5]


####### Figure of beta diversity #######

# we use bw (Whittaker 1960) as a measure of network dissimilarity
# bw = (a + b + c) / [(2a + b + c) / 2] - 1
# a = number of shared items
# b and c = number of items unique to the two networks
# in bs items are species
# in bos items are interactions between shared species

# number of simulations and samples
n_sim = 100
n_samples = 200

# calculate bos and bs
bos = zeros(Float64, n_sim, n_samples)
bs = zeros(Float64, n_sim, n_samples)

# simulate different network accumulation curves
p = Progress(n_sim)
Threads.@threads for i in 1:n_sim
        
        # select inital network randomly 
        N = sample(Ns, 1)[1]
        
        # update list of remaining networks 
        Ns_remain = Ns[findall(x -> x != N, Ns)]

        # calculate beta diversity
        bos[i, 1] = KGL02(βos(N, M))
        bs[i, 1] = KGL02(βs(N, M))

        for j in 2:n_samples
            # select following network
            N2 = sample(Ns_remain, 1)[1]

            # update list of remaining networks 
            Ns_remain =  Ns_remain[findall(x -> x != N2, Ns_remain)]

            # combine networks
            N = union(N, N2)
        
            # calculate beta diversity
            bos[i, j] = KGL02(βos(N, M))
            bs[i, j] = KGL02(βs(N, M))
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

xaxis!(xlabel="Number of samples", 
    xlims=(0,n_samples))

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
    linewidth=6)



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

xaxis!(xlabel="Number of samples", 
    xlims=(0,n_samples))

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
    linewidth=6)


plot(plot_bos, plot_bs,
    title = ["(a)" "(b)"],
    titleloc=:right, 
    titlefont=fonts,
    layout = (1, 2),
    dpi=1000)

savefig(joinpath("figures","beta_diversity.png"))