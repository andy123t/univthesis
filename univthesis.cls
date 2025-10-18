%%
%% This is file `univthesis.cls',
%%
%% @author andy123t
%% @date 2025/10/18
%% @version v1.0
%% LaTeX thesis template for University
%%

%---------- 定义的新的Class ----------
\ProvidesClass{univthesis}[2025/10/18 v1.0]
\NeedsTeXFormat{LaTeX2e}

%---------- 定义的新的Options ----------
\newif\ifuniv@master
\newif\ifuniv@print
\DeclareOption{master}{\univ@mastertrue}
\DeclareOption{doctor}{\univ@masterfalse}
\DeclareOption{print}{\univ@printtrue}
\DeclareOption{openany}{\PassOptionsToClass{openany}{ctexbook}}
\DeclareOption{openright}{\PassOptionsToClass{openright}{ctexbook}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{ctexbook}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ExecuteOptions{master,openany,twoside}
\ProcessOptions\relax

%---------------------------------
% twoside,openany 单面排版
% twoside,openany,print 用于打印, 封面等生成空白页
% twoside,openright,print 用于打印, 全部双面排版
%---------------------------------

%---------- 修改字体宏包Options ----------
\PassOptionsToPackage{no-math}{fontspec}

%---------- 载入Class ----------
\LoadClass[UTF8,a4paper,zihao=-4]{ctexbook}
\@ifclasslater{ctexbook}{2017/01/01}{}{%
    \ClassError{univthesis}{ctex >= 2017/01/01 is required ...}{}%
}

%---------- 定义页边距 ----------
\RequirePackage{geometry}
\geometry{
    left=3.0cm, right=3.0cm,
    top=3.0cm, bottom=3.0cm,
    headheight=15pt, headsep=18pt,
    footskip=28pt
}

%---------- 常用宏包 ----------
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{mathrsfs}
\RequirePackage{graphicx}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{float}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage{color,xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{makecell}
\RequirePackage{etoolbox}
\RequirePackage{titletoc}
\RequirePackage{anyfontsize}
\RequirePackage{pdfpages}
\RequirePackage[numbered]{bookmark}

%---------- 定义文档属性格式 ----------
\def\univ@define@term#1{%
    \expandafter\gdef\csname #1\endcsname##1{%
        \expandafter\gdef\csname univ@#1\endcsname{##1}%
    }%
    \csname #1\endcsname{}%
}

%---------- 定义新变量 ----------
\newcommand\cnabstractname{摘~~要}
\newcommand\enabstractname{Abstract}
\newcommand\denotationname{主要符号表}
\newcommand\acknowledgementname{致谢}

\ifuniv@master
    \newcommand\univ@publications{攻读硕士学位期间的研究成果}%
\else
    \newcommand\univ@publications{攻读博士学位期间的研究成果}%
\fi

%------- 重新定义cleardoublepage --------
\renewcommand{\cleardoublepage}{%
    \clearpage
    \if@twoside
        \ifodd\c@page\else
            \thispagestyle{empty}%
            \hbox{}\newpage
            \if@twocolumn\hbox{}\newpage\fi
        \fi
    \fi
}

%---------- 设置超链接 ----------
\RequirePackage{hyperref}
\ifuniv@print
\hypersetup{hidelinks}
\else
\hypersetup{%
    colorlinks=true,
    linkcolor=black,
    citecolor=blue,
    filecolor=blue,
    urlcolor=blue
}
\fi

%---------- 设置正文前页码为大写罗马数字 ----------
\renewcommand\frontmatter{%
    \ifuniv@print\cleardoublepage\else\clearpage\fi
    \@mainmatterfalse
    \pagenumbering{Roman}%
}

%---------- 设置正文页码为阿拉伯数字 ----------
\renewcommand\mainmatter{%
    \ifuniv@print\cleardoublepage\else\clearpage\fi
    \pagenumbering{arabic}%
    \@mainmattertrue
}

%---------- 设置图片的路径 ----------
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}}

%---------- 设置章节目录的深度 ----------
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

%---------- 定义章节字号 ----------
\newcommand{\chapfont}{\fontsize{20bp}{28bp}\selectfont}
\newcommand{\secfont}{\fontsize{15bp}{20bp}\selectfont}
\newcommand{\subsecfont}{\fontsize{14bp}{20bp}\selectfont}
\newcommand{\ssubsecfont}{\fontsize{12bp}{18bp}\selectfont}

%---------- 定义章节标题格式 ----------
\ctexset{%
    chapter = {
        format = \linespread{1.0}\sffamily\heiti\chapfont\centering,
        nameformat = {},
        titleformat = {},
        number = \arabic{chapter},
        numberformat = {},
        aftername = \quad,
        beforeskip = {-4pt},
        afterskip = {24pt},
        pagestyle = plain,
    },
    section = {
        format = \linespread{1.0}\sffamily\heiti\zihao{-3}\raggedright,
        numberformat = {},
        aftername = \quad,
        beforeskip = {24pt},
        afterskip = {6pt},
    },
    subsection = {
        format = \linespread{1.0}\sffamily\heiti\zihao{4}\raggedright,
        numberformat = {},
        aftername = \quad,
        beforeskip = {12pt},
        afterskip = {6pt},
    },
    subsubsection = {
        format = \linespread{1.0}\sffamily\heiti\zihao{-4}\raggedright,
        numberformat = {},
        aftername = \quad,
        beforeskip = {12pt},
        afterskip = {6pt},
    },
    appendix = {
        numbering = true,
        number = \Alph{chapter},
    },
}%

%---------- 算法宏包及设置 ----------
\RequirePackage{algorithm,algorithmicx}
\RequirePackage{algpseudocode}
\floatname{algorithm}{算法}
\algrenewcommand\algorithmicrequire{\textbf{输入:}}
\algrenewcommand\algorithmicensure{\textbf{输出:}}

%---------- 定义页眉页脚 ----------
%---------- 设置分隔线宽度 ----------
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}

%---------- 设置页眉样式 ----------
% \renewcommand{\headrule}{%
%     \let\headrulewidth\plainheadrulewidth
%     \hrule\@height 1.5pt \@width\headwidth
%     \vskip 1.6pt
%     \hrule\@height 0.4pt \@width\headwidth
%     \vskip-1.5pt
% }

\renewcommand{\headrule}{%
    \let\headrulewidth\plainheadrulewidth%
    \hrule\@height 0.5pt \@width\headwidth%
    \vskip-1.5pt
}

%---------- 设置页眉样式 ----------
\newcommand{\headstyle}{%
    %\fancyhead[RO,LE]{\zihao{5}\nouppercase{\leftmark}}
    %\fancyhead[LO,RE]{\zihao{5}\univ@univthesisname}
    \fancyhead[C]{\zihao{5}\nouppercase{\leftmark}}
}

%---------- 设置页脚样式 ----------
\newcommand{\footstyle}{%
    \fancyfoot[C]{\zihao{5}\thepage}
    %\fancyfoot[LE]{\zihao{5}\thepage}
    %\fancyfoot[RO]{\zihao{5}\thepage}
}

%---------- 定义plain样式 ----------
\fancypagestyle{plain}{%
    \fancyhf{}
    \headstyle
    \footstyle
}

\pagestyle{plain}

%---------- 中文段落缩进和行距 ----------
\setlength{\parindent}{2\ccwd}
\setlength{\parskip}{4pt plus 1pt minus 1pt}
\linespread{1.35}  % 设置行距
%\renewcommand{\baselinestretch}{1.35}

%---------- 浮动对象设置 ----------
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

%---------- 设置图表格式 ----------
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}
%\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
%\renewcommand{\thetable}{\thechapter.\arabic{table}}

%---------- 设置图片和表格样式 ----------
\RequirePackage{caption}
\captionsetup{font={small,singlespacing},labelformat={default},labelsep=quad}
\captionsetup[figure]{position=bottom,skip={6pt},name={图}}
\captionsetup[table]{position=top,skip={3pt},name={表}}
\setlength{\textfloatsep}{12pt plus 2pt minus 2pt}
\setlength{\floatsep}{10pt plus 2pt minus 2pt}
\setlength{\intextsep}{10pt plus 2pt minus 2pt}
%\setlength{\abovecaptionskip}{2pt plus 1pt minus 1pt}
%\setlength{\belowcaptionskip}{3pt plus 1pt minus 2pt}

%---------- 重新设置图表autoref ----------
\renewcommand{\figureautorefname}{图}
\renewcommand{\tableautorefname}{表}

%---------- 定义表格列类型 ----------
\newcolumntype{L}{X}
\newcolumntype{C}{>{\centering \arraybackslash}X}
\newcolumntype{R}{>{\raggedleft \arraybackslash}X}
\newcolumntype{P}[1]{>{\centering \arraybackslash}p{#1}}

%---------- 数学定理设置 ----------
\newtheoremstyle{univ}{0.5\topsep}{0.5\topsep}{\kaishu}{}{\sffamily\heiti}{.}{5pt plus 1pt minus 1pt}{}%
%\theoremstyle{plain}
\theoremstyle{univ}
\newtheorem{theorem}{定理}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{remark}{注}[chapter]
\newtheorem{exercise}{习题}[chapter]
\newtheorem{assumption}{假设}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{property}{性质}[chapter]
\newtheorem{conjecture}{猜想}[chapter]
%\renewcommand{\qedsymbol}{$\blacksquare$}
\renewcommand{\proofname}{证明}
\renewenvironment{proof}[1][\proofname]{%
    \par\pushQED{\qed}%
    %\normalfont \topsep6\p@\@plus6\p@\relax
    \normalfont\topsep0\p@\@plus3\p@\relax
    \trivlist\item[\hskip\labelsep
    \bfseries #1\@addpunct{\,:\,}]\ignorespaces
}{%
    \popQED\endtrivlist\@endpefalse
}

%---------- 定义定理的autoref ----------
\renewcommand{\theoremautorefname}{定理}
\newcommand{\lemmaautorefname}{引理}
\newcommand{\corollaryautorefname}{推论}
\newcommand{\definitionautorefname}{定义}
\newcommand{\propositionautorefname}{命题}
\newcommand{\exampleautorefname}{例}
\newcommand{\remarkautorefname}{注}
\newcommand{\exerciseautorefname}{习题}
\newcommand{\assumptionautorefname}{假设}
\newcommand{\axiomautorefname}{公理}
\newcommand{\propertyautorefname}{性质}
\newcommand{\conjectureautorefname}{猜想}

%---------- 数学公式设置 ----------
\allowdisplaybreaks[4]

%---------- 设置公式间距 ----------
\AtBeginDocument{
    \setlength{\abovedisplayskip}{6pt plus 2pt minus 2pt}
    \setlength{\belowdisplayskip}{6pt plus 2pt minus 2pt}
    \setlength{\abovedisplayshortskip}{3pt plus 1pt minus 1pt}
    \setlength{\belowdisplayshortskip}{3pt plus 1pt minus 1pt}
    %\setlength{\arraycolsep}{2pt}
}

%---------- 公式编号带章节 ----------
\numberwithin{equation}{chapter}

%---------- 重新设置公式autoref ----------
\renewcommand{\equationautorefname}{公式}

%---------- 列表样式设置 ----------
\RequirePackage{enumitem}
\setlist{nolistsep}

%---------- 定义新的列表 ----------
\newlist{biblist}{enumerate}{1}
\setlist[biblist]{leftmargin=*,label={[\arabic*]}}


%---------- 定义插入封面pdf文件命令 ----------
\newcommand{\insertcover}[2][]{%
    \clearpage
    \phantomsection
    %\pdfbookmark[0]{封面}{cover}
    \thispagestyle{empty}
    \includepdf[#1]{#2}
    \ifuniv@print\cleardoublepage\else\clearpage\fi
    \if@openright\cleardoublepage\fi
}

%---------- 定义插入声明页pdf文件命令 ----------
\newcommand{\insertstatement}[2][]{%
    \clearpage
    \phantomsection
    %\pdfbookmark[0]{声明页}{statement}
    \thispagestyle{empty}%
    \includepdf[#1]{#2}
    \ifuniv@print\cleardoublepage\else\clearpage\fi
    \if@openright\cleardoublepage\fi
}

%---------- 定义中英文关键词 ----------
%--- 中文关键词 ---
\newcommand{\cnkeywords}[1]{%
    \vspace*{0.8\baselineskip}\par
    \noindent\textbf{关键词:\enspace} #1%
}
%--- 英文关键词 ---
\newcommand{\enkeywords}[1]{%
    \vspace*{0.8\baselineskip}\par
    \noindent\textbf{Key Words:\enspace} #1%
}

%---------- 中文摘要环境 ----------
\newenvironment{cnabstract}{%
    \clearpage
    \pagestyle{plain}%
    \phantomsection
    \chapter*{\cnabstractname}
    \addcontentsline{toc}{chapter}{\cnabstractname}
    \chaptermark{\cnabstractname}
}{%
    \clearpage
    \if@openright\cleardoublepage\fi
}

%---------- 英文摘要环境 ----------
\newenvironment{enabstract}{%
    \clearpage
    \pagestyle{plain}%
    \phantomsection
    \chapter*{\enabstractname}
    \addcontentsline{toc}{chapter}{\enabstractname}
    \chaptermark{\enabstractname}
}{%
    \clearpage
    \if@openright\cleardoublepage\fi
}

%---------- 定义新的目录页面 ----------
\RequirePackage{tocloft}
\renewcommand{\cfttoctitlefont}{\hfill\heiti\chapfont}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftloftitlefont}{\hfill\heiti\chapfont}
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\cftlottitlefont}{\hfill\heiti\chapfont}
\renewcommand{\cftafterlottitle}{\hfill}
\renewcommand{\contentsname}{目~~录}
\renewcommand{\listfigurename}{插图清单}
\renewcommand{\listtablename}{表格清单}
\setlength{\cftbeforetoctitleskip}{8pt}
\setlength{\cftaftertoctitleskip}{20pt}
\setlength{\cftbeforechapskip}{10pt plus 2pt minus 2pt}
\setlength{\cftbeforesecskip}{3pt}
\setlength{\cftbeforesubsecskip}{3pt}
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftdotsep}{3}
\renewcommand{\cftchapfont}{\sffamily\heiti}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\renewcommand\cftchapleader{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftsecdotsep}{\cftdotsep}
\renewcommand{\cftfigpresnum}{\figurename~}
\setlength{\cftfigindent}{0pt}
\setlength{\cftfignumwidth}{3.5em}
\renewcommand{\cfttabpresnum}{\tablename~}
\setlength{\cfttabindent}{0pt}
\setlength{\cfttabnumwidth}{3.5em}

%---------- 设置新的生成目录命令 ----------
\newcommand{\maketoc}{%
    \clearpage
    \pagestyle{plain}
    \phantomsection
    \addcontentsline{toc}{chapter}{\contentsname}
    \tableofcontents
    \clearpage
    \if@openright\cleardoublepage\fi
}

%---------- 重定义插图清单 ----------
\newcommand\makelof{%
    \clearpage
    \phantomsection
    \chapter*{\listfigurename}
    \addcontentsline{toc}{chapter}{\listfigurename}
    \chaptermark{\listfigurename}
    \@starttoc{lof}%
    \clearpage
}

%---------- 重定义表格清单 ----------
\newcommand\makelot{%
    \clearpage
    \phantomsection
    \chapter*{\listtablename}
    \addcontentsline{toc}{chapter}{\listtablename}
    \chaptermark{\listtablename}
    \@starttoc{lot}%
    \clearpage
}

%---------- 定义主要符号表环境 ----------
\newenvironment{denotation}{%
    \clearpage
    \phantomsection
    \chapter*{\denotationname}
    \addcontentsline{toc}{chapter}{\denotationname}
    \chaptermark{\denotationname}
}{%
    \clearpage
}

%---------- 重新定义参考文献页 ----------
\RequirePackage[sort&compress]{natbib}
\newcommand\bibstyle@super{\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\newcommand\bibstyle@numbers{\bibpunct{[}{]}{,}{n}{,}{,}}
\newcommand\bibstyle@authoryear{\bibpunct{(}{)}{;}{a}{,}{,}}
%--- 参考文献引用 ---
\renewcommand\NAT@citesuper[3]{%
    \ifNAT@swa\if*#2*\else#2\NAT@spacechar\fi
    \unskip\kern\p@\textsuperscript{\NAT@@open#1%
    \if*#3*\else,\NAT@spacechar#3\fi
    \NAT@@close}\else#1\fi\endgroup
}
%--- 参考文献间距 ---
\def\bibfont{\small}
\setlength{\bibsep}{7pt plus 3pt minus 3pt}
\setlength{\bibhang}{2\ccwd}
\renewcommand\@biblabel[1]{[#1]\hfill}
\urlstyle{same}
\g@addto@macro\UrlBreaks{%
    \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j%
    \do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t%
    \do\u\do\v\do\w\do\x\do\y\do\z%
    \do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J%
    \do\K\do\L\do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T%
    \do\U\do\V\do\W\do\X\do\Y\do\Z%
    \do\1\do\2\do\3\do\4\do\5\do\6\do\7\do\8\do\9\do\0%
}
%--- 设置新的参考文献命令 ---
\renewcommand{\bibname}{参考文献}
\renewcommand\bibsection{%
    \@mainmatterfalse
    \chapter{\bibname}%
    \@mainmattertrue
}

%---------- 定义研究成果环境 ----------
\newenvironment{publications}{%
    \clearpage
    \phantomsection
    \chapter*{\univ@publications}
    \addcontentsline{toc}{chapter}{\univ@publications}
    \chaptermark{\univ@publications}
    \baselineskip=1.2\baselineskip
}{%
    \clearpage
}

%---------- 定义新的致谢环境 ----------
\newenvironment{acknowledgement}{%
    \clearpage
    \phantomsection
    \chapter*{\acknowledgementname}
    \addcontentsline{toc}{chapter}{\acknowledgementname}
    \chaptermark{\acknowledgementname}
    \baselineskip=1.2\baselineskip
}{%
    \clearpage
    \if@openright\cleardoublepage\fi
}

% End of file `univthesis.cls'.
