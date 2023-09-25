"""
    spatiotemporal_model(; p_ixy = 0.5, p_jxy = 0.5, γ = 2, λ = 1, t0 = 1)

Predict the probability that two taxa i and j interact locally at a location (x,y) and time period t0. 

p_ixy: probability of occurrence of the first taxa.
p_jxy: probability of occurrence of the second taxa.
γ: strength of association between occurrence and co-occurrence.
λ: rate of interaction.
t0: time period.
"""
function spatiotemporal_model(; p_ixy = 0.5, p_jxy = 0.5, γ = 2, λ = 1, t0 = 1)
    # spatiotemporally explicit model of interactions
    return p_ixy * p_jxy * γ * (1 - exp(-λ * t0))
end

