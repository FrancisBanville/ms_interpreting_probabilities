## Activate project environment
## Creates a list of packages and dependencies with specific versions used
import Pkg; Pkg.activate(".")

Pkg.instantiate()

## Load required packages

# Manipulating variables, data frames and files
import CSV 
using DataFrames 
using JLD2

# Doing statistics and models
using ProgressMeter
using Random
using SparseArrays
using Statistics
using StatsBase

# Making plots
using Plots 
using StatsPlots 

# Analyzing ecological networks
using EcologicalNetworks 

# Using R within Julia
using RCall

## Load functions
include(joinpath("code", "functions", "accumulate.jl"))
include(joinpath("code", "functions", "prob_metaweb.jl"))
include(joinpath("code", "functions", "prob_networks.jl"))
include(joinpath("code", "functions", "merge_networks.jl"))

## Load scripts
# source("01_import_data.r") # run in R
include(joinpath("code", "02_process_data.jl"))
include(joinpath("code", "03_build_prob_networks.jl"))
include(joinpath("code", "04_make_figures.jl"))


