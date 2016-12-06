#' Read in data from cbioportal
#'
#' Input must be data downloaded from http://www.cbioportal.org/ by selecting cancer studies
#' of interest and inputting one gene name. The download button for the required csv is under
#' the Mutations tab on the bottom left of the resulting table.
#'
#' @param gene_file .tsv
#'
#' @return data.frame
#' @export
#'
#' @examples
#' read_cbioportal("~/mutation_table_TP53.csv")

read_cbioportal <- function(gene_file) {
  gene_data <- readr::read_tsv(gene_file)
  data.table::setnames(gene_data,
                       old = c("Cancer Study", "Type", "Start Pos", "AA change", "Mutation Assessor"),
                       new = c("cancer_study", "mut_type", "n_pos", "AA_change", "mut_impact"))
  
  gene_subset <- gene_data %>%
    dplyr::filter(mut_type != "Fusion") %>%
    dplyr::select(cancer_study, mut_type, n_pos, AA_change, mut_impact)
  
  return(gene_subset)
}
