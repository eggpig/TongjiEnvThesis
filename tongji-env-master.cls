% SPDX-License-Identifier: MIT
% TongjiEnvThesis: professional master thesis class.
% Typesetting basis: Tongji Graduate School, October 2025.
\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\ProvidesClass{tongji-env-master}[2026/10/03 v1.0.0 Tongji environmental professional master]
\RequirePackage{iftex}
\ifXeTeX\else\ClassError{tongji-env-master}{Please select XeLaTeX}{Use XeLaTeX in Overleaf Settings.}\fi
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=tj,prefix=tj@}
\DeclareBoolOption[false]{blind}
\DeclareBoolOption[false]{printcopy}
\DeclareStringOption[auto]{fontset}
\DeclareStringOption[bibtex]{bibbackend}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*
\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[UTF8,a4paper,zihao=-4,fontset=none,scheme=plain,twoside,openany]{ctexbook}
\RequirePackage{fontspec,etoolbox}
% auto: use the complete supplied school font set, otherwise open fonts.
% school: require all twelve files listed in fonts/README.md.
\newif\iftj@schoolfonts
\newif\iftj@allfonts
\tj@allfontstrue
\newcommand\tj@checkfont[1]{\IfFileExists{fonts/#1}{}{\tj@allfontsfalse}}
\forcsvlist{\tj@checkfont}{SimSun.ttf,SimHei.ttf,FangSong.ttf,LiShu.ttf,times.ttf,timesbd.ttf,timesi.ttf,timesbi.ttf,arial.ttf,arialbd.ttf,ariali.ttf,arialbi.ttf}
\ifdefstring{\tj@fontset}{auto}
  {\iftj@allfonts\tj@schoolfontstrue\fi}
  {\ifdefstring{\tj@fontset}{school}
    {\iftj@allfonts\tj@schoolfontstrue\else
      \ClassError{tongji-env-master}{Incomplete school font set}{Add all files listed in fonts/README.md, or select fontset=open.}\fi}
    {\ifdefstring{\tj@fontset}{open}{}
      {\ClassError{tongji-env-master}{Unknown fontset}{Choose auto, open, or school.}}}}
\iftj@schoolfonts
  \setmainfont{times.ttf}[Path=fonts/,BoldFont=timesbd.ttf,ItalicFont=timesi.ttf,BoldItalicFont=timesbi.ttf]
  \setsansfont{arial.ttf}[Path=fonts/,BoldFont=arialbd.ttf,ItalicFont=ariali.ttf,BoldItalicFont=arialbi.ttf]
  \setCJKmainfont{SimSun.ttf}[Path=fonts/,AutoFakeBold=2]
  \setCJKsansfont{SimHei.ttf}[Path=fonts/,AutoFakeBold=2]
  \setCJKfamilyfont{song}{SimSun.ttf}[Path=fonts/,AutoFakeBold=2]
  \setCJKfamilyfont{hei}{SimHei.ttf}[Path=fonts/,AutoFakeBold=2]
  \setCJKfamilyfont{fang}{FangSong.ttf}[Path=fonts/,AutoFakeBold=2]
  \setCJKfamilyfont{li}{LiShu.ttf}[Path=fonts/,AutoFakeBold=2]
  \newfontfamily\headinglatin{SimHei.ttf}[Path=fonts/,AutoFakeBold=2]
  \newfontfamily\pagenumberfont{SimSun.ttf}[Path=fonts/]
\else
  \setmainfont{texgyretermes-regular.otf}[BoldFont=texgyretermes-bold.otf,ItalicFont=texgyretermes-italic.otf,BoldItalicFont=texgyretermes-bolditalic.otf]
  \setsansfont{texgyreheros-regular.otf}[BoldFont=texgyreheros-bold.otf,ItalicFont=texgyreheros-italic.otf,BoldItalicFont=texgyreheros-bolditalic.otf]
  \setCJKmainfont{FandolSong-Regular.otf}[BoldFont=FandolSong-Bold.otf,ItalicFont=FandolKai-Regular.otf]
  \setCJKsansfont{FandolHei-Regular.otf}[BoldFont=FandolHei-Bold.otf]
  \setCJKfamilyfont{song}{FandolSong-Regular.otf}[BoldFont=FandolSong-Bold.otf]
  \setCJKfamilyfont{hei}{FandolHei-Regular.otf}[BoldFont=FandolHei-Bold.otf]
  \setCJKfamilyfont{fang}{FandolFang-Regular.otf}[AutoFakeBold=2]
  \setCJKfamilyfont{li}{FandolKai-Regular.otf}[AutoFakeBold=2]
  \newfontfamily\headinglatin{texgyreheros-regular.otf}[BoldFont=texgyreheros-bold.otf]
  \newfontfamily\pagenumberfont{FandolSong-Regular.otf}
\fi
\newcommand\songti{\CJKfamily{song}}
\newcommand\heiti{\CJKfamily{hei}}
\newcommand\fangsong{\CJKfamily{fang}}
\newcommand\lishu{\CJKfamily{li}}
\RequirePackage{amsmath}
\RequirePackage{unicode-math}
\setmathfont{texgyretermes-math.otf}
\RequirePackage{graphicx,booktabs,array,tabularx,longtable}
\RequirePackage{caption,subcaption}
\RequirePackage{siunitx}
\RequirePackage[version=4]{mhchem}
\RequirePackage{enumitem,etoolbox}
\RequirePackage{geometry,fancyhdr,titletoc,pdfpages}
\geometry{a4paper,top=25.4mm,bottom=25.4mm,left=31.7mm,right=31.7mm,
  headheight=14bp,headsep=0.1mm,footskip=9.75mm,bindingoffset=0mm}
% TeX distances are relative to the text block, unlike Word's page-edge values.
% Calibrated against the supplied Word example: header ~2 cm, footer ~1.5 cm.
\linespread{1}
\renewcommand\normalsize{\@setfontsize\normalsize{12bp}{20bp}%
  \abovedisplayskip=10bp\belowdisplayskip=10bp
  \abovedisplayshortskip=6bp\belowdisplayshortskip=6bp}
\normalsize
\setlength\parskip{0bp}
\setlength\parindent{2\ccwd}
\raggedbottom
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\ctexset{punct=quanjiao,autoindent=2,chapter={name={第,章},number=\arabic{chapter},
  format=\centering\headinglatin\heiti\bfseries\fontsize{16bp}{19.2bp}\selectfont,
  nameformat={},numberformat={},titleformat={},
  beforeskip=24bp,afterskip=18bp,aftername=\hspace{1\ccwd},
  pagestyle=thesis,afterindent=true},
  section={format=\headinglatin\heiti\fontsize{15bp}{18bp}\selectfont,
    beforeskip=24bp,afterskip=6bp,aftername=\hspace{1\ccwd},afterindent=true},
  subsection={format=\headinglatin\heiti\fontsize{14bp}{16.8bp}\selectfont,
    beforeskip=12bp,afterskip=6bp,aftername=\hspace{1\ccwd},afterindent=true},
  subsubsection={format=\headinglatin\heiti\fontsize{12bp}{14.4bp}\selectfont,
    beforeskip=12bp,afterskip=6bp,aftername=\hspace{1\ccwd},afterindent=true},
  contentsname=目录,figurename=图,tablename=表,bibname=参考文献,appendixname=附录}
\fancypagestyle{thesis}{\fancyhf{}
  \fancyhead[C]{\normalfont\songti\fontsize{10.5bp}{12bp}\selectfont\nouppercase{\leftmark}}
  \fancyfoot[C]{\normalfont\pagenumberfont\songti\fontsize{10.5bp}{12bp}\selectfont\thepage}
  \renewcommand\headrulewidth{0.4pt}\renewcommand\footrulewidth{0pt}}
\fancypagestyle{plain}{\fancyhf{}
  \fancyhead[C]{\normalfont\songti\fontsize{10.5bp}{12bp}\selectfont\nouppercase{\leftmark}}
  \fancyfoot[C]{\normalfont\pagenumberfont\songti\fontsize{10.5bp}{12bp}\selectfont\thepage}
  \renewcommand\headrulewidth{0.4pt}}
\renewcommand\chaptermark[1]{\markboth{\if@mainmatter\CTEXthechapter\quad\fi#1}{}}
\renewcommand\sectionmark[1]{}
\newcommand\tjbody{\normalfont\songti\normalsize\setlength\parindent{2\ccwd}\setlength\parskip{0bp}}
\newcommand\tjsmall{\normalfont\songti\fontsize{10.5bp}{16bp}\selectfont\setlength\parskip{0bp}}
\newcommand\tjcheckbox{\begingroup\setlength\fboxsep{0pt}\fbox{\rule{0pt}{2.7mm}\rule{2.7mm}{0pt}}\endgroup}
\newcommand\tjunnumbered[1]{\chapter*{#1}\markboth{#1}{}\addcontentsline{toc}{chapter}{#1}}
\renewcommand\frontmatter{\clearpage\@mainmatterfalse\pagenumbering{Roman}\pagestyle{thesis}\tjbody}
\renewcommand\mainmatter{\clearpage\@mainmattertrue\pagenumbering{arabic}\pagestyle{thesis}\tjbody}
\renewcommand\backmatter{\clearpage\@mainmatterfalse\tjbody}
\contentsmargin{2.5em}
\titlecontents{chapter}[0pt]{\songti\fontsize{12bp}{18bp}\selectfont}
  {\thecontentslabel\quad}{}{\titlerule*[.5em]{.}\contentspage}
\titlecontents{section}[2\ccwd]{\songti\fontsize{12bp}{18bp}\selectfont}
  {\thecontentslabel\quad}{}{\titlerule*[.5em]{.}\contentspage}
\titlecontents{subsection}[4\ccwd]{\songti\fontsize{12bp}{18bp}\selectfont}
  {\thecontentslabel\quad}{}{\titlerule*[.5em]{.}\contentspage}
\renewcommand\tableofcontents{\chapter*{目录}\markboth{目录}{}%
  \pdfbookmark[0]{目录}{toc}\begingroup\fontsize{12bp}{18bp}\selectfont\@starttoc{toc}\endgroup\clearpage}
\DeclareCaptionFont{tj}{\normalfont\songti\fontsize{10.5bp}{12.6bp}\selectfont}
\DeclareCaptionLabelFormat{tj}{#1#2}
\DeclareCaptionLabelSeparator{tj}{\hspace{1\ccwd}}
\captionsetup{font=tj,labelformat=tj,labelsep=tj,justification=centering,singlelinecheck=false}
\captionsetup[figure]{position=bottom,aboveskip=6bp,belowskip=12bp}
\captionsetup[table]{position=top,aboveskip=6bp,belowskip=6bp}
\captionsetup[sub]{font=tj}
\setlength\textfloatsep{12bp}
\setlength\intextsep{12bp}
\sisetup{detect-all,per-mode=symbol,range-phrase={--},range-units=single}
\setlist{nosep,leftmargin=2\ccwd}
% Both backends use the 2015 numeric style named in the school attachment.
\ifdefstring{\tj@bibbackend}{biber}{%
  \RequirePackage[backend=biber,style=gb7714-2015,sorting=none,
    gbnamefmt=uppercase,gbpub=false,gbalign=left]{biblatex}
  \addbibresource{references/references.bib}
  \renewcommand\bibfont{\tjsmall}
  \setlength\bibitemsep{0pt}
  \setlength\bibparsep{0pt}
  % gb7714-2015's cite command includes brackets and accepts cited pages.
  \let\supercite\cite
  \defbibheading{tjreferences}{\tjunnumbered{参考文献}}
  \defbibenvironment{bibliography}
    {\list{\printtext[labelnumberwidth]{\printfield{labelnumber}}}
      {\setlength\leftmargin{2\ccwd}\setlength\labelsep{.5em}%
       \setlength\labelwidth{\labelnumberwidth}%
       \setlength\itemindent{\dimexpr\labelwidth+\labelsep-\leftmargin\relax}%
       \ifdim\itemindent<0pt\setlength\itemindent{0pt}\fi
       \setlength\labelwidth{\dimexpr\leftmargin+\itemindent-\labelsep\relax}%
       \setlength\itemsep{0pt}\setlength\parsep{0pt}\setlength\listparindent{0pt}}%
     \renewcommand\makelabel[1]{##1\hss}}
    {\endlist}{\item}
  \newcommand\printreferences{\clearpage\begingroup\tjsmall
    \printbibliography[heading=tjreferences]\par\endgroup\clearpage}
}{\ifdefstring{\tj@bibbackend}{bibtex}{%
  \RequirePackage[sort&compress]{gbt7714}
  \renewcommand\bibfont{\tjsmall}
  \setlength\bibsep{0bp}
  % Numeric natbib lists do not use bibhang: set continuation indent here.
  \renewcommand\NAT@bibsetnum[1]{%
    \setlength\leftmargin{2\ccwd}\setlength\labelsep{.5em}%
    \settowidth\labelwidth{\@biblabel{#1}}%
    \setlength\itemindent{\dimexpr\labelwidth+\labelsep-\leftmargin\relax}%
    \ifdim\itemindent<0pt\setlength\itemindent{0pt}\fi
    \setlength\labelwidth{\dimexpr\leftmargin+\itemindent-\labelsep\relax}%
    \setlength\itemsep{0pt}\setlength\parsep{0pt}\setlength\listparindent{0pt}}
  \renewcommand\bibsection{\tjunnumbered{参考文献}}
  \let\supercite\citep
  \newcommand\printreferences{\clearpage\begingroup\tjsmall
    \@ifpackagelater{gbt7714}{2026/05/02}%
      {\bibliographystyle{gbt7714-2015-numeric}}{\bibliographystyle{gbt7714-numerical}}%
    \bibliography{references/references}\par\endgroup\clearpage}
}{\ClassError{tongji-env-master}{Unknown bibliography backend}{Choose bibtex or biber.}}}
\RequirePackage[unicode,hidelinks,bookmarksnumbered=true,pdfdisplaydoctitle=true]{hyperref}
\urlstyle{same}
\pdfstringdefDisableCommands{\def\\{ }\def\quad{ }\def\ce#1{#1}}
\newcommand\tjfield[1]{\expandafter\newcommand\csname #1\endcsname{}}
\forcsvlist{\tjfield}{ctitle,etitle,cauthor,eauthor,studentid,cschool,eschool,ccategory,ecategory,cdegree,edegree,cfield,efield,cdirection,edirection,csupervisor,esupervisor,cindustry,eindustry,cjoint,ejoint,cdate,edate,cfunding,efunding}
\newcommand\privateinfo[1]{\iftj@blind 匿名\else#1\fi}
\newcommand\privateinfoen[1]{\iftj@blind Anonymous\else#1\fi}
\newcommand\tjcoverbreak{\clearpage\iftj@printcopy\null\thispagestyle{empty}\clearpage\fi}
\newcommand\makecovers{%
 \pagestyle{empty}\hypersetup{pageanchor=false}\pagenumbering{gobble}
 \begin{center}
 \vspace*{10mm}
 \includegraphics[width=100mm,height=26mm]{figures/tongji-mark.png}\par
 \vspace{9mm}
 {\lishu\bfseries\fontsize{22bp}{22bp}\selectfont 硕士学位论文\par}
 \vspace{3mm}
 {\lishu\bfseries\fontsize{16bp}{16bp}\selectfont （专业学位）\par}
 \vspace{15mm}
 \begin{minipage}[c][30mm][c]{\textwidth}\centering
 {\heiti\bfseries\fontsize{22bp}{26bp}\selectfont\ctitle\par}
 \iftj@blind\else\ifdefempty{\cfunding}{}{\vspace{3mm}{\songti\fontsize{16bp}{19bp}\selectfont\cfunding\par}}\fi
 \end{minipage}\par\vspace{10mm}
 \begingroup\fangsong\fontsize{16bp}{19.2bp}\selectfont
 \setlength\tabcolsep{0pt}\renewcommand\arraystretch{1}
 \hspace*{4.5\ccwd}\begin{tabularx}{\dimexpr\textwidth-4.5\ccwd\relax}{@{}l@{：\hspace{.35em}}>{\raggedright\arraybackslash}X@{}}
 姓\hspace{2em}名&\privateinfo{\cauthor}\\
 学\hspace{2em}号&\privateinfo{\studentid}\\
 学\hspace{2em}院&\cschool\\
 学科门类&\ccategory\\
 专业学位类别&\cdegree\\
 专业领域&\cfield\\
 研究方向&\cdirection\\
 指导教师&\privateinfo{\csupervisor}\\
 \iftj@blind\else
 \ifdefempty{\cindustry}{}{行业导师&\cindustry\\}
 \ifdefempty{\cjoint}{}{联合培养单位&\cjoint\\}
 \fi
 \end{tabularx}\endgroup\par
 \vfill{\songti\fontsize{16bp}{19bp}\selectfont\cdate\par}
 \end{center}\tjcoverbreak
 \begin{center}
 \vspace*{5mm}
 \includegraphics[width=100mm,height=26mm]{figures/tongji-mark.png}\par
 \vspace{8mm}
 {\fontsize{14bp}{16.8bp}\selectfont A thesis submitted to\\Tongji University in partial fulfillment of the requirements for\\the degree of \edegree\par}
 \vspace{12mm}
 \begin{minipage}[c][24mm][c]{\textwidth}\centering
 {\sffamily\bfseries\fontsize{18bp}{21.6bp}\selectfont\etitle\par}
 \end{minipage}\par\vspace{10mm}
 \begingroup\raggedright\fontsize{16bp}{19.2bp}\selectfont
 \setlength\parskip{4bp}\setlength\parindent{0pt}
 Candidate: \privateinfoen{\eauthor}\par
 Student Number: \privateinfoen{\estudentid}\par
 School/Department: \eschool\par
 Categories: \ecategory\par
 Degree: \cdegreeen\par
 Degree's Field: \efield\par
 Research Fields: \edirection\par
 Supervisor: \privateinfoen{\esupervisor}\par
 \iftj@blind\else
 \ifdefempty{\eindustry}{}{Associate Supervisor: \eindustry\par}
 \ifdefempty{\ejoint}{}{Joint Training Institution: \ejoint\par}
 \ifdefempty{\efunding}{}{\vspace{2mm}\efunding\par}
 \fi
 \endgroup
 \vfill{\fontsize{16bp}{19.2bp}\selectfont\edate\par}
 \end{center}\tjcoverbreak\hypersetup{pageanchor=true}\tjbody}
\newcommand\cdegreeen{}
\newcommand\estudentid{}
\newenvironment{cnabstract}{\chapter*{摘要}\markboth{摘要}{}\pdfbookmark[0]{摘要}{abstract-cn}\tjbody}
 {\par\clearpage}
\newenvironment{enabstract}{\chapter*{\sffamily Abstract}\markboth{Abstract}{}\pdfbookmark[0]{Abstract}{abstract-en}\tjbody}
 {\par\clearpage}
\newcommand\keywords[1]{\par\vspace{12bp}\noindent\textbf{关键词：}#1\par}
\newcommand\keywordsen[1]{\par\vspace{12bp}\noindent\textbf{Key Words: }#1\par}
\newcommand\startappendices{\clearpage\@mainmattertrue\appendix
 \ctexset{chapter/name={附录,},chapter/number=\Alph{chapter}}
 \renewcommand\thefigure{\Alph{chapter}\arabic{figure}}
 \renewcommand\thetable{\Alph{chapter}\arabic{table}}
 \renewcommand\theequation{\Alph{chapter}\arabic{equation}}}
\newcommand\makebackmatter{\backmatter
 \iftj@blind\else
  \tjunnumbered{致谢}\begingroup\fangsong\normalsize\input{backmatter/acknowledgements}\par\clearpage\endgroup
  \tjunnumbered{个人简历、在读期间发表的学术成果}\begingroup\tjsmall\input{backmatter/resume}\par\clearpage\endgroup
  \IfFileExists{signed/statements.pdf}{\includepdf[pages=-,pagecommand={\thispagestyle{empty}}]{signed/statements.pdf}}
    {\input{backmatter/statements}}
  \iftj@printcopy
   \IfFileExists{signed/defense-resolution.pdf}{\includepdf[pages=-,pagecommand={\thispagestyle{empty}}]{signed/defense-resolution.pdf}}{}
  \fi
 \fi}
\AtBeginDocument{\tjbody\hypersetup{pdftitle={\ctitle},pdfsubject={Professional master's thesis},pdfcreator={XeLaTeX}}
 \iftj@blind\hypersetup{pdfauthor={}}\else\hypersetup{pdfauthor={\cauthor}}\fi}
\endinput
