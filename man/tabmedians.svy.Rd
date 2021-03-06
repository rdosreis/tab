% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tabmedians_svy.R
\name{tabmedians.svy}
\alias{tabmedians.svy}
\title{Create Table Comparing Group Medians (for Complex Survey Data)}
\usage{
tabmedians.svy(formula, design, columns = c("xgroups", "p"),
  parenth = "iqr", sep.char = ", ", xlevels = NULL, yname = NULL,
  text.label = NULL, decimals = NULL, svyranktest.list = NULL,
  formatp.list = NULL, n.headings = FALSE, N.headings = FALSE,
  print.html = FALSE, html.filename = "table1.html")
}
\arguments{
\item{formula}{Formula, e.g. \code{BMI ~ Sex}.}

\item{design}{Survey design object from \code{\link[survey]{svydesign}}.}

\item{columns}{Character vector specifying what columns to include. Choices
for each element are \code{"n"} for total sample size, \code{"overall"} for
overall median, \code{"xgroups"} for \code{x} group medians, \code{"diff"}
for difference in \code{x} group medians (only available for binary
\code{x}), and \code{"p"} for p-value.}

\item{parenth}{Character string specifying what values are shown in
parentheses after the medians in each cell. Choices are \code{"none"},
\code{"iqr"}, \code{"q1q3"} for first and third quartiles, \code{"range"},
\code{"minmax"}, and \code{"ci"} for 95\% confidence interval for the median.}

\item{sep.char}{Character string with separator to place between lower and
upper bound of confidence intervals. Typically \code{"-"} or \code{", "}.}

\item{xlevels}{Character vector with labels for the levels of \code{x}, used
in column headings.}

\item{yname}{Character string with a label for the \code{y} variable.}

\item{text.label}{Character string with text to put after the \code{y}
variable name, identifying what cell values and parentheses represent.}

\item{decimals}{Numeric value specifying number of decimal places for numbers
other than p-values.}

\item{svyranktest.list}{List of arguments to pass to
\code{\link[survey]{svyranktest}}.}

\item{formatp.list}{List of arguments to pass to \code{\link[tab]{formatp}}.}

\item{n.headings}{Logical value for whether to display group sample sizes in
parentheses in column headings.}

\item{N.headings}{Logical value for whether to display weighted sample sizes
in parentheses in column headings.}

\item{print.html}{Logical value for whether to write a .html file with the
table to the current working directory.}

\item{html.filename}{Character string specifying the name of the .html file
that gets written if \code{print.html = TRUE}.}
}
\value{
Data frame which you can print in R (e.g. with \strong{xtable}'s
\code{\link[xtable]{xtable}} or \strong{knitr}'s \code{\link[knitr]{kable}})
or export to Word, Excel, or some other program. To export the table, set
\code{print.html = TRUE}. This will result in a .html file being written to
your current working directory, which you can open and copy/paste into your
document.
}
\description{
Creates a table comparing the median of \code{y} across levels of \code{x}.
}
\details{
Basically \code{\link{tabmedians}} for complex survey data. Relies heavily on
the \pkg{survey} package.
}
\examples{
# Create survey design object
library("survey")
design <- svydesign(
  data = tabsvydata,
  ids = ~sdmvpsu,
  strata = ~sdmvstra,
  weights = ~wtmec2yr,
  nest = TRUE
)

# Compare median BMI by sex
(medtable1 <- tabmedians.svy(BMI ~ Sex, design = design))


}
