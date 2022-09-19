# Introduction 

## General background 

Why is it useful to think about interactions as probabilistic events?

- A biological interaction is probabilistic since two taxa co-occurring does not mean they are going to meet (e.g., think of species relative abundances). Also, two individuals meeting does not mean that an interaction will occur (e.g., a lion crossing paths with a gazelle does not mean predation). 
- Interaction is contextual on the environment and on the physiological state of both species (or individuals).
- Representing ecological interactions as probabilistic events helps us predict networks across time and space and assess the spatial variability of biological interactions. 

**Papers:** @Poisot2016StrProa


## Problem and objectives

Why should we use probabilities with caution when working with ecological networks? What is the objective of this paper?

- There are different ways to define and interpret interaction probabilities depending on the study system and on the method used to build probabilistic networks. 
- It is important to document and define what we mean by an interaction probability because different definitions can have different ecological and statistical implications. 
- This paper aims to outline some of the challenges in interpreting interaction probabilities and propose an approach to thinking about them.


# Definitions and interpretations

## Overview of interaction probabilities 

How are interaction probabilities defined in the literature? It might not be as intuitive as one would think.

- There is a big difference in how we interpret the probability that two species *can* interact (metaweb) and the probability that they *will* interact (realized networks). 
- Interaction probabilities can be used to describe Boolean interactions (e.g., the probability that two species interact) and weighted interactions (e.g., the probability distribution of the amount of energy flow between two species).
- In many studies, it is not obvious if their numbers represent interaction scores or probabilities (in the later case, it is rarely specified what these probabilities truly represent).


## Probabilistic metawebs

What does a probability in the context of a metaweb mean? 

- It means the probability that two taxa can interact, regardless of biological plasticity and environmental variability. 
- One observation is enough to set this probability to one. 
- Can we turn this into a local network realisation that is also probabilistic and intuitive?

**Papers:** @Strydom2022FooWeb


## Probabilistic local networks 

What does a probability in the context of a local network mean? A cautionary tale of how we define probabilities.

- It means the probability that two taxa will interact, regardless of biological plasticity and environmental variability. 
- What do we mean by two taxa will interact? That at least one individual from one group will interact with (e.g., predate) at least one other individual from the other group.
- The probability is conditional on the environmental and local abundance contexts. 
- We should expect a certain number of interactions to occur depending on the probability value. This number depends on the number of trials, which is defined according to the ecological context (e.g., environmental conditions, scale) in which probabilities were estimated. This is in contrast with probabilities in metawebs. 


# Scaling

## Spatial and temporal scales

How do interaction probabilities scale spatially and temporally?

- Why do probabilistic local networks scale with area and time but not probabilistic metawebs?
- Network area relationships (e.g., Ontario lakes and Alaska datasets)
- In metawebs, interaction probabilities do not scale with space and time. 
- In local networks, interaction probabilities scale with space and time. There are more opportunities of interactions (e.g., more environmental conditions) in a larger area and longer time period.
- Regional networks can inform local networks but can local networks inform regional networks? 

**Figure:** Empirical example of the association between the number of interactions in realized local networks and the number of interactions in the corresponding species subnetworks of regional networks. We should expect the interaction to be linear below the 1:1 line. 


## Taxonomic scale

How do interaction probabilities scale taxonomically?

- Difference of interpretation between probabilities in networks at the individual level and at any higher taxonomic level. 
- How does the scale up of the nodes from an individual to population to taxonomic group group change our interpretation of interaction probabilities? How does the aggregation change the interpretation? 
- How is it analogous to spatial and temporal scaling? Basically, all kinds of scaling are just different ways to aggregate individuals or nodes.

**Figure:** Conceptual figure of how a scale up of the nodes from an individual to a population to any taxonomic group change our interpretation of the probability of interaction. 


# Concluding remarks

Here we present some advice moving forward.

- Non-ecological Networks: What can we learn from other systems/fields (e.g., social networks, probabilistic graph theory)?
- What even are the probabilities? What is the probability that we will ever know the answer to that?
- Be careful how we define probabilities. Be sure to be explicit about these things. Be sure to specify the type of interaction, the spatial, temporal, and taxonomic scale when presenting new data on interaction probabilities. We need better metadata documentation. 
- Be careful to use and manipulate interaction probabilities properly depending on how they were defined. Different interpretations imply different scaling, and thus different ways to manipulate these numbers. 
- Maybe mention thinking about a workflow to predict probabilistic local networks from probabilistic metawebs. 


# References
