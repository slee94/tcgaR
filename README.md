
tcgaR
=====

------------------------------------------------------------------------

This is a very simple package for gaining basic insight on cancer associated genes through TCGA data. Data must be downloaded from [cbioportal](http://www.cbioportal.org/). Before going into the packages usages, here are the instructions for getting data from cbioportal.

**1. Query cbioportal for a gene of interest (required action indicated by red circles). If you want to try other genes but don't know any, BRCA1, KRAS, and KMT2D are some other known cancer associated genes. **

![](C:/Users/owner/Desktop//tcgaR/images/cbioportal_query.png)

**2. Download mutation tsv from cbioportal**

![](C:/Users/owner/Desktop//tcgaR/images/cbioportal_download.png)

If you're not familiar with genetics
====================================

------------------------------------------------------------------------

**Cancer is a disease hallmarked by many mutations that vary greatly across cancer types. It can be informative to visualize the mutations in a gene that you are interested in studying across other cancer types to see their contribution towards cancer as a whole and to generate hypotheses on their mechanism.**

Installation
============

------------------------------------------------------------------------

Package Usage
=============

------------------------------------------------------------------------

read\_cbioportal() takes in cbioportal data (specifically, the mutation table) and produces a nice data frame that contains the information we are interested in.

``` r
library(tcgaR)
library(tidyverse)
CIC_data <- read_cbioportal("mutation_table_CIC.tsv")
knitr::kable(head(CIC_data, 10))
```

| cancer\_study              | mut\_type |    n\_pos| AA\_change   | mut\_impact |
|:---------------------------|:----------|---------:|:-------------|:------------|
| Glioma (TCGA)              | Missense  |  42799060| R1515H       | Low         |
| Glioma (TCGA)              | Missense  |  42791715| R201W        | Medium      |
| LGG-GBM (TCGA 2016)        | Missense  |  42791715| R201W        | Medium      |
| LGG-GBM (TCGA 2016)        | Missense  |  42791715| R201W        | Medium      |
| LGG-GBM (TCGA 2016)        | Missense  |  42791715| R201W        | Medium      |
| LGG-GBM (TCGA 2016)        | Missense  |  42791715| R201W        | Medium      |
| LGG-GBM (TCGA 2016)        | Splice    |  42791393| X151\_splice | NA          |
| Glioma (TCGA)              | Missense  |  42791758| R215Q        | Medium      |
| LGG-GBM (TCGA 2016)        | Missense  |  42791806| S231I        | High        |
| CCLE (Novartis/Broad 2012) | Splice    |  42791603| X194\_splice | NA          |

plot\_mut\_freq() plots the frequency of mutations found in each cancer type. This allows us to assess the importance of our gene of interest in the pathologies of different cancer types.

``` r
plot_mut_freq(CIC_data)
```

![](README_files/figure-markdown_github/unnamed-chunk-3-1.png)

Here we see that CIC is prevalently mutated in gliomas and stomach cancers (CCLE is cell line data), suggesting that these cancers are driven by mutations in CIC.

plot\_mut\_dist() plots the distribution of mutations that occur along the length of the gene. This may inform us on the nature of the contribution of our gene towards specific cancers. For example, if we see a very spread out distribution vs a localized distribution, it may indicate that the cancer progresses upon **losing** the function of our gene.

``` r
plot_mut_dist(CIC_data)
```

![](README_files/figure-markdown_github/unnamed-chunk-4-1.png)

Here we see two mutations found further upstream than the rest of the mutations, perhaps it would be better to drop these two to get a better view of the rest. Otherwise, the mutations seem to be fairly spread out suggesting that the CIC gene normally suppresses tumour progression.

Progress Report
===============

------------------------------------------------------------------------

Unfortunately, I was not able to incorporate a gene model above the mutation distribution plot due to an error beyond my understanding with the namespace unable to import some object from the Homo.sapiens package. Other than that issue, I completed the assignment with little difficulty. Learning how to make an R package was interesting, though I doubt I would ever have to implement this during the course of my research.
