# Introduction

As we try to navigate global biodiversity change, filling in knowledge gaps
about biodiversity becomes instrumental to monitoring and mitigating those
changes [@Gonzalez2022Monitor; @Abrego2021Accounting]. However, cataloging
species, populations and, in particular, ecological interactions (e.g.,
predation, parasitism, and pollination) is a substantial challenge
[@Polis1991Complex; @Pascual2006Ecologicala]. There are methodological and
biological constraints that hinder our ability to observe all ecological
interactions, leading to significant uncertainties in our understanding of these
interactions. For example, the spatial and temporal uncoupling of species [e.g.,
nocturnal and diurnal species coexisting in the same space without interacting
due to differences in the timing of their daily activities; @Jordano1987PatMut]
and the large number of rare and cryptic interactions in a community contribute
to these uncertainties [@Jordano2016Samplingb]. More generally, a handful of
conditions must be satisfied for an interaction to be observed locally. First,
both species must have overlapping geographic ranges, i.e. they must co-occur
within the region of interest [@Blanchet2020Cooccurrencea]. Second, they must
have some probability of meeting. Probabilities of interspecific encounters are
typically low, especially for rare species with low abundances. While species'
absolute abundances may impact interaction frequencies [@Vazquez2007Species],
encounter probabilities are determined by their relative abundances
[@Canard2012Emergencea; @Canard2012Emergencea]. The probability that species
meet each other also depends on their biological characteristics, such as the
synchronization of their phenology [@Olesen2010Missing; @Singer2012GeoMos] and
their discoverability [e.g., @Broom2005You]. Finally, when species do come into
contact, an interaction occurs only if their traits are locally compatible
[@Poisot2015Speciesa], including but not limited to their body phenotypes
[@Bolnick2011WhyInt; @Stouffer2011RolBod; @Gravel2013InfFooa] and behavioral
choices [@Pulliam1974Theory; @Choh2012PreRol]. Interactions may also be
influenced by the presence or prevalence of a third species [e.g., of a more
profitable prey species; @Golubski2011ModMod; @Sanders2012Indirect]. Documenting
the location and timing of interactions becomes even more difficult when
accounting for the spatiotemporal variability of ecological interactions
[@Poisot2012Dissimilaritya; @Poisot2015Speciesa]. Environmental factors, such as
temperature [@Angilletta2004TemGro], drought [@Woodward2012CliCha], climate
change [@Gilman2010FraCom; @Woodward2010ChaEco; @Araujo2011Usinga], and habitat
modifications [@Tylianakis2007HabMod], contribute to this spatiotemporal
variability by impacting species abundance and traits. Even after satisfying all
these conditions, there remains a possibility that the interaction does not
occur locally, either due to the intricate nature of the system or simply by
chance. If it does occur, it might still go unnoticed, particularly if it
happens infrequently. In this context, it is unsurprising that our knowledge of
ecological interactions remains limited [@Hortal2015SevSho] despite extensive
biodiversity data collection [@Schmeller2015GloTer]. 

Knowing the biological capacity of two species to interact directly (via e.g.,
trophic interactions) is necessary but not sufficient for inferring their
interaction at a specific time and space. The recognition of the intrinsic
variability of species interactions has led ecologists to expand their
representation of ecological networks (also known as ecological webs) to include
a probabilistic view of interactions [@Poisot2016Structure,
@Dallas2017Predictinga; @Fu2021Link]. This different perspective allows us to
fill in the Eltonian shortfall [@Hortal2015SevSho] by modeling the probability
of occurrence of interactions, which can be an important tool for directing
efforts and taking action, especially in places where access and resources for
research are scarce. The probabilistic representation of interactions is thus
far limited to direct interactions, which are conceptually and mathematically
analogous regardless of their biological type (e.g., predation and pollination).
This is in contrast with indirect interactions (e.g., interspecific
competition), which arise from distinct ecological processes and are often not
directly observable [@Kefi2015NetStr; @Kefi2016HowStr]. Representing direct
interactions probabilistically enables us to capture the spatiotemporal
variability of the aforementioned ecological processes and the uncertainties
associated with their occurrence. As opposed to webs of binary deterministic
interactions, in which interactions are regarded as either occurring or not,
webs of probabilistic interactions, within a Bayesian framework, express our
degree of belief (or confidence) regarding the occurrence or observation of
interactions. Based on the scale at which they are estimated, probabilistic
interactions may reflect our level of confidence in whether interactions will be
observed, realized locally, or biologically feasible. As an illustration, we
could outline a situation in which there is a $50\%$ certainty that an
interaction occurs $50\%$ of the time, or that there is a $50\%$ certainty that
it simply occurs. Our level of confidence should be more definitive (approaching
either $0$ or $1$) as we extend our sampling to a broader area and over a longer
time period, thereby diminishing the uncertainty of the interactions (but not
necessarily the estimation of their variability). In the broadest sense, binary
interactions are also a type of probabilistic interaction, in which the
numerical value of an interaction is restrained to $0$ (non-occurring) or $1$
(occurring). Yet, for the sake of clarity, we omit binary interactions from our
discussion of probabilistic interactions in this contribution. In networks of
probabilistic interactions, only forbidden interactions [i.e., interactions
prohibited by biological traits or species absence; @Jordano2003Invarianta,
@Olesen2010Missing] have a probability value of zero, provided that
intraspecific trait variability is considered [@Gonzalez-Varo2016Labilea]. 

By accounting for the uncertainty of interactions, networks of probabilistic
interactions may provide a more realistic portrait of species interactions.
However, how the uncertainty of pairwise interactions propagates to network
structure [i.e., community-level properties driving the functioning, dynamics,
and resilience of ecosystems\; @Proulx2005Networka; @McCann2007ProBio,
@McCann2011FooWeb; @Rooney2012IntFoo] remains to be elucidated. The application
and development of computational methods in network ecology, often based on a
probabilistic representation of interactions, can alleviate (and guide) the
sampling efforts required to document species interactions
[@Strydom2021Roadmapa]. For example, statistical models can be used to estimate
the uncertainty of pairwise interactions [@Cirtwill2019QuaFra] and the
probability of missing (false negatives) and spurious (false positives)
interactions [@Guimera2009MisSpu]. Considering the high rate of false negatives
in species interaction data due to the difficulty of witnessing rare
interactions [@Catchen2023Missinga], these models could inform the
identification of priority sampling locations of ecological webs where data
collection would yield the most valuable information, thereby reducing errors.
Optimization models for sampling locations have mostly found applications in
biological systems that are not networks, such as identifying priority sampling
sites for disease hotspots [@Andrade-Pacheco2020Finding], but there is
substantial promise in applying them to probabilistic ecological interactions.
Statistical models can also be used to generate predictions of ecological webs
without prior knowledge of pairwise interactions, for instance using body size
[@Petchey2008SizFor; @Gravel2013InfFooa], phylogeny [@Elmasri2020HieBay,
@Strydom2022Food], or a combination of niche and neutral processes
[@Bartomeus2016ComFra; @Pomeranz2019InfPre] for inference. Topological null
models, which generate networks of probabilistic interactions by preserving
chosen characteristics of the adjacency matrix of binary interactions while
intentionally omitting others [@Bascompte2003NesAss; @Fortuna2006HabLos], serve
as other examples of common probabilistic interaction models. Null models can be
used to produce underlying distributions of network measures for null hypothesis
significance testing. Many measures have been developed to describe the
structure [@Poisot2016Structure] and diversity [@Ohlmann2019Diversity,
@Godsoe2022Species] of probabilistic interaction webs. These models and measures
support the use of this approach for the study of a wide range of ecological
questions, from making better predictions of species distribution
[@Cazelles2016Theorya] to forecasting the impact of climate change on ecological
webs [@Gilman2010FraCom].

The lack of clear guidelines on the use of probabilistic interaction data is
worrisome, both for data producers and re-users who generate and manipulate
these numbers. This is concerning because sampling strategies and decisions
regarding network construction can affect our understanding of network
properties [@Brimacombe2023ShoReu]. Besides methodological difficulties that may
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
documentation of all types of probabilistic interactions [although see e.g.,
@Salim2022Data who discuss data standards for deterministic mutualistic webs].
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

Consider a scenario where a species of avian predator has just established
itself in a northern habitat home to a small rodent species. Suppose these
species have never co-occurred before, and as a result, their interaction has
not been previously observed. What is the probability that the rodent is part of
the diet of the avian predator, or put differently, what is the probability that
they interact? Answering this question requires some clarification, as there are
multiple ways to interpret and calculate interaction probabilities. We may
calculate the probability that the traits of these species match, i.e. that the
avian predator possesses the biological attributes to capture and consume the
rodent. We may also calculate the probability that their traits support an
interaction under the typical environmental conditions of the new habitat. For
example, because avian predators hunt by sight, predation could be possible in
the absence of snow but highly improbable when snow is present, as rodents may
use it as a shelter to hide from predators. Finally, we may calculate the
probability that the avian predator will consume the rodent at *that* particular
location, for which the spatial and temporal boundaries need to be specified.
The estimation of interaction probabilities, whether through predictive models
or prior distributions, hinges on our comprehension of these probabilities and
the specific ecological processes we aim to capture. 

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
to characterize our uncertainty regarding their actual realization. We use the
terms *metaweb* [@Dunne2006Network] to designate regional webs of potential
interactions and *local webs* [@Poisot2012Dissimilaritya] for those of realized
interactions. Metawebs are the network analogs of the species pool, where local
webs originate from a subset of both species (nodes) and interactions (edges) of
the regional metaweb [@Saravia2022Ecological]. Without clear documentation, it
can be challenging to know if published probabilistic interaction webs describe
local or regional interactions (@Tbl:prob provides examples of studies employing
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
may be represented at different levels of organization and precision. The basic
units of ecological networks are individuals that interact with each other
[e.g., by predation in food webs\; @Elton2001Animal], forming individual-based
networks [@Melian2011EcoDyn]. The aggregation of these individuals into more or
less homogeneous groups (e.g., populations, species, families, feeding guilds)
allows us to represent nodes at broader taxonomic scales, which affects our
interpretation of the properties of these systems [@Guimaraes2020Structurea;
@Hemprich-Bennett2021AssImp]. 

Edges linking nodes may describe a variety of interaction measures. Ecologists
have traditionally represented interactions as binary objects that were
considered realized after observing at least one individual from group $i$
interact with at least another individual from group $j$. In an adjacency matrix
$B$ of binary interactions, the presence or absence of an interaction $B_{i
\rightarrow j}$ between two taxa can be viewed as the result of a Bernoulli
trial $B_{i \rightarrow j} \sim {\rm Bernoulli}(P(B_{i \rightarrow j}))$, with
$P(B_{i \rightarrow j})$ being the probability of interaction. This interaction
probability characterizes our limited ecological knowledge and/or the intrinsic
spatiotemporal variability of interactions. It may be estimated through
predictive models (e.g., those based on biological traits and species
abundances) or expert (prior) knowledge about the interaction. In networks of
probabilistic interactions, $P(B_{i \rightarrow j})$ are edge values, and the
only two possible outcomes are the presence ($B_{i \rightarrow j} = 1$) or
absence ($B_{i \rightarrow j} = 0$) of an interaction between each pair of
nodes. Depending on the type of probabilistic interaction network (local or
metaweb), the mathematical formulation and interpretation of stochastic
parameters like $P(B_{i \rightarrow j})$ can be linked to environmental and
biological factors such as species abundance, traits, area, and time
(@Tbl:prob), for example using logistic regression with continuous explanatory
variables. Predicting the number of local webs in which the interaction between
two given taxa occurs can be achieved by using a Binomial distribution, assuming
a constant interaction probability and independence between networks (trials).
When considering uncertainties around the estimation of $P(B_{i \rightarrow j})$
or its spatiotemporal variability, a Beta distribution may be used to represent
the relative likelihood of different probability values. For example, when
calculating the probability of interaction between two taxa based on their local
abundances, any spatiotemporal fluctuations in their abundances would introduce
variability in the interaction probability at the local scale. If we take into
account the stochasticity of the interaction probability, a Beta-Binomial
distribution can be used to predict the number of networks in which the
interaction occurs. Empirically observing an interaction between two taxa at a
given location and time provides important information that can be used to
update previous estimates of $P(B_{i \rightarrow j})$, informing us on the
biological capacity of both taxa to interact and the environmental conditions
that enabled them to interact locally. 

Even though binary interaction webs constitute a highly valuable source of
ecological information [@Pascual2006Ecologicala], they overlook important
factors regarding interaction strengths. Represented in a quantitative adjacency
matrix $W$ as numbers not confined to the $[0, 1]$ range, interaction strengths
better describe the energy flows, demographic impacts or frequencies of
interactions between nodes [@Berlow2004Interaction; @Borrett2019Walk], with
$W_{i \rightarrow j}$ being a natural $\mathbb{N}$ or real $\mathbb{R}$ number
depending on the measure. For example, they may represent local interaction
rates between pairs of taxa [e.g., the flower-visiting rates of pollinators in a
mutualistic network; @Herrera1989PolAbu]. When interaction strengths
characterize predation pressure on prey taxa in food webs, they can serve as
good estimators of the parameters describing species interactions in a
Lotka-Volterra model [e.g., @Emmerson2004Predatora]. The extra amount of
ecological information in quantitative networks typically comes at a cost of
greater sampling effort and data volume in predictive models
[@Strydom2021Roadmapa], which can lead to relatively high levels of
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
period). The Poisson distribution can also be $0$-inflated after initially
modeling non-interacting taxa [e.g., @Boulangeat2012AccDis employ a $0$-inflated
model to analyze species abundance following the modeling of species presence
and absence], which constitute the majority of taxa pairs in most local webs due
to their typically high sparseness [@Jordano2016Samplingb]. Because of the
methodological difficulties typically encountered when building deterministic
quantitative webs [which are only partially mitigated by models such as Ecopath,
@Plaganyi2004Criticala], binary interaction webs, which are easier to sample
[@Jordano2016Samplingb] and predict [@Strydom2021Roadmapa], have been more
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
interact at a given location and time period. Local interactions are contingent
upon the environmental and biological conditions of the community. In local
webs, edges commonly represent our degree of belief that two taxa interact in
nature, but can also represent the probability of *observing* this interaction
[@Catchen2023Missinga]. For example; @Gravel2019BriElt analyzed local European
trophic webs of willow-galling sawflies and their natural enemies depicting
binary interactions, all referenced in space and time, to infer the
probabilities of locally observing interactions between co-occurring species.
This was achieved by situating local webs within the context of environmental
variables, i.e. by including temperature and precipitation as conditional
variables in some of their models.

We define space as the collection of geographic coordinates $(x, y, z)$, with
$(x, y)$ representing longitude and latitude coordinates, and $z$ denoting
either altitudes or depths. These point coordinates delineate the spatial
boundaries of the system, which may be portrayed as a polyhedron. Ecological
interactions may exhibit variations along latitudinal and altitudinal gradients,
as evidenced by changes in hummingbird-plant interactions [@Weinstein2017PerBil,
@Weinstein2017ComTra] and mosquito biting rates [e.g., @Kulkarni2006EntEva] at
different elevations. In contrast, time is defined as the specific time period
within which interactions were either observed or predicted. Even though space
and time are continuous variables that should yield probability *densities* of
interactions (i.e., relative likelihoods of interactions occurring at
infinitesimal locations and instants in time), these definitions enable them to
be conceptualized as distinct patches and time segments. Treating space and time
as discrete dimensions aligns with the common sampling methods of ecological
networks and provides actual probabilities of interactions, which can be
obtained by integrating probability densities over space and time. Furthermore,
we can quantify both an area $A$ and a duration $t$, which can be readily used
in spatiotemporal analyses of ecological networks. For example, when studying
network-area relationships [NAR\; @Galiana2018Spatiala], we anticipate that
local probabilities of interactions scale positively with area and duration
because taxa have more opportunities to interact as these dimensions expand.

The probability that two taxa $i$ and $j$ interact in a local web $L_{x,y,z,t}$
(spatial and temporal subscripts hereafter omitted or replaced by the shorter
subscript $l$ for clarity) can be conditioned on many environmental and
biological factors. In addition to network area (or volume) and duration, they
may be conditioned on taxa co-occurrence $X_{i,j,l}$, which is usually a Boolean
describing if the geographic distributions of both taxa overlap within the study
area. Co-occurrence may be modeled probabilistically, in which case it may
conform to a Bernoulli distribution $X_{i,j,l} \sim {\rm Bernoulli}(P(X_{i,l},
X_{j,l}))$, where $X_{i,l}$ and $X_{j,l}$ are the local occurrences (presence /
absence) of both taxa. The probability of co-occurrence $P(X_{i,l}, X_{j,l})$
can be estimated through the application of joint species distribution models
[e.g., @Pollock2014UndCoo], potentially taking into account biotic interactions
[@Staniczenko2017Linking]. Given that the probability that two non-co-occurring
taxa interact locally is zero (i.e., $P(L_{i \rightarrow j}| X_{i,j,l} = 0) =
0$), the probability of local interaction can be obtained by multiplying the
probability of interaction given co-occurrence with the probability of
co-occurrence: 

$$P(L_{i \rightarrow j}) = P(L_{i \rightarrow j}| X_{i,j,l} = 1) \times
P(X_{i,l} = 1, X_{j,l} = 1).$${#eq:co-occur}

Other important factors that can impact interaction probabilities at the local
scale are taxa local abundances $N_{i,l}$ and $N_{j,l}$, which affect encounter
probabilities [@Canard2012Emergencea], and local traits distributions $T_{i,l}$
and $T_{j,l}$ (e.g., body mass, presence of given anatomical features, host
resistance), which determine the ability of individuals to interact after
encountering each other [@Poisot2015Speciesa]. Moreover, local interactions may
be conditional on local environmental factors such as temperature
[@Angilletta2004TemGro], precipitation [@Woodward2012CliCha], habitat structure
[@Klecka2014EffHab], and presence of other taxa in the network
[@Pilosof2017MulNat; @Kefi2012MorMea], as described above. Here, we use the
variable $E_l$ to describe the local ecological context in which interaction
probabilities were estimated. For example, if a research team conducts a
mesocosm experiment to estimate interaction probabilities between predators and
prey with and without shelters (a place that offers refuge and protection for
prey, shielding them from predators), $E_l$ would represent the presence or
absence of these shelters. Like co-occurrence, $E_l$ can also be modeled
probabilistically when the stochasticity or uncertainty of environmental factors
is considered. In sum, $E_l$ represents all ecological variables that were taken
into consideration when measuring interaction probabilities and is, therefore, a
subset of all environmental factors impacting ecological interactions. Finally,
local interaction probabilities may be conditioned on higher-level properties of
the network, which we denote by $f(L)$. Many topological null models (i.e.,
statistical models that randomize interactions by retaining certain properties
of the network while excluding others) provide interaction probabilities from
selected measures of network structure, such as connectance [@Fortuna2006HabLos]
and the degree distribution [@Bascompte2003NesAss].

The probability that two taxa $i$ and $j$ interact in a local web $L$ can thus
be conditioned on their co-occurrence $X_{i,j,l}$ (or more explicitly on their
occurrences $X_{i,l}$ and $X_{j,l}$), local abundances $N_{i,l}$ and $N_{j,l}$,
local traits distributions $T_{i,l}$ and $T_{j,l}$, local environmental
conditions $E_l$, network area (or volume) $A$, time interval $t$, and network
properties $f(L)$. Although these variables correspond to distinct ecological
inquiries or mechanisms related to ecological interactions, they may covary with
each other, such as the possible dependence of $X_{i,j,l}$ and $E_l$ on spatial
and temporal scales. When estimating interaction probabilities using e.g. a
generalized linear model with multiple explanatory variables that might not be
independent, it may become important to address collinearity. In such a case, to
mitigate this issue, it may be necessary to use variable selection techniques
before fitting the model to data. The probability that a local interaction is
realized is described by the following expression when all these conditional
variables are included:

$$P(L_{i \rightarrow j} | X_{i,l}, X_{j,l}, N_{i,l}, N_{j,l}, T_{i,l}, T_{j,l},
E_l, A, t, f(L))$$ {#eq:local}

The representation of the local context in which probabilities are estimated and
the variables that should be taken into consideration depend on the study
system, the objectives of the study, and the resources available to the
researchers. In other words, these variables do not systematically need to be
accounted for. For example, in @Gravel2019BriElt, for the purpose of model
comparison, some models incorporated environmental variables as conditions of
interaction probabilities, while others did not. When accounted for, these
variables should be clearly described in the documentation of the data
[@Brimacombe2023ShoReu], preferentially in mathematical terms to avoid any
confusion in their interpretation and to limit manipulation errors during their
re-use. For instance, ecologists should be explicit about their consideration of
co-occurrence in their estimation of local interaction probabilities. Indeed, it
is important to specify if probability values are conditional $P(L_{i
\rightarrow j} | X_{i,j,l} = 1)$ or not $P(L_{i \rightarrow j})$ on
co-occurrence since this can significantly impact the interpretation and
analysis of the data. In @Tbl:prob, we present examples of studies that used
these different formulations of probabilistic interactions and conditional
variables. We have included the probability of empirically observing an
interaction that is realized locally $P(O_{i \rightarrow j} \vert L_{i
\rightarrow j})$ to underscore the distinction between local observations and
actual realizations of interactions, even though the focus of this manuscript is
not on the observation of interactions.

| Expression | Type | Outcome | Uncertainty sources | Reference | 
| :------ | :-- | :---------- | :------ | -------: |   
| $P(L_{i \rightarrow j} \vert X_{i,l}, X_{j,l},...)$ | local | realization of the interaction given taxa co-occurrence | spatiotemporal variability | @Gravel2019BriElt | 
| $P(L_{i \rightarrow j} \vert N_{i,l}, N_{j,l},...)$ | local | realization of the interaction given taxa abundances | neutral models | @Canard2014Empiricala |   
| $P(L_{i \rightarrow j} \vert T_{i,l}, T_{j,l}, ...)$ | local | realization of the interaction given local traits | trait matching models | @Gravel2016Meaning |  
| $P(L_{i \rightarrow j} \vert E_l,...)$ | local | realization of the interaction given local environmental conditions | environmental-based models | @Gravel2019BriElt (temperature and precipitation) | 
| $P(L_{i \rightarrow j} \vert A, ...)$ | local | realization of the interaction in a given area or volume | spatial models | @Galiana2018Spatiala * |   
| $P(L_{i \rightarrow j} \vert t,...)$ | local | realization of the interaction during a given time period | temporal models | @Weinstein2017ComTra |    
| $P(L_{i \rightarrow j} \vert f(L),...)$ | local | realization of the interaction given network structure | topological null models | @Fortuna2006HabLos (connectance) |   
| $P(L_{i \rightarrow j} \vert M_{i \rightarrow j},...)$ | local | realization of the interaction given that the taxa can biologically interact | spatiotemporal variability | this study |
| $P(O_{i \rightarrow j} \vert L_{i \rightarrow j},...)$ | local | observation of the interaction given that it is realized locally | sampling model | @Catchen2023Missinga |
| $P(M_{i \rightarrow j} \vert T_i, T_j)$ | regional | biological feasibility of the interaction given regional traits (non-forbiddenness) | trait matching models | @Strydom2022Food |   
| $P(M^*_{i \rightarrow j} \vert T_i, T_j, E)$ | regional | ecological feasibility of the interaction given regional traits and environmental conditions | trait matching and environmental-based models | this study |    

Table: **Mathematical expressions of probabilistic interactions.** The
probability of interaction between two taxa $i$ and $j$ is interpreted
differently in a metaweb $M$ of potential interactions (representing the
*biological* feasibility of interactions), a metaweb $M^*$ of potential
interactions (representing the *ecological* feasibility of interactions), a
local web $L$ of realized interactions and a local web $O$ of observed
interactions. Each expression emphasizes a different conditional variable, the
ellipsis serving as a placeholder for other variables not explicitly stated in
the expression. The outcome of each of these probabilistic events, along with
common uncertainty sources (often stemming from the model used for estimation),
is presented alongside examples of studies that employed them (with specific
variables indicated in parentheses, when applicable). The study marked with an
asterisk has been conducted on binary interaction webs. {#tbl:prob}

When testing or employing multiple models to estimate local interaction
probabilities, rather than selecting a single model that best fits the data,
model averaging may be used to enhance our estimations. In this approach, the
weighting is based on the likelihood of each model. Model weights represent the
probability that each model is the most suitable for explaining the data, and
may be measured using Akaike weights [@Burnham2004Multimodel;
@Wagenmakers2004Aic]. For instance, considering two models $mod_1$ and $mod_2$
with respective probabilities (or weights) $P(mod_1)$ and $P(mod_2)$, the
average probability of interaction $P(L_{i \rightarrow j}|...)$ can be
calculated as follows: 

$$P(L_{i \rightarrow j}|...) = P(L_{i \rightarrow j}|mod_1, ...) \times
P(mod_1)+ P(L_{i \rightarrow j}|mod_2, ...) \times P(mod_2),$$ {#eq:model_ens}

where the ellipsis serves as a placeholder for the conditional variables
incorporated in these models.

## Metawebs: regional catalogs of interactions

Metawebs are networks of potential interactions that have been designed for
broad spatial, temporal, and taxonomic scales (e.g., species food webs at the
continental scale). Potential interactions describe the biological capacity of
taxa to interact, which is typically assessed at the regional scale. Metawebs of
probabilistic interactions are particularly useful in situations where there is
high uncertainty in the ability of taxa to interact if they were to encounter
each other. This uncertainty frequently arises due to insufficient interaction
data, especially for taxa that have not yet been observed to co-occur, and
uncertainties in trait-matching models. As data accumulates, interactions in
metawebs should tend towards binarity, approaching probability values of $0$
(repeatedly failing to observe an interaction between two co-occurring taxa) and
$1$ (observing an interaction at least once). The extent of sampling effort thus
influences our evaluation of probabilities of potential interactions, as
sampling over a larger area or for a longer duration enables us to capture a
greater number of regional interactions [@McLeod2021Sampling]. However, in
contrast with local webs of probabilistic interactions, which describe
interaction stochasticity in local natural settings, regional interactions are
not evaluated for any particular local context. Although *neutrally* forbidden
interactions [i.e., improbable interactions between rare species,
@Canard2012Emergencea] tend to have low probability values in local webs, they
may have higher probabilities in the metaweb (i.e., when species' biological
traits can support an interaction if they were to encounter each other).
Likewise, non-co-occurring taxa may have a non-zero probability of interaction
in the metaweb.  

Potential interactions describe what we refer to as the *biological* feasibility
of interactions, which is based solely on the regional traits distributions
$T_i$ and $T_j$ of taxa $i$ and $j$, respectively. A probability of potential
interaction in a metaweb $M$ describing the biological feasibility of
interactions may be expressed as: 

$$P(M_{i \rightarrow j} | T_i, T_j),$$ {#eq:metaweb}

which, in contrast with local webs, is not conditioned on any spatial, temporal,
co-occurrence or environmental variables (@Tbl:prob). Regional traits may differ
from local traits $T_{i,l}$ and $T_{j,l}$, which may vary spatially and
temporally due to phenotypic plasticity [@Berg2010Traita]. The biological
feasibility of interactions expresses our degree of belief that there exists at
least one combination of phenotypes that could support an interaction if they
were to encounter each other, assuming they had infinite time to interact.
Evaluating this probability is conducted without incorporating the environmental
conditions under which they encounter each other into the model. It is the
complement of the probability $P(F_{i \rightarrow j} | T_i, T_j)$ of forbidden
interactions based uniquely on biological traits (i.e., the probability that
their traits do not support an interaction):

$$P(M_{i \rightarrow j} | T_i, T_j) = 1 - P(F_{i \rightarrow j} | T_i, T_j).$$
{#eq:forbidden}

For example, let $i$ be a western diamondback rattlesnake (*Crotalus atrox*) and
$j$, a wood lemming (*Myopus schisticolor*). These two taxa never co-occur, the
rattlesnake being adapted to warm regions of North America
[@Castoe2007Phylogeographic] and the lemming, to northern habitats of Eurasia
[@Fedorov2008Comparative]. As we lack direct observations of an interaction
between these two species, we have to rely on expert knowledge or trait-matching
models to estimate their probability of potential interaction. To accurately
estimate this probability using trait-matching models, it is crucial to ensure
that the set of traits considered reflects the overall traits distributions of
both taxa. We could for instance consider their average body mass and the
average phylogenetic proximity of lemmings to rattlesnakes' prey. Doing so, we
might find a high probability of potential interaction based on these traits. 

The biological feasibility of interactions should not be confused with what we
refer to as the *ecological* feasibility of interactions. A probability of
potential interaction in a metaweb $M^*$ describing ecological feasibility of
interactions may be expressed as: 

$$P(M^*_{i \rightarrow j} | T_i, T_j, E),$$ {#eq:metaweb2}

where $E$ is the environmental conditions under which potential interactions are
evaluated (@Tbl:prob). Unlike $E_l$, these environmental conditions do not
represent conditions occurring at specific locations. Ecological feasibility
represents the probability that two taxa interact if they were to encounter each
other under given environmental conditions, assuming they had infinite time to
interact. Incorporating environmental conditions into a trait-matching model may
be important when there is high covariation between the environment and
biological traits. For instance, in our example involving rattlesnakes and
lemmings, the probability of potential interaction between these two species may
be low in most environmental conditions. Western diamondback rattlesnakes may be
unactive under low temperatures [@Kissner1997Rattling], whereas wood lemmings
may have low tolerance to high temperatures [@Kausrud2008Linking]. The
probability that an interaction is ecologically feasible is always lower than
the probability that it is biologically feasible, even across all environmental
conditions: 

$$\int_{E}P(M^*_{i \rightarrow j} | T_i, T_j, E) dE \leq P(M_{i \rightarrow j} |
T_i, T_j).$$ {#eq:feasibility}

This is because the biological feasibility of an interaction is a prerequisite
for its ecological feasibility. Biological feasibility is necessary but not
sufficient for an interaction to be ecologically feasible. Our discussion of
metawebs will focus on the biological feasibility of interactions since most
methods developed for inferring probabilities of regional interactions do not
explicitly take into account environmental conditions [e.g., @Strydom2022Food]. 

Starting from a selected set of taxa, which are usually distributed within a
broad region of interest, metawebs can be built using different data sources,
including literature review [e.g., @Maiorano2020Tetraeua], aggregated local web
data [e.g., @Gravel2019BriElt; @Saravia2022Ecological], trait-matching models
[e.g., @Strydom2022Food; @Shaw2024Framework], and expert knowledge. Every pair
of taxa that have confidently been observed to interact at least once can be
given a probability of $1$ (i.e., $P(M_{i \rightarrow j}) = 1$) since we know
that they *can* interact. This differs from local webs of probabilistic
interactions, where interaction events may remain stochastic (i.e., $P(L_{i
\rightarrow j}) < 1$) even after empirically observing interactions due to their
spatiotemporal variability. Interactions that were never observed typically have
low probability values in local webs and vary from low to high values in
metawebs, contingent upon taxa traits distributions (reaching $0$ for forbidden
links). 

When incorporating local network data to estimate probabilities of regional
interactions, repeatedly failing to observe an interaction between two
co-occurring taxa (i.e., $P(O_{i \rightarrow j} = 0)$) should decrease the
probability that the interaction is biologically feasible. Using Bayes' theorem,
the probability that the interaction is biologically feasible given that it was
never observed locally, $P(M_{i \rightarrow j} = 1 | O_{i \rightarrow j} = 0,
...)$, may be calculated as follows: 

$$P(M_{i \rightarrow j} = 1 | O_{i \rightarrow j} = 0,...) = \frac{P(O_{i
\rightarrow j} = 0 |M_{i \rightarrow j} = 1, ...) \times P(M_{i \rightarrow j} =
1 | ...)}{P(O_{i \rightarrow j} = 0 |...)}.$$ {#eq:emp_sampling}

The reduction in the probability of regional interaction after considering that
it was never observed locally (i.e., $P(M_{i \rightarrow j} = 1 | O_{i
\rightarrow j} = 0,...) < P(M_{i \rightarrow j} = 1 | ...)$) occurs because
$P(O_{i \rightarrow j} = 0 | M_{i \rightarrow j} = 1,...)$ must be lower than
$P(O_{i \rightarrow j} = 0, ...)$, i.e. there is a higher chance of observing an
interaction when we know it is biologically feasible. 

Many observations of interactions are false positives because of observation
errors due to taxonomic misidentifications and ecological misinterpretations
[e.g., due to cryptic species and interactions; @Pringle2020Resolving].
Likewise, forbidden interactions may be false negatives, e.g. if they have been
evaluated based on unrepresentative or incomplete traits distributions.
Employing Bayesian models could prove valuable when estimating interaction
probabilities in metawebs [e.g., @Bartomeus2016ComFra; @Cirtwill2019QuaFra].
This improvement is achieved by updating prior information regarding the
feasibility of interactions (e.g., experts' prior assessments of interaction
probabilities) with empirical data on interactions and traits.

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
dataset contains well-resolved binary local interactions between willows ($52$
species), willow-galling sawflies ($96$ species), and their parasitoids ($126$
species). Given its replicated webs spanning large spatiotemporal scales, this
dataset is well-suited for analyzing a variety of ecological hypotheses and
processes. Out of a total of $374$ local webs, we retained those containing at
least $5$ species, resulting in a set of $233$ georeferenced local webs
(networks sampled within areas of $0.1$ to $0.3$ km² during June and/or July
spanning $29$ years). We built a metaweb of binary interactions by aggregating
all local interactions, which gave us a regional web composed of $274$ species
and $1080$ interactions. In the first two panels of @Fig:accumulation, we show
how the dissimilarity of interactions between common species ($\beta_{OS}$) and
the dissimilarity in species composition ($\beta_{S}$) between the metaweb and
aggregated local webs [@Poisot2012Dissimilaritya] vary with the number of
sampled local webs. This shows that networks of local interactions are highly
dissimilar from the metaweb, both in terms of species and interactions,
especially when only a limited number of sites has been sampled. Both
dissimilarity indices were calculated based on the number of items shared by the
two webs ($c_{LM}$) and the number of items unique to the metaweb ($u_M$) and to
the aggregated local web ($u_L$). The $\beta_{S}$ dissimilarity index uses
species (nodes) as items being compared, while the $\beta_{OS}$ index assesses
dissimilarity based on interactions between shared species
[@Poisot2012Dissimilaritya]. Both indices were calculated following the
$\beta_W$ index of @Whittaker1960Vegetation: 

$$\beta_W = \frac{c_{LM} + u_L + u_M}{(2 c_{LM} + u_L + u_M) / 2} - 1.$$
{#eq:diss}

![**Network accumulation curves.** (a) Dissimilarity of interactions between
common species and (b) dissimilarity in species composition between aggregated
local webs and the metaweb of binary host-parasite interactions. Aggregated
local webs were obtained by sequentially and randomly selecting a number of
local webs of binary interactions and aggregating both their species and
interactions. In both panels, the colored line represents the median
dissimilarity across simulations and the grey areas cover the $50\%$ and $95\%$
percentile intervals. (c) Scaling of the number of links and (d) scaling of
connectance with the number of sampled binary and probabilistic local
interaction webs. For a better comparison with binary interactions, local webs
of probabilistic interactions were derived from the metaweb of probabilistic
interactions with a false positive and false negative rate of zero. A specific
value of $P(L_{i \rightarrow j}|M_{i \rightarrow j})$ (the local probability of
interaction among potentially interacting species, indices omitted in the figure
for simplicity) was used for all local webs within a particular curve.
Aggregated local webs of probabilistic interactions were obtained by
sequentially and randomly selecting a number of local webs and aggregating both
their species and interactions (with the value of $P(L_{i \rightarrow j}|M_{i
\rightarrow j})$ adjusting according to
@Eq:aggregate).](figures/network_accumulation.png){#fig:accumulation}

We converted these binary interaction networks into probabilistic ones using
models based on simple assumptions. Our models are not designed to estimate the
exact values of probabilistic interactions. Instead, their purpose is to create
plausible networks that serve as illustrative examples to highlight distinctions
between local and metawebs of probabilistic interactions. We created two
metawebs of probabilistic interactions by employing constant false positive and
false negative rates for all regional interactions. In the first metaweb, we set
both false positive and false negative rates to zero to prevent artificially
inflating the total number of links, enabling a more accurate comparison with
binary interaction webs. This gave us a probability of regional interaction of
$1$ when at least one interaction has been observed locally and of $0$ in the
absence of any observed interaction between a given pair of species. In the
second metaweb, we introduced a $5\%$ false positive rate to account for
spurious interactions and a $10\%$ false negative rate to address the elevated
occurrence of missing interactions in ecological networks
[@Catchen2023Missinga]. We believe these rates represent reasonable estimates of
missing and spurious potential interactions, but confirming their accuracy is
challenging due to the unavailability of data on the actual feasibility of
interaction. Observed interactions were thus given a probability of regional
interaction of $95\%$, whereas unobserved ones were assigned a probability of
$10\%$. 

To build local webs of probabilistic interactions, we first recognize that local
interactions must initially be biologically feasible before occurring at a
specific time and space. A local probability of interaction $P(L_{i \rightarrow
j})$ can be expressed as the product of the probability of local interaction
given that the two taxa can potentially interact $P(L_{i \rightarrow j} | M_{i
\rightarrow j} = 1)$, which we denote as $P(L_{i \rightarrow j}|M_{i \rightarrow
j})$ for the sake of simplicity, with their probability of regional interaction
$P(M_{i \rightarrow j})$: 

$$P(L_{i \rightarrow j}) = P(L_{i \rightarrow j} | M_{i \rightarrow j} = 1)
\times P(M_{i \rightarrow j} = 1).$$ {#eq:local_meta}

We built local webs of probabilistic interactions using the taxa found in the
empirical local networks and attributing pairwise interaction probabilities
based on the metawebs of probabilistic interactions and a constant value of
$P(L_{i \rightarrow j}|M_{i \rightarrow j})$ across interactions. Low values of
$P(L_{i \rightarrow j}|M_{i \rightarrow j})$ indicate that feasible interactions
rarely occur locally, intermediate values around $50\%$ suggest considerable
spatiotemporal variability, while high values indicate that regional
interactions are nearly always realized locally. Following @Eq:local_meta, the
local probability of interaction between a given pair of taxa consistently
remained equal to or below their probability of regional interaction. 

In the last two panels of @Fig:accumulation, we show how the aggregated number
of links and connectance (i.e., the proportion of all of the non-forbidden links
that are realized) scale with the number of sampled local webs, according to
different values of $P(L_{i \rightarrow j}|M_{i \rightarrow j})$. When
aggregating local webs of probabilistic interactions, the constancy of the
probability of regional interaction across the entire study area means that any
rise in the probability of local interaction is solely attributable to an
increase in $P(L_{i \rightarrow j}|M_{i \rightarrow j})$. For example, let $L_1$
and $L_2$ be two local networks and $L_{1,2}$ the aggregated web. If $P(L_{1, i
\rightarrow j}|M_{i \rightarrow j})$ and $P(L_{2, i \rightarrow j}|M_{i
\rightarrow j})$ are the probabilities that two potentially interacting taxa
interact respectively in $L_1$ and $L_2$, the probability $P(L_{1,2, i
\rightarrow j}|M_{i \rightarrow j})$ that these taxa interact in the aggregated
web $L_{1,2}$ is obtained by: 

$$P(L_{1,2, i \rightarrow j}|M_{i \rightarrow j}) = 1 - (1 - P(L_{1, i
\rightarrow j}|M_{i \rightarrow j})) \times (1 - P(2, L_{i \rightarrow j}|M_{i
\rightarrow j})),$$ {#eq:aggregate}

assuming independence between the interaction of the two taxa in different
networks. This equation represents the probability that the interaction is
realized in either (1) exclusively the local web $L_1$, (2) exclusively the
local web $L_2$ or (3) both local webs, given that the two taxa have the
biological capacity to interact.

By comparing the scaling relationships observed in webs of binary and
probabilistic interactions; @Fig:accumulation illustrates that high values of
$P(L_{i \rightarrow j}|M_{i \rightarrow j})$ lead to systematic overestimations
in the number of links and connectance, especially when $P(L_{i \rightarrow
j}|M_{i \rightarrow j}) = 1$ (corresponding to the scenario where local
probabilities of interactions are equivalent to the probabilities of regional
interactions). However, these biases tend to diminish as the number of sampled
webs increases.

## Spatial and temporal scaling of interactions

The investigation of network-area relationships and interaction accumulation
curves is an important area of research in network ecology. First, network-area
relationships elucidate the scaling of network properties (such as modularity
and trophic chain lengths) with spatial scale [e.g., @Wood2015Effects,
@Galiana2018Spatiala]. The variations in network structure across spatial scales
may stem from the scaling of species richness (species-area relationships,
SARs), the number of interactions [@Brose2004UniSpa], and many other
higher-level properties of the system [e.g., environmental heterogeneity,
@Thompson2005Foodweb] with the sampled area. Additionally, ecological processes
occurring at distinct spatial scales, such as the spatial variability in local
community composition resulting from different sequences of extinction and
colonization events, can also contribute to this variation
[@Galiana2018Spatiala]. Next, interaction accumulation curves describe the
scaling of the number of observed interactions with sampling effort
[@Jordano2016Samplingb]. Sampling effort, which may correspond to the duration
of the sampling period used to construct the network, can impact connectance
[@Bersier1999Scale] and various measures of network structure
[@Banasek-Richter2004Sampling; @McLeod2021Sampling]. Apart from sampling effort,
the temporal scaling of interactions also elucidates how network structure
changes with the temporal resolution of the network [@Poisot2012Dissimilaritya],
acknowledging that distinct interactions take place over time, ranging from
short-term fluctuations of interactions to long-term trends. As local webs of
probabilistic interactions may explicitly account for the spatiotemporal
variability of interactions, they offer a distinct approach to investigating the
scaling of network structure with space and time, in contrast to webs of binary
and quantitative interactions, by making the stochasticity of interactions the
focal point of the modeling process.

Local and metawebs exhibit distinct relationships with spatial and temporal
scales. On one hand, metawebs of probabilistic interactions, representing
biological feasibility, feature regional interactions that do not scale with
space and time. This is because regional interactions depend solely on the
biological capacity of two taxa to interact, regardless of their co-occurrence
and local environmental conditions. However, probabilities of potential
interactions may change (tending to become more definitive) upon updating
previous estimates with increased sampling effort, even though they do not vary
in a specific direction with the spatial and temporal extent (boundaries) of the
network. The probability of two taxa potentially interacting should
theoretically be the same in all metawebs in which they are present, provided
that the data and methods used for estimation are consistent. For example, if a
smaller metaweb $M_1$ is derived from a larger metaweb $M_0$ by selecting the
subset of taxa present in the region described by $M_1$ and retaining all their
interactions, their probabilities of interaction should be identical regardless
of scale, i.e. $P(M_{1, i \rightarrow j}) = P(M_{0, i \rightarrow j})$. With a
larger or equal number of taxa in $M_0$ as compared to $M_1$, the total number
of interactions is expected to be higher or at least equal in the larger web,
even though pairwise probabilities remain identical. 

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
durations when time intervals are nested. In @Fig:spatial, we show how the
expected number of local host-parasite interactions scales with area,
represented as an expanding latitudinal window, in comparison with regional
interactions. Even though we employed local probabilities of interactions equal
to regional interactions for the purpose of comparison (i.e., using $P(L_{i
\rightarrow j}|M_{i \rightarrow j}) = 1$ here), we notice that the total number
of regional interactions scales more rapidly than local interactions. This is
because numerous regional interactions involve species that never co-occur, and
as a result, these interactions are not captured in any local web.

![**Spatial scaling of interactions.** Expected number of host-parasite
interactions in a network aggregating all (a) local and (b) regional
probabilistic interactions within a latitudinal window of a given length. Every
dashed curve corresponds to a different expanding window characterized by a
different central latitude, with the colored solid line representing the median
number of interactions. Heatmaps of the expected number of (c) local and (d)
regional interactions found in windows of specified length and central
latitudes. Probabilities of regional interactions were obtained with a false
positive rate of $5\%$ and a false negative rate of $10\%$. Local probabilistic
interactions were derived from probabilistic regional interactions by setting
the value of $P(L_{i \rightarrow j}|M_{i \rightarrow j})$ (the local probability
of interaction among potentially interacting species) to $1$, ensuring a
conservative comparison between aggregated local webs and metawebs. Aggregated
local webs were obtained by aggregating both the species and interactions found
within a particular latitudinal window, with the values of $P(L_{i \rightarrow
j}|M_{i \rightarrow j})$ remaining at their maximum value of $1$ following
@Eq:aggregate. ](figures/spatial_scaling.png){#fig:spatial}

## Box 1: A spatiotemporally explicit model of interactions

Predicting local webs across time and space is a pivotal goal of network
ecology, especially given the scarcity of interaction data
[@Strydom2021Roadmapa]. Ecologists may resort to predictive models (e.g.,
generative Bayesian and machine learning models) to reconstruct networks at fine
spatial and temporal scales with limited interaction data. For instance,
real-time biomonitoring data coupled with appropriate numerical models
[@Bohan2017Nextgenerationa] can be employed to reconstruct local ecological
webs, opening avenues for in-depth studies on local ecosystem functioning and
dynamics. The probabilistic representation of interactions describes the
inherent uncertainty in these models, typically expressed through probability
distributions. We introduce and develop a simple generative mechanistic model
for probabilistic local interactions that takes into consideration their
spatiotemporal variability (i.e., a spatiotemporally explicit model of local
interactions). It is essential to note that our model is not designed for
regional interactions, which are scale-independent. Rather, it could prove
valuable for predicting local interactions across time and space by generating
new interaction data following parameter inference.

As indicated by @Eq:co-occur, the probability that two taxa $i$ and $j$ interact
at a specific location and time $l$ may be determined by the product of their
probability of interaction given co-occurrence and their probability of
co-occurrence. First, their co-occurrence probability can be calculated using
their individual (marginal) occurrence probabilities $P(X_{i,l})$ and
$P(X_{j,l})$. Given that taxa occurrences are not independent of each other, the
joint probability of both taxa occurring together can be calculated by
multiplying the probability of one taxon being present by the conditional
probability of the other occurring when the first one is present. Alternatively,
the joint occurrence probability can be obtained by multiplying the marginal
probabilities by the strength of association $\gamma$ between the occurrences of
both taxa [@Cazelles2016Theorya]: 

$$P(X_{i,l}, X_{j,l}) = P(X_{i,l} | X_{j,l}) P(X_{j,l})  = P(X_{i,l}) P(X_{j,l})
\gamma.$$ {#eq:modelcoprob}

When $\gamma > 1$, it signifies a positive association in the geographic
distributions of both taxa, indicating that the presence of one taxon enhances
the probability of occurrence of the other. Attractions may be the result of
positive interactions (e.g., mutualism) or positive/negative interactions [e.g.,
antagonism between predators and prey\; @Cazelles2016Theorya]. In empirical
webs, $\gamma > 1$ holds true for the majority of species pairs
[@Catchen2023Missinga]. In contrast, repulsions ($\gamma < 1$) may be caused
e.g. by strong interspecific competition [@Cazelles2016Theorya]. We model the
co-occurrence $X_{i,j,l}$ of both taxa as the outcome of a Bernoulli trial

$$X_{i,j,l} \sim Bernoulli(P(X_{i,l}, X_{j,l})).$$ {#eq:modelco}

Next, the probability of interaction given co-occurrence can be made temporally
explicit by modeling it as a Poisson process with rate parameter $\lambda_l$.
This parameter represents the local expected frequency of interaction between
the taxa within a defined time interval and can be estimated using prior data on
interaction strengths, when accessible. The probability that two co-occurring
taxa engage in an interaction during a time period $t_0$ is given by:

$$P(L_{i \rightarrow j} | X_{i,j,l} = 1) = 1-e^{-\lambda_l t_0},$$
{#eq:modelrate}

which tends toward $1$ as $t_0 \to \infty$ if $\lambda > 0$. In other words, two
co-occurring taxa with a nonzero rate of interaction will inevitably interact in
a sufficiently long time period. It is important to note that the units of
$\lambda_l$ and $t_0$ are complementary. For instance, if the duration $t_0$ is
measured in months, $\lambda_l$ denote the expected number of interactions per
month.

The occurrence of an interaction between $i$ and $j$ can be modeled as a
Bernoulli trial with a probability of $P(L_{i \rightarrow j})$. Consequently, a
Bayesian inference model can be built based on the preceding equations to
estimate the value of the $\lambda_l$ and $\gamma$ parameters and generate novel
interaction data:

$$L_{i \rightarrow j} \sim \text{Bernoulli}(P(L_{i \rightarrow j}))$$
{#eq:model} 

$$P(L_{i \rightarrow j}) = P(X_{i,l}) P(X_{j,l}) \gamma (1-e^{-\lambda_l t_0})$$
{#eq:modeleq}

$$\gamma \sim \text{Gamma}(2,0.5)$$ {#eq:modelgamma} 

$$\lambda_l \sim \text{Exponential}(2)$$ {#eq:modellambda}

In @Fig:spatiotemporal, we show the variation in the probability of interaction
under different parameter values. In the right panel, we notice that,
irrespective of the interaction rate $\lambda_l$, the probability of interaction
converges toward an asymptote determined by the probability of co-occurrence
$P(X_{i,j,l})$ (@Eq:modelcoprob). This model can be customized in different
ways, such as by linking $\lambda_l$ with specific environmental variables or
explicitly incorporating observation errors (i.e., the probabilities of false
negatives and false positives).

![**Parameters of the spatiotemporally explicit model of interactions.** (a)
Probability of local interaction given by the process model (@Eq:modeleq) under
different values of $\lambda_l$ and $\gamma$, with $t_0 = 1$. The parameter
values used in the right panel are denoted by the white stars. (b) Scaling of
the probability of interaction with the duration parameter $t_0$ in @Eq:modeleq,
for different values of $\lambda_l$ and $\gamma$. In both panels, the marginal
probabilities of occurrence $P(X_{i,l})$ and $P(X_{j,l})$ are set to a constant
value of $0.5$.](figures/spatiotemporal_model.png){#fig:spatiotemporal}

## Taxonomic scaling of interactions 

Probabilistic interaction networks offer a versatile approach to tackle a broad
array of ecological questions, depending on their level of organization. For
instance, the assemblage of interactions across ecological scales can be
explored through species-based networks, while clade-based networks provide
insights into macroevolutionary processes [e.g., @Gomez2010EcoInt]. Given that
our interpretation of the properties and dynamics of ecological webs depends on
their taxonomic level [@Guimaraes2020Structurea], investigating the taxonomic
scaling of interactions (i.e., how interaction probabilities change with
taxonomic level) emerges as a promising research avenue. Examining the same
system at various taxonomic scales can yield meaningful and complementary
ecological information, and, in our perspective, employing webs of probabilistic
interactions is an effective approach for such analyses.

There are no inherent differences in the taxonomic scaling between local and
metawebs, as only the nodes are defined taxonomically. In other words, the
probability values of edges in both local (@Eq:local) and metawebs (@Eq:metaweb)
are not conditional on any taxonomic level. The taxonomic scale is tied to the
definition of the event itself (i.e., the interaction between two taxa, defined
at the desired taxonomical scale), not to the variables on which interaction
probabilities are conditional. In both types of webs, transitioning to a broader
level of organization (e.g., from a species-level web $S$ to a genus-level web
$G$) can be accomplished directly by using probabilities from finer scales. For
example, in a network with $n_1$ species from genus $g_1$ and $n_2$ species from
genus $g_2$, one can compute the probability that at least one species from
genus $g_1$ interacts with at least one species from genus $g_2$ (i.e., that
there is a non-zero number of species-level interactions or, equivalently, that
the genus-level interaction occurs) as follows:

$$P(G_{g_1 \rightarrow g_2} = 1) = 1 - \prod_{i = 1}^{n_1}\prod_{j = 1}^{n_2}(1
- P(S_{g_{1i} \rightarrow g_{2j}} = 1)),$$ {#eq:taxo}

where $g_{1,i}$ and $g_{2,j}$ are the species of the corresponding genus and
assuming independence between species-level interactions. If it is known that at
least two of these species interact (i.e., $P(S_{g_{1,i} \rightarrow g_{2,j}}) =
1$ for at least one pair of $(g_{1,i}, g_{2,j})$), it implies a probability of
genus interaction equal to $1$. @Canard2012Emergencea built a species-based
network following a similar approach, by using simulated interactions between
individuals derived from a neutral model (i.e., a model that assumed ecological
equivalence among individuals). In contrast, a more sophisticated approach is
necessary when transitioning from a broader to a finer level of organization.
This is because knowledge of an interaction between two genera does not
guarantee that all possible pairwise combinations of their species will also
interact. One possible method is to build a finer-scale network by generating
probabilities of interactions through random sampling from a beta distribution,
parameterized by the broader-scale network.

Ideally, our biological interpretation of probabilistic interactions should
remain consistent across a network even if it incorporates heterogeneous levels
of organization, such as a network whose nodes represent both species and
trophic species (groups of species sharing similar predators and prey). This is
common in ecological webs where taxonomic resolution is typically low
[@Hemprich-Bennett2021AssImp; @VazquezSS2022Ecological]. Interaction
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
generated networks [@Poisot2016Structure]. This method enables the
representation of the variability of network structure, albeit with possible
biases when connectance is low [@Poisot2014WheEco; @Chagnon2015ChaTop].
Employing this strategy to generate binary interaction networks under a null
model facilitates null hypothesis significance testing, wherein the observed
measure is compared against the simulated distribution [e.g.,
@Bascompte2003NesAss]. Additionally, the random generation of binary interaction
networks, from a probabilistic interaction web that accounts for the
spatiotemporal variability of interactions, may effectively capture network
structure across space and time. This facilitates the investigation of
ecological hypotheses about interactions at broad spatial and temporal scales.
Yet, inferring network structure through sampling for binary interactions
assumes independence among interactions, which might not accurately represent
reality. Covariation among interactions could exist even if we do not explicitly
condition interactions on others. For example, an interaction between two taxa
could be more probable when another interaction occurs. The consequences of this
assumption of independence on the prediction of network structure have yet to be
empirically examined. 

There are at least two distinct approaches to sample binary interaction networks
from probabilistic interaction webs across space, for example, when attempting
to predict a binary interaction network for each location $l$ within a given
region. Both approaches assume independence between interactions. The first
approach involves performing a singular Bernoulli trial for each pair of taxa
based on their regional probability of interaction: 

$$M_{i \rightarrow j} \sim {\rm Bernoulli}(P(M_{i \rightarrow j})).$$

In employing this approach, we predict a single metaweb of binary interactions
for each simulation. Every pair of taxa predicted to interact in this metaweb
will be treated as interacting in all local webs where they co-occur, i.e.
$L_{l, i \rightarrow j} = M_{i \rightarrow j}$ when $X_{i,j,l} = 1$. This will
result in local pairwise interactions without spatial variation. 

The second approach is to independently sample each local web of probabilistic
interactions: 

$$L_{l, i \rightarrow j} \sim {\rm Bernoulli}(P(L_{l, i \rightarrow j})).$$

This can be achieved by first generating distinct probabilistic interaction
networks for each location. These local webs of probabilistic interactions may
vary in taxa composition and interaction probabilities. Because binary
interaction networks are sampled independently for each location, this second
approach introduces spatial variation in binary interactions.

In @Fig:sampling, we compare the average connectance of binary interaction
networks resulting from these two sampling techniques, where regional and local
interactions are drawn from our host-parasite networks of probabilistic
interactions, generating a number of binary interaction web realizations for
each site in the dataset. These two sampling approaches yield different
outcomes, particularly for lower values of $P(L_{i \rightarrow j}|M_{i
\rightarrow j})$, which represent instances where regional interactions do not
consistently manifest locally. Small discrepancies between these techniques are
also apparent when we equate the probability of local interaction to the
probability of regional interaction (i.e., when using $P(L_{i \rightarrow
j}|M_{i \rightarrow j}) = 1.0$ in @Eq:local_meta), especially when the number of
simulations of binary interaction networks for each location is low. As
anticipated, we observe that sampling binary interactions from the metaweb tends
to overestimate connectance on average compared to sampling them from local
webs. Furthermore, we observe an increase in the variability of connectance when
employing a single simulation, representing what we consider as a more tangible
process leading to the realization of local interactions in nature. 

![**Connectance of sampled binary interaction webs.** Comparison between the
average connectance of binary interaction network samples obtained from the
local and metawebs of probabilistic interactions. Each dot corresponds to a
different site. The local probability of interaction between potentially
interacting species was set to three different values: (a) $P(L_{i \rightarrow
j}|M_{i \rightarrow j}) = 1.0$, (b) $P(L_{i \rightarrow j}|M_{i \rightarrow j})
= 0.75$, and (c) $P(L_{i \rightarrow j}|M_{i \rightarrow j}) = 0.50$. Grey dots
represent the outcome of a single simulation, while colored dots represent the
average connectance of each network across $100$ simulations. (d) Reduction in
the mean squared logarithmic error between the average connectance of binary
interaction networks obtained from these two sampling methods as the number of
simulations increases, for the same values of $P(L_{i \rightarrow j}|M_{i
\rightarrow j})$ used in panels a-c. Probabilities of regional interactions were
obtained with a false positive rate of $5\%$ and a false negative rate of
$10\%$. Metaweb samples were obtained by randomly sampling binary interactions
from the probabilistic interaction metaweb, and then propagating this result to
all local webs that include the species potentially engaged in the interactions.
Local binary interaction webs were generated by independently sampling binary
interactions for each local web of probabilistic
interactions.](figures/network_sampling.png){#fig:sampling}

The choice of a sampling approach can influence the selection of grid cell size
when delineating local communities within a broader region of interest. In the
first approach, pairwise interactions remain constant irrespective of cell size
because they are sampled only once from the metaweb. However, in the second
approach, local interaction probabilities are contingent on network area. For
instance, consider the local webs $L_1$ and $L_2$ with an area of
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
[@Dunne2006Network]. This implies that metawebs consistently contain more
interactions than their corresponding local webs, even though their connectance
is usually much smaller than the ones of local webs [@Gravel2011Trophic].
Determining the list of taxa to select can be achieved empirically or through
numerical methods like range maps or species distribution models. As species
composition is arguably less difficult to sample or predict than pairwise
interactions, the primary challenge lies in deciding which interactions to
select from the metaweb, a task that may necessitate advanced statistical models
and ecological expertise. Inferring the structure of local webs from the metaweb
before predicting specific local pairwise interactions could hold promise
[@Strydom2021Roadmapa], considering that the structure of local webs is
constrained by the metaweb [@Saravia2022Ecological].

Building local webs of probabilistic interactions from a metaweb of
probabilistic interactions involves a reduction in the value of pairwise
interaction probabilities. This decrease is attributed to the prerequisite that
two taxa must initially possess the capacity to interact before engaging in
local interactions (@Eq:local_meta). Therefore, inferring local webs from their
metaweb while maintaining identical interaction probability values would
introduce systematic biases into the predictions. In such cases, these networks
would essentially represent smaller-scale metawebs of potential interactions,
possibly leading to misinterpretations by being perceived as local interactions.
As proposed by @McLeod2021Sampling, although metawebs do not capture the
spatiotemporal variability of interactions, they establish an upper limit for
local interactions. In other words, the probability of two taxa interacting at a
specific location and time is consistently lower or equal to the probability of
their regional interaction: 

$$P(L_{i \rightarrow j} | X_{i,l}, X_{j,l}, N_{i,l}, N_{j,l}, T_{i,l}, T_{j,l},
E_l, A, t, f(L)) \le P(M_{i \rightarrow j} | T_i, T_j).$$ {#eq:switch}

Moreover, the probability that two taxa possess the biological capacity to
interact must exceed the probability of them interacting at any location and
time because they may never co-occur or encounter locally. Specifically, the
cumulative probability of local interactions across all spatial, temporal, and
environmental conditions must be less than the probability of regional
interaction, i.e.

$$\int_{E_l}\int_A\int_t P(L_{i \rightarrow j} | E_l, A, t) dt dA dE_l \leq
P(M_{i \rightarrow j} | T_i, T_j).$$ {#eq:all}

Estimating more precisely the probability $P(L_{i \rightarrow j}|M_{i
\rightarrow j})$ that two taxa interact locally if they can potentially interact
allows for improved predictions of local webs from the metaweb of probabilistic
interactions. This task is challenging due to the variability of this
probability across space and time, as well as its variability across pairwise
interactions within a network. Using simple models of $P(L_{i \rightarrow
j}|M_{i \rightarrow j})$, as demonstrated in our case studies, represents an
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
depend on taxa co-occurrence. These differences bring to light the need to use
probabilistic data with caution, for instance when generating network
realizations of binary interactions across space and predicting local webs from
metawebs. Clear metadata describing the type of interaction and the variables
used in their estimation are required to ensure adequate data manipulation.
Sound data practices and foundations for probabilistic thinking in network
ecology could facilitate reliable assessments of the spatiotemporal variability
and uncertainty of biotic interactions.

Estimating local interaction probabilities independently for each taxa pair and
assembling them into a network of probabilistic interactions comes with
limitations. Predicting local networks of binary interactions based on these
interaction probabilities assumes independence among interactions, a condition
seldom respected in practice [@Golubski2011ModMod]. Relaxing this assumption is
the next logical step in the stochastic representation of interactions. A more
accurate representation of the stochasticity of ecological networks involves
creating *probabilistic networks* ($P(L|...)$ and $P(M|...)$), rather than
networks of *probabilistic interactions* ($P(L_{i \rightarrow j}|...)$ and
$P(M_{i \rightarrow j}|...)$). Probabilistic networks describe the probability
that a particular network of binary (or quantitative) interactions (its whole
adjacency matrix) is realized. For example; @Young2021Reconstructiona used a
Bayesian approach to estimate the probability of different plant-pollinator
network structures derived from imperfect observational data. A probability
distribution of ecological networks may also be derived using the principle of
maximum entropy given some structural constrained [e.g., @Park2004Statisticala;
@Cimini2019Statistical]. Regardless of the method employed, generating
probabilistic local webs, bypassing the need to independently estimate local
interaction probabilities, could lead to more accurate predictions of local
webs. Furthermore, probabilistic networks could serve as an alternative to null
hypothesis significance testing when comparing the structure of a local web to
some random expectations or, as done in @Pellissier2018Comparing, to the
metaweb. These random expectations are typically derived by performing a series
of Bernoulli trials on probabilistic interactions, assuming independence, to
generate a distribution of networks of binary interactions and then calculate
their structure [@Poisot2016Structure]. One could for instance compare the
likelihood of an observed network to the one of the most likely network
structure according to the probabilistic network distribution, thereby directly
obtaining a measure of discrepancy of the empirical network. Generating
probabilistic ecological networks represents a tangible challenge, one that, in
the coming years, promises to unlock doors to more advanced and adequate
analyses of ecological networks.

It is essential to enhance our comprehension of both regional and local
interactions, especially considering the current scarcity of interaction data.
While sampling biological communities does decrease the uncertainty of
interactions by accumulating evidence for their feasibility and local
realization, there is a limit to how much we can reduce uncertainty. In
metawebs, probabilities reflect our limited knowledge of interactions (i.e., our
degree of belief that interactions are feasible), which is expected to improve
with a larger volume of data. Regional interactions should become more
definitive (with probabilities approaching $0$ or $1$) as we investigate various
conditions, including different combinations of species traits. In local webs,
which can be seen as random instances of metawebs, randomness cannot be reduced
to the same extent. Local interaction probabilities may represent both their
uncertainty and spatiotemporal variability. Owing to environmental
heterogeneity, there will invariably be instances in which an interaction occurs
and others in which it does not, across different times and locations,
irrespective of the extent to which we can improve our knowledge of its
biological feasibility and the local conditions that facilitate its occurrence.
When local webs describe probabilities of observing interactions rather than
their actual occurrence, we must also consider observation variability (sampling
error) as an additional source of stochasticity. Every ecological process is
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
