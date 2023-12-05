# Introduction

As we try to navigate global biodiversity change (decline?), filling in
knowledge gaps about biodiversity becomes instrumental to monitoring and
mitigating those changes (@AndrewGonzalez2022Monitor,
@Abrego2021Accounting). However, cataloging species,
populations and, in particular, ecological interactions is a substantial
challenge. There are methodological and biological constraints that hinder our
ability to observe all interactions, such as the spatial and temporal uncoupling
of species (@Jordano1987PatMut) and the large number of possible interactions in
a community, of which the vast majority are rare (@Jordano2016Samplingb). More
generally, a handful of conditions must be satisfied for an interaction to be
observed locally. First, both species must have overlapping geographic ranges,
i.e. they must co-occur within the region of interest
(@Blanchet2020Cooccurrencea). Then, they must encounter locally. Probabilities
of interspecific encounters are typically low, especially for rare species with
low relative abundances (@Canard2012Emergencea). Finally, their traits must be
locally compatible (@Poisot2015Speciesa). This includes their phenology
(@Olesen2010Missing, @Singer2012GeoMos), behavioral choices (@Pulliam1974Theory,
@Choh2012PreRol), phenotypes (@Bolnick2011WhyInt, @Stouffer2011RolBod,
@Gravel2013InfFooa) and even the presence or abundance of a third species (e.g.,
of a more profitable prey species) (@Golubski2011ModMod, @Sanders2012Indirect).
Documenting the location and timing of interactions becomes even more difficult
when accounting for the spatiotemporal variability of ecological networks
(@Poisot2012Dissimilaritya, @Poisot2015Speciesa). Environmental factors, such as
temperature (@Angilletta2004TemGro), drought (@Woodward2012CliCha), climate
change (@Gilman2010FraCom, @Woodward2010ChaEco, @Araujo2011Usinga), and habitat
modifications (@Tylianakis2007HabMod), contribute to this spatiotemporal
variability of interactions by impacting species abundance and traits. In this
context, it is unsurprising that our knowledge of ecological interactions
remains limited (@Hortal2015SevSho) despite extensive biodiversity data
collection (@Schmeller2015GloTer). 

Knowing the biological capacity of two species to interact is necessary but not
sufficient for inferring their interaction at a specific time and space. The
recognition of the intrinsic variability of species interactions has led
ecologists to expand their representation of ecological networks to include a
probabilistic view of interactions (@Poisot2016Structure, @Dallas2017Predicting,
@XiaoFu2019Link). This different perspective allows us to fill in the Eltonian
shortfall by modeling the probability of detecting interactions, which can be an
important tool for directing efforts and take action, especially in places where
access and resources for research are scarce. As opposed to binary deterministic
networks, in which interactions are regarded as either occurring or not,
probabilistic networks represent our degree of belief about the realization or
feasibility of pairwise interactions at the local or regional scale,
respectively. In other words, representing interactions probabilistically takes
into account inherent uncertainties and variability associated with ecological
data. In the broadest sense, binary networks are also a type of probabilistic
network, in which the numerical value of an interaction is restrained to $0$
(non-occurring) or $1$ (occurring). In probabilistic networks, only forbidden
interactions (i.e., interactions prohibited by biological traits,
@Jordano2003Invarianta, @Olesen2010Missing) have a probability value of zero,
provided that intraspecific trait variability is considered
(@Gonzalez-Varo2016Labilea). However, *neutrally* forbidden interactions (i.e.,
improbable interactions between rare species, @Canard2012Emergencea) could have
low probability values in local networks but high probability in a regional
network (metaweb) describing the biological capacity of species to interact.

By accounting for the uncertainty of interactions, probabilistic networks
provide a more realistic portrait of species interactions and network structure
(i.e. community-level properties), which is a major driver of the functioning,
dynamics, and resilience of ecosystems worldwide (@Proulx2005Networka,
@McCann2007ProBio, @McCann2011FooWeb, @Rooney2012IntFoo). Moreover, the
application and development of computational methods in network ecology, often
based on a probabilistic representation of interactions, can alleviate (and guide) the
sampling efforts required to document species interactions
(@Strydom2021Roadmapa). For example, statistical models can be used to estimate
the uncertainty of pairwise interactions (@Cirtwill2019QuaFra) and the
probability of missing (false negatives) and spurious (false positives)
interactions (@Guimera2009MisSpu). Considering the high rate of false negatives
in species interaction data due to the difficulty of witnessing rare
interactions (@Catchen2023Missinga), these models could inform the
identification of priority sampling locations of ecological networks where data
collection would yield the most valuable information, thereby reducing errors.
Optimization models for sampling locations have mostly found applications in
biological systems that are not networked, such as identifying priority sampling
sites for disease hotspots (@Andrade-Pacheco2020Finding), but there is
substantial promise in applying them to probabilistic ecological interactions.
Statistical models can also be used to generate network predictions without
prior knowledge of pairwise interactions, for instance using body size
(@Petchey2008SizFor, @Gravel2013InfFooa), phylogeny (@Elmasri2020HieBay,
@Strydom2022Food), or a combination of niche and neutral processes
(@Bartomeus2016ComFra, @Pomeranz2019InfPre) for inference. Topological null
models (e.g., @Bascompte2003NesAss, @Fortuna2006HabLos), which can be used to
generate underlying distributions of network measures for null hypothesis
significance testing, are other examples of common probabilistic network models.
Many measures have been developed to describe the structure
(@Poisot2016Structure) and diversity (@Ohlmann2019Diversity, @Godsoe2022Species)
of probabilistic networks. These models and measures support the use of this
approach for the study of a wide range of ecological questions, from making
better predictions of species distribution (@Cazelles2016Theorya) to forecasting
the impact of climate change on ecological networks (@Gilman2010FraCom).

The lack of clear guidelines on the use of probabilistic interaction data is
worrisome (@Brimacombe2023ShoReu), both for data producers and re-users who
generate and manipulate these numbers. Besides methodological difficulties that
may arise when assessing probabilistic interactions, a precise definition of
probabilistic interactions appears to be lacking, making the estimation and use
of these data more difficult. We aim to take a step back by outlining different
ways in which probabilistic interactions are defined and used in network
ecology. We distinguish two broad categories of probabilistic networks that
necessitate distinct approaches when applied to key ecological questions: local
networks of realized interactions, and regional networks (metawebs) of potential
interactions. We highlight the distinctions in the ecological meaning of these
two representations and show that they yield different statistical outcomes
regarding e.g. the spatial and temporal scaling of interactions and the
prediction of binary networks across space. Moreover, there is currently no
metadata standard that could guide the documentation of all types of
probabilistic interactions (@Salim2022Data discuss data standards for
deterministic mutualistic networks). Well-defined metadata for probabilistic
networks would support more adequate manipulation and integration of interaction
data from different sources and guard against the potential misinterpretations
arising from ambiguous definitions of probabilistic networks. These metadata
should outline the nature (i.e., potential or local) and type (e.g., predatory
or pollination) of the interactions, provide information regarding the taxonomic
level, identities, and characteristics (e.g., life stages) of the individuals
involved in an interaction, present the mathematical formulation of
probabilities, including clearly identified conditional variables, and describe
the methods and contexts (e.g., location, time, environmental conditions) in
which interactions were estimated. Inadequately documented probabilistic
interaction data should be used with caution when analyzing ecological networks.
Although our contribution focuses on food webs, our observations and advice can
be applied to other types of ecological networks, from plant-pollinator to
host-virus networks. Indeed, excluding networks of indirect interactions such as
competition and facilitation networks (@Kefi2015NetStr, @Kefi2016HowStr), most
ecological networks describe probabilities of direct interactions, which are
conceptually and mathematically analogous regardless of their biological type
(e.g., trophic and mutualistic interactions). 

# Probabilistic representations of interactions

One of the first aspects to take into consideration when estimating or
interpreting probabilities of interactions is knowing if they describe potential
or realized interactions. A potential interaction is defined as the biological
capacity of two taxa to interact (i.e., the probability that they *can*
theoretically interact) whereas a realized interaction is the materialization or
observation of this interaction in a well-defined space and time (i.e., the
probability that they interact locally). Here, we use the terms *metaweb*
(@Dunne2006Network) to designate networks of potential interactions and *local
networks* (@Poisot2012Dissimilaritya) for those of realized interactions.
Metawebs are the network analogues of the species pool, where local networks
originate from a subset of both species (nodes) and interactions (edges) of the
regional metaweb (@Saravia2022Ecological). Without clear documentation, it can
be challenging to know if published probabilistic networks describe potential or
realized interactions, or if so-called probabilities are in reality *interaction
scores* (i.e., non-probabilistic quantitative interactions). When probabilistic
potential interactions are used and interpreted as local interactions (and
conversely), this may generate misleading findings during data analysis. We
believe that a better understanding of the differences, similarities, and
relationships between these two probabilistic representations of ecological
networks would alleviate interpretation errors and facilitate a more adequate
utilization of interaction data.

## Pairwise interactions: the building blocks of ecological networks

Local ecological networks and metawebs, like any type of network, are made of
nodes and edges that can be represented at different levels of organization and
precision. The basic unit of food webs and other ecological networks are
individuals that interact with each other (e.g., by predation,
@Elton2001Animal), forming individual-based networks (@Melian2011EcoDyn). The
aggregation of these individuals into more or less homogeneous groups (e.g.,
populations, species, trophic species, families) allows us to represent nodes at
broader taxonomic scales, which affects our interpretation of the properties of
these systems (@Guimaraes2020Structurea). Moreover, edges linking these nodes
can describe a variety of interaction measures. Ecologists have traditionally
represented interactions as binary objects that were considered realized after
observing at least one individual from group $i$ interact with at least another
individual from group $j$. Boolean interactions can be viewed as the result of a
Bernoulli process $A_{i,j} \sim {\rm Bernoulli}(P(i \rightarrow j))$, with $P(i
\rightarrow j)$ being the probability of interaction between $i$ and $j$ that
characterizes our limited knowledge of the system and its intrinsic
spatiotemporal variability. Depending on the type of networks (local or
metaweb), the mathematical formulation and interpretation of stochastic
parameters like $P(i \rightarrow j)$ can be linked to environmental and
biological factors such as species relative abundance, traits, area, and time
(@tbl:prob), for example using logistic regression with a logit link function
with continuous explanatory variables. In these probabilistic network
representations in which $P(i \rightarrow j)$ are edge values, the only two
possible outcomes are the presence ($A_{i,j} = 1$) or absence ($A_{i,j} = 0$) of
an interaction between each pair of nodes. When considering uncertainties around
the estimation of $P(i \rightarrow j)$, a Beta distribution ${\rm Beta}(\alpha,
\beta)$ can also be used to encompass all possible probability values. Observing
an interaction between two taxa at a given location and time provides important
information that can be used to update previous estimates of $P(i \rightarrow
j)$, informing us on the biological capacity of both taxa to interact and the
environmental conditions that enabled them to interact locally. 

Even though binary networks constitute a highly valuable source of ecological
information (@Pascual2006Ecologicala), they overlook important factors regarding
interaction strengths. These are represented using quantitative interactions,
which better describe the energy flows, demographic impacts or frequencies of
interactions between nodes (@Berlow2004Interaction, @Borrett2019Walk), with
$A_{i,j}$ being a natural number $\mathbb{N}$ or a real number $\mathbb{R}$
depending on the measure. For example, they may represent local interaction
rates between pairs of taxa (e.g., the flower visiting rates of pollinators in a
mutualistic network, @Herrera1989PolAbu). Because quantitative interactions can
also describe predation pressure on prey taxa in food webs, they can be good
estimators of the parameters describing species interactions in a Lotka-Volterra
model (e.g., @Emmerson2004Predatora). The extra amount of ecological information
in quantitative networks typically comes at a cost of greater sampling effort
and data volume in predictive models (@Strydom2021Roadmapa), which can lead to
relatively high levels of uncertainties when inferring quantitative networks
with limited data. 

Just like binary networks, the uncertainty and spatiotemporal
variability of quantitative interactions can be represented probabilistically.
However, the need to estimate the probability distribution of all possible values
of interaction strengths can make the inference of probabilities more
challenging in quantitative networks compared to binary networks, which require
only one probability estimate for each interaction. Quantitative interactions
can follow various probability distributions depending on the measure used, the
event's outcome being the value of interaction strength. For instance,
quantitative interactions can follow a Poisson distribution $A_{i,j} \sim {\rm
Poisson}(\lambda_{i \rightarrow j})$ when predicting frequencies of interactions
between pairs of nodes, with $\lambda_{i \rightarrow j}$ being the expected rate
at which individuals of taxa $i$ and $j$ interact (e.g., the average number of
prey $j$ consumed by all predators $i$ in a given time period). The Poisson
distribution can also be 0-inflated after initially modeling non-interacting
taxa (e.g., @Boulangeat2012AccDis employ a 0-inflated model to analyze species
abundance following the modeling of species presence and absence), which
constitute the majority of taxa pairs in most local networks due to their
typically high sparseness (@Jordano2016Samplingb). Because of the methodological
difficulties typically encountered when building deterministic quantitative
networks, binary networks, which are easier to sample (@Jordano2016Samplingb)
and predict (@Strydom2021Roadmapa), are much more documented and modeled in the
literature. Moreover, most published probabilistic networks and methods describe
Bernoulli interactions (whether interaction probabilities are regarded as
constant or variable, e.g. represented by Beta distributions), which underlines
the need for better guidelines regarding the interpretation and manipulation of
these types of networks. For these reasons, our primary focus in this
contribution will be on addressing the challenges in interpreting and using
Bernoulli interactions, in both probabilistic local networks and metawebs.

## Local networks: communities interacting in space and time

Probabilistic local networks describe how likely taxa are to interact at a given
location and time period (i.e., interactions are contingent upon the
environmental and biological conditions of the community). In local networks,
edges commonly represent our degree of belief that two taxa interact in nature,
but can also represent the probability of *observing* this interaction
(@Catchen2023Missinga). For example, @Kopelke2017FooStra assembled a dataset of
binary local European food webs of willow-galling sawflies and their natural
enemies, clearly referencing each food web in space and time. @Gravel2019BriElt
used this dataset to infer the probabilities of locally observing interactions
between co-occurring species, with the added aspect of situating local networks
within the context of environmental variables. This was achieved by including
temperature and precipitation as conditional variables in some of their models. 

We define space as the set of geographic coordinates $(x, y, z)$ of the spatial
boundaries delineating the system, whether sampled or targeted. Ecological
interactions may exhibit variations spatially and along altitudinal gradients,
as evidenced by changes in hummingbird-plant interactions (@Weinstein2017PerBil
and @Weinstein2017ComTra) and mosquitoes biting rates (e.g.,
@Kulkarni2006EntEva) at different elevations. In contrast, time is defined as
the specific time period within which interactions were either observed or
predicted. With these definitions in mind, space and time can be conceptualized
as distinct patches or time segments. Treating them as discrete dimensions
aligns with the common sampling methods of ecological networks and provides
actual probabilities of interactions across space and time. This differs from
the approach of treating them as continuous variables, where edge values
represent probability densities (i.e., relative likelihoods of interactions
occurring at infinitesimal locations and instants in time) rather than discrete
probability values (which can be obtained by integrating probability densities).
By employing discrete locations and time periods, we can quantify both an area
$A$ and a duration $t$, which can be readily used in spatiotemporal analyses of
ecological networks. For example, when studying network-area relationships (NAR,
@Galiana2018Spatiala), we anticipate that local probabilities of interactions
scale positively with area and duration because taxa have more opportunities to
interact as these dimensions expand.

The probability that two taxa $i$ and $j$ interact locally can be conditional on
many environmental and biological factors. One of these is their co-occurrence
$C_{i,j}$, which is usually a Boolean describing if the geographic distributions
of both taxa overlap within the study area. Co-occurrence can be modeled
probabilistically, in which case it may conform to a Bernoulli distribution
$C_{i,j} \sim {\rm Bernoulli}(P_{i,j}(x, y, z))$, where the probability of
co-occurrence $P_{i,j}(x, y, z)$ can be estimated through the application of
joint species distribution models (e.g., @Pollock2014UndCoo). Considering that
the probability that two non co-occurring taxa interact locally is zero (i.e.,
$P_{N}(i \rightarrow j | C = 0) = 0$), the probability of local interaction can
be obtained by multiplying the probability of interaction given co-occurrence
with the probability of co-occurrence: 

$$P_{N}(i \rightarrow j) = P_{N}(i \rightarrow j | C = 1) \times
P_{i,j}(x,y,z).$${#eq:co-occur}

Other important factors that can impact our estimation of interaction
probabilities at the local scale are taxa relative abundance
(@Canard2012Emergencea) and traits (@Poisot2015Speciesa), as well as
environmental factors such as temperature (@Angilletta2004TemGro), precipitation
(@Woodward2012CliCha), habitat structure (@Klecka2014EffHab), and presence of
other interacting taxa in the network (@Pilosof2017MulNat, @Kefi2012MorMea).
Here, we use the variable $\Omega$ to describe the biological and ecological
context in which interaction probabilities were estimated. For example, if a
research team conducts a mesocosm experiment to estimate interaction
probabilities between predators and prey with and without shelters, $\Omega$
would represent the presence or absence of these shelters. Like co-occurrence,
$\Omega$ can also be modeled probabilistically when the stochasticity or
uncertainty of environmental and biological factors is considered. In sum,
$\Omega$ represents all ecological and biological variables that were taken into
consideration when measuring interaction probabilities and is, therefore, a
subset of all factors actually impacting ecological interactions. 

The probability that two taxa $i$ and $j$ interact in a local network $N$ can
thus be conditional on the area $A$, the time interval $t$, their co-occurrence
$C$ and chosen environmental and biological conditions $\Omega$. This gives us
the following equation when all of these conditions are included in the
estimation of interaction probabilities:

$$P_{N}(i \rightarrow j | A, t, C, \Omega).$$
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
conditional $P_{N}(i \rightarrow j | C = 1)$ or not $P_{N}(i \rightarrow j)$ on
co-occurrence since this can significantly impact the interpretation and
analysis of the data. In @tbl:prob, we present examples of studies that used
these diverse formulations of probabilistic interactions and conditional
variables. 

| Notation | Type | Description | Reference | 
| :--- | :-- | :-------- | -------: | 
| $P_M(i \rightarrow j)$ | potential | biological feasibility of the interaction | @Strydom2022Food |   
| $P_N(i \rightarrow j)$ | local | realization of the interaction | @Fortuna2006HabLos (null model) |    
| $P_N(i \rightarrow j \vert A)$ | local | realization of the interaction in a given area | @Galiana2018Spatiala * |   
| $P_N(i \rightarrow j \vert t)$ | local | realization of the interaction during a given time period | @Weinstein2017ComTra |   
| $P_N(i \rightarrow j \vert C)$ | local | realization of the interaction given that the taxa co-occur | @Gravel2019BriElt |  
| $P_N(i \rightarrow j \vert \Omega)$ | local | realization of the interaction given environmental conditions | @Gravel2019BriElt (temperature and precipitation) |  

Table: **Notation of probabilistic interactions.** The probability of
interaction between two taxa $i$ and $j$ is interpreted differently in a metaweb
$M$ of potential interactions and a local network $N$ of realized interactions.
Each notation includes a different conditional variable, when applicable. An
example of a study employing each of these notations and conditional variables
is provided, with the specific variables used indicated in parentheses. The
study marked with an asterisk has been carried out on binary networks. Note that
interaction probabilities can be contingent upon multiple conditional variables,
or none at all. Additionally, local interaction probabilities might represent
the probability of observing an interaction, not necessarily its actual
occurrence. {#tbl:prob}

## Metawebs: regional catalogs of interactions

Metawebs are networks of potential interactions that have been designed for
broad spatial, temporal, and taxonomic scales (e.g., species food webs at the
continental scale). They represent the probability that taxa can biologically
interact regardless of their co-occurrence and local environmental conditions.
Potential interactions are by definition context-independent, i.e. they are not
measured at a specific location and time. In contrast with probabilistic local
networks, which represent the stochasticity of interactions occurring in nature,
probabilistic metawebs measure our degree of belief in the capacity of two taxa
to interact (i.e., the probability that their traits could support an
interaction in the right conditions). In other words, potential interactions
describe the probability that there exists at least one combination of
phenotypes of taxa $i$ and $j$ that can interact with each other if they were to
encounter. To reduce any biases in our calculation of this probability, it is
crucial to ensure that the set of traits sampled or considered accurately
reflects the overall trait distribution in both taxa. This enhances our
confidence in concluding that the taxa cannot interact when no positive
observation has been made and increases our capacity to detect an interaction
when it is biologically feasible. In addition to one-on-one interactions, the
extent of sampling effort also contributes to shaping our assessment of metaweb
properties, as sampling a larger number of local networks allows us to capture
more potential interactions (@McLeod2021SamAsy). A probability of potential
interaction in a metaweb $M$ can be expressed as 

$$P_{M}(i \rightarrow j),$$ {#eq:metaweb}

which, in contrast with @eq:local, is not conditional on any spatial, temporal,
or environmental variables (@tbl:prob). 

Starting from a selected set of taxa, which are usually distributed within a
broad region of interest, probabilistic metawebs can be built using different
data sources, including literature review, fieldwork, and predictive models
(e.g., the metaweb of trophic interactions between Canadian mammals inferred by
@Strydom2022Food). Every pair of taxa that have confidently been observed to
interact at least once can be given a probability of $1$ (i.e., $P_{M}(i
\rightarrow j) = 1$) since we know that they *can* interact. This is not the
case in local probabilistic networks, in which interaction events usually remain
stochastic (i.e., $P_{N}(i \rightarrow j) < 1$) after empirically observing
interactions because of their intrinsic spatiotemporal variability. Similarly,
although rare interactions typically have low probabilities in local networks,
they can have high probabilities in metawebs when the traits of both taxa are
congruent. On the other hand, interactions that were never observed can have low
probability values in both metawebs and local networks, going as low as $0$ for
forbidden links. However, because of observation errors due to taxonomic
misidentifications and ecological misinterpretations (e.g., due to cryptic
species and interactions, @Pringle2020Resolving), many observations of
interactions are in reality false positives. Likewise, forbidden interactions
can be false negatives in metawebs, e.g. if they have been assessed for specific
phenotypes, locations or time. Employing Bayesian models, whether they are
mechanistic or phenomenological, has the potential to enhance the accuracy of
our estimation of interaction probabilities within both local and potential
networks (e.g., @Bartomeus2016ComFra, @Cirtwill2019QuaFra). This improvement is
achieved in potential networks by leveraging prior information regarding the
feasibility of interactions along with the empirical data on observed
interactions.

# Properties of probabilistic networks 

Probabilistic local networks and metawebs differ in their type of interactions
(i.e., local or potential) and in the conditional variables upon which
interaction values depend. These differences are significant as they influence
the characteristics of probabilistic networks. Neglecting to consider them may
result in misleading results and interpretation errors when analyzing the
properties of probabilistic networks, which could be particularly problematic
when addressing crucial ecological questions about networks. Here we compare the
characteristics of local networks and metawebs through the presentation of four
common applications of probabilistic interactions. All code and data to
reproduce these analyses are available at the Open Science Framework (TBD).  

## Host-parasite network data

We use the collection of tripartite host-parasite networks sampled across
Europe, created by @Kopelke2017FooStra, in most of our case studies. This
dataset contains well-resolved binary local interactions between willows (52
species), willow-galling sawflies (96 species), and their parasitoids (126
species). Given its replicated networks spanning large spatiotemporal scales,
this dataset is well-suited for analyzing a variety of ecological hypotheses and
processes. Out of a total of 374 local networks, we retained those containing at
least 5 species, resulting in a set of 233 georeferenced local networks. We
built a binary metaweb by aggregating all local interactions, which gave us a
regional metaweb composed of 274 species and 1080 interactions. In the first two
panels of @fig:accumulation, we show how the dissimilarity of interactions
between common species ($\beta_{OS}$) and the dissimilarity in species
composition ($\beta_{S}$) between the metaweb and aggregated local networks
(@Poisot2012Dissimilaritya) vary with the number of sampled local networks. This
shows that networks of local interactions are highly dissimilar from the
metaweb, both in terms of species and interactions, especially when only a
limited number of sites has been sampled.

![**Network accumulation curves.** (a) Dissimilarity of interactions between
common species and (b) dissimilarity in species composition between aggregated
local networks and the binary metaweb of host-parasite interactions. Aggregated
local networks were obtained by sequentially and randomly selecting a number of
binary local networks and aggregating both their species and interactions. In
both panels, the colored line represents the median dissimilarity across
simulations and the grey areas cover the 50% and 95% percentile intervals. (c)
Scaling of the number of links and (d) scaling of connectance with the number of
sampled binary and probabilistic local networks. For a better comparison with
binary networks, local probabilistic networks were derived from the
probabilistic metaweb with a false positive and false negative rates of zero. A
specific value of $p$ (the local probability of interaction among potentially
interacting species) was used for all local networks within a particular curve.
Aggregated probabilistic local networks were obtained by sequentially and
randomly selecting a number of probabilistic local networks and aggregating both
their species and interactions (with the value of $p$ adjusting according to
@eq:aggregate).](figures/network_accumulation.png){#fig:accumulation}

We converted these binary networks into probabilistic ones using models based on
simple assumptions. Our models do not aim to precisely estimate the actual
values of probabilistic interactions but rather to offer simplified networks as
illustrative examples to underscore the differences between probabilistic local
networks and metawebs. We created two probabilistic metawebs by employing
constant false positive and false negative rates for all potential interactions.
In the first metaweb, we set both false positive and false negative rates to
zero to prevent artificially inflating the total number of links, enabling a
more accurate comparison with binary networks. This gave us a probability of
potential interaction of 1 when at least one interaction has been observed and
of 0 in the absence of any observed interaction between a given pair of species.
In the second metaweb, we introduced a 5% false positive rate to account for
spurious interactions and a 10% false negative rate to capture the elevated
occurrence of false negatives in ecological networks (@Catchen2023Missinga).
Observed potential interactions were thus given a probability of 95%, whereas
unobserved ones were assigned a probability of 10%.

To build probabilistic local networks, we first recognize that local
interactions must initially be biologically feasible before occurring at a
specific time and space. A local probability of interaction $P_{N}(i \rightarrow
j)$ can be expressed as the product of the probability of local interaction
given that the two taxa can potentially interact $P_{N}(i \rightarrow j | M_{i
\rightarrow j} = 1)$, which we denote as $p$ for the sake of simplicity, with
their probability of potential interaction $P_{M}(i \rightarrow j)$: 

$$P_{N}(i \rightarrow j) = P_{N}(i \rightarrow j | M_{i \rightarrow j} = 1)
\times P_{M}(i \rightarrow j).$$ {#eq:local_meta}

We built the probabilistic local networks from the binary ones by using the
probabilistic metawebs and a constant value of $p$ across interactions. Lower
values of $p$ indicate that feasible interactions rarely occur locally,
intermediate values around 50% suggest considerable spatiotemporal variability,
while higher values indicate that potential interactions are nearly always
realized. Following @eq:local_meta, the local probabilities of interaction
between a given pair of taxa consistently remained equal to or below their
probability of potential interaction. 

In the last two panels of @fig:accumulation, we show how the aggregated number
of links and connectance (i.e., the proportion of all of the $S^2$ possible
links that are realized, where $S$ represents species richness) scale with the
number of sampled local probabilistic networks, according to different values of
$p$. When aggregating local probabilistic networks, the constancy of the
probability of potential interaction across the entire study area means that any
rise in the probability of local interaction is solely attributable to an
increase in $p$. The probability $p_{1,2}$ of local interaction among
potentially interacting species in an aggregated network $N_{1,2}$ is obtained
by: 

$$p_{1,2} = 1 - (1 - p_1) \times (1 - p_2),$$ {#eq:aggregate}

where $p_1$ and $p_2$ are the probabilities of local interaction among two
potentially interacting species in the subnetworks $N_1$ and $N_2$,
respectively. 

By comparing the scaling relationships observed in binary and probabilistic
networks, @fig:accumulation illustrates that high values of $p$ lead to
systematic overestimations in the number of links and connectance, especially
when $p = 1$ (corresponding to the scenario where local probabilities of
interactions are equivalent to the probabilities of potential interactions).
However, these biases tend to diminish as the number of sampled networks
increases.

## Taxonomic scaling of interactions 

Probabilistic networks offer a versatile approach to tackle a broad array of
ecological questions, depending on their level of organization. For instance,
the assemblage of interactions across ecological scales can be explored through
species-based networks, while clade-based networks provide insights into
macroevolutionary processes (e.g., @Gomez2010EcoInt). Given that our
interpretation of the properties and dynamics of ecological networks depends on
their taxonomic scale (@Guimaraes2020Structurea), investigating the phylogenetic
scaling of network structure emerges as a promising research avenue. Examining
the same system at various taxonomic scales can yield meaningful and
complementary ecological information, and, in our perspective, employing
probabilistic networks is an effective approach for such analyses.

There are no inherent differences in the taxonomic scaling between local
networks and metawebs, as only the nodes are defined taxonomically. In other
words, the probability values of edges in both local networks (@eq:local) and
metawebs (@eq:metaweb) are not conditional on any taxonomic scale. The
phylogenetic scale is tied to the definition of the event itself (i.e., the
interaction between two taxa), not to the conditional variables. In both types
of networks, transitioning to a broader level of organization can be
accomplished directly by using probabilities from finer scales. For example, in
a network with $n_A$ species from genus $A$ and $n_B$ species from genus $B$,
one can compute the probability that at least one species from genus $A$
interacts with at least one species from genus $B$ as follows:

$$P(A \rightarrow B) = 1 - \prod_{i = 1}^{n_A}\prod_{j = 1}^{n_B}(1 - P(A_i
\rightarrow B_j)),$$ {#eq:taxo}

where $A_i$ and $B_j$ are the species of the corresponding genus. If it is known
that at least two of these species interact (i.e., $P(A_i \rightarrow B_j) = 1$
for at least one pair of ${i, j}$), it implies a probability of genus
interaction equal to $1$. @Canard2012Emergencea built a species-based network
following a similar approach, by using simulated interactions between
individuals derived from a neutral model (i.e., a model that assumed ecological
equivalence among individuals). In contrast, a more sophisticated approach is
necessary when transitioning from a broader to a finer level of organization.
This is because knowledge of an interaction between two genera does not
guarantee that all possible pairwise combinations of their species will also
interact. One possible method is to build a finer-scale network by generating
probabilities of interactions through random sampling from a beta distribution,
parameterized by the broader-scale network.

Ideally, our biological interpretation of probabilistic interactions should
remain consistent across a network even if it incorporates heterogenous levels
of organization (e.g., a network whose nodes are composed of both species and
trophic species). This is common in ecological networks where taxonomic
resolution is typically low (@Hemprich-Bennett2021AssImp,
@VazquezSS2022Ecological). Interaction probabilities at broader taxonomic scales
should be based on probabilities of interactions between individuals, for both
local networks and metawebs. For instance, in local individual-based food webs,
the probability that two individuals interact reflects our degree of belief that
one individual will consume the other. Similarly, in local species-based food
webs, the probability that two species interact represents our degree of belief
that at least one individual from the predator species consumes at least another
individual from the prey species. Furthermore, in local clade-based food webs,
the probability that two clades interact represents our degree of belief that at
least two species from these clades interact with each other or, equivalently,
that at least two individuals from these clades interact with each other.
Fundamentally, the taxonomic scaling of interactions involves aggregating
interactions between individuals into larger groups, which may exhibit varying
degrees of homogeneity based on the organisms and the study system. In that
regard, taxonomic scaling is analogous to the spatial and temporal scaling of
interactions, as they all represent different ways to aggregate individuals into
broader groups (either spatially, temporally, or taxonomically).

## Spatial and temporal scaling of interactions

The investigation of network-area relationships (NARs) and interaction
accumulation curves (IACs) is an important area of research in network ecology.
First, NARs elucidate the scaling of network properties (such as modularity and
trophic chain lengths) with spatial scale (e.g., @Wood2015Effects,
@Galiana2018Spatiala). The variations in network structure across spatial scales
may stem from the scaling of species richness (species-area relationships, SARs)
and the number of interactions (@Brose2004UniSpa) with the sampled area.
Additionally, ecological processes unfolding at distinct spatial scales, such as
the spatial variability in local community composition resulting from different
sequences of extinction and colonization events, can also contribute to this
variation (@Galiana2018Spatiala). Next, IACs describe the scaling of the number
of observed interactions with sampling effort (@Jordano2016Samplingb), which can
also impact various measures of network structure such as connectance
(@McLeod2021Sampling). Apart from sampling effort, the temporal scaling of
interactions elucidates how network structure changes with the duration of the
network (@Poisot2012Dissimilaritya), acknowledging that distinct interactions
take place over time. Given that probabilistic local networks can quantify the
spatiotemporal variability of interactions (@eq:local), they serve as valuable
tools for developing and testing equations describing the scaling of network
structure with space and time. 

Metawebs and local networks exhibit distinct relationships with spatial and
temporal scales. On one hand, probabilistic metawebs, being independent of any
local context, feature potential interactions that do not scale with space and
time. This is because potential interactions depend solely on the biological
capacity of two taxa to interact, regardless of their co-occurrence and specific
environmental conditions. This implies that the probability of two taxa
potentially interacting should theoretically be the same in all metawebs in
which they are present, provided that the data and methods used for estimation
are consistent. As a result, if a smaller metaweb $M_1$ is derived from
subsampling a regional metaweb $M_0$ to represent potential interactions among a
subset of taxa in a smaller region, their probabilities of interaction should be
identical regardless of scale, i.e. $P_{M_1}(i \rightarrow j) = P_{M_0}(i
\rightarrow j)$. However, because the number of taxa may be higher in the larger
metaweb, it is expected that the overall number of interactions would be higher
in the larger network, despite pairwise probabilities being identical.

On the other hand, local interactions scale both spatially and temporally, given
that they have more opportunities to be realized and observed in larger areas
and longer durations. This is attributed to factors such as a higher number of
individuals, greater trait variations, and increased opportunities for
encounters, as highlighted by @McLeod2020EffSpe. For example, if a local
probabilistic network $N_1$ with an area $A_1$ is derived from a larger network
$N_0$ with an area $A_0$, and $A_1$ is entirely nested within $A_0$, interaction
probabilities should be lower in the smaller network, i.e. $P_{N_1}(i
\rightarrow j | A_1 < A_0) \le P_{N_0}(i \rightarrow j | A_0)$. However, if
$A_1$ and $A_0$ are disjoint, interaction probabilities could potentially be
higher in the smaller area, contingent upon their environmental and biological
conditions. Likewise, interaction probabilities are expected to be lower in
networks with shorter durations when time intervals are nested. In @fig:spatial,
we show how the expected number of local host-parasite interactions scales with
area, represented as an expanding latitudinal window, in comparison with
potential interactions. Even though we employed local probabilities of
interactions equal to potential interactions for the purpose of comparison
(i.e., using $p = 1$ here), we notice that the total number of potential
interactions scales more rapidly than local interactions. This is due to the
fact that numerous potential interactions involve species that never co-occur,
and as a result, these interactions are not captured in local networks.

![**Spatial scaling of interactions.** Expected number of host-parasite
interactions in a network aggregating all probabilistic (a) local and (b)
potential interactions within a latitudinal window of a given length. Every
dashed curve corresponds to a different expanding window characterized by a
different central latitude, with the colored solid line representing the median
number of interactions. Heatmaps of the expected number of (c) local and (d)
potential interactions found in windows of specified length and central
latitudes. Probabilities of potential interactions were obtained with a false
positive rate of 5% and a false negative rate of 10%. Local probabilistic
interactions were derived from the probabilistic metaweb by setting the value of
$p$ (the local probability of interaction among potentially interacting species)
to $1$, ensuring a conservative comparison between aggregated local networks and
metawebs. Aggregated local networks were obtained by aggregating both the
species and interactions found within a particular latitudinal window, with the
values of $p$ remaining at their maximum value of $1$ following @eq:aggregate.
](figures/spatial_scaling.png){#fig:spatial}

## Box 1: A spatiotemporally explicit model of interactions

Predicting local networks across time and space is a pivotal goal of network
ecology (@Strydom2021Roadmapa). In a context of scarcity of interaction data
(@Jordano2016Samplingb), ecologists must resort to predictive models for
reconstructing networks at fine spatial and temporal scales. For instance,
real-time biomonitoring data coupled with appropriate numerical models
(@Bohan2017Nextgenerationa) can be employed to reconstruct local ecological
networks, opening avenues for in-depth studies on local ecosystem functioning
and dynamics. Apart from their predictive applications, statistical models can
also be crafted for descriptive purposes, elucidating key parameters of interest
such as probabilities of interactions. In such instances, the parameter values
themselves offer valuable ecological insights. Various types of models (e.g.,
Bayesian and machine learning models) have been used for both predictive and
descriptive purposes in the realm of ecological interactions
(@Strydom2021Roadmapa). The probabilistic representation of interactions
acknowledges the inherent uncertainty in these models, typically expressed
through probability distributions. We introduce and develop a simple generative
mechanistic model for probabilistic local interactions that takes into
consideration their spatiotemporal variability (i.e. a spatiotemporally explicit
model of local interactions). It is essential to note that our model is not
designed for potential interactions, which are scale-independent. Rather, it
could prove valuable for predicting local interactions across time and space by
generating new interaction data following parameter inference.

As indicated by @eq:co-occur, the probability that two taxa $i$ and $j$ interact
at a specific location $(x, y, z)$ is determined by the product of their
probability of interaction given co-occurrence and their probability of
co-occurrence. First, their co-occurrence probability can be calculated using
their individual occurrence probabilities $P_i(x, y, z)$ and $P_j(x, y, z)$,
along with the strength of association $\gamma$ between their occurrences and
co-occurrence (@Cazelles2016Theorya): 

$$P_{i, j}(x, y, z) = P_i(x, y, z) P_j(x, y, z) \gamma.$$ {#eq:modelcoprob}

When $\gamma > 1$, it signifies a positive association in the geographic
distributions of both taxa, indicating that the presence of one taxon enhances
the probability of occurrence of the other. In empirical networks, $\gamma > 1$
holds true for the majority of species pairs (@Catchen2023Missinga). The
co-occurrence of both taxa is modeled as the outcome of a Bernoulli trial

$$C \sim Bernoulli(P_{i, j}(x, y, z)).$$ {#eq:modelco}

Next, the probability of interaction given co-occurrence can be made temporally
explicit by modeling it as a Poisson process with rate parameter $\lambda$. This
parameter represents the expected frequency of interaction between the taxa
within a defined time interval and can be estimated using prior data on
interaction strengths, when accessible. The probability that two co-occurring
taxa engage in an interaction during a time period $t_0$ is given by:

$$P_N(i \rightarrow j | C = 1) = 1-e^{-\lambda t_0},$$ {#eq:modelrate}

which tends toward $1$ as $t_0 \to \infty$. It is important to note that the
units of $\lambda$ and $t_0$ are complementary. For instance, if the duration
$t_0$ is measured in months, $\lambda$ denote the expected number of
interactions per month.

The occurrence of an interaction between $i$ and $j$ can be modeled as a
Bernoulli trial with a probability of $P_{N}(i \rightarrow j)$. Consequently, a
Bayesian inference model can be built based on the preceding equations to
estimate the value of the $\lambda$ and $\gamma$ parameters and generate novel
interaction data:

$$I \sim \text{Bernoulli}(P_{N}(i \rightarrow j))$$ {#eq:model} $$P_{N}(i
\rightarrow j) = P_i(x, y, z) P_j(x, y, z) \gamma (1-e^{-\lambda t_0})$$
{#eq:modeleq}

$$\gamma \sim \text{Gamma}(2,0.5)$$ {#eq:modelgamma} 

$$\lambda \sim \text{Exponential}(2)$$ {#eq:modellambda}

In @fig:spatiotemporal, we show the variation in the probability of interaction
under different parameter values. In the right panel, we notice that,
irrespective of the interaction rate $\lambda$, the probability of interaction
converges toward an asymptote determined by the co-occurrence $P_{i, j}(x, y,
z)$ (@eq:modelcoprob). This model can be customized in different ways, such as
by linking $\lambda$ with specific environmental variables or explicitly
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

## Sampling binary networks 

The prediction of binary interactions through random draws is an important
application of probabilistic networks. This approach proves beneficial for
analyzing the structural characteristics of probabilistic networks, particularly
in the absence of specific analytical measures. By simulating independent
Bernoulli trials for each interaction, a binary network can be generated. A
probability distribution of network properties can be obtained by measuring
network structure across multiple randomly generated networks
(@Poisot2016Structure). This method enables the representation of the
variability of network structure, albeit with potential biases when connectance
is low (@Poisot2014WheEco, @Chagnon2015ChaTop). Employing this strategy to
generate binary networks under a null model facilitates null hypothesis
significance testing, wherein the observed measure is compared against the
simulated distribution (e.g., @Bascompte2003NesAss). Additionally, randomly
generating binary networks across spatial and temporal dimensions aids in
representing the spatiotemporal variability of network structure, allowing the
testing of ecological hypotheses regarding interactions on large spatial and
temporal scales.

There are at least two distinct approaches to sample binary networks from
probabilistic webs across space, for example, when attempting to predict a
binary network for each of a number of locations within a given region. The
first approach involves performing a singular Bernoulli trial for each pair of
taxa within the region of interest based on their regional probability of
potential interaction. In employing this approach, every pair of taxa predicted
to interact in the binary metaweb realization will be treated as interacting in
all local networks where they co-occur. This will result in local pairwise
interactions without spatial variation. The second approach is to independently
sample each of the local probabilistic networks, which can be achieved by first
generating distinct probabilistic networks for each location. These local
probabilistic networks may vary in taxa composition and interaction
probabilities. Subsequently, binary networks can be independently sampled for
each location, introducing spatial variation in binary interactions.

In @fig:sampling, we compare the average connectance of binary networks
resulting from these two sampling techniques, where potential and local
interactions are drawn from our host-parasite probabilistic networks, generating
a number of binary network realizations for each site in the dataset. These two
sampling approaches yield different outcomes, particularly for lower values of
$p$, which denote instances when potential interactions do not consistently
manifest locally. Small discrepancies are also apparent between these techniques
when we equate the probability of local interaction to the probability of
potential interaction (i.e., when using $p = 1.0$ in @eq:local_meta), especially
when the number of binary network samples for each location is low. As
anticipated, we observe that sampling binary interactions from the metaweb tends
to overestimate connectance on average compared to sampling them from local
networks. Furthermore, we observe an increase in the variability of connectance
when employing a single sample, representing what we consider as a more tangible
process leading to the realization of local and potential interactions in
nature. 

![**Connectance of sampled binary networks.** Comparison between the average
connectance of binary network samples obtained from the probabilistic local
networks and metaweb. Each dot corresponds to a different site. The local
probability of interaction between potentially interacting species was set to
three different values: (a) $p = 1.0$, (b) $p = 0.75$, and (c) $p = 0.50$. Grey
dots represent the outcome of a single trial, while colored dots represent the
average connectance of each network across $100$ trials. (d) Reduction in the
mean squared logarithmic error between the average connectance of binary
networks obtained from these two sampling methods as the number of trials
increases, for the same values of $p$ used in panels a-c. Probabilities of
potential interactions were obtained with a false positive rate of 5% and a
false negative rate of 10%. Metaweb samples were obtained by randomly sampling
binary interactions from the probabilistic metaweb, and then propagating this
result to all local networks that include the species potentially engaged in the
interactions. Local binary networks were generated by independently sampling
binary interactions for each local probabilistic
network.](figures/network_sampling.png){#fig:sampling}

The choice of a sampling approach can influence the selection of grid cell size
when delineating local communities within a broader region of interest. In the
first approach, pairwise interactions remain constant irrespective of cell size
since they are sampled only once from the regional network. However, in the
second approach, local interaction probabilities are contingent on the network
area. For instance, consider networks $N_1$ and $N_2$ with an area of
$\frac{1}{2}A_0$, both nested within $A_0$ but disjoint from each other, forming
$N_0$. If we treat $N_1$ and $N_2$ as independent, the probability of
interaction between taxa $i$ and $j$ in $N_0$ is given by:

$$P_{N_0}(i \rightarrow j) = 1 - (1 - P_{N_1}(i \rightarrow j)) \times (1 -
P_{N_2}(i \rightarrow j)).$$ {#eq:binary}

Due to its larger area, the probability that the two taxa interact in $N_0$ is
equal or greater than in $N_1$ and $N_2$. When sampling binary interactions from
local networks, it is crucial to sample at the same spatial scale for which
probabilities were estimated. Otherwise, interaction probabilities must be
adjusted to align with the intended cell size, preventing potential systematic
biases in predictions.

## Prediction of local networks from metawebs

Metawebs serve as a valuable source of ecological information for predicting
local networks across time and space. Binary local networks can be reconstructed
by selecting a subset of taxa and interactions from the metaweb
(@Dunne2006Network). This implies that metawebs consistently contain more
interactions than their corresponding local networks. Determining the list of
taxa to select can be achieved empirically or through methods like range maps or
species distribution models. As the species composition of a community is
arguably less difficult to sample or predict than its interactions, the primary
challenge lies in deciding which interactions to select from the metaweb, a task
that may necessitate advanced statistical models and ecological expertise.
Inferring the structure of local networks from the metaweb before predicting
specific local pairwise interactions could hold promise (@Strydom2021Roadmapa),
considering that the structure of local networks is constrained by the metaweb
(@Saravia2022Ecological).

Building probabilistic local networks from a probabilistic metaweb involves a
reduction in the value of pairwise interaction probabilities. This decrease is
attributed to the prerequisite that two taxa must initially possess the capacity
to interact before engaging in local interactions (@eq:local_meta). Therefore,
inferring local networks from their metaweb while maintaining identical
interaction probability values would introduce systematic biases into the
predictions. In such cases, these networks would essentially represent
smaller-scale metawebs of potential interactions, potentially leading to
misinterpretations by being perceived as local interactions. As proposed by
@McLeod2021Sampling, although metawebs lack the ability to capture the
spatiotemporal variability of interactions, they establish an upper limit for
local interactions. In other words, the probability of two taxa interacting at a
specific location and time is consistently lower or equal to the probability of
their potential interaction: 

$$P_{N}(i \rightarrow j | A, t, C, \Omega) \le
P_M(i \rightarrow j).$$ {#eq:switch}

Moreover, the probability that two taxa possess the biological capacity to
interact must exceed the probability of them interacting at any location and
time because they may never co-occur or encounter locally. Specifically, the
cumulative probability of realized interactions across all spatial, temporal,
and environmental conditions must be less than the probability of potential
interaction, i.e.

$$\int_\Omega\int_A\int_t P_{N}(i \rightarrow j | A, t, \Omega) dt dA d\Omega
\leq P_M(i \rightarrow j).$$ {#eq:all}

Estimating more precisely the probability $p$ that two taxa interact locally if
they can potentially interact allows for improved predictions of local networks
from a probabilistic metaweb. This task is challenging due to the variability of
this probability across space and time, as well as its potential variations
among pairwise interactions within a network. Using simple models of $p$, as
demonstrated in our case studies, represents an initial step toward the
overarching objective of reconstructing local networks from metawebs.

# Conclusion

In this contribution, we underline the importance of network metadata for
adequately interpreting and manipulating probabilistic interaction data. The
mathematical representation of probabilities and their statistical properties
depend on the type of interactions (local or potential) and the conditions in
which they were estimated. We showed that probabilistic local networks and
metawebs differ in their relationship to spatial and temporal scales, with
potential interactions remaining consistent across scales. In contrast with
metawebs, local interactions are measured in a specific context (e.g., in a
given area, time, and biological and environmental conditions) and depend on
taxa co-occurrence. These important conceptual differences bring to light the
need to use probabilistic data with caution, for instance when generating binary
network realizations across space and predicting local networks from metawebs.
Clear metadata describing the type of interaction and the variables used in
their estimation are required to ensure adequate data manipulation. Better data
practices and foundations for probabilistic thinking in network ecology could
enable more reliable assessments of the spatiotemporal variability and
uncertainty of biotic interactions.

It is essential to enhance our comprehension of both potential and local
interactions, especially considering the current scarcity of interaction data.
However, while sampling biological communities does decrease the uncertainty of
interactions by accumulating evidence for their feasibility and local
realization, there is a limit to how much we can diminish their inherent
randomness. In metawebs, probabilities reflect our limited knowledge of
interactions (i.e., our degree of belief that interactions are feasible), which
is expected to improve with a larger volume of data. We should anticipate that
potential interactions will become more definitive (with probabilities
approaching $0$ or $1$) as we investigate various conditions, including
different combinations of species traits. Conversely, in the case of local
networks, which can be seen as random instances of metawebs, randomness cannot
be as reduced. In local interactions, probabilities can be divided into a
component representing uncertainty and another representing spatiotemporal
variability. Owing to environmental heterogeneity, there will invariably be
instances in which an interaction occurs and others in which it does not, across
different times and locations, irrespective of the extent to which we can
improve our knowledge of its biological feasibility and the local conditions
that facilitate its occurrence. When local networks depict probabilities of
observing interactions rather than just their actual occurrence, we must also
consider the observation variability as an additional source of randomness.
Every ecological process is stochastic but there is also a possibility that a
phenomenon goes undetected. Quantifying and partitioning this stochasticity will
enable us to make more accurate predictions about ecological interactions at
various spatial and temporal scales. This will prove to be of vital importance
as our time to understand nature runs out, especially at the places where the
climate change impacts hit harder.

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
