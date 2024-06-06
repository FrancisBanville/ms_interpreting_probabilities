"""
    spatiotemporal_model(; pxij = 0.5, λ = 1, t0 = 1)

Predict the probability that two taxa i and j interact locally during a time period t0. 

pxij: probability of co-occurrence.
λ: rate of interaction.
t0: time period.
"""
function spatiotemporal_model(; pxij = 0.5, λ = 1, t0 = 1)
    # spatiotemporally explicit model of interactions
    return pxij * (1 - exp(-λ * t0))
end

