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
    foreground_color_legend=:black, 
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
    foreground_color_legend=:black, 
    background_color_legend=:white, 
    legendfont=fonts,
    legendfontpointsize=7,
    legendfontfamily="Times")

plot!(1:n_samples,
    Ns_M3_p100_links,
    color=RGB(86/255,190/255,233/255),
    alpha=0.6,
    linewidth=3,
    label="p = 1.0")

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
    foreground_color_legend=:black, 
    background_color_legend=:white, 
    legendfont=fonts,
    legendfontpointsize=7,
    legendfontfamily="Times")


plot!(1:n_samples,
    Ns_M3_p100_co,
    color=RGB(86/255,190/255,233/255),
    alpha=0.6,
    linewidth=3,
    label="p = 1.0")

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
        Ns_draws1_co[i, :] = connectance.(Ns_draws1)
        Ns_draws2_co[i, :] = connectance.(Ns_draws2)
    end
    return (samples_metaweb_co = Ns_draws1_co, samples_local_co = Ns_draws2_co)
end


### first subplot: scatterplot of network connectance obtained from the metaweb and local network sampling methods (averaged across simulations) 
# probability of local interaction between potentially interacting species = 1.0

samples_co_100_1 = sample_connectance(M3_fpfn, Ns_M3_fpfn_p100, nsim = 1)
samples_co_100 = sample_connectance(M3_fpfn, Ns_M3_fpfn_p100, nsim = 100)

# minimum and maximum values for plotting
min = 0.04
max = 0.26

plotA = scatter(mean.(eachcol(samples_co_100_1.samples_metaweb_co)), 
        mean.(eachcol(samples_co_100_1.samples_local_co)), 
        label = "n = 1",
        alpha = 0.5,
        color = :darkgrey,
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
        background_color_legend=:white, 
        legendfont=fonts,
        legendfontpointsize=8,
        legendfontfamily="Times")
        
scatter!(mean.(eachcol(samples_co_100.samples_metaweb_co)), 
        mean.(eachcol(samples_co_100.samples_local_co)), 
        label = "n = 100",
        color = RGB(86/255,190/255,233/255),
        alpha = 0.5)

# 1:1 line
plot!(min:0.01:max, 
        min:0.01:max, 
        linestyle=:dash, 
        linecolor=:grey,
        label="")

xaxis!(xlabel="Average connectance across metaweb samples", 
        xlims=(min-0.005, max+0.005))

yaxis!(ylabel="Average connectance across local samples", 
        ylims=(min-0.005, max+0.005))


### second subplot: scatterplot of network connectance obtained from the metaweb and local network sampling methods (averaged across simulations) 

# probability of local interaction between potentially interacting species = 0.75

samples_co_75_1 = sample_connectance(M3_fpfn, Ns_M3_fpfn_p75, nsim = 1)
samples_co_75 = sample_connectance(M3_fpfn, Ns_M3_fpfn_p75, nsim = 100)

plotB = scatter(mean.(eachcol(samples_co_75_1.samples_metaweb_co)), 
mean.(eachcol(samples_co_75_1.samples_local_co)), 
    label = "n = 1",
    alpha = 0.5,
    color = :darkgrey,
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
    background_color_legend=:white, 
    legendfont=fonts,
    legendfontpointsize=8,
    legendfontfamily="Times")

scatter!(mean.(eachcol(samples_co_75.samples_metaweb_co)), 
        mean.(eachcol(samples_co_75.samples_local_co)), 
        label = "n = 100",
        color = RGB(0/255,158/255,115/255),
        alpha = 0.5)

# 1:1 line
plot!(min:0.01:max, 
        min:0.01:max, 
        linestyle=:dash, 
        linecolor=:grey,
        label="")

xaxis!(xlabel="Average connectance across metaweb samples", 
        xlims=(min-0.005, max+0.005))

yaxis!(ylabel="Average connectance across local samples", 
        ylims=(min-0.005, max+0.005))


### third subplot: scatterplot of network connectance obtained from the metaweb and local network sampling methods (averaged across simulations) 
# probability of local interaction between potentially interacting species = 0.5

samples_co_50_1 = sample_connectance(M3_fpfn, Ns_M3_fpfn_p50, nsim = 1)
samples_co_50 = sample_connectance(M3_fpfn, Ns_M3_fpfn_p50, nsim = 100)

plotC = scatter(mean.(eachcol(samples_co_50_1.samples_metaweb_co)), 
mean.(eachcol(samples_co_50_1.samples_local_co)), 
    label = "n = 1",
    alpha = 0.5,
    color = :darkgrey,
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
    background_color_legend=:white, 
    legendfont=fonts,
    legendfontpointsize=8,
    legendfontfamily="Times")

scatter!(mean.(eachcol(samples_co_50.samples_metaweb_co)), 
        mean.(eachcol(samples_co_50.samples_local_co)), 
        label = "n = 100",
        color = RGB(230/255,159/255,0/255),
        alpha = 0.5)

# 1:1 line
plot!(min:0.01:max, 
        min:0.01:max, 
        linestyle=:dash, 
        linecolor=:grey,
        label="")

xaxis!(xlabel="Average connectance across metaweb samples", 
        xlims=(min-0.005, max+0.005))

yaxis!(ylabel="Average connectance across local samples", 
        ylims=(min-0.005, max+0.005))


### fourth subplot: scatterplot of the mean squared logarithmic error between the connectance obtained from the local network and metaweb sampling methods as a function of the number of simulations
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

a = [1,5,10,20,40,100]

plotD = scatter(nsims, 
        divergences_100, 
        label = "p = 1.0",
        color = RGB(86/255,190/255,233/255),
        alpha = 0.8,
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
        background_color_legend=:white, 
        legendfont=fonts,
        legendfontpointsize=8,
        legendfontfamily="Times")

scatter!(nsims, 
        divergences_75, 
        label = "p = 0.75",
        alpha = 0.8,
        color = RGB(0/255,158/255,115/255))

scatter!(nsims, 
        divergences_50, 
        label = "p = 0.50",
        color = RGB(230/255,159/255,0/255),
        alpha = 0.8)

xaxis!(:log,
        xlabel="Number of binary samples", 
        xticks = (a, a))

yaxis!(ylabel="Mean squared logarithmic error (MSLE)")



l = @layout [grid(3,1) d{0.6w}]

plot(plotA, plotB, plotC, plotD,
        title = ["(a) p = 1.0" "(b) p = 0.75" "(c) p = 0.50" "(d)"],
        titleloc=:right, 
        titlefont=fonts,
        layout = l,
        dpi=1000,
        size=(800, 800))
        
savefig(joinpath("figures","network_sampling.png"))





####### suppmat 


# average connectance for each network across simulations
plotA_sup = density(mean.(eachcol(samples_co_100.samples_metaweb_co)), 
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
                foreground_color_legend=:black, 
                background_color_legend=:white, 
                legendfont=fonts,
                legendfontpointsize=8,
                legendfontfamily="Times")

    # second sampling method
    density!(mean.(eachcol(samples_co_100.samples_local_co)), 
            label="",
            fill=(0, .2),
            linewidth=2)

    xaxis!(xlabel="Average connectance across simulations", 
        xlims=(0, 0.27))

    yaxis!(ylabel="Density", 
        ylims=(0, Inf))


# average connectance for each simulation across networks
plotB_sup = density(mean.(eachrow(samples_co_100.samples_metaweb_co)), 
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
                foreground_color_legend=:black, 
                background_color_legend=:white, 
                legend=:topleft,
                legendfont=fonts,
                legendfontpointsize=8,
                legendfontfamily="Times")

    # second sampling method
    density!(mean.(eachrow(samples_co_100.samples_local_co)), 
            label="",
            fill=(0, .2),
            linewidth=2)

    xaxis!(xlabel="Average connectance across networks")

    yaxis!(ylabel="Density", 
        ylims=(0, Inf))
        

# standard deviation of connectance for each simulation across networks
plotC_sup = density(std.(eachrow(samples_co_100.samples_metaweb_co)), 
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
                foreground_color_legend=:black, 
                background_color_legend=:white, 
                legendfont=fonts,
                legendfontpointsize=8,
                legendfontfamily="Times")

    # second sampling method
    density!(std.(eachrow(samples_co_100.samples_local_co)), 
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
            foreground_color_legend=:black, 
            background_color_legend=:white,
            legendfont=fonts,
            legendfontpointsize=7,
            legendfontfamily="Times")


plot(plotA_sup, plotB_sup, plotC_sup, legend,
        title = ["(a)" "(b)" "(c)" ""],
        titleloc=:right, 
        titlefont=fonts,
        layout = @layout([[A B C]; D{.1h}]),
        dpi=1000,
        size=(800, 400))

    
savefig(joinpath("figures", "supp", "network_sampling_avg.png"))




## difference between sampling methods for individual networks

function density_plots_co(i::Int64)

    density(samples_co_100.samples_metaweb_co[:, i], 
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
                foreground_color_legend=:black, 
                background_color_legend=:white, 
                legendfont=fonts,
                legendfontpointsize=8,
                legendfontfamily="Times")

    # second sampling method
    density!(samples_co_100.samples_local_co[:, i], 
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

savefig(joinpath("figures", "supp", "network_sampling_examples.png"))





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
    links_merged[1,:],
    label="expanding windows",
    color=:grey,
    alpha=0.7,
    linestyle=:dot,
    linewidth=1, 
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
    legendfontpointsize=7,
    legendfontfamily="Times")

for i in 2:length(areas)
    plot!(areas,
    links_merged[i,:],
    linestyle=:dot,
    alpha=0.7,
    color="grey",
    label="",
    linewidth=1)
end

plot!(areas,
    median.(eachcol(links_merged)),
    color=RGB(204/255,121/255,167/255),
    label="median",
    linewidth=5)

xaxis!(xlabel="Latitude width",
    xticks=(a,a))

yaxis!(ylabel="Expected number of links in merged network", 
    ylims=(-0.05, 1650))


## expected number of links in the submetawebs

plot_links_metaweb = plot(areas,
    links_metaweb[1,:],
    label="expanding windows",
    color=:grey,
    linewidth=1, 
    linestyle=:dot,
    alpha=0.7,
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
    legendfontpointsize=7,
    legendfontfamily="Times")

for i in 2:length(areas)
    plot!(areas,
    links_metaweb[i,:],
    color="grey",
    label="",
    alpha=0.7,
    linestyle=:dot,
    linewidth=1)
end

plot!(areas,
    median.(eachcol(links_metaweb)),
    color=RGB(204/255,121/255,167/255),
    label="median",
    linewidth=5)

xaxis!(xlabel="Latitude width",
    xticks=(a,a))

yaxis!(ylabel="Expected number of links in metaweb", 
    ylims=(-0.05, 1650))



# heatmaps of the expected numbers of links in the merged networks and submetawebs as a function of position and latitude width 
heatmap_links_merged = heatmap(areas, lats, links_merged, c = :viridis, 
        clims=(0,1650),
        colorbar_title="Expected number of links in merged network",
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

xaxis!(xlabel="Latitude width",
        xticks=(a,a))

yaxis!(ylabel="Central latitude (position)")


heatmap_links_metaweb = heatmap(areas, lats, links_metaweb, c = :viridis, 
        clims=(0,1650),
        colorbar_title="Expected number of links in metaweb",
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

xaxis!(xlabel="Latitude width",
        xticks=(a,a))

yaxis!(ylabel="Central latitude (position)")



plot(plot_links_merged, heatmap_links_merged,
    plot_links_metaweb, heatmap_links_metaweb,
    title = ["(a)" "(b)" "(c)" "(d)"],
    titleloc=:right, 
    titlefont=fonts,
    dpi=1000,
    size=(800, 700))

savefig(joinpath("figures","spatial_scaling.png"))




####### Figure of spatiotemporal interactions #######

### heatmap of the probability of interactions with changing λ and γ (fixed p_ixy, p_jxy and t0)

# explored values of λ and γ for heatmap
λ_heat = [0:0.01:4;]
γ_heat = [0:0.01:4;]

# explored values of λ and γ for line plot
γ_line = [1.0; 2.0]
λ_line = [1.0; 2.0]

# reshape points for plotting
params = vec(collect(Base.product(γ_line, λ_line)))

n_points = size(params)[1]
γ_point = [params[i][1] for i in 1:n_points]
λ_point = [params[i][2] for i in 1:n_points]

# calculate probability of interactions
p = zeros(Float64, length(γ_heat), length(λ_heat))

for i in 1:length(γ_heat), j in 1:length(λ_heat)
    p[i, j] = spatiotemporal_model(γ = γ_heat[i], λ = λ_heat[j], p_ixy = 0.5, p_jxy = 0.5, t0 = 1)
end

# make heatmap
plotA = heatmap(λ_heat, γ_heat, p, c = :viridis, 
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
        γ_point,
        markershape = :star4,
        markercolor = :white,
        markersize = 5,
        label = "")

xaxis!(xlabel="Interaction rate λ", 
        xlims=(minimum(λ_heat), maximum(λ_heat)))

yaxis!(ylabel="Strength of co-occurrence γ",
        ylims=(minimum(γ_heat), maximum(γ_heat)))


### time series of the probability of interactions with changing λ and γ (fixed p_ixy and p_jxy)

# time steps
t = [0:0.1:5;]

# calculate probability of interactions
p = zeros(length(t), length(params))

for (i, t0) in enumerate(t), j in 1:length(params)
    p[i,j] = spatiotemporal_model(p_ixy = 0.5, p_jxy = 0.5, γ = params[j][1], λ = params[j][2], t0 = t0)
end

# plot time series
linestyles = [:solid, :dash, :dot, :dashdot]
plotB = plot(t, p[:,1],
    linewidth=1.5,
    linestyle=linestyles[1],
    label="γ = $(params[1][1]), λ = $(params[1][2])",
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
    legendfontpointsize=7,
    legendfontfamily="Times")

for i in 2:length(params)
    plot!(t, p[:,i],
        linewidth=1.5,
        linestyle=linestyles[i],
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


