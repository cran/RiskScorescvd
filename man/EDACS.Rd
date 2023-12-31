% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/03_EDACS_func.R
\name{EDACS}
\alias{EDACS}
\title{Emergency Department Assessment of Chest Pain Score (EDACS)}
\usage{
EDACS(
  Age = Age,
  Gender = Gender,
  diabetes = diabetes,
  smoker = smoker,
  hypertension = hypertension,
  hyperlipidaemia = hyperlipidaemia,
  family.history = family.history,
  sweating = sweating,
  pain.radiation = pain.radiation,
  pleuritic = pleuritic,
  palpation = palpation,
  ecg.st.depression = ecg.st.depression,
  ecg.twi = ecg.twi,
  presentation_hstni = presentation_hstni,
  second_hstni = second_hstni,
  classify = FALSE
)
}
\arguments{
\item{Age}{a numeric vector of age values, in years}

\item{Gender}{a binary character vector of sex values. Categories should include only 'male' or 'female'.}

\item{diabetes}{a binary numeric vector, 1 = yes and 0 = no}

\item{smoker}{a binary numeric vector, 1 = yes and 0 = no}

\item{hypertension}{a binary numeric vector, 1 = yes and 0 = no}

\item{hyperlipidaemia}{a binary numeric vector, 1 = yes and 0 = no}

\item{family.history}{a binary numeric vector, 1 = yes and 0 = no}

\item{sweating}{a binary numeric vector, 1 = yes and 0 = no}

\item{pain.radiation}{a binary numeric vector, 1 = yes and 0 = no}

\item{pleuritic}{a binary numeric vector, 1 = yes and 0 = no}

\item{palpation}{a binary numeric vector, 1 = yes and 0 = no}

\item{ecg.st.depression}{a binary numeric vector, 1 = yes and 0 = no}

\item{ecg.twi}{a binary numeric vector, 1 = yes and 0 = no}

\item{presentation_hstni}{a continuous numeric vector of the troponin levels}

\item{second_hstni}{a binary numeric vector, 1 = yes and 0 = no}

\item{classify}{a logical parameter to indicate classification of scores "TRUE" or none "FALSE"}
}
\value{
A vector with EDACS score calculations
and/or a vector of their classifications if indicated
}
\description{
This function implements the EDACS score calculation as a vector

Age -
18-45 = 2\cr
46-50 = 4\cr
51-55 = 6\cr
56-60 = 8\cr
61-65 = 10\cr
66-70 = 12\cr
71-75 = 14\cr
76-80 = 16\cr
81-85 = 18\cr
>=86 = 20\cr

Sex -\cr
Female = 0\cr
Male = 6\cr

Known coronary artery disease or >=3 risk factors*\cr
The risk factors only apply to patients 18-50-\cr
no = 0\cr
yes = 4\cr

Symptoms and signs\cr
Diaphoresis                                         no = 0   yes = 3\cr
Pain radiates to arm, shoulder, neck, or jaw        no = 0   yes = 5\cr
Pain occurred or worsened with inspiration          no = 0   yes = -4\cr
Pain is reproduced by palpation                     no = 0   yes = -6\cr


Two possible outcomes\cr

Low risk cohort:\cr
EDACS <16 and\cr
EKG shows no new ischemia and\cr
0-hr and 2-hr troponin both negative.\cr
Not low risk cohort:\cr
EDACS >=16 or\cr
EKG shows new ischemia or\cr
0-hr or 2-hr troponin positive.
}
\examples{

# Create a data frame or list with the necessary variables
# Set the number of rows
num_rows <- 100

# Create a larger dataset with 100 rows
cohort_xx <- data.frame(
  typical_symptoms.num = as.numeric(sample(0:6, num_rows, replace = TRUE)),
  ecg.normal = as.numeric(sample(c(0, 1), num_rows, replace = TRUE)),
  abn.repolarisation = as.numeric(sample(c(0, 1), num_rows, replace = TRUE)),
  ecg.st.depression = as.numeric(sample(c(0, 1), num_rows, replace = TRUE)),
  Age = as.numeric(sample(30:80, num_rows, replace = TRUE)),
  diabetes = sample(c(1, 0), num_rows, replace = TRUE),
  smoker = sample(c(1, 0), num_rows, replace = TRUE),
  hypertension = sample(c(1, 0), num_rows, replace = TRUE),
  hyperlipidaemia = sample(c(1, 0), num_rows, replace = TRUE),
  family.history = sample(c(1, 0), num_rows, replace = TRUE),
  atherosclerotic.disease = sample(c(1, 0), num_rows, replace = TRUE),
  presentation_hstni = as.numeric(sample(10:100, num_rows, replace = TRUE)),
  Gender = sample(c("male", "female"), num_rows, replace = TRUE),
  sweating = as.numeric(sample(c(0, 1), num_rows, replace = TRUE)),
  pain.radiation = as.numeric(sample(c(0, 1), num_rows, replace = TRUE)),
  pleuritic = as.numeric(sample(c(0, 1), num_rows, replace = TRUE)),
  palpation = as.numeric(sample(c(0, 1), num_rows, replace = TRUE)),
  ecg.twi = as.numeric(sample(c(0, 1), num_rows, replace = TRUE)),
  second_hstni = as.numeric(sample(1:200, num_rows, replace = TRUE))
)

# Call the function with the cohort_xx

results <- cohort_xx \%>\% rowwise() \%>\% mutate(EDACS_score = EDACS(Age,
Gender, diabetes, smoker, hypertension, hyperlipidaemia, family.history,
sweating, pain.radiation, pleuritic, palpation, ecg.st.depression, ecg.twi,
presentation_hstni, second_hstni, classify = FALSE))


}
\keyword{Age}
\keyword{EDACS}
\keyword{Gender}
\keyword{classify}
\keyword{diabetes}
\keyword{ecg.st.depression}
\keyword{ecg.twi}
\keyword{family.history}
\keyword{hyperlipidaemia}
\keyword{hypertension}
\keyword{pain.radiation}
\keyword{palpation}
\keyword{pleuritic}
\keyword{presentation_hstni}
\keyword{second_hstni}
\keyword{smoker}
\keyword{sweating}
