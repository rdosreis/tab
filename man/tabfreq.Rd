% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tabfreq.R
\name{tabfreq}
\alias{tabfreq}
\title{Create Frequency Table}
\usage{
tabfreq(formula = NULL, data = NULL, x = NULL, y = NULL,
  columns = c("xgroups", "p"), cell = "counts",
  parenth = "col.percent", sep.char = ", ", test = "chi.fisher",
  xlevels = NULL, yname = NULL, ylevels = NULL,
  compress.binary = FALSE, yname.row = TRUE, indent.spaces = 3,
  text.label = NULL, quantiles = NULL, quantile.vals = FALSE,
  latex = TRUE, decimals = 1, formatp.list = NULL,
  n.headings = FALSE, print.html = FALSE,
  html.filename = "table1.html")
}
\arguments{
\item{formula}{Formula, e.g. \code{Sex ~ Group}.}

\item{data}{Data frame containing variables named in \code{formula}.}

\item{x}{Vector indicating group membership for columns of I-by-J table.}

\item{y}{Vector indicating group membership for rows of I-by-J table.}

\item{columns}{Character vector specifying what columns to include. Choices
for each element are \code{"n"} for total sample size, \code{"overall"} for
overall distribution of \code{y}, \code{"xgroups"} for distributions of
\code{y} for each \code{x} group, \code{"test"} for test statistic, and
\code{"p"} for p-value.}

\item{cell}{Character string specifying what statistic to display in cells.
Choices are \code{"counts"}, \code{"tot.percent"}, \code{"col.percent"},
and \code{"row.percent"}.}

\item{parenth}{Character string specifying what statistic to display in
parentheses. Choices are \code{"none"}, \code{"se"}, \code{"ci"},
\code{"counts"}, \code{"tot.percent"}, \code{"col.percent"}, and
\code{"row.percent"}.}

\item{sep.char}{Character string with separator to place between lower and
upper bound of confidence intervals. Typically \code{"-"} or \code{", "}.}

\item{test}{Character string specifying which test for association between
\code{x} and \code{y} should be used. Choices are \code{"chi.fisher"} for
Pearson's chi-squared test if its assumptions are met, otherwise Fisher's
exact test; \code{"chi"}; \code{"fisher"}; \code{"z"} for z test without
continuity correction; and \code{"z.continuity"} for z test with continuity
correction. The last two only work if both \code{x} and \code{y} are binary.}

\item{xlevels}{Character vector with labels for the levels of \code{x}, used
in column headings.}

\item{yname}{Character string with a label for the \code{y} variable.}

\item{ylevels}{Character vector with labels for the levels of \code{y}. Note
that levels of \code{y} are listed in the order that they appear when you run
\code{table(y, x)}.}

\item{compress.binary}{Logical value for whether to compress binary \code{y}
variable to a single row, excluding the first level rather than showing both.}

\item{yname.row}{Logical value for whether to include a row displaying the
name of the \code{y} variable and indent the factor levels.}

\item{indent.spaces}{Integer value specifying how many spaces to indent
factor levels. Only used if \code{yname.row = TRUE}.}

\item{text.label}{Character string with text to put after the \code{y}
variable name, identifying what cell values and parentheses represent.}

\item{quantiles}{Numeric value. If specified, table compares \code{y} across
quantiles of \code{x} created on the fly.}

\item{quantile.vals}{Logical value for whether labels for \code{x} quantiles
should show quantile number and corresponding range, e.g. Q1 [0.00, 0.25),
rather than just the quantile number.}

\item{latex}{Logical value for whether to format table so it is
ready for printing in LaTeX via \code{\link[xtable]{xtable}} or
\code{\link[knitr]{kable}}.}

\item{decimals}{Numeric value specifying number of decimal places for numbers
other than p-values.}

\item{formatp.list}{List of arguments to pass to \code{\link[tab]{formatp}}.}

\item{n.headings}{Logical value for whether to display group sample sizes in
parentheses in column headings.}

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
Creates an I-by-J frequency table comparing the distribution of \code{y}
across levels of \code{x}.
}
\examples{
# Compare sex distribution by group
(freqtable1 <- tabfreq(Sex ~ Group, data = tabdata))

# Same as previous, but specifying input vectors rather than formula
(freqtable2 <- tabfreq(x = tabdata$Group, y = tabdata$Sex))

# Same as previous, but showing male row only and percent (SE) rather than n
# (percent)
(freqtable3 <- tabfreq(Sex ~ Group, data = tabdata,
                       cell = "col.percent", parenth = "se",
                       compress.binary = TRUE))

# Create single table comparing sex and race in control vs. treatment group.
# Drop missing observations first.
tabdata2 <- subset(tabdata, ! is.na(Sex) & ! is.na(Race))
(freqtable4 <- rbind(tabfreq(Sex ~ Group, data = tabdata2),
                     tabfreq(Race ~ Group, data = tabdata2)))

# Same as previous, but using tabmulti for convenience
#(freqtable5 <- tabmulti(data = d, xvarname = "Group",
#                        yvarnames = c("Sex", "Race")))


}
