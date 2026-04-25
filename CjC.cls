\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CjC}[2019/01/01 v0.1 CjC LaTeX Chinese template class]
\LoadClass[a4paper, 10.5pt,twoside,journal]{article}
\RequirePackage{ifthen}
\usepackage{flushend}
\usepackage{graphicx}
\usepackage{times}
\RequirePackage{picins}
\RequirePackage{ccaption}
\RequirePackage{calc}
%%--------PAGE FORMAT---------%%
\setlength{\topmargin}{0pt}
\setlength{\headsep}{13pt}
\setlength{\headheight}{6mm}
\setlength{\oddsidemargin}{13pt}
\setlength{\evensidemargin}{13pt}
\setlength{\voffset}{-0.40in}
\setlength{\hoffset}{0mm}
\setlength{\footskip}{3.5em}
\setlength{\columnsep}{8mm} %
\textwidth \paperwidth%
\textheight \paperheight%
\addtolength\textwidth{-63.4mm}
\addtolength\textheight{-50.8mm}

\setlength{\parskip}{0mm}

\setlength{\abovedisplayskip}{2pt plus 1pt minus 1pt}
\setlength{\belowdisplayskip}{3pt plus 2pt minus 2pt}
\setlength{\doublerulesep}{0.5pt}
\renewcommand{\baselinestretch}{1.14}
\renewcommand{\arraystretch}{1.06}

\newlength\CjC@linespace
\newcommand{\CjC@choosefont}[3]{%
   \setlength{\CjC@linespace}{#1*\real{\baselinestretch}}%
   \fontsize{#1}{\CjC@linespace plus#2 minus #3}\selectfont}

% 1 in = 72 bp = 72.27 pt

\newcommand\zihao[1]{%
   \ifthenelse{\equal{#1}{0}}{%
       \CjC@choosefont{42bp}{.5pt}{.3pt}}{}%
   \ifthenelse{\equal{#1}{0-}}{%
       \CjC@choosefont{36bp}{.5pt}{.3pt}}{}%
   \ifthenelse{\equal{#1}{1}}{%
       \CjC@choosefont{26bp}{.5pt}{.3pt}}{}%
   \ifthenelse{\equal{#1}{1-}}{%
       \CjC@choosefont{24bp}{.5pt}{.3pt}}{}%
   \ifthenelse{\equal{#1}{2}}{%
       \CjC@choosefont{22bp}{.5pt}{.3pt}}{}%
   \ifthenelse{\equal{#1}{2-}}{%
       \CjC@choosefont{18bp}{.3pt}{.2pt}}{}%
   \ifthenelse{\equal{#1}{3}}{%
       \CjC@choosefont{16bp}{.3pt}{.2pt}}{}%
   \ifthenelse{\equal{#1}{3-}}{%
       \CjC@choosefont{15bp}{.3pt}{.2pt}}{}%
   \ifthenelse{\equal{#1}{4}}{%
       \CjC@choosefont{14bp}{.3pt}{.2pt}}{}%
   \ifthenelse{\equal{#1}{4-}}{%
       \CjC@choosefont{12bp}{.3pt}{.2pt}}{}%
   \ifthenelse{\equal{#1}{5}}{%
       \CjC@choosefont{10.5bp}{.3pt}{.2pt}}{}%
   \ifthenelse{\equal{#1}{5--}}{%
       \CjC@choosefont{10bp}{.3pt}{.2pt}}{}%
   \ifthenelse{\equal{#1}{5-}}{%
       \CjC@choosefont{9bp}{.2pt}{.1pt}}{}%
   \ifthenelse{\equal{#1}{6}}{%
       \CjC@choosefont{7.5bp}{.2pt}{.1pt}}{}%
   \ifthenelse{\equal{#1}{6-}}{%
       \CjC@choosefont{6.5bp}{.2pt}{.1pt}}{}%
   \ifthenelse{\equal{#1}{7}}{%
       \CjC@choosefont{5.5bp}{.1pt}{.1pt}}{}%
   \ifthenelse{\equal{#1}{8}}{%
       \CjC@choosefont{5bp}{.1pt}{.1pt}}{}}
%
%%----- Redefine \tiny \scriptsize \footnotesize\small ----------%%
%%-------------------------\normalsize --------------------------%%
%%---------------\large \Large \LARGE \huge \Huge ---------------%%
%% Refer to ctex
\def\tiny{\zihao{7-}}
\def\scriptsize{\zihao{7}}
\def\footnotesize{\zihao{6-}}
\def\small{\zihao{6}}
\def\normalsize{\zihao{5}}%
\def\large{\zihao{4-}}%
\def\Large{\zihao{4}}%
\def\LARGE{\zihao{3}}%
\def\huge{\zihao{2-}}%
\def\Huge{\zihao{1-}}%
\def\IEEEproof{\@ifnextchar[{\@IEEEproof}{\@IEEEproof[\IEEEproofname]}}
\def\@IEEEproof[#1]{\par\noindent\hspace{1em}{\textbf #1{\quad}}}
\def\endIEEEproof{\hspace*{\fill}~$\blacksquare$\par}
\def\IEEEproofname{Proof}




\normalsize
\let\@afterindentfalse\@afterindenttrue\@afterindenttrue
\def\@cite#1#2{\textsuperscript{[{#1\if@tempswa, #2\fi}]}}
\setlength{\footnotesep}{0pt}
\def\footnoterule{\kern-10\p@ \hrule width .4\columnwidth height 0.4pt \kern 6.6\p@}

\renewcommand{\maketitle}{\par
 \begingroup
  \def\thefootnote{}
  \def\footnotemark{}
   \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
   \long\def\@makefntext##1{\parindent 1em\noindent
           \hb@xt@0.5em{%
               \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
   \twocolumn[\@maketitle]%
   \thispagestyle{CjC@firstfootings}
   \@thanks%
 \endgroup%
 \setcounter{footnote}{0}%
 \global\let\thanks\relax%
 \global\let\maketitle\relax%
 \global\let\@maketitle\relax%
 \global\let\@thanks\@empty%
 \global\let\@author\@empty%
 \global\let\@title\@empty%
 \global\let\title\relax%
 \global\let\author\relax%
 \global\let\and\relax%
 \global\let\cncl\relax%
 \global\let\email\relax%
 \global\let\CjC@title\relax%
 \global\let\CjC@author\relax%
 \global\let\CjC@address\relax%
 \global\let\CjC@abstract\relax%
 \global\let\CjC@keyword\relax%
 \global\let\CjC@doi\relax%
 \global\let\title\relax%
 \global\let\author\relax%
 \global\let\address\relax%
 \global\let\abstract\relax%
 \global\let\keyword\relax%
 \global\let\doi\relax%
}

\def\@maketitle{%
    \let\footnote\thanks%
    \newpage\null
    \vskip 1.2\baselineskip%
    {\centering%
    {\CjC@title\par}%
    {%
    \vskip 0.8\baselineskip%
    \begin{tabular}[t]{c}%
    \CjC@author%
    \end{tabular}%
    \vskip 0.3em%
    \par%
    }%
    \vskip 0.2\baselineskip}%
    {\linespread{1.0}\selectfont\CjC@abstract\par%
    \vskip 0.2\baselineskip%
    \CjC@keyword\par%
    \vskip 0.2\baselineskip%
    \CjC@doi\par
    }%
    \vskip 1.5\baselineskip%
}

\renewcommand{\refname}{\centering \normalsize\bf ~\\[-7mm]}
\newenvironment{acknowledgement}{
    \vspace*{10pt}
    {\noindent\zihao{4}\bfseries Acknowledgements\par}
    \vspace*{10pt}
    \begingroup
    }{
    \par
    \endgroup
}

\newenvironment{biography}[1][]{
\vskip 0.4\baselineskip%
\zihao{5-}
\parpic{%
\includegraphics[height=3.3cm,width=2.5cm]{#1}}%
}{\vskip 0.4\baselineskip\par}

\newenvironment{biographynophoto}{\vskip 0.4\baselineskip\zihao{5-}}{\vskip 0.4\baselineskip\par}

\setcounter{secnumdepth}{3}

\renewcommand\thesection {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-1.5ex \@plus -.2ex \@minus -.2ex}%
                                   {1.5ex \@plus.2ex}%
                                   {\zihao{4-}\heiti }}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-1.0ex \@plus -.2ex \@minus -.2ex}%
                                     {1.0ex \@plus .2ex}%
                                     {\zihao{5}\heiti}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-0.5ex \@plus -.0ex \@minus -.2ex}%
                                     {0.5ex \@plus .0ex}%
                                     {\zihao{5}}}
\renewcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}

\newcommand{\firstheadname}[1]{\gdef\CjC@firstheadname{\zihao{5-} #1}}
\newcommand{\firstfootname}[1]{\gdef\CjC@firstfootname{\zihao{5-}}{#1}}
\newcommand{\headevenname}[1]{\gdef\CjC@headevenname{\zihao{5-} #1}}
\newcommand{\headoddname}[1]{\gdef\CjC@headoddname{\zihao{5-} #1}}
%%-------------------CjCheadings begin----------------------------------------%%
\def\ps@CjCheadings{
    \let\@evenhead\@empty\let\@evenfoot\@empty
    \let\@oddhead\@empty\let\@oddfoot\@empty
    \def\@evenhead{%
        \vbox{%
            \vskip 1mm%
            \hbox to \textwidth {\mbox{\hspace {2mm}} {\zihao{5-} \thepage} \hfill \hbox{\CjC@headevenname  \hfill  {\zihao{5-} \mbox{\hspace {2mm}}}}}%
            \vskip 2.0mm%
           \hbox to \textwidth{\noindent\rule[2mm]{\textwidth}{0.5pt}}%
        }%
    }
    \def\@oddhead{%
        \vbox{%
            \vskip 1mm%
            \hbox to \textwidth {{\zihao{5-} \mbox{\hspace {0mm}} \CjC@headoddname}   \hfill {{\zihao{5-} \thepage} \mbox{\hspace {2mm}}}}%
            \vskip 2.0mm%
            \hbox to \textwidth{\noindent\rule[2mm]{\textwidth}{0.5pt}}%
        }
    }%
}
%---------------------headings end------------------------------------------%%

%%------------ AtBeginDocument and AtEndDocument --------%%
\AtBeginDocument{%
   \flushend
   \captiondelim{ } %
   \captionnamefont{\zihao{5-}\heiti}%
   \captiontitlefont{\zihao{5-}\songti}%
   }
\AtEndDocument{\clearpage}
\endinput
%%-------- The end of CjC.cls -------------%%
