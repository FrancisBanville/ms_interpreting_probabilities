# Introduction

Cataloging species interactions across space is a gargantuan task. At the core
of this challenge lies the spatiotemporal variability of ecological networks
[@Poisot2012Dissimilaritya; @Poisot2015Speciesa], which makes documenting the location and
timing of interactions difficult. Indeed, it is not sufficient to know that two
species have the biological capacity to interact to infer the realization of
their interaction at a specific time and space [@Dunne2006Network]. Taking food
webs as an example, a predator species and its potential prey must first
co-occur on the same territory in order for a trophic interaction to take place
[@Blanchet2020Cooccurrencea]. They must then encounter, which is conditional on their
relative abundances in the ecosystem and the matching of their phenology
[@Poisot2015Speciesa]. Finally, the interaction occurs only if the predators have
a desire to consume their prey and are able to capture and ingest them
[@Pulliam1974Theory]. Environmental (e.g. temperature and presence of shelters)
and biological (e.g. physiological state of both species and availability of
other prey species) factors contribute to this variability by impacting species
co-occurrence [@Araujo2011UsiSpe] and the realization of their interactions
[@Poisot2015Speciesa]. In this context, it is unsurprising that computational
methods are being developed in ecology to help alleviate the colossal sampling
efforts required to document species interactions across time and space
[@Strydom2021Roadmapa]. Having a better portrait of species interactions and the
emerging structure of their food webs is important since it lays the groundwork
for understanding the functioning, dynamics, and resilience of ecosystems
worldwide [e.g., @Proulx2005NetThi; @Pascual2006EcoNet; @Delmas2019AnaEco]. 

The recognition of the intrinsic variability of species interactions and the
emergence of numerical methods have led ecologists to rethink their
representation of ecological networks, slowly moving from a binary to a
probabilistic view of species interactions [@Poisot2016Structure]. This has
several benefits. For example, probabilities represent the limit of our
knowledge about species interactions and can inform us about the expected number
of interactions and emerging network properties despite this limited knowledge
[@Poisot2016Structure]. They are also very helpful in predicting the spatial
distribution of species within networks [@Cazelles2016Theorya] and the temporal
variability of interactions [@Poisot2015Speciesa], generating new ecological
data [e.g., @Strydom2022Food], and identifying priority sampling locations of
species interactions [see @Andrade-Pacheco2020Finding for an ecological example
of a sampling optimization problem]. Moreover, the high rate of false negatives
in ecological network data, resulting from the difficulty of witnessing
interactions between rare species, makes it hard to interpret non-observations
of species interactions ecologically [@Catchen2023Missinga]. Using probabilities
instead of yes-no interactions accounts for these observation errors; in that
case, only forbidden interactions [@Jordano2003Invarianta; @Olesen2010Missing] would
have a probability value of zero [but see @Gonzalez-Varo2016Labilea]. Many
measures have been developed to describe the structure [@Poisot2016Structure]
and diversity [@Ohlmann2019DivInd; @GodsoeSpeInt] of probabilistic interactions,
which shows the potential of this framework in the study of a variety of
ecological phenomena.

However, representing species interactions probabilistically can also be
challenging. Beyond methodological difficulties in estimating these numbers,
there are important conceptual challenges in defining what we mean by
"probability of interactions". To the best of our knowledge, because the
building blocks of this mathematical representation of food webs are still being
laid, there is no clear definition found in the literature. This is worrisome,
since working with probabilistic species interactions without clear guidelines
could be misleading as much for field ecologists as for computational ecologists
who use and generate these data. In this contribution, we outline different ways
to define and interpret interactions probabilities in network ecology and
propose an approach to thinking about them. These definitions mostly depend on
the study system (e.g. local network or metaweb) and on the method used to
generate them. We show that different definitions can have different ecological
implications, especially regarding spatial, temporal, and taxonomic scaling.
Although we will focus on food webs, our observations and advice can be applied
to all types of ecological networks, from plant-pollinator to host-parasite
networks. Specifically, we argue that probabilities should be better documented,
defined mathematically, and used with caution when describing species
interactions. 

# Definitions and interpretations

The basic unit of food webs and other ecological networks are individuals that
interact with each others [e.g., by predation; @Elton2001AniEco]. The
aggregation of these individuals into more or less homogeneous groups (e.g.,
populations, species, trophic species) allows us to represent networks at
different scales, which impacts the properties and behaviour of these systems
[@Guimaraes2020StrEco]. A network's nodes can thus designate distinct levels of
organization, whereas the edges linking these nodes can describe a variety of
interaction measures. When using a Boolean (yes-no) representation of biotic
interactions, the observation that one individual from group (or node) $i$
interacts with another individual from group $j$ is enough to set the
interaction $A_{i,j}$ to 1. This simplified representation of food webs is a
highly valuable source of ecological information [@Pascual2006EcoNet] even
though it overlooks important factors regarding interaction strengths. These, in
turn, can be represented using weighted interactions, which better describe the
energy flows, demographic impacts or frequencies of interactions between nodes
[@Berlow2004IntStr; @Borrett2019WalPar], with $A_{i,j} \in \mathbb{N}$ or
$\mathbb{R}$ depending on the measure. For example, they can be used to estimate
the average number of prey individuals consumed by the predators in a given time
period. This extra amount of ecological information typically comes at a cost of
greater sampling effort or data requirement in predictive models
[@Strydom2021Roadmapa], which can lead to high uncertainties when building these
types of networks.

The uncertainty and spatiotemporal variability of both types of biotic
interactions (Boolean and weighted) can be represented probabilistically. On one
hand, Boolean interactions follow a Bernoulli distribution $A_{i,j} \sim {\rm
Bernoulli}(p)$, with $p$ being the probability of interactions. The only two
possible outcomes are the presence ($A_{i,j} = 1$) or absence ($A_{i,j} = 0$) of
an interaction between the two nodes. Weighted interactions, on the other hand,
can follow various probability distributions depending on the measure used. In
this case, the event's outcome is the value of interaction strength. For
instance, weights can follow a Poisson distribution $A_{i,j} \sim {\rm
Poisson}(\lambda)$ when predicting frequencies of interactions between pairs of
nodes, with $\lambda$ being the expected rate of interaction. The definition and
interpretation of parameters like $p$ and $\lambda$ are inextricably linked to
environmental and biological factors such as species relative abundance, traits,
area, and time, depending on the type of interaction. Because Boolean species
interactions are much more documented in the literature, our primary focus in
this contribution will be on addressing the challenges in defining and
interpretating $p$ for pairwise species interactions.

The first aspect to take into consideration when estimating or using
probabilities of interactions is knowing if they describe the likelihood of
potential or realized interactions. A potential interaction is defined as the
biological capacity of two species to interact (i.e., the probability that they
*can* interact) whereas a realized interaction refers to the materialization or
observation of this interaction in a delineated space and time period (i.e., the
probability that they *will* interact). Here, we will use the terms *metaweb* to
designate networks of potential interactions and *local networks* for those of
realized interactions. Frequent confusion arises among ecologists over the use
of these two terms, especially in a probabilistic context. Indeed, in many
studies of probabilistic ecological networks, it remains unclear when authors
describe potential or realized interactions, or when so-called probabilities are
actually *interaction scores*. A better understanding of these differences would
alleviate interpretation errors and help ecologists use these numbers more
appropriately. 

## Probabilistic metawebs

What does a probability in the context of a metaweb mean?

$$P(i \rightarrow j)$$

- It means the probability that two taxa can interact, regardless of biological
  plasticity, environmental variability, or co-occurrence.
- One observation is enough to set this probability to one.
- Can we turn this into a local network realisation that is also probabilistic
  and intuitive?
- Low probability with rare interactions?

**Papers:** @Strydom2022Food

## Probabilistic local networks

$$P(i \rightarrow j | C, A, N, E, t)$$

i = predator
j = prey
C = co-occurrence (and relative abundance?)
A = area
N = relative abundance  (or network?)
E = environment (including network?)
t = time

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
@McLeod2021Sampling; @Wood2015Effects

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

# Acknowledgement

We acknowledge that this study was conducted on land within the traditional
unceded territory of the Saint Lawrence Iroquoian, Anishinabewaki, Mohawk,
Huron-Wendat, and Omàmiwininiwak nations. This work was supported by the
Institute for Data Valorisation (IVADO) and the Natural Sciences and Engineering
Research Council of Canada (NSERC) Collaborative Research and Training
Experience (CREATE) program, through the Computational Biodiversity Science and
Services (BIOS²) program. A special thank to all members of the Black Holes and
Revelations working group (organized by BIOS²) for their insightful discussions
and valuable feedbacks on this manuscript.

# References
