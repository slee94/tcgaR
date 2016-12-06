#' Plot mutations distributions
#'
#' @param gene_df data.frame
#'
#' @return ggplot
#' @export
#'
#' @examples
#' 

plot_mut_dist <- function(gene_df) {
  gene_mut_p <- ggplot2::ggplot(gene_df, ggplot2::aes(n_pos, forcats::fct_rev(forcats::fct_infreq(cancer_study))))  +
    ggplot2::geom_point(ggplot2::aes(colour = mut_type, shape = mut_type),
                        size = 2.5, alpha = 0.7) +
    ggplot2::labs(x = NULL, y = "Cancer Type", colour = NULL, shape = NULL) +
    ggplot2::theme(legend.position = "bottom",
                   legend.text = ggplot2::element_text(size = "10"),
                   axis.text.x = ggplot2::element_text(size = "7"),
                   axis.title.y = ggplot2::element_text(size = "10"),
                   axis.ticks.y = ggplot2::element_blank(),
                   axis.text.y = ggplot2::element_blank())
  return(gene_mut_p)
}
