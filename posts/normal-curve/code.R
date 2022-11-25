set.seed(1234)

n <- 1000L
w <- rnorm(n = n, mean = 2, sd = 4)
y <- 0.5 * w + rnorm(n = n, mean = 5, sd = 3)

df <- data.frame(w, y)

m1 <- lm(formula = y ~ w, data = df)
summary(m1)

hist(m1$residuals, breaks = 20L, freq = FALSE, main = "")

# Note that the sequence here must be called "x", otherwise dnorm() won't work 
x <- seq(from = round(min(m1$residuals), 1), 
         to   = round(max(m1$residuals), 1), 
         by   = 0.1)

curve(dnorm(x, mean = 0, sd = sd(m1$residuals)), add = TRUE)

png(filename = "./posts/normal-curve/hist-with-curve.png")
help(png)
