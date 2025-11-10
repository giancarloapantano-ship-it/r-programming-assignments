set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)




corrected_tukey <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in seq_len(ncol(x))) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }
  outlier.vec <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  outlier.vec
}

tukey.outlier <- function(x) {
  
  q1 <- quantile(x, 0.25)
  q3 <- quantile(x, 0.75)
  
  
  iqr <- q3 - q1
  
  
  lower_fence <- q1 - 1.5 * iqr
  upper_fence <- q3 + 1.5 * iqr
  
  
  return(x < lower_fence | x > upper_fence)
}

corrected_tukey(test_mat)
