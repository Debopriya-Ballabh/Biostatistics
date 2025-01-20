#Probability distributions using binomial distributions
#We have caught 10 frogs and count how many of them are light colored

n = 10        #no. of frogs we catch
p = 0.3       #true fraction of light green frogs
dbinom(x = 5, size = n, prob = p)     #allows to look at the density of the distribution

# we can ask the probability of catching at most 5 light green frogs
pbinom (q = 5, size = n, prob = p) #at most    
pbinom (q =5, size =n, prob = p, lower.tail = FALSE) #larger than

#Exercise : 1 There is a disease with a known prevalence of 4%. From selected 100 persons what is the probability of seeing exact 7 persons with the disease
no = 100 #no. of patients
pr = 0.04 # prevalence of the disease
dbinom(x = 7, size = no, prob = pr)

#At least 7 persons with the disease
pbinom(q = 93, size = no, prob = pr)

#Simulations in R
#We will simulate frog counts from 100 binomial experiments
set.seed(85)         #Set a seed for reproducibility
size = 10            #number of frogs per net
prob = 0.3           #true percentage of light colored frogs
n = 100              #number of binomial experiments
binomial_frog_counts <- rbinom(n=n, size=size, prob=prob)
head(binomial_frog_counts)

#Exercise : 2 Try the same with random poisson numbers. simulate 100 random frog counts with a poisson rate of 4
set.seed(81)
siz = 100
lambda = 4
poisson_frog_counts <- rpois(n = siz, lambda = lambda)
head(poisson_frog_counts)

#Run the same simulations again and calculate the mean frog count
set.seed(81)
siz = 100
lambda = 4
poisson_frog_counts <- rpois(n = siz, lambda = lambda)
head(poisson_frog_counts)
mean1 <- mean(poisson_frog_counts)
mean1

#Exercise : 3 on Gamma Poisson Distribution
#Poisson mean and variance
set.seed(81)
size = 100
lambda = 4
poisson_frog <-rpois(n = size, lambda = lambda)
mean1 <- mean(poisson_frog)
mean1
variance <- var(poisson_frog)
variance

#Exercise : 4 Calculate gamma poisson mean and variance
set.seed(81)
n = 100
m = 4
size = 2
gpois <- rnbinom(100,mu = 4, size = 2)
mean2 <- mean(gpois)
mean2
varian <- var(gpois)
varian