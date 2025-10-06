#task1
A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)


#task2
D <- diag(c(4, 1, 2, 3))

#task3
Diag <- diag(rep(3, 4))
M <- matrix(0, nrow = 5, ncol = 5)
diag(M) <- c(3, 3, 3, 3, 3)
M[, 1] <- c(3, 2, 2, 2, 2)
M[1, 2:5] <- 1

