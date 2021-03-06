\name{SimulateGeoHiSSE}
\alias{SimulateGeoHiSSE}
\title{Simulate under a GeoHiSSE model}
\description{Simulation function for the GeoHiSSE model}
\usage{
SimulateGeoHiSSE(pars, hidden.traits=1, x0="0A", max.taxa=Inf,
max.time=Inf, add.jumps=FALSE, add.extinction=FALSE, 
include.extinct=FALSE, return.GeoHiSSE_pars=FALSE, 
override.safeties=FALSE)} 
\arguments{
\item{pars}{an object of class "GeoHiSSE_pars" generated by
  \code{SimulateGeoHiSSE}. See 'Details'.}
\item{hidden.traits}{number of hidden areas in the model. Default is 1.}
\item{x0}{a character value for the starting state. Default is "01A".}
\item{max.taxa}{have the simulation stop at \code{max.taxa} surviving taxa.}
\item{max.time}{have the simulation stop at \code{max.time} height
  (including stem).}
\item{return.GeoHiSSE_pars}{whether to (only) return a "GeoHiSSE_pars" object
  in the correct format to use in this function. See 'Details'.}
\item{add.jumps}{whether to include jump dispersals in the model. Both
  for returning the parameters of the model and model
  estimation. Default is FALSE.}
\item{add.extinction}{whether to separate extirpation and extinction of
  endemic lineages. Both for returning the parameters of the model and model
  estimation. Default is FALSE.}
\item{include.extinct}{whether the simulation should keep extinct
  lineages. Default is FALSE.}
\item{override.safeties}{simulate even if there is no limit on number of
taxa or depth of tree.}
}
\details{
This function uses \code{diversitree::tree.classe} function to simulate
the tree under the GeoSSE model with hidden states. The parameter
\code{pars} is a list of class "GeoHiSSE_pars" that can be generated
using this same function. The best way is to first run
\code{SimulateGeoHiSSE} with empty parameters and
\code{return.GeoHiSSE_pars=TRUE} and with \code{hidden.areas} equal to
the number of desired hidden states in the model. This will return an
object in list format with a set of four matrices. Each matrix controls
a different set of parameters of the model. All parameters are set to 0
and parameters not used by the model are set to NA. To prepare the
simulation, edit these matrices and change the desired parameter
values. Leaving a parameter equal to 0 is the same as reducing the model
by eliminating this parameter of the model.
}
\value{
	This returns a list, with the following elements:
	\item{$phy}{a phylogeny of class phylo.}
	\item{$data}{a data matrix with the species names as the first
	  column and the ranges (in 0, 1, and 2 format) as the second column.}
	\item{$hidden.states}{a named vector with the 'true' simulated ranges
	  (include the hidden state information).}
	\item{$sim.attempts}{number of times that the simulation tried
	  before reaching desired termination condition.}
    \item{$pars}{the parameters used for the simulation.}
    \item{$classe.pars}{the parameters in 'make.classe' format for 
      the 'diversitree' package.}
      }      
\examples{
\dontrun{
## Get the a list with the correct parameters to run the simulation:
pars <- SimulateGeoHiSSE(hidden.areas=1, return.GeoHiSSE_pars=TRUE)
## Edit the parameter values:
pars$model.pars[1:3,] <- 0.1
pars$model.pars[4:5,] <- 0.05
pars$model.pars[6:7,] <- 0.01
pars$q.01[1,2] <- pars$q.01[2,1] <- 0.01
pars$q.1[1,2] <- pars$q.1[2,1] <- 0.02
pars$q.2[1,2] <- pars$q.2[2,1] <- 0.02
## Run the simulation:
sim <- SimulateGeoHiSSE(pars=pars, hidden.areas=1, x0="01A", max.taxa=100)
}
}
\author{Daniel Caetano}
\concept{simulation}
\concept{GeoSSE}
\concept{GeoHiSSE}
