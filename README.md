# Introduction

Cataloging species interactions across space is a gargantuan task. At the core
of this challenge lies the spatiotemporal variability of ecological networks
[@Poisot2015SpeWhy], which makes documenting the location and timing of
interactions difficult. Indeed, it is not sufficient to know if two species have
the biological capacity to interact to infer the realization of this interaction
at a specific time and space. Taking food webs as an example, a predator and its
potential prey must first co-occur on the same territory in order for a trophic
interaction to take place. They must then cross paths, which can happen only if
their relative abundances in the ecosystem is high enough and their phenology
matches. Finally, the interaction occurs only if the predator has a desire to
consume its prey and is able to capture and ingest it. Environmental (e.g.
temperature and presence of shelters) and biological (e.g. physiological state
of both individuals and availability of other prey species) factors contribute
to this variability by impacting species co-occurrence and the realization of
their interactions. In this context, it is unsurprising that computational
methods are being developed in ecology to help alleviate the colossal sampling
efforts required to document species interactions across time and space
[@Strydom2021RoaPre]. 

The recognition of the variability of species interactions and the emergence of
numerical methods have led ecologists to rethink their representation of
ecological networks, slowly moving from a binary to a probabilistic view of
species interactions [@Poisot2016StrProa]. This has several benefits. For
example, probabilities represent the limit of our knowledge about species
interactions and can indicate the expected frequency of two species interacting
with each other. They are also very helpful in predictive models when modeling
the spatial distribution and temporal variability of ecological networks,
generating new ecological data, and identifying priority sampling locations. 

However, representing species interactions probabilistically can also be
challenging. Beyond methodological difficulties in estimating these numbers,
there are important conceptual challenges in defining what we mean by
"probability of interactions". Because this ecological representation is still
in its infancy, there is no clear definition found in the literature. In this
contribution, we outline different ways to define and interpret interactions
probabilities in network ecology and propose an approach to thinking about them.
These definitions mostly depend on the study system (e.g. local network or
metaweb) and on the method used to generate them. We show that different
definitions can have different ecological implications, especially related to
spatial, temporal, and taxonomic scaling. Although we will focus on food webs,
our observations and advice can be applied to all types of ecological networks,
from plant-pollinator to host-parasite networks. Overall, we argue that
probabilities should be better documented, defined mathematically, and used with
caution when describing species interactions. 

# Definitions and interpretations

## Overview of interaction probabilities

How are interaction probabilities defined in the literature? It might not be as
intuitive as one would think.

- There is a big difference in how we interpret the probability that two species
  *can* interact (metaweb) and the probability that they *will* interact
  (realized networks).
- Interaction probabilities can be used to describe Boolean interactions (e.g.,
  the probability that two species interact) and weighted interactions (e.g.,
  the probability distribution of the amount of energy flow between two
  species).
- In many studies, it is not obvious if authors use interaction
  scores or probabilities (in the latter case, it is rarely specified what these
  probabilities truly represent).

## Probabilistic metawebs

What does a probability in the context of a metaweb mean?

- It means the probability that two taxa can interact, regardless of biological
  plasticity, environmental variability, or co-occurrence.
- One observation is enough to set this probability to one.
- Can we turn this into a local network realisation that is also probabilistic
  and intuitive?

**Papers:** @Strydom2022FooWeb

## Probabilistic local networks

What does a probability in the context of a local network mean? A cautionary
tale of how we define probabilities.

- It means the probability that two taxa will interact at a given location.
- What do we mean by saying that two taxa will interact? We usually mean that at least one individual from
  one group will interact with (e.g., predate) at least one other individual
  from the other group.
- The probability is conditional on the environmental and local abundance
  contexts.
- We should expect a certain number of interactions to be realized depending on the
  probability value. This number depends on the number of trials, which also depends on
  the ecological context (e.g., environmental conditions,
  scale) in which probabilities were estimated. This is in contrast with
  probabilities in metawebs.

# Scaling

## Spatial and temporal scales

How do interaction probabilities scale spatially and temporally?

- Why do probabilistic local food webs scale with area and time but not
  probabilistic metawebs?
- In metawebs, interaction probabilities do not scale with space and time because
  they depend solely on the biological capacity of two species to interact.
- In local food webs, interaction probabilities scale with space and time because there
  are more opportunities of interactions (e.g., more environmental conditions)
  in a larger area and longer time period.
- What are some network area relationships in probabilistic local food webs?
- We know that local networks can inform regional networks. However, can regional networks inform
  local networks?

**Figure:** Empirical example of the association between the number of
interactions in realized local food webs and the number of interactions in the
corresponding species subnetworks of regional networks. We should expect the
interaction to be linear below the 1:1 line.

**Papers:** there might be something in these @McLeod2020EffSpe;
@McLeod2021SamAsy; @Wood2015EffSpa

## Taxonomic scale

How do interaction probabilities scale taxonomically?

- There are different biological interpretations of probabilities in food webs at the
  individual level and at higher taxonomic levels.
- How does the scaling up of the nodes from an individual to population to
  any higher taxonomic group change our interpretation of interaction probabilities?
  How does the aggregation change our interpretation?
- How is it similar and different to spatial and temporal scaling? Basically, all kinds of
  scaling are just different ways to aggregate individuals or nodes.

**Figure:** Conceptual figure of how a scale up of the nodes from an individual
to a population to any higher taxonomic group change our interpretation of the
probability of interaction.

# Concluding remarks

Here we present some advice moving forward.

- What can we learn from other systems/fields (e.g., social networks, probabilistic graph theory)?
- What even are probabilities? What is the probability that we will ever
  know the answer to that?
- Be careful of how we define probabilities. Be sure to be explicit about these
  things. Be sure to specify the type of interaction, the spatial, temporal, and
  taxonomic scale when presenting new data on interaction probabilities. We need
  better metadata documentation.
- Be careful to use and manipulate interaction probabilities properly depending
  on how they were defined and obtained. Different interpretations imply different scaling,
  and thus different ways to manipulate these numbers.
- Maybe mention thinking about a workflow to predict probabilistic local
  food webs from probabilistic metawebs.

# References
