# Introduction

Cataloging ecological interactions is a substantial challenge. There are
methodological and biological constraints that hinder our ability to observe all
interactions, such as the spatial and temporal uncoupling of species
(@Jordano1987PatMut) and the large number of possible interactions in a
community, of which the vast majority are rare (@Jordano2016Samplingb).
Documenting the location and timing of interactions becomes even more difficult
when accounting for the spatiotemporal variability of ecological networks
(@Poisot2012Dissimilaritya, @Poisot2015Speciesa). Indeed, knowing the biological
capacity of two species to interact is necessary but not sufficient for
inferring their interaction at a specific time and space. For example,
@Golubski2011ModMod presented many cases where trophic interactions in food webs
depend on the presence or abundance of a third species (e.g., of a more
profitable prey species). More generally, a handful of conditions must be
satisfied for an interaction to be observed locally. First, both species must
have overlapping geographic ranges, i.e. they must co-occur within the region of
interest (@Blanchet2020Cooccurrencea). Then, they must encounter locally.
Probabilities of interspecific encounters are typically low, especially for rare
species with low relative abundances (@Canard2012Emergencea). Finally, their
traits must be locally compatible (@Poisot2015Speciesa). This includes their
phenology (@Olesen2010Missing, @Singer2012GeoMos), behavioral choices
(@Pulliam1974Theory, @Choh2012PreRol) and phenotypes (@Bolnick2011WhyInt,
@Stouffer2011RolBod, @Gravel2013InfFooa). Environmental factors, such as
temperature (@Angilletta2004TemGro), drought (@Woodward2012CliCha), climate
change (@Gilman2010FraCom, @Woodward2010ChaEco, @Araujo2011Usinga), and habitat
modifications (@Tylianakis2007HabMod), contribute to this spatiotemporal
variability of interactions by impacting species abundance and traits. In this
context, it is unsurprising that our knowledge of ecological interactions
remains limited (@Hortal2015SevSho) despite extensive biodiversity data
collection (@Schmeller2015GloTer).

The recognition of the intrinsic variability of species interactions has led
ecologists to expand their representation of ecological networks to include a
probabilistic view of interactions (@Poisot2016Structure). As opposed to binary
deterministic networks, in which interactions are regarded as either occurring
or not, probabilistic networks represent our degree of belief about the
realization or feasibility of pairwise interactions at the local or regional
scale, respectively. In other words, representing interactions probabilistically
takes into account inherent uncertainties and variability associated with
ecological data. In the broadest sense, binary networks are also a type of
probabilistic network, in which the numerical value of an interaction is
restrained to $0$ (non-occurring) or $1$ (occurring). In probabilistic networks,
only forbidden interactions (i.e., interactions prohibited by biological traits,
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
based on a probabilistic representation of interactions, can alleviate the
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
with limited data. Just like binary networks, the uncertainty and spatiotemporal
variability of quantitative interactions can be represented probabilistically.
However, the need to estimate the probability distribution of all possible value
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
analysis of the data. In @tbl:prob, we present a handful of studies of
probabilistic networks that used diverse formulations of probabilistic
interactions, highlighting the importance of a thorough description of
interaction data. 

| Formula | Type | Description | Studies | 
| :--- | :-- | :------------ | -------: | 
| $P_M(i \rightarrow j)$ | potential | biological feasibility of the interaction | @Strydom2022Food |   
| $P_N(i \rightarrow j)$ | local | realization of the interaction |  |    
| $P_N(i \rightarrow j \vert A)$ | local | realization of the interaction in a given area |   |   
| $P_N(i \rightarrow j \vert t)$ | local | realization of the interaction during a given time period |   |   
| $P_N(i \rightarrow j \vert C)$ | local | realization of the interaction given that the taxa co-occur |   |  
| $P_N(i \rightarrow j \vert \Omega)$ | local | realization of the interaction given environmental and biological conditions | @Gravel2019BriElt (temperature and precipitation)  |  

Table: **Notation of probabilistic interactions.** The probability of
interaction between two taxa $i$ and $j$ is interpreted differently in a metaweb
$M$ and local network $N$. Each formula includes a different conditional
variable described in plain text. A non-exhaustive list of studies using these
conditional variables is included, with the variables used specified in
parentheses. Note that interaction probabilities can be contingent upon multiple
conditional variables, or none at all. Additionally, local interaction
probabilities might represent the probability of observing an interaction, not
necessarily its actual occurrence. {#tbl:prob}

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

The differences in the mathematical formulations of local and potential
interactions can affect their statistical properties when applied to key
ecological questions. These disparities must therefore be taken into account
when analyzing probabilistic interaction data to prevent misleading results and
minimize interpretation errors. Here we show four common applications of
probabilistic interactions and compare the characteristics of local networks and
metawebs using simulated and empirical data. 

![](figures/network_accumulation.png){#fig:accumulation}

## Taxonomic scaling of interactions 

Probabilistic networks can be used to address a wide range of ecological
questions based on their level of organization. For example, the assemblage of
interactions across ecological scales can be studied using species-based
networks, whereas clade-based networks can be used to study macroevolutionary
processes (e.g., @Gomez2010EcoInt). Because our interpretation of the properties
and dynamics of ecological networks depends on their taxonomic scale
(@Guimaraes2020Structurea), examining the phylogenetic scaling of network
structure is also a promising research avenue. Analyzing the same system at
different taxonomic scales can thus provide meaningful and complementary
ecological information and is, in our perspective, best conducted using
probabilistic networks. 

There is no qualitative difference in the taxonomic scaling of local networks
compared to metawebs because only the nodes are defined taxonomically. In other
words, the edge probability values of local networks (@eq:local) and metawebs
(@eq:metaweb) are not conditional on any taxonomic scale. It is the definition
of the event itself (i.e., the interaction of the two taxa) that has a given
phylogenetic scale, not their conditional variables. In both types of networks,
shifting to a broader level of organization can be directly done using
probabilities at finer scales. For example, if we have a network of $n_A$
species from genus $A$ and $n_B$ species from genus $B$, we can calculate the
probability that at least one species from genus $A$ interact with at least one
species from genus $B$ as follows: 

$$P(A \rightarrow B) = 1 - \prod_{i = 1}^{n_A}\prod_{j = 1}^{n_B}(1 - P(A_i
\rightarrow B_j)),$$ {#eq:taxo}

where $A_i$ and $B_j$ are the species of the corresponding genus. Knowing that
two species interact (i.e., $P(A_i \rightarrow B_j) = 1$) gives a probability of
genus interaction of $1$. @Canard2012Emergencea built a species-based network
from neutrally simulated interactions between individuals using a similar
approach. In contrast, more sophisticated models need to be built when shifting
to a finer level of organization. Indeed, knowing that two genera interact does
not imply that all of their pairwise species combinations can also interact. One
could, for example, build a finer-scale network by generating probabilities of
species interactions by randomly sampling them from a beta distribution
parametrized by the broader-scale network. 

Ideally, the biological interpretation of probabilistic interactions should not
differ across a network even if it has heterogenous levels of organization, i.e.
if different nodes are represented at different taxonomic scales (e.g., a
network composed of species and trophic species). This is frequent in ecological
networks where taxonomic resolution is typically low
(@Hemprich-Bennett2021AssImp, @VazquezSS2022Ecological). Broader-scale
interactions should be based on probabilities of interactions between
individuals, either at the local or regional scale. For example, in local
individual-based food webs, the probability that two individuals interact
represents the degree of belief that one individual will actually consume the
other. Similarly, in local species-based food webs, the probability that two
species interact represents the degree of belief that at least one individual
from the predator species consumes at least another individual from the prey
species. Moreover, in local clade-based food webs, the probability that two
clades interact represents the degree of belief that at least two species from
these clades interact with each other or, equivalently, that at least two
individuals from these clades interact with each other. Fundamentally, the
taxonomic scaling of interactions is an aggregation of interactions between
individuals into larger groups, which could be more or less homogeneous
depending on the organisms and the study system. This type of scaling is
analogous to the spatial and temporal scaling of interactions to the extent that
they represent different ways to aggregate individuals into broader groups,
either spatially, temporally, or taxonomically. 

## Spatial and temporal scaling of interactions

The study of network-area relationships (NARs) and interaction accumulation
curves (IACs) are important realms of research in network ecology. Firstly, NARs
describe the scaling of network properties (such as modularity and trophic chain
lengths) with spatial scale (e.g., @Wood2015Effects, @Galiana2018Spatiala). The
variation of network structure across spatial scales can be the result of the
scaling of species richness (species-area relationships, SARs) and the number of
interactions (@Brose2004UniSpa) with the area sampled, but can also be due to
ecological processes (e.g., spatial variability in community composition and
extinction and colonization events) occurring at different scales
(@Galiana2018Spatiala). Secondly, IACs describe the scaling of the number of
interactions observed with sampling effort (@Jordano2016Samplingb), which can
impact many measures of network structure such as connectance
(@McLeod2021Sampling). Beyond sampling effort, the temporal scaling of
interactions describes how network structure changes with the duration of the
network (@Poisot2012Dissimilaritya) given that different interactions are
occurring through time. Because probabilistic local networks can assess the
spatiotemporal variability of interactions (@eq:local), they are useful tools to
develop and test different equations of the scaling of network structure with
space and time.

Metawebs and local networks intrinsically differ in their relationship to
spatial and temporal scales. On one hand, because probabilistic metawebs are
context-independent, potential interactions do not scale with space and time
since they depend solely on the biological capacity of the two taxa to interact,
regardless of any particular environmental conditions. This suggests that the
probability that two taxa can potentially interact should theoretically be the
same in all metawebs in which they are present, provided that the data and
methods used to estimate them are the same. As a result, if a potential network
$M_1$ is subsampled from a regional metaweb $M_0$ to represent the potential
interactions between a subset of taxa found in a smaller region, their
probabilities of interaction should be identical regardless of scale, i.e.
$P_{M_1}(i \rightarrow j) = P_{M_0}(i \rightarrow j)$. On the other hand, local
ecological networks scale both spatially and temporally since interactions have
more opportunities to be realized and observed in a larger area and duration
(e.g., more individuals, more trait variations, more chance of an encounter,
@McLeod2020EffSpe). For example, if a local probabilistic network $N_1$ of area
$A_1$ is obtained from a larger network $N_0$ of area $A_0$, with $A_1$ being
completely nested within $A_0$, interaction probabilities should be smaller in
the smaller network, i.e. $P_{N_1}(i \rightarrow j | A_1 < A_0) \le P_{N_0}(i
\rightarrow j | A_0)$. However, if $A_1$ and $A_0$ are disjoint, interaction
probabilities could be incidentally higher in the smaller area depending on
their environmental and biological conditions. Similarly, interaction
probabilities should be smaller in networks of shorter durations if time
intervals are nested. Statistical models, such as network-area relationships and
interaction accumulation curves, can be used to generate estimates of local
probabilities of interactions across spatial and temporal scales.

![](figures/spatial_scaling.png){#fig:spatial}

## Box 1: A spatiotemporally explicit model of interactions

Predicting local networks across time and space is an important goal of network
ecology (@Strydom2021Roadmapa). Indeed, in a context of scarcity of interaction
data (@Jordano2016Samplingb), ecologists must rely on predictive models to
reconstruct networks at fine spatial and temporal scales. For example, local
ecological networks could be reconstructed using real-time biomonitoring data
and adequate numerical models (@Bohan2017Nextgenerationa), which could pave the
way for fine-scale studies of ecosystem functioning and dynamics. Besides
predictive models, statistical models can also be built to describe parameters
of interest, such as probabilities of interactions. In that case, parameter
values provide valuable ecological information in their own rights. Different
types of models (e.g., Bayesian and machine learning models) of ecological
interactions have been built for predictive and descriptive purposes
(@Strydom2021Roadmapa). Representing interactions probabilistically reflects the
uncertainty of these models, which is usually represented in terms of
probability distributions. Here we show how to build a simple generative
mechanistic model of probabilistic interactions that takes into account their
inherent spatiotemporal variability, i.e. a spatiotemporally-explicit model. Our
model is not suitable for potential interactions, which are scale-independent.
Rather, it could prove useful for predicting local interactions across time and
space by generating new interaction data after parameter inference.

As stated by @eq:co-occur, the probability that two taxa $i$ and $j$ interact at
a given location $(x, y)$ is given by the product of their probability of
interaction given co-occurrence and their probability of co-occurrence. First,
their probability of co-occurrence is given by their respective probabilities of
occurrence $P_i(x, y)$ and $P_j(x, y)$ and the strength of association $\gamma$
between their occurrence and co-occurrence (@Cazelles2016Theorya): 

$$P_{i, j}(x, y) = P_i(x, y) P_j(x, y) \gamma.$$ {#eq:modelcoprob}

When $\gamma > 1$, the geographic distributions of both taxa are positively
associated, which implies that the occurrence of one taxon increases the
probability of occurrence of the other. In empirical networks, $\gamma > 1$ for
most species pairs (@Catchen2023Missinga). The co-occurrence of both taxa is the
result of a Bernoulli trial

$$C \sim Bernoulli(P_{i, j}(x, y)).$$ {#eq:modelco}

Second, the probability of interaction given co-occurrence can be made
temporally explicit by modeling it as a Poisson process with rate $\lambda$.
This parameter corresponds to the expected frequency of interaction between both
taxa in a given time period and its value can be estimated using prior data on
interaction strengths, if available. Specifically, the probability that two
co-occurring taxa interact during a time period $t_0$ is: 

$$P_N(i \rightarrow j | C = 1) = 1-e^{-\lambda t_0},$$ {#eq:modelrate}

which approaches $1$ when $t_0 \to \infty$. 

The realization of the interaction between $i$ and $j$ is the result of a
Bernoulli trial with probability $P_{N}(i \rightarrow j)$. A Bayesian inference
model can thus be built from the previous equations to estimate the value of the
$\lambda$ parameter and generate new interaction data:

$$I \sim \text{Bernoulli}(P_{N}(i \rightarrow j))$$ {#eq:model} $$P_{N}(i
\rightarrow j) = P_i(x, y) P_j(x, y) \gamma (1-e^{-\lambda t_0})$$ {#eq:modeleq}
$$\gamma \sim \text{Gamma}(2,0.5)$$ {#eq:modelgamma} $$\lambda \sim
\text{Exponential}(2)$$ {#eq:modellambda}

This simple model can be customized in many ways, e.g. by linking $\lambda$ with
given environmental variables or by explicitly modeling observation errors
(i.e., the probability of false negatives and false positives).

![](figures/spatiotemporal_model.png){#fig:spatiotemporal}

## Sampling binary networks 

Probabilistic networks can be used to predict binary interactions through random
draws. This can be useful when analyzing the structure of a probabilistic
network when analytical probabilistic measures are lacking. A binary network can
be generated from independent Bernoulli trials for each interaction. The
distribution of a network's property can then be obtained after measuring the
structure of all randomly generated networks (@Poisot2016Structure). Doing so
allows us to represent the variability of network structure, although possibly
with biases when connectance is low (@Poisot2014WheEco, @Chagnon2015ChaTop).
When binary networks are generated under a null model, this method can be used
for null hypothesis significance testing, in which case the observed measure is
compared to a null distribution (e.g., @Bascompte2003NesAss). Furthermore,
randomly generating binary networks across space and time can help us visualize
the spatiotemporal variability of network structure and test ecological
hypotheses on interactions across large spatial and temporal scales. 

There are at least two different approaches when sampling binary networks from
probabilistic webs across space, e.g. if we want to predict a binary network for
each of $n \times n$ grid cells. The first approach is to conduct a single
Bernoulli trial for each pair of taxa found in the region of interest based on
their regional probability of interaction. As a result, each pair of taxa that
are predicted to interact in the regional network realization will interact in
all of the $n^2$ networks in which they co-occur. This sampling technique is
best used with potential interactions that have no spatial variation. The second
approach is to independently sample each of the $n^2$ networks. In practice,
this can be done by generating a different probabilistic network for each grid
cell. Depending on how they were obtained, these networks can differ in their
taxa composition (nodes) and/or interaction probabilities (edges). Then, binary
networks can be independently sampled for each grid cell. Because this method
generates spatial variation in binary interactions, it is best used with local
interactions. 

The choice of sampling approach has an impact on the selection of grid cell
size. In the first approach, interactions will be the same regardless of cell
size because interactions are sampled only once from the regional network.
However, in the second approach, local interaction probabilities depend on the
network area. For example, let $N_1$ and $N_2$ be networks of area
$\frac{1}{2}A_0$ nested within $A_0$ and disjoint from each other, i.e. two
contiguous cells that form $N_0$. If $N_1$ and $N_2$ are independent (which is
rarely the case in reality because of spatial auto-correlation), the probability
that two taxa $i$ and $j$ interact in $N_0$ is given by:

$$P_{N_0}(i \rightarrow j) = 1 - (1 - P_{N_1}(i \rightarrow j)) \times (1 -
P_{N_2}(i \rightarrow j)).$$ {#eq:binary}

Because of its larger area, the probability that the two taxa interact in $N_0$
is higher than in $N_1$ and $N_2$. When sampling binary interactions from local
networks, it is thus important to sample at the same spatial scale as the one
for which probabilities were estimated. Otherwise, interaction probabilities
must be adjusted to correspond to the targeted cell size and avoid systematic
biases in prediction.

![](figures/network_sampling.png){#fig:sampling}

## Prediction of local networks from metawebs

Metawebs are an important source of ecological information that can be leveraged
for predicting local networks. Indeed, binary local networks can be
reconstructed by selecting a subset of both taxa and interactions from the
metaweb (@Dunne2006Network). This implies that there are always more
interactions in a metaweb compared to its corresponding local networks. In
practice, because a community's composition is arguably easier to sample or
predict than its interactions, the list of taxa to select can be known
empirically or obtained using range maps or species distribution models. The
challenge is rather to choose which interactions to select from the metaweb,
which could require more sophisticated statistical models and ecological
knowledge. Because the structure of local networks is constrained by the one of
the metaweb (@Saravia2022Ecological), inferring their structure from the metaweb
before predicting local pairwise interactions could prove promising
(@Strydom2021Roadmapa). 

When building probabilistic local networks from a probabilistic metaweb,
interaction probabilities decrease. This is because two taxa must first have the
capacity to interact (i.e., $M_{i,j}^* = 1$ in the binary metaweb $M^*$) before
interacting locally:

$$P_N(i \rightarrow j) = P_M(i \rightarrow j) \times P_N(i \rightarrow j
|M_{i,j}^* = 1).$$

Therefore, inferring local networks from their metaweb keeping the same values
of interaction probability would generate systematic biases in the prediction.
In that case, these networks would instead represent smaller-scale metawebs of
potential interactions, which could be misinterpreted as local interactions. As
suggested by @McLeod2021Sampling, even though metawebs do not capture the
spatiotemporal variability of interactions, they set the upper limit of local
interactions. In other words, the probability that two taxa interact at a given
location and time is always lower or equal to the probability of their potential
interaction: 

$$P_{N}(i \rightarrow j | A, t, C, \Omega) \le
P_M(i \rightarrow j).$$ {#eq:switch}

Moreover, the probability that two taxa have the biological capacity to interact
must be higher than the probability that they will ever interact because they
might never co-occur or encounter locally. More precisely, the accumulated
probability of realized interactions across all spatial, temporal, and
environmental conditions must be lower than the probability of potential
interaction, i.e.  

$$\int_\Omega\int_A\int_t P_{N}(i \rightarrow j | A, t, \Omega) dt dA d\Omega
\leq P_M(i \rightarrow j).$$ {#eq:all}

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
various spatial and temporal scales.

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
