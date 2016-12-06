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
#' 

read_cbioportal <- function(gene_file) {
  gene_data <- readr::read_tsv(gene_file)
  
  gene_subset <- gene_data %>%
    dplyr::filter(Type != "Fusion") %>%
    dplyr::select(`Cancer Study`, Type, `Start Pos`)
  
  colnames(gene_subset) <- c("cancer_study", "mut_type", "n_pos")
  
  return(gene_subset)
}
