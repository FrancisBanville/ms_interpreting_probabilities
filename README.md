# Introduction

As we try to navigate global biodiversity change, filling in knowledge gaps
about biodiversity becomes instrumental to monitoring and mitigating those
changes (@Gonzalez2022Monitor, @Abrego2021Accounting). However, cataloging
species, populations and, in particular, ecological interactions (e.g.,
predation, parasitism, and pollination) is a substantial challenge
(@Polis1991Complex, @Pascual2006Ecologicala). There are methodological and
biological constraints that hinder our ability to observe all ecological
interactions, leading to significant uncertainties in our understanding of these
interactions. For example, the spatial and temporal uncoupling of species (e.g.,
nocturnal and diurnal species coexisting in the same space without interacting
due to differences in the timing of their daily activities, @Jordano1987PatMut)
and the large number of rare and cryptic interactions in a community contribute
to these uncertainties (@Jordano2016Samplingb). More generally, a handful of
conditions must be satisfied for an interaction to be observed locally. First,
both species must have overlapping geographic ranges, i.e. they must co-occur
within the region of interest (@Blanchet2020Cooccurrencea). Second, they must
have some probability of meeting. Probabilities of interspecific encounters are
typically low, especially for rare species with low abundances. While species'
absolute abundance may impact interaction frequencies (@Vazquez2007Species),
encounter probabilities are determined by their relative abundance
(@Canard2012Emergencea, @Canard2012Emergencea). The probability that species
meet each other also depends on their biological characteristics, such as the
synchronization of their phenology (@Olesen2010Missing, @Singer2012GeoMos) and
their discoverability (e.g., @Broom2005You). Finally, when species do come into
contact, an interaction occurs only if their traits are locally compatible
(@Poisot2015Speciesa), including but not limited to their body phenotypes
(@Bolnick2011WhyInt, @Stouffer2011RolBod, @Gravel2013InfFooa) and behavioral
choices (@Pulliam1974Theory, @Choh2012PreRol). Interactions may also be
influenced by the presence or prevalence of a third species (e.g., of a more
profitable prey species, @Golubski2011ModMod, @Sanders2012Indirect). Documenting
the location and timing of interactions becomes even more difficult when
accounting for the spatiotemporal variability of ecological interactions
(@Poisot2012Dissimilaritya, @Poisot2015Speciesa). Environmental factors, such as
temperature (@Angilletta2004TemGro), drought (@Woodward2012CliCha), climate
change (@Gilman2010FraCom, @Woodward2010ChaEco, @Araujo2011Usinga), and habitat
modifications (@Tylianakis2007HabMod), contribute to this spatiotemporal
variability by impacting species abundance and traits. Even after satisfying all
these conditions, there remains a possibility that the interaction does not
occur locally, either due to the intricate nature of the system or simply by
chance. If it does occur, it might still go unnoticed, particularly if it
happens infrequently. In this context, it is unsurprising that our knowledge of
ecological interactions remains limited (@Hortal2015SevSho) despite extensive
biodiversity data collection (@Schmeller2015GloTer). 

Knowing the biological capacity of two species to interact directly (via e.g.,
trophic interactions) is necessary but not sufficient for inferring their
interaction at a specific time and space. The recognition of the intrinsic
variability of species interactions has led ecologists to expand their
representation of ecological networks (also known as ecological webs) to include
a probabilistic view of interactions (@Poisot2016Structure,
@Dallas2017Predictinga, @Fu2021Link). This different perspective allows us to
fill in the Eltonian shortfall (@Hortal2015SevSho) by modeling the probability
of detecting interactions, which can be an important tool for directing efforts
and taking action, especially in places where access and resources for research
are scarce. The probabilistic representation of interactions is thus far limited
to direct interactions, which are conceptually and mathematically analogous
regardless of their biological type (e.g., predation and pollination). This is
in contrast with indirect interactions (e.g., interspecific competition), which
arise from distinct ecological processes and are often not directly observable
(@Kefi2015NetStr, @Kefi2016HowStr). Representing direct interactions
probabilistically enables us to capture the spatiotemporal variability of the
aforementioned ecological processes and the uncertainties associated with their
measurement. As opposed to webs of binary deterministic interactions, in which
interactions are regarded as either occurring or not, webs of probabilistic
interactions, within a Bayesian framework, express our degree of belief (or
confidence) regarding the occurrence or observation of interactions. Based on
the scale at which they are estimated, probabilistic interactions may reflect
our level of confidence in whether interactions will be observed, realized
locally, or biologically feasible. As an illustration, we could outline a
situation in which there is a 50% certainty that an interaction occurs 50% of
the time, or that there is a 50% certainty that it simply occurs. Our level of
confidence should be more definitive (approaching either 0 or 1) as we extend
our sampling to a broader area and over a longer time period, thereby
diminishing the uncertainty of the interactions (but not necessarily the
estimation of their variability). In the broadest sense, binary interactions are
also a type of probabilistic interaction, in which the numerical value of an
interaction is restrained to 0 (non-occurring) or 1 (occurring). Yet, for the
sake of clarity, we omit binary interactions from our discussion of
probabilistic interactions in this contribution. In networks of probabilistic
interactions, only forbidden interactions (i.e., interactions prohibited by
biological traits or species absence, @Jordano2003Invarianta,
@Olesen2010Missing) have a probability value of zero by default, provided that
intraspecific trait variability is considered (@Gonzalez-Varo2016Labilea). 

By accounting for the uncertainty of interactions, networks of probabilistic
interactions may provide a more realistic portrait of species interactions.
However, it is still unknown how the uncertainty of pairwise interactions
propagate to network structure (i.e., community-level properties that drive the
functioning, dynamics, and resilience of ecosystems, @Proulx2005Networka,
@McCann2007ProBio, @McCann2011FooWeb, @Rooney2012IntFoo). The application and
development of computational methods in network ecology, often based on a
probabilistic representation of interactions, can alleviate (and guide) the
sampling efforts required to document species interactions
(@Strydom2021Roadmapa). For example, statistical models can be used to estimate
the uncertainty of pairwise interactions (@Cirtwill2019QuaFra) and the
probability of missing (false negatives) and spurious (false positives)
interactions (@Guimera2009MisSpu). Considering the high rate of false negatives
in species interaction data due to the difficulty of witnessing rare
interactions (@Catchen2023Missinga), these models could inform the
identification of priority sampling locations of ecological webs where data
collection would yield the most valuable information, thereby reducing errors.
Optimization models for sampling locations have mostly found applications in
biological systems that are not networks, such as identifying priority sampling
sites for disease hotspots (@Andrade-Pacheco2020Finding), but there is
substantial promise in applying them to probabilistic ecological interactions.
Statistical models can also be used to generate predictions of ecological webs
without prior knowledge of pairwise interactions, for instance using body size
(@Petchey2008SizFor, @Gravel2013InfFooa), phylogeny (@Elmasri2020HieBay,
@Strydom2022Food), or a combination of niche and neutral processes
(@Bartomeus2016ComFra, @Pomeranz2019InfPre) for inference. Topological null
models, which generate networks of probabilistic interactions by preserving
chosen characteristics of the adjacency matrix of binary interactions while
intentionally omitting others (@Bascompte2003NesAss, @Fortuna2006HabLos), serve
as other examples of common probabilistic interaction models. Null models can be
used to produce underlying distributions of network measures for null hypothesis
significance testing. Many measures have been developed to describe the
structure (@Poisot2016Structure) and diversity (@Ohlmann2019Diversity,
@Godsoe2022Species) of probabilistic interaction webs. These models and measures
support the use of this approach for the study of a wide range of ecological
questions, from making better predictions of species distribution
(@Cazelles2016Theorya) to forecasting the impact of climate change on ecological
webs (@Gilman2010FraCom).

The lack of clear guidelines on the use of probabilistic interaction data is
worrisome, both for data producers and re-users who generate and manipulate
these numbers. This is concerning because sampling strategies and decisions
regarding network construction can affect our understanding of network
properties (@Brimacombe2023ShoReu). Besides methodological difficulties that may
arise when assessing probabilistic interactions, a precise definition of
probabilistic interactions appears to be lacking, making the estimation and use
of these data more difficult. We aim to take a step back by outlining different
ways in which probabilistic interactions are defined and used in network
ecology. We distinguish two broad categories of probabilistic interaction
networks that necessitate distinct approaches when applied to key ecological
questions: local webs describing probabilities of realized interactions, and
regional webs (metawebs) describing probabilities of potential interactions. We
highlight the distinctions in the ecological meaning of these two
representations and examine some of their properties and relationships
(particularly with space, time, and between each other) through empirical case
studies. Moreover, there is currently no metadata standard that could guide the
documentation of all types of probabilistic interactions (although see e.g.,
@Salim2022Data who discuss data standards for deterministic mutualistic webs).
Well-defined metadata for probabilistic interactions would support more adequate
manipulation and integration of interaction data from different sources and
guard against possible misinterpretations arising from ambiguous definitions of
probabilistic interaction networks. These metadata should outline the nature
(i.e., local or regional) and type (e.g., predatory or pollination) of the
interactions, provide information regarding the taxonomic level, identities, and
characteristics (e.g., life stages) of the individuals involved in an
interaction, present the mathematical formulation of probabilities, including
clearly identified conditional variables (e.g., spatial and temporal scales),
and describe the methods and contexts (e.g., location, time, environmental
conditions) in which interactions were estimated. Inadequately documented
probabilistic interaction data should be used with caution when analyzing
ecological webs. Our observations and advice can be applied to most types of
ecological networks representing direct interactions, from food webs to
host-virus networks. Even though the measurement of interaction probabilities
may differ between network types (e.g., estimations often based on frequencies
of interactions in plant-pollinator networks), the broad principles underlying
our findings remain relevant and applicable across diverse ecological contexts.

# Probabilistic representations of interactions

One of the first aspects to take into consideration when estimating or
interpreting probabilities of interactions is knowing if they describe potential
or realized interactions, as these two types of interactions have distinct
conceptual underpinnings and sources of uncertainty. A potential (regional)
interaction is defined as the biological capacity of two taxa to interact (i.e.,
the probability that they interact if they were to encounter each other and
given sufficient time) whereas a realized (local) interaction is the occurrence
or observation of this interaction in a well-defined space and time (i.e., the
probability that they interact locally). For two co-occurring taxa and over
infinite time, the probability of local interaction is equivalent to the
probability of regional (potential) interaction. Our discussion of local
interactions focuses on their occurrence rather than their direct empirical
observation, as one of the primary goals of describing them probabilistically is
to characterize our uncertainty regarding their actual manifestation. We use the
terms *metaweb* (@Dunne2006Network) to designate regional webs of potential
interactions and *local webs* (@Poisot2012Dissimilaritya) for those of realized
interactions. Metawebs are the network analogs of the species pool, where local
webs originate from a subset of both species (nodes) and interactions (edges) of
the regional metaweb (@Saravia2022Ecological). Without clear documentation, it
can be challenging to know if published probabilistic interaction webs describe
local or regional interactions (@tbl:prob provides examples of studies employing
both types of probabilistic interaction networks), or if so-called probabilities
are in reality *interaction scores* (i.e., non-probabilistic quantitative
interactions analogous to interaction strengths). When probabilistic regional
interactions are used and interpreted incorrectly as local interactions (and
conversely), this may generate misleading findings during data analysis. We
believe that a better understanding of the differences, similarities, and
interconnections between these two probabilistic representations of ecological
interactions would alleviate interpretation errors (e.g., when studying
network-area relationships) and facilitate a more adequate utilization of
interaction data.

## Pairwise interactions: the building blocks of ecological networks

Local and metawebs, like any type of network, are made of nodes and edges that
can be represented at different levels of organization and precision. The basic
units of ecological networks are individuals that interact with each other
(e.g., by predation in food webs, @Elton2001Animal), forming individual-based
networks (@Melian2011EcoDyn). The aggregation of these individuals into more or
less homogeneous groups (e.g., populations, species, families, feeding guilds)
allows us to represent nodes at broader taxonomic scales, which affects our
interpretation of the properties of these systems (@Guimaraes2020Structurea,
@Hemprich-Bennett2021AssImp). 

Edges linking nodes can describe a variety of interaction measures. Ecologists
have traditionally represented interactions as binary objects that were
considered realized after observing at least one individual from group $i$
interact with at least another individual from group $j$. In an adjacency matrix
of binary interactions $B$, the presence or absence of an interaction $B_{i
\rightarrow j}$ between two taxa can be viewed as the result of a Bernoulli
process $B_{i \rightarrow j} \sim {\rm Bernoulli}(P(B_{i \rightarrow j}))$, with
$P(B_{i \rightarrow j})$ being the probability of interaction that characterizes
our limited knowledge of the system and its intrinsic spatiotemporal
variability. In networks of probabilistic interactions, $P(B_{i \rightarrow j})$
are edge values, and the only two possible outcomes are the presence ($B_{i
\rightarrow j} = 1$) or absence ($B_{i \rightarrow j} = 0$) of an interaction
between each pair of nodes. Depending on the type of probabilistic interaction
network (local or metaweb), the mathematical formulation and interpretation of
stochastic parameters like $P(B_{i \rightarrow j})$ can be linked to
environmental and biological factors such as species abundance, traits, area,
and time (@tbl:prob), for example using logistic regression with a logit link
function with continuous explanatory variables. Predicting the number of local
webs in which the interaction occurs can be achieved by using a Binomial
distribution, assuming a constant probability of interaction and independence
between networks (trials). When considering uncertainties around the estimation
of $P(B_{i \rightarrow j})$, a Beta distribution can also be used to encompass
all possible probability values. In that case, a Beta-Binomial distribution can
be used to predict the number of networks in which the interaction occurs.
Observing an interaction between two taxa at a given location and time provides
important information that can be used to update previous estimates of $P(B_{i
\rightarrow j})$, informing us on the biological capacity of both taxa to
interact and the environmental conditions that enabled them to interact locally. 

Even though binary interaction webs constitute a highly valuable source of
ecological information (@Pascual2006Ecologicala), they overlook important
factors regarding interaction strengths. Represented in a quantitative adjacency
matrix $W$ as numbers not confined to the $[0, 1]$ range, interaction strengths
better describe the energy flows, demographic impacts or frequencies of
interactions between nodes (@Berlow2004Interaction, @Borrett2019Walk), with
$W_{i \rightarrow j}$ being a natural $\mathbb{N}$ or real $\mathbb{R}$ number
depending on the measure. For example, they may represent local interaction
rates between pairs of taxa (e.g., the flower-visiting rates of pollinators in a
mutualistic network, @Herrera1989PolAbu). When interaction strengths
characterize predation pressure on prey taxa in food webs, they can serve as
good estimators of the parameters describing species interactions in a
Lotka-Volterra model (e.g., @Emmerson2004Predatora). The extra amount of
ecological information in quantitative networks typically comes at a cost of
greater sampling effort and data volume in predictive models
(@Strydom2021Roadmapa), which can lead to relatively high levels of
uncertainties when inferring quantitative webs with limited data. 

Just like binary interaction networks, the uncertainty and spatiotemporal
variability of interaction strengths can be represented probabilistically.
However, the need to estimate the probability distribution of all possible
values of interaction strengths can make the inference of probabilities more
challenging in quantitative webs compared to binary interaction webs, which
require only one probability estimate for each interaction. Interaction
strengths can follow various probability distributions depending on the measure
used. For instance, they can follow a Poisson distribution $W_{i \rightarrow j}
\sim {\rm Poisson}(\lambda_{i \rightarrow j})$ when predicting frequencies of
interactions between pairs of nodes, with $\lambda_{i \rightarrow j}$ being the
expected rate at which individuals of taxa $i$ and $j$ interact (e.g., the
average number of prey $j$ consumed by all predators $i$ in a given time
period). The Poisson distribution can also be 0-inflated after initially
modeling non-interacting taxa (e.g., @Boulangeat2012AccDis employ a 0-inflated
model to analyze species abundance following the modeling of species presence
and absence), which constitute the majority of taxa pairs in most local webs due
to their typically high sparseness (@Jordano2016Samplingb). Because of the
methodological difficulties typically encountered when building deterministic
quantitative webs (which are only partially mitigated by models such as Ecopath,
@Plaganyi2004Criticala), binary interaction webs, which are easier to sample
(@Jordano2016Samplingb) and predict (@Strydom2021Roadmapa), have been more
frequently studied and modeled. Moreover, most published networks of
probabilistic interactions and methods describe probabilistic interactions whose
outcome is binary (whether interaction probabilities are regarded as constant or
variable, e.g. represented by a Beta distribution), which underlines the need
for better guidelines regarding the interpretation and manipulation of these
types of webs first. For these reasons, our primary focus in this contribution
will be on addressing the challenges in interpreting and using interaction
probabilities in Bernoulli distributions, in both local and metawebs.

## Local webs: communities interacting in space and time

Local webs of probabilistic interactions describe how likely taxa are to
interact at a given location and time period (i.e., interactions are contingent
upon the environmental and biological conditions of the community). In local
webs, edges commonly represent our degree of belief that two taxa interact in
nature, but can also represent the probability of *observing* this interaction
(@Catchen2023Missinga). For example, @Gravel2019BriElt used a dataset of local
European trophic webs of willow-galling sawflies and their natural enemies
depicting binary interactions, all referenced in space and time and consisting
of similar species, to infer the probabilities of locally observing interactions
between co-occurring species. This was achieved by situating local webs within
the context of environmental variables, i.e. by including temperature and
precipitation as conditional variables in some of their models.

We define space as the collection of geographic coordinates $(x, y, z)$, with
$(x, y)$ representing longitude and latitude coordinates, and $z$ denoting
either altitudes or depths. These point coordinates delineate the spatial
boundaries of the system, which may be portrayed as a polyhedron. Ecological
interactions may exhibit variations along latitudinal and altitudinal gradients,
as evidenced by changes in hummingbird-plant interactions (@Weinstein2017PerBil,
@Weinstein2017ComTra) and mosquito biting rates (e.g., @Kulkarni2006EntEva) at
different elevations. In contrast, time is defined as the specific time period
within which interactions were either observed or predicted. Even though space
and time are continuous variables that should yield probability *densities* of
interactions (i.e., relative likelihoods of interactions occurring at
infinitesimal locations and instants in time), these definitions enable them to
be conceptualised as distinct patches and time segments. Treating space and time
as discrete dimensions aligns with the common sampling methods of ecological
networks and provides actual probabilities of interactions, which can be
obtained by integrating probability densities over space and time. Furthermore,
we can quantify both an area $A$ and a duration $t$, which can be readily used
in spatiotemporal analyses of ecological networks. For example, when studying
network-area relationships (NAR, @Galiana2018Spatiala), we anticipate that local
probabilities of interactions scale positively with area and duration because
taxa have more opportunities to interact as these dimensions expand.

The probability that two taxa $i$ and $j$ interact in a local web $L_{x,y,z,t}$
(spatial and temporal subscripts hereafter omitted for clarity) can be
conditional on many environmental and biological factors. One of these is their
co-occurrence $C_{i,j}$, which is usually a Boolean describing if the geographic
distributions of both taxa overlap within the study area. Co-occurrence can be
modeled probabilistically, in which case it may conform to a Bernoulli
distribution $C_{i,j} \sim {\rm Bernoulli}(P(C_{i,j}))$. The probability of
co-occurrence $P(C_{i,j})$ can be estimated through the application of joint
species distribution models (e.g., @Pollock2014UndCoo), potentially taking into
account biotic interactions (@Staniczenko2017Linking). Considering that the
probability that two non-co-occurring taxa interact locally is zero (i.e.,
$P(L_{i \rightarrow j}| C_{i,j} = 0) = 0$), the probability of local interaction
can be obtained by multiplying the probability of interaction given
co-occurrence with the probability of co-occurrence: 

$$P(L_{i \rightarrow j}) = P(L_{i \rightarrow j}| C_{i,j} = 1) \times
P(C_{i,j} = 1).$${#eq:co-occur}

Other important factors that can impact interaction probabilities at the local
scale are taxa abundance (@Canard2012Emergencea) and traits
(@Poisot2015Speciesa), as well as environmental factors such as temperature
(@Angilletta2004TemGro), precipitation (@Woodward2012CliCha), habitat structure
(@Klecka2014EffHab), and presence of other interacting taxa in the network
(@Pilosof2017MulNat, @Kefi2012MorMea), as described above. Here, we use the
variable $\Omega_{x,y,z,t}$ (hereafter simply $\Omega$) to describe the
biological and ecological context in which interaction probabilities were
estimated. For example, if a research team conducts a mesocosm experiment to
estimate interaction probabilities between predators and prey with and without
shelters (a place that offers refuge and protection for prey, shielding them
from predators), $\Omega$ would represent the presence or absence of these
shelters. Like co-occurrence, $\Omega$ can also be modeled probabilistically
when the stochasticity or uncertainty of environmental and biological factors is
considered. In sum, $\Omega$ represents all ecological and biological variables
that were taken into consideration when measuring interaction probabilities and
is, therefore, a subset of all factors impacting ecological interactions. It is
a vector of random variables whose values determine the overall uncertainty of
an interaction.  

The probability that two taxa $i$ and $j$ interact in a local web $L$ can thus
be conditional on the area (or volume) $A$, the time interval $t$, their
co-occurrence $C_{i,j}$ and chosen environmental and biological conditions
$\Omega$. Although these variables are associated with distinct questions or
mechanisms related to ecological interactions, they may covary with each other,
such as the possible dependence of $C_{i,j}$ and $\Omega$ on spatial and
temporal scales. When estimating interaction probabilities using e.g. a
generalized linear model with multiple explanatory variables that might not be
independent, it may become important to address collinearity. Using variable
selection techniques, for instance, may be necessary before fitting the model to
mitigate this issue. The probability of local interaction is described by the
following expression when all these conditional variables are included:

$$P(L_{i \rightarrow j} | A, t, C_{i,j}, \Omega)$$
{#eq:local}

The representation of the local context in which probabilities are estimated and
the variables that should be taken into consideration depend on the study
system, the objectives of the study, and the resources available to the
researchers. In other words, these variables do not systematically need to be
accounted for. For example, in @Gravel2019BriElt, for the purpose of model
comparison, some models incorporated environmental variables as conditional
factors to estimate interaction probabilities, while others did not. When
accounted for, these variables should be clearly described in the documentation
of the data (@Brimacombe2023ShoReu), preferentially in mathematical terms to
avoid any confusion in their interpretation and to limit manipulation errors
during their re-use. For instance, ecologists should be explicit about their
consideration of co-occurrence in their estimation of local interaction
probabilities. Indeed, it is important to specify if probability values are
conditional $P(L_{i \rightarrow j} | C_{i,j} = 1)$ or not $P(L_{i \rightarrow
j})$ on co-occurrence since this can significantly impact the interpretation and
analysis of the data. In @tbl:prob, we present examples of studies that used
these diverse formulations of probabilistic interactions and conditional
variables. 

| Expression | Type | Outcome | Uncertainty sources | Reference | 
| :------ | :-- | :---------- | :------ | -------: |   
| $P(M_{i \rightarrow j} \vert T_i, T_j)$ | regional | biological feasibility of the interaction given regional traits (non-forbiddenness) | trait matching models | @Strydom2022Food |   
| $P(M^*_{i \rightarrow j} \vert T_i, T_j, E)$ | regional | ecological feasibility of the interaction given regional traits and environmental conditions | trait matching and environmental-based models | this study |    
| $P(L_{i \rightarrow j} \vert X_{il}, X_{jl},...)$ | local | realization of the interaction given taxa co-occurrence | spatiotemporal variability | @Gravel2019BriElt | 
| $P(L_{i \rightarrow j} \vert n_{il}, n_{jl},...)$ | local | realization of the interaction given taxa abundances | neutral models | @Canard2014Empiricala |   
| $P(L_{i \rightarrow j} \vert T_{il}, T_{jl}, ...)$ | local | realization of the interaction given local traits | trait matching models | @Gravel2016Meaning |  
| $P(L_{i \rightarrow j} \vert E_l,...)$ | local | realization of the interaction given local environmental conditions | environmental-based models | @Gravel2019BriElt (temperature and precipitation) | 
| $P(L_{i \rightarrow j} \vert A, ...)$ | local | realization of the interaction in a given area or volume | spatial models | @Galiana2018Spatiala * |   
| $P(L_{i \rightarrow j} \vert t,...)$ | local | realization of the interaction during a given time period | temporal models | @Weinstein2017ComTra |    
| $P(L_{i \rightarrow j} \vert f(L),...)$ | local | realization of the interaction given network structure | common null models | @Fortuna2006HabLos (connectance) |   
| $P(L_{i \rightarrow j} \vert M_{i \rightarrow j},...)$ | local | realization of the interaction given that the taxa can biologically interact | spatiotemporal variability | this study |

Table: **Mathematical expressions of probabilistic interactions.** The
probability of interaction between two taxa $i$ and $j$ is interpreted
differently in a metaweb $M$ of potential interactions (representing the
*biological* feasibility of interactions), a metaweb $M^*$ of potential
interactions (representing the *ecological* feasibility of interactions) and a
local web $L$ of realized interactions. Each expression emphasizes a different
conditional variable, the three dots serving as a placeholder for other
variables not explicitly stated in the expression. The outcome of each of these
probabilistic events, along with common uncertainty sources (often stemming from
the model used for estimation), is presented alongside examples of studies that
employed them (with specific variables indicated in parentheses, when
applicable). The study marked with an asterisk has been conducted on binary
interaction webs. Note that local interaction probabilities may represent the
probability of observing an interaction, not necessarily its actual occurrence.
{#tbl:prob}

## Metawebs: regional catalogs of interactions

Metawebs are networks of potential interactions that have been designed for
broad spatial, temporal, and taxonomic scales (e.g., species food webs at the
continental scale). They represent the probability that taxa can biologically
interact regardless of their co-occurrence and local environmental conditions.
Metawebs of probabilistic interactions are particularly valuable when
interaction data is limited, i.e. when the uncertainty of potential interactions
is high. As data accumulates, interactions in metawebs should tend towards
binarity, approaching probability values of $0$ (repeatedly failing to observe
an interaction) and $1$ (observing an interaction at least once).

Regional interactions are by definition context-independent, i.e. they are not
measured at a specific location and time. In contrast with local webs of
probabilistic interactions, which represent the stochasticity of interactions
occurring in nature, metawebs of probabilistic interactions measure our degree
of belief in the capacity of two taxa to interact (i.e., the probability that
their traits could support an interaction in the right conditions).
Consequently, although *neutrally* forbidden interactions (i.e., improbable
interactions between rare species, @Canard2012Emergencea) tend to have low
probability values in local webs, they may exhibit a higher probability in the
metaweb. Potential interactions describe the probability that there exists at
least one combination of phenotypes of taxa $i$ and $j$ that can interact with
each other if they were to encounter. For example, a piscivorous species may
have the capacity to interact with a potential prey species if they share at
least one matching combination of body sizes, such as an adult predator being
able to consume juvenile prey. To reduce any biases in our calculation of this
probability, it is crucial to ensure that the set of traits sampled or
considered accurately reflects the overall trait distribution in both taxa. This
enhances our confidence in concluding that the taxa cannot interact when no
positive observation has been made and increases our capacity to detect an
interaction when it is biologically feasible. In addition to pairwise
interactions, the extent of sampling effort also contributes to shaping our
assessment of metaweb properties, as sampling a larger number of local webs
allows us to capture more regional interactions (@McLeod2021Sampling). A
probability of potential interaction in a metaweb $M$ can be expressed as 

$$P(M_{i \rightarrow j}),$$ {#eq:metaweb}

which, in contrast with local webs, is never conditional on any spatial,
temporal, co-occurrence or environmental variables (@tbl:prob). 

Starting from a selected set of taxa, which are usually distributed within a
broad region of interest, metawebs can be built using different data sources,
including literature review (e.g., Maiorano2020Tetraeua), aggregated local web
data (e.g., @Gravel2019BriElt, @Saravia2022Ecological), and predictive models
(e.g., @Strydom2022Food, @Shaw2024Framework). Every pair of taxa that have
confidently been observed to interact at least once can be given a probability
of $1$ (i.e., $P(M_{i \rightarrow j}) = 1$) since we know that they *can*
interact. This is not the case in local webs of probabilistic interactions, in
which interaction events usually remain stochastic (i.e., $P(L_{i \rightarrow
j}) < 1$) after empirically observing interactions because of their intrinsic
spatiotemporal variability. Similarly, although rare interactions typically have
low probabilities in local webs, they can have high probabilities in metawebs
when the traits of both taxa are congruent. On the other hand, interactions that
were never observed can have low probability values in both local and metawebs,
going as low as $0$ for forbidden links (i.e., interactions forbidden by
biological traits). However, many observations of interactions are in reality
false positives because of observation errors due to taxonomic
misidentifications and ecological misinterpretations (e.g., due to cryptic
species and interactions, @Pringle2020Resolving). Likewise, forbidden
interactions can be false negatives in metawebs, e.g. if they have been assessed
for specific phenotypes, locations or time. Employing Bayesian models, whether
they are mechanistic or phenomenological, could improve the accuracy of our
estimation of interaction probabilities within both local and regional webs
(e.g., @Bartomeus2016ComFra, @Cirtwill2019QuaFra). This improvement is achieved
in metawebs by leveraging prior information regarding the feasibility of
interactions along with the empirical data on observed interactions.

# Properties of probabilistic interaction webs

Local and metawebs of probabilistic interactions differ in their type of
interactions (i.e., realized or potential) and in the conditional variables upon
which interaction values depend. These differences are significant as they
influence the characteristics of probabilistic interaction networks. Neglecting
to consider them may result in misleading results and interpretation errors when
analyzing the properties of probabilistic interaction webs, which could be
particularly problematic when addressing crucial ecological questions about
networks. Here we compare the characteristics of local and metawebs through the
presentation of four applications of probabilistic interactions: (1) describing
their spatial and temporal scaling, (2) describing their taxonomic scaling, (3)
sampling for binary interaction webs, and (4) reconstructing local webs of
probabilistic interactions from metawebs. All code and data to reproduce these
analyses are available at the Open Science Framework (TBD).

## Host-parasite network data

We use the collection of tripartite host-parasite networks sampled across
Europe, created by @Kopelke2017FooStra, in the following case studies. This
dataset contains well-resolved binary local interactions between willows (52
species), willow-galling sawflies (96 species), and their parasitoids (126
species). Given its replicated webs spanning large spatiotemporal scales, this
dataset is well-suited for analyzing a variety of ecological hypotheses and
processes. Out of a total of 374 local webs, we retained those containing at
least 5 species, resulting in a set of 233 georeferenced local webs (networks
sampled within areas of 0.1 to 0.3 km² during June and/or July spanning 29
years). We built a metaweb of binary interactions by aggregating all local
interactions, which gave us a regional web composed of 274 species and 1080
interactions. In the first two panels of @fig:accumulation, we show how the
dissimilarity of interactions between common species ($\beta_{OS}$) and the
dissimilarity in species composition ($\beta_{S}$) between the metaweb and
aggregated local webs (@Poisot2012Dissimilaritya) vary with the number of
sampled local webs. This shows that networks of local interactions are highly
dissimilar from the metaweb, both in terms of species and interactions,
especially when only a limited number of sites has been sampled. Both
dissimilarity indices were calculated based on the number of items shared by the
two webs ($c_{LM}$) and the number of items unique to the metaweb ($u_M$) and to
the aggregated local web ($u_L$). The $\beta_{S}$ dissimilarity index uses
species (nodes) as items being compared, while the $\beta_{OS}$ index assesses
dissimilarity based on interactions between shared species
(@Poisot2012Dissimilaritya). Both indices were calculated following the
$\beta_W$ index of @Whittaker1960Vegetation: 

$$\beta_W = \frac{c_{LM} + u_L + u_M}{(2 c_{LM} + u_L + u_M) / 2} - 1.$$
{#eq:diss}

![**Network accumulation curves.** (a) Dissimilarity of interactions between
common species and (b) dissimilarity in species composition between aggregated
local webs and the metaweb of binary host-parasite interactions. Aggregated
local webs were obtained by sequentially and randomly selecting a number of
local webs of binary interactions and aggregating both their species and
interactions. In both panels, the colored line represents the median
dissimilarity across simulations and the grey areas cover the 50\% and 95\%
percentile intervals. (c) Scaling of the number of links and (d) scaling of
connectance with the number of sampled binary and probabilistic local
interaction webs. For a better comparison with binary interactions, local webs
of probabilistic interactions were derived from the metaweb of probabilistic
interactions with a false positive and false negative rate of zero. A specific
value of $P(L|M)$ (the local probability of interaction among potentially
interacting species) was used for all local webs within a particular curve.
Aggregated local webs of probabilistic interactions were obtained by
sequentially and randomly selecting a number of local webs and aggregating both
their species and interactions (with the value of $P(L|M)$ adjusting according
to @eq:aggregate).](figures/network_accumulation.png){#fig:accumulation}

We converted these binary interaction networks into probabilistic ones using
models based on simple assumptions. Our models are not designed to estimate the
exact values of probabilistic interactions. Instead, their purpose is to create
plausible networks that serve as illustrative examples to highlight distinctions
between local and metawebs of probabilistic interactions. We created two
metawebs of probabilistic interactions by employing constant false positive and
false negative rates for all regional interactions. In the first metaweb, we set
both false positive and false negative rates to zero to prevent artificially
inflating the total number of links, enabling a more accurate comparison with
binary interaction webs. This gave us a probability of regional interaction of 1
when at least one interaction has been observed and of 0 in the absence of any
observed interaction between a given pair of species. In the second metaweb, we
introduced a 5\% false positive rate to account for spurious interactions and a
10\% false negative rate to address the elevated occurrence of missing
interactions in ecological networks (@Catchen2023Missinga). We believe these
rates represent reasonable estimates of missing and spurious potential
interactions, but confirming their accuracy is challenging due to the
unavailability of data on the actual feasibility of interaction. Observed
interactions were thus given a probability of regional interaction of 95\%,
whereas unobserved ones were assigned a probability of 10\%. 

To build local webs of probabilistic interactions, we first recognize that local
interactions must initially be biologically feasible before occurring at a
specific time and space. A local probability of interaction $P(L_{i \rightarrow
j})$ can be expressed as the product of the probability of local interaction
given that the two taxa can potentially interact $P(L_{i \rightarrow j} | M_{i
\rightarrow j} = 1)$, which we denote as $P(L|M)$ for the sake of simplicity,
with their probability of regional interaction $P(M_{i \rightarrow j})$: 

$$P(L_{i \rightarrow j}) = P(L_{i \rightarrow j} | M_{i \rightarrow j} = 1)
\times P(M_{i \rightarrow j} = 1).$$ {#eq:local_meta}

We built local webs of probabilistic interactions from the binary ones by using
the metawebs of probabilistic interactions and a constant value of $P(L|M)$
across interactions. Low values of $P(L|M)$ indicate that feasible interactions
rarely occur locally, intermediate values around 50% suggest considerable
spatiotemporal variability, while high values indicate that regional
interactions are nearly always realized locally. Following @eq:local_meta, the
local probability of interaction between a given pair of taxa consistently
remained equal to or below their probability of regional interaction. 

In the last two panels of @fig:accumulation, we show how the aggregated number
of links and connectance (i.e., the proportion of all of the non-forbidden links
that are realized) scale with the number of sampled local webs, according to
different values of $P(L|M)$. When aggregating local webs of probabilistic
interactions, the constancy of the probability of regional interaction across
the entire study area means that any rise in the probability of local
interaction is solely attributable to an increase in $P(L|M)$. The probability
$P(L_{1,2}|M)$ of local interaction among potentially interacting species in an
aggregated web $L_{1,2}$ is obtained by: 

$$P(L_{1,2}|M) = 1 - (1 - P(L_{1}|M)) \times (1 - P(L_{2}|M)),$$ {#eq:aggregate}

where $P(L_{1}|M)$ and $P(L_{2}|M)$ are the probabilities of local interaction
among two potentially interacting species in the subnetworks $L_1$ and $L_2$,
respectively. This equation provides the probability that the interaction is
realized in either (1) exclusively the local web $L_1$, (2) exclusively the
local web $L_2$ or (3) both local webs, given that the two taxa have the
biological capacity to interact.

By comparing the scaling relationships observed in webs of binary and
probabilistic interactions, @fig:accumulation illustrates that high values of
$P(L|M)$ lead to systematic overestimations in the number of links and
connectance, especially when $P(L|M) = 1$ (corresponding to the scenario where
local probabilities of interactions are equivalent to the probabilities of
regional interactions). However, these biases tend to diminish as the number of
sampled webs increases.

## Spatial and temporal scaling of interactions

The investigation of network-area relationships and interaction accumulation
curves is an important area of research in network ecology. First, network-area
relationships elucidate the scaling of network properties (such as modularity
and trophic chain lengths) with spatial scale (e.g., @Wood2015Effects,
@Galiana2018Spatiala). The variations in network structure across spatial scales
may stem from the scaling of species richness (species-area relationships, SARs)
and the number of interactions (@Brose2004UniSpa) with the sampled area.
Additionally, ecological processes unfolding at distinct spatial scales, such as
the spatial variability in local community composition resulting from different
sequences of extinction and colonization events, can also contribute to this
variation (@Galiana2018Spatiala). Next, interaction accumulation curves describe
the scaling of the number of observed interactions with sampling effort
(@Jordano2016Samplingb). Sampling effort, which may correspond to the duration
of the sampling period used to construct the network, can impact connectance
(@Bersier1999Scale) and various measures of network structure
(@Banasek-Richter2004Sampling, @McLeod2021Sampling). Apart from sampling effort,
the temporal scaling of interactions also elucidates how network structure
changes with the temporal resolution of the network (@Poisot2012Dissimilaritya),
acknowledging that distinct interactions take place over time, ranging from
short-term fluctuations of interactions to long-term trends. As local webs of
probabilistic interactions may explicitly account for the spatiotemporal
variability of interactions, they offer a distinct approach to investigating the
scaling of network structure with space and time, in contrast to webs of binary
and quantitative interactions, by making the stochasticity of interactions the
focal point of the modeling process.

Local and metawebs exhibit distinct relationships with spatial and temporal
scales. On one hand, metawebs of probabilistic interactions, being independent
of any local context, feature regional interactions that do not scale with space
and time. This is because regional interactions depend solely on the biological
capacity of two taxa to interact, regardless of their co-occurrence and specific
environmental conditions. However, probabilities of potential interactions may
change (tending to become more definitive) upon updating previous estimates with
increased sampling effort, even though they do not vary in a specific direction
with the spatial and temporal extent (boundaries) of the network. The
probability of two taxa potentially interacting should theoretically be the same
in all metawebs in which they are present, provided that the data and methods
used for estimation are consistent. For exemple, if a smaller metaweb $M_1$ is
derived from a larger metaweb $M_0$ by selecting the subset of taxa present in
the region described by $M_1$ and retaining all their interactions, their
probabilities of interaction should be identical regardless of scale, i.e.
$P(M_{1, i \rightarrow j}) = P(M_{0, i \rightarrow j})$. With a larger or equal
number of taxa in $M_0$ as compared to $M_1$, the total number of interactions
is expected to be higher or at least equal in the larger web, even though
pairwise probabilities remain identical. 

On the other hand, local interactions scale both spatially and temporally, given
that they have more opportunities to be realized and observed in larger areas
and longer durations. This is attributed to factors such as a higher number of
individuals, greater trait variations, and increased opportunities for
encounters, as highlighted by @McLeod2020EffSpe. For example, if a local web of
probabilistic interactions $L_1$ with an area $A_1$ is derived from a larger web
$L_0$ with an area $A_0$, and $A_1$ is entirely nested within $A_0$, interaction
probabilities should be lower in the smaller web, i.e. $P(L_{1,i \rightarrow j}
| A_1 < A_0) \le P(L_{0,i \rightarrow j} | A_0)$. However, if $A_1$ and $A_0$
are disjoint, interaction probabilities could be higher in the smaller area,
contingent upon their environmental and biological conditions. Likewise,
interaction probabilities are expected to be lower in webs with shorter
durations when time intervals are nested. In @fig:spatial, we show how the
expected number of local host-parasite interactions scales with area,
represented as an expanding latitudinal window, in comparison with regional
interactions. Even though we employed local probabilities of interactions equal
to regional interactions for the purpose of comparison (i.e., using $P(L|M) = 1$
here), we notice that the total number of regional interactions scales more
rapidly than local interactions. This is because numerous regional interactions
involve species that never co-occur, and as a result, these interactions are not
captured in local webs.

![**Spatial scaling of interactions.** Expected number of host-parasite
interactions in a network aggregating all (a) local and (b) regional
probabilistic interactions within a latitudinal window of a given length. Every
dashed curve corresponds to a different expanding window characterized by a
different central latitude, with the colored solid line representing the median
number of interactions. Heatmaps of the expected number of (c) local and (d)
regional interactions found in windows of specified length and central
latitudes. Probabilities of regional interactions were obtained with a false
positive rate of 5% and a false negative rate of 10%. Local probabilistic
interactions were derived from the probabilistic regional interactions by
setting the value of $P(L|M)$ (the local probability of interaction among
potentially interacting species) to $1$, ensuring a conservative comparison
between aggregated local webs and metawebs. Aggregated local webs were obtained
by aggregating both the species and interactions found within a particular
latitudinal window, with the values of $P(L|M)$ remaining at their maximum value
of $1$ following @eq:aggregate. ](figures/spatial_scaling.png){#fig:spatial}

## Box 1: A spatiotemporally explicit model of interactions

Predicting local webs across time and space is a pivotal goal of network
ecology, especially given the scarcity of interaction data
(@Strydom2021Roadmapa). Ecologists may resort to predictive models (e.g.,
generative Bayesian and machine learning models) to reconstruct networks at fine
spatial and temporal scales with limited interaction data. For instance,
real-time biomonitoring data coupled with appropriate numerical models
(@Bohan2017Nextgenerationa) can be employed to reconstruct local ecological
webs, opening avenues for in-depth studies on local ecosystem functioning and
dynamics. The probabilistic representation of interactions acknowledges the
inherent uncertainty in these models, typically expressed through probability
distributions. We introduce and develop a simple generative mechanistic model
for probabilistic local interactions that takes into consideration their
spatiotemporal variability (i.e. a spatiotemporally explicit model of local
interactions). It is essential to note that our model is not designed for
regional interactions, which are scale-independent. Rather, it could prove
valuable for predicting local interactions across time and space by generating
new interaction data following parameter inference.

As indicated by @eq:co-occur, the probability that two taxa $i$ and $j$ interact
at a specific location $(x, y, z)$ may be determined by the product of their
probability of interaction given co-occurrence and their probability of
co-occurrence. First, their co-occurrence probability can be calculated using
their individual occurrence probabilities $P(X_i)$ and $P(X_j)$, along with the
strength of association $\gamma$ between their occurrences and co-occurrence
(@Cazelles2016Theorya): 

$$P(C_{i, j}) = P(X_i, X_j) = P(X_i) P(X_j) \gamma.$$ {#eq:modelcoprob}

When $\gamma > 1$, it signifies a positive association in the geographic
distributions of both taxa, indicating that the presence of one taxon enhances
the probability of occurrence of the other. Attractions may be the result of
positive interactions (e.g., mutualism) or positive/negative interactions (e.g.,
antagonism between predators and prey, @Cazelles2016Theorya). In empirical webs,
$\gamma > 1$ holds true for the majority of species pairs
(@Catchen2023Missinga). In contrast, repulsions ($\gamma < 1$) may be caused by
strong interspecific competition (@Cazelles2016Theorya). We model the
co-occurrence of both taxa as the outcome of a Bernoulli trial

$$C_{i, j} \sim Bernoulli(P(X_i, X_j)).$$ {#eq:modelco}

Next, the probability of interaction given co-occurrence can be made temporally
explicit by modeling it as a Poisson process with rate parameter $\lambda$. This
parameter represents the expected frequency of interaction between the taxa
within a defined time interval and can be estimated using prior data on
interaction strengths, when accessible. The probability that two co-occurring
taxa engage in an interaction during a time period $t_0$ is given by:

$$P(L_{i \rightarrow j} | C_{i, j} = 1) = 1-e^{-\lambda t_0},$$ {#eq:modelrate}

which tends toward $1$ as $t_0 \to \infty$ if $\lambda > 0$. In other words, two
co-occurring taxa with a nonzero rate of interaction will inevitably do so in a
sufficiently long observation period. It is important to note that the units of
$\lambda$ and $t_0$ are complementary. For instance, if the duration $t_0$ is
measured in months, $\lambda$ denote the expected number of interactions per
month.

The occurrence of an interaction between $i$ and $j$ can be modeled as a
Bernoulli trial with a probability of $P(L_{i \rightarrow j})$. Consequently, a
Bayesian inference model can be built based on the preceding equations to
estimate the value of the $\lambda$ and $\gamma$ parameters and generate novel
interaction data:

$$L_{i \rightarrow j} \sim \text{Bernoulli}(P(L_{i \rightarrow j}))$$
{#eq:model} 

$$P(L_{i \rightarrow j}) = P(X_i) P(X_j) \gamma (1-e^{-\lambda t_0})$$
{#eq:modeleq}

$$\gamma \sim \text{Gamma}(2,0.5)$$ {#eq:modelgamma} 

$$\lambda \sim \text{Exponential}(2)$$ {#eq:modellambda}

In @fig:spatiotemporal, we show the variation in the probability of interaction
under different parameter values. In the right panel, we notice that,
irrespective of the interaction rate $\lambda$, the probability of interaction
converges toward an asymptote determined by the co-occurrence $P(C_{i, j})$
(@eq:modelcoprob). This model can be customized in different ways, such as by
linking $\lambda$ with specific environmental variables or explicitly
incorporating observation errors (i.e., the probabilities of false negatives and
false positives).

![**Parameters of the spatiotemporally explicit model of interactions.** (a)
Probability of local interaction given by the process model (@eq:modeleq) under
different values of $\lambda$ and $\gamma$, with $t_0 = 1$. The parameter values
used in the right panel are denoted by the white stars. (b) Scaling of the
probability of interaction with the duration parameter $t_0$ in @eq:modeleq, for
different values of $\lambda$ and $\gamma$. In both panels, the individual
probabilities of occurrence $P_i(x, y, z)$ and $P_j(x, y, z)$ are set to a
constant value of $0.5$.](figures/spatiotemporal_model.png){#fig:spatiotemporal}

## Taxonomic scaling of interactions 

Probabilistic interaction networks offer a versatile approach to tackle a broad
array of ecological questions, depending on their level of organization. For
instance, the assemblage of interactions across ecological scales can be
explored through species-based networks, while clade-based networks provide
insights into macroevolutionary processes (e.g., @Gomez2010EcoInt). Given that
our interpretation of the properties and dynamics of ecological webs depends on
their taxonomic scale (@Guimaraes2020Structurea), investigating the phylogenetic
scaling of network structure emerges as a promising research avenue. Examining
the same system at various taxonomic scales can yield meaningful and
complementary ecological information, and, in our perspective, employing webs of
probabilistic interactions is an effective approach for such analyses.

There are no inherent differences in the taxonomic scaling between local and
metawebs, as only the nodes are defined taxonomically. In other words, the
probability values of edges in both local (@eq:local) and metawebs (@eq:metaweb)
are not conditional on any taxonomic scale. The phylogenetic scale is tied to
the definition of the event itself (i.e., the interaction between two taxa,
defined at the desired taxonomical scale), not to the variables on which
interaction probabilities are conditional. In both types of webs, transitioning
to a broader level of organization (e.g., from a species-level web $S$ to a
genus-level web $G$) can be accomplished directly by using probabilities from
finer scales. For example, in a network with $n_1$ species from genus $g_1$ and
$n_2$ species from genus $g_2$, one can compute the probability that at least
one species from genus $g_1$ interacts with at least one species from genus
$g_2$ as follows:

$$P(G_{g_1 \rightarrow g_2}) = 1 - \prod_{i = 1}^{n_1}\prod_{j = 1}^{n_2}(1 -
P(S_{g_{1i} \rightarrow g_{2j}})),$$ {#eq:taxo}

where $g_{1i}$ and $g_{2j}$ are the species of the corresponding genus. If it is
known that at least two of these species interact (i.e., $P(S_{g_{1i}
\rightarrow g_{2j}}) = 1$ for at least one pair of $(g_{1i}, g_{2j})$), it
implies a probability of genus interaction equal to $1$. @Canard2012Emergencea
built a species-based network following a similar approach, by using simulated
interactions between individuals derived from a neutral model (i.e., a model
that assumed ecological equivalence among individuals). In contrast, a more
sophisticated approach is necessary when transitioning from a broader to a finer
level of organization. This is because knowledge of an interaction between two
genera does not guarantee that all possible pairwise combinations of their
species will also interact. One possible method is to build a finer-scale
network by generating probabilities of interactions through random sampling from
a beta distribution, parameterized by the broader-scale network.

Ideally, our biological interpretation of probabilistic interactions should
remain consistent across a network even if it incorporates heterogeneous levels
of organization, such as a network whose nodes represent both species and
trophic species (groups of species sharing similar predators and prey). This is
common in ecological webs where taxonomic resolution is typically low
(@Hemprich-Bennett2021AssImp, @VazquezSS2022Ecological). Interaction
probabilities at broader taxonomic scales should be based on probabilities of
interactions between individuals, for both local and metawebs. For instance, in
local individual-based food webs, the probability that two individuals interact
reflects our degree of belief that one individual will consume the other.
Similarly, in local species-based food webs, the probability that two species
interact represents our degree of belief that at least one individual from the
predator species consumes at least another individual from the prey species.
Furthermore, in local clade-based food webs, the probability that two clades
interact represents our degree of belief that at least two species from these
clades interact with each other or, equivalently, that at least two individuals
from these clades interact with each other. Fundamentally, the taxonomic scaling
of interactions involves aggregating interactions between individuals into
larger groups, which may exhibit varying degrees of homogeneity based on the
organisms and the study system. In that regard, taxonomic scaling is analogous
to the spatial and temporal scaling of interactions, as they all represent
different ways to aggregate individuals into broader groups (either spatially,
temporally, or taxonomically).

## Sampling for binary interaction webs

The prediction of binary interactions through Bernoulli trials is an important
application of probabilistic interaction webs. This approach proves beneficial
for analyzing the structural characteristics of probabilistic interaction webs,
particularly in the absence of specific analytical measures. By performing
independent Bernoulli trials for each interaction, a network of binary
interactions may be generated. A probability distribution of network properties
can be obtained by measuring network structure across multiple randomly
generated networks (@Poisot2016Structure). This method enables the
representation of the variability of network structure, albeit with possible
biases when connectance is low (@Poisot2014WheEco, @Chagnon2015ChaTop).
Employing this strategy to generate binary interaction networks under a null
model facilitates null hypothesis significance testing, wherein the observed
measure is compared against the simulated distribution (e.g.,
@Bascompte2003NesAss). Additionally, the random generation of binary interaction
networks, from a probabilistic interaction web that accounts for the
spatiotemporal variability of interactions, may effectively capture network
structure across space and time. This facilitates the investigation of
ecological hypotheses about interactions at broad spatial and temporal scales.

There are at least two distinct approaches to sample binary interaction networks
from probabilistic interaction webs across space, for example, when attempting
to predict a binary interaction network for each of a number of locations within
a given region. The first approach involves performing a singular Bernoulli
trial for each pair of taxa based on their regional probability of interaction.
In employing this approach, every pair of taxa predicted to interact in the
metaweb of binary interactions will be treated as interacting in all local webs
where they co-occur. This will result in local pairwise interactions without
spatial variation. The second approach is to independently sample each of the
local webs of probabilistic interactions, which can be achieved by first
generating distinct probabilistic interaction networks for each location. These
local webs of probabilistic interactions may vary in taxa composition and
interaction probabilities. Subsequently, binary interaction networks can be
independently sampled for each location, introducing spatial variation in binary
interactions.

In @fig:sampling, we compare the average connectance of binary interaction
networks resulting from these two sampling techniques, where regional and local
interactions are drawn from our host-parasite networks of probabilistic
interactions, generating a number of binary interaction web realizations for
each site in the dataset. These two sampling approaches yield different
outcomes, particularly for lower values of $P(L|M)$, which denote instances
where regional interactions do not consistently manifest locally. Small
discrepancies are also apparent between these techniques when we equate the
probability of local interaction to the probability of regional interaction
(i.e., when using $P(L|M) = 1.0$ in @eq:local_meta), especially when the number
of samples of binary interaction networks for each location is low. As
anticipated, we observe that sampling binary interactions from the metaweb tends
to overestimate connectance on average compared to sampling them from local
webs. Furthermore, we observe an increase in the variability of connectance when
employing a single sample, representing what we consider as a more tangible
process leading to the realization of local and regional interactions in nature. 

![**Connectance of sampled binary interaction webs.** Comparison between the
average connectance of binary interaction network samples obtained from the
local and metawebs of probabilistic interactions. Each dot corresponds to a
different site. The local probability of interaction between potentially
interacting species was set to three different values: (a) $P(L|M) = 1.0$, (b)
$P(L|M) = 0.75$, and (c) $P(L|M) = 0.50$. Grey dots represent the outcome of a
single trial, while colored dots represent the average connectance of each
network across $100$ trials. (d) Reduction in the mean squared logarithmic error
between the average connectance of binary interaction networks obtained from
these two sampling methods as the number of trials increases, for the same
values of $P(L|M)$ used in panels a-c. Probabilities of regional interactions
were obtained with a false positive rate of 5% and a false negative rate of 10%.
Metaweb samples were obtained by randomly sampling binary interactions from the
probabilistic interaction metaweb, and then propagating this result to all local
webs that include the species potentially engaged in the interactions. Local
binary interaction webs were generated by independently sampling binary
interactions for each local web of probabilistic
interactions.](figures/network_sampling.png){#fig:sampling}

The choice of a sampling approach can influence the selection of grid cell size
when delineating local communities within a broader region of interest. In the
first approach, pairwise interactions remain constant irrespective of cell size
since they are sampled only once from the metaweb. However, in the second
approach, local interaction probabilities are contingent on the network area.
For instance, consider the local webs $L_1$ and $L_2$ with an area of
$\frac{1}{2}A_0$, both nested within $A_0$ but disjoint from each other, forming
$L_0$. If we treat $L_1$ and $L_2$ as independent, the probability of
interaction between taxa $i$ and $j$ in $L_0$ is given by:

$$P(L_{0, i \rightarrow j}) = 1 - (1 - P(L_{1, i \rightarrow j}) \times P(L_{2,
i \rightarrow j})).$$ {#eq:binary}

Due to its larger area, the probability that the two taxa interact in $L_0$ is
equal or greater than in $L_1$ and $L_2$. When sampling binary interactions from
local webs, it is crucial to sample at the same spatial scale for which
probabilities were estimated. Otherwise, interaction probabilities must be
adjusted to align with the intended cell size, preventing systematic biases in
predictions.

## Prediction of local webs from metawebs

Metawebs serve as a valuable source of ecological information for predicting
local webs across time and space. Local webs of binary interactions can be
reconstructed by selecting a subset of taxa and interactions from the metaweb
(@Dunne2006Network). This implies that metawebs consistently contain more
interactions than their corresponding local webs. Determining the list of taxa
to select can be achieved empirically or through methods like range maps or
species distribution models. As the species composition of a community is
arguably less difficult to sample or predict than its interactions, the primary
challenge lies in deciding which interactions to select from the metaweb, a task
that may necessitate advanced statistical models and ecological expertise.
Inferring the structure of local webs from the metaweb before predicting
specific local pairwise interactions could hold promise (@Strydom2021Roadmapa),
considering that the structure of local webs is constrained by the metaweb
(@Saravia2022Ecological).

Building local webs of probabilistic interactions from a metaweb of
probabilistic interactions involves a reduction in the value of pairwise
interaction probabilities. This decrease is attributed to the prerequisite that
two taxa must initially possess the capacity to interact before engaging in
local interactions (@eq:local_meta). Therefore, inferring local webs from their
metaweb while maintaining identical interaction probability values would
introduce systematic biases into the predictions. In such cases, these networks
would essentially represent smaller-scale metawebs of potential interactions,
possibly leading to misinterpretations by being perceived as local interactions.
As proposed by @McLeod2021Sampling, although metawebs do not capture the
spatiotemporal variability of interactions, they establish an upper limit for
local interactions. In other words, the probability of two taxa interacting at a
specific location and time is consistently lower or equal to the probability of
their regional interaction: 

$$P(L_{i \rightarrow j} | A, t, C, \Omega) \le
P(M_{i \rightarrow j}).$$ {#eq:switch}

Moreover, the probability that two taxa possess the biological capacity to
interact must exceed the probability of them interacting at any location and
time because they may never co-occur or encounter locally. Specifically, the
cumulative probability of local interactions across all spatial, temporal, and
environmental conditions must be less than the probability of regional
interaction, i.e.

$$\int_\Omega\int_A\int_t P(L_{i \rightarrow j} | A, t, \Omega) dt dA d\Omega
\leq P(M_{i \rightarrow j}).$$ {#eq:all}

Estimating more precisely the probability $P(L|M)$ that two taxa interact
locally if they can potentially interact allows for improved predictions of
local webs from a metaweb of probabilistic interactions. This task is
challenging due to the variability of this probability across space and time, as
well as its variability across pairwise interactions within a network. Using
simple models of $P(L|M)$, as demonstrated in our case studies, represents an
initial step toward the overarching objective of reconstructing local webs from
metawebs.

# Conclusion

In this contribution, we underline the importance of network metadata for
adequately interpreting and manipulating probabilistic interaction data. The
mathematical representation of probabilities and their statistical properties
depend on the type of interactions (local or regional) and the conditions under
which these interactions were evaluated. We showed that local and metawebs of
probabilistic interactions differ in their relationship to spatial and temporal
scales, with regional interactions remaining consistent across scales. In
contrast with metawebs, local interactions are measured in a specific context
(e.g., in a given area, time, and biological and environmental conditions) and
depend on taxa co-occurrence. These important conceptual differences bring to
light the need to use probabilistic data with caution, for instance when
generating network realizations of binary interactions across space and
predicting local webs from metawebs. Clear metadata describing the type of
interaction and the variables used in their estimation are required to ensure
adequate data manipulation. Better data practices and foundations for
probabilistic thinking in network ecology could enable more reliable assessments
of the spatiotemporal variability and uncertainty of biotic interactions.

It is essential to enhance our comprehension of both regional and local
interactions, especially considering the current scarcity of interaction data.
However, while sampling biological communities does decrease the uncertainty of
interactions by accumulating evidence for their feasibility and local
realization, there is a limit to how much we can diminish their inherent
randomness. In metawebs, probabilities reflect our limited knowledge of
interactions (i.e., our degree of belief that interactions are feasible), which
is expected to improve with a larger volume of data. We should anticipate that
regional interactions will become more definitive (with probabilities
approaching $0$ or $1$) as we investigate various conditions, including
different combinations of species traits. Conversely, in the case of local webs,
which can be seen as random instances of metawebs, randomness cannot be as
reduced. In local interactions, probabilities can be divided into a component
representing uncertainty and another representing spatiotemporal variability.
Owing to environmental heterogeneity, there will invariably be instances in
which an interaction occurs and others in which it does not, across different
times and locations, irrespective of the extent to which we can improve our
knowledge of its biological feasibility and the local conditions that facilitate
its occurrence. When local webs depict probabilities of observing interactions
rather than just their actual occurrence, we must also consider the observation
variability as an additional source of randomness. Every ecological process is
stochastic but there is also a possibility that a phenomenon goes undetected.
Quantifying and partitioning this stochasticity will enable us to make more
accurate predictions about ecological interactions at various spatial and
temporal scales. This will prove to be of vital importance as our time to
understand nature runs out, especially at the places where the impacts of
climate change and habitat loss hit harder.

# Acknowledgment

We acknowledge that this study was conducted on land within the traditional
unceded territory of the Saint Lawrence Iroquoian, Anishinabewaki, Mohawk,
Huron-Wendat, and Omàmiwininiwak nations. This work was supported by the
Institute for Data Valorisation (IVADO) and the Natural Sciences and Engineering
Research Council of Canada (NSERC) Collaborative Research and Training
Experience (CREATE) program, through the Computational Biodiversity Science and
Services (BIOS²) program. A special thanks to all members of the Black Holes and
Revelations working group (organized by BIOS²) for their insightful discussions
and valuable feedback on this manuscript.

# References
