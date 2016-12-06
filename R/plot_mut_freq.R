#' Plot mutation frequencies
#'
#' @param gene_df data.frame
#'
#' @return ggplot
#' @export
#'
#' @examples
#' plot_mut_freq(read_cbioportal("~/mutation_table_TP53.csv"))

plot_mut_freq <- function(gene_df) {
  can_studies_low <- gene_df %>%
    dplyr::group_by(cancer_study) %>%
    dplyr::summarize(n = n()) %>%
    dplyr::filter(n > 1)
  
  gene_df <- gene_df %>%
    dplyr::filter(cancer_study %in% can_studies_low$cancer_study)
  
  ggplot2::ggplot(gene_df, ggplot2::aes(forcats::fct_infreq(cancer_study), fill = mut_type)) +
    ggplot2::geom_bar() +
    ggplot2::labs(y = "Count", fill = "Mutation Type") +
    ggplot2::theme(axis.text.x =  ggplot2::element_text(size = 7, angle = 70,
                                                        hjust = 1, vjust = 1, colour = "black"),
                   axis.title.y =  ggplot2::element_text(size = 10),
                   axis.title.x =  ggplot2::element_blank(),
                   legend.position = "bottom",
                   legend.title =  ggplot2::element_text(size = 10),
                   legend.text =  ggplot2::element_text(size = 8),
                   plot.title =  ggplot2::element_text(size = 12, hjust = 0.5))
}
