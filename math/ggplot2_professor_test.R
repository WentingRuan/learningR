ggplot(Salaries) + 
  aes(
    x=yrs.since.phd, y=salary, color=sex, shape=rank) + 
  geom_point()


Salaries$sex_ = Salaries[["sex"]]
levels(Salaries$sex_) <- c("Female", "Male")
Salaries$sex_ <- as.vector(Salaries$sex_)


s=Salaries

ggplot(s) + 
  aes(
    x = yrs.since.phd,
    y = salary,
    color = rank
  ) + 
  geom_point(data=s[s[["sex"]]=="Male",], size=1,shape = 17,show.legend = TRUE) +
  geom_point(data=s[s[["sex"]]=="Female",], size=2,shape =16,show.legend = TRUE)

ggplot(s) +
  aes( x = yrs.since.phd,
       y = salary,
       shape = sex,
       size = sex,
       color = rank) +
  geom_point(data=s[s[["sex"]]=="Male",], size=1,show.legend = TRUE) +
  geom_point(data=s[s[["sex"]]=="Female",], size=2,show.legend = TRUE)


ggplot(s) +
  aes( x = yrs.since.phd,
       y = salary,
       shape = sex,
       size = sex,
       color = rank) +
   # scale_shape_manual(values = c(17, 18)) +
  scale_size_manual(values=c(2, 1)) +
  geom_point(show.legend = TRUE)

ggplot(s) +
  aes( x = yrs.since.phd,
       y = salary,
       shape = sex,
       size = rank,
       color = sex) +
  # scale_shape_manual(values = c('o', '.')) +
  scale_size_manual(values=c(1,2,3)) +
  geom_point(show.legend = TRUE)

