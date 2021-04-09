\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[Curriculum Vitae]

\LoadClass{letter}

\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}

\RequirePackage{geometry}
\RequirePackage{fontspec}
\RequirePackage{xcolor}
\RequirePackage{tikz}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{parskip}
\RequirePackage[hidelinks]{hyperref}

\geometry{%
    layoutwidth=.92\paperwidth,
    layouthoffset=.08\paperwidth,
    left=5.5cm,
    right=2cm,
    top=1cm,
    bottom=1cm,
    footskip=.2cm,
    headsep=.1cm
}
\newcommand{\fulltextwidth}{\dimexpr\hsize+\Gm@lmargin\relax}
\newcommand{\lm@rginskip}{1.5em}
\newcommand{\lm@rgintext}{\dimexpr\Gm@lmargin-\lm@rginskip\relax}

\newcommand{\fullrule}{\rule{\textwidth}{.4pt}}
\newcommand{\smallrule}{\rule{.3817\textwidth}{.4pt}}
\newcommand{\seprule}{%
    \begin{center}%
        \rule{.2\textwidth}{.4pt}%
    \end{center}%
}

\newlength{\p@rskip}
\setlength{\p@rskip}{1ex}
\setlength{\parskip}{\p@rskip}
\newcommand{\@minipagerestore}{\setlength{\parskip}{\p@rskip}}

\setlength{\parindent}{0pt}
\setlength{\fboxsep}{0pt}

\newcommand{\titlefont}{\fontsize{20pt}{22pt}\selectfont}
\newcommand{\headerfont}{\fontsize{18pt}{19pt}\selectfont}

\newcommand{\fullname}[1]{\def\@fullname{#1}}
\newcommand{\doctitle}[1]{\def\@doctitle{#1}}
\newcommand{\shortdescription}[1]{\def\@shortdesc{#1}}
\newcommand{\email}[1]{\def\@email{#1}}
\newcommand{\phone}[1]{\def\@phone{#1}}
\newcommand{\github}[1]{\def\@github{#1}}
\newcommand{\linkedin}[1]{\def\@linkedin{#1}}

\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{.4pt}
\fancyfoot[C]{}
\fancyfoot[R]{page \thepage\ of \pageref{LastPage}}

\newcommand{\mainheader}{%
    \hskip-\Gm@lmargin\relax
    \begin{minipage}[][][b]{\fulltextwidth}
        \vspace{0pt}
        \begin{minipage}{.5\textwidth}
            \vspace{0pt}
            \titlefont
            \@fullname \\
            \@doctitle
            \ifdefined\@shortdesc
                \vskip.1\baselineskip\relax
                \fontsize{14pt}{14pt}\selectfont\textit{\@shortdesc}
            \fi
        \end{minipage}
        \hfill
        \begin{minipage}{.5\textwidth}
            \vspace{0pt}
            \hfill
            \begin{tabular}{rl}
                mail:     & \href{mailto:\@email}{\@email} \\
                tel:      & \href{tel:\@phone}{\@phone} \\
                github:   & \href{https://github.com/\@github}{\@github} \\
                linkedin: & \href{https://linkedin.com/in/\@linkedin}{\@linkedin}
            \end{tabular}
        \end{minipage}
    \end{minipage}
    \vskip0pt\relax
}

\newcounter{category}

\newcommand{\category}[1]{%
    \stepcounter{category}
    \vskip.5\baselineskip\relax
    \hskip -\Gm@lmargin \relax
    \begin{minipage}{\lm@rgintext}
        \begin{flushright}
            \headerfont #1
        \end{flushright}
    \end{minipage}%
    \hskip\lm@rginskip\relax%
    \hrulefill%
    \vskip0pt\relax%
    \normalsize
}

\newcommand{\entryheaderfont}{\bf\fontsize{10pt}{12pt}\selectfont}
\newcommand{\entrysubheaderfont}{\it\fontsize{10pt}{12pt}\selectfont}

\newenvironment{entrywithdates}[3]
    {% Start env
        \vskip.6\baselineskip\relax
        \hskip -\Gm@lmargin \relax
        \begin{minipage}[t][][t]{\lm@rgintext}
            \raggedleft
            {\entryheaderfont #3} \\
            \vskip 0pt
            {\entrysubheaderfont #1 $\rightarrow$ #2}
        \end{minipage}
        \hskip\lm@rginskip\relax
        \begin{minipage}[t][][t]{\textwidth}
    }
    {% End env
        \end{minipage}
    }

\newenvironment{entry}[1]
    {% Start env
        \vskip.0\baselineskip\relax
        \hskip-\Gm@lmargin\relax
        \begin{minipage}[t][][t]{\lm@rgintext}
            \raggedleft
            {\entryheaderfont #1}
        \end{minipage}
        \hskip\lm@rginskip\relax
        \begin{minipage}[t][][t]{\textwidth}
    }
    {% End env
        \end{minipage}
    }

\newcommand{\headingfont}{\bf\fontsize{12pt}{12pt}\selectfont}
\newcommand{\subheadingfont}{\bf\fontsize{10pt}{12pt}\selectfont}

\newcommand{\heading}[1]{%
    \vskip\baselineskip\relax
    {\headingfont #1}
    \vskip\smallskipamount\relax
}

\newcommand{\sideheading}[1]{%
    \vskip\smallskipamount\relax
    \hspace*{-\Gm@lmargin}%
    \begin{minipage}[t][][t]{\lm@rgintext}
        \raggedleft
        {\subheadingfont #1}
    \end{minipage}%
    \hspace*{\lm@rginskip}\ignorespaces
}

\renewenvironment{description}
    {% Start env
        \let\olditem\item
        \newif\iffirstitem
        \firstitemtrue
        \setlength{\itemsep}{-5pt}
        \renewcommand{\item}[1][]{%
            \iffirstitem
                \firstitemfalse
            \else
                \vskip\smallskipamount\relax
            \fi
            \hspace*{-\Gm@lmargin}%
            \begin{minipage}[t][][t]{\lm@rgintext}%
                \raggedleft\it##1
            \end{minipage}%
            \hspace*{\lm@rginskip}\ignorespaces
        }%
        \vskip\smallskipamount\relax
    }
    {% Env env
        \let\item\olditem
    }

\endinput
