\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myreport}[2025/02/28 Custom LuaTeX-ja Report Class]

% ベースクラス
\LoadClass[a4paper]{jlreq}

% --- パッケージの読み込み ---
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}    % セクションフォーマット
\RequirePackage{luatexja-fontspec} % フォント
\RequirePackage{enumerate}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{url}
\RequirePackage{etoolbox}

% --- ページスタイルの設定 ---
\geometry{top=1.5cm, bottom=1.5cm, left=1.5cm, right=1.5cm}
\makeatletter
\patchcmd{\@afterheading}{\clubpenalty\@M}{\indent\clubpenalty\@M}{}{}
\makeatother


% --- フォントの設定 ---
\newjfontfamily\YuGothic{YuGothic-Medium}[BoldFont=YuGothic-Bold]
\newjfontfamily\YuMincho{YuMincho}
\newfontfamily\TimesNewRoman{Times New Roman}
\newfontfamily\Arial{Arial}

\newcommand{\headlinefont}{\Arial\YuGothic}
\newcommand{\bodyfont}{\TimesNewRoman\YuMincho}
\newcommand{\defaultfontsize}{\fontsize{10.5pt}{14pt}\selectfont}

\setmainjfont{YuMincho}
\setmainfont{Times New Roman}

% --- 文書開始時のフォント適用 ---
\AtBeginDocument{
    \defaultfontsize
}

% --- セクションフォーマット ---
\titleformat{\section}[block]{\headlinefont\defaultfontsize}{\thesection}{1em}{}
\titleformat{\subsection}[block]{\headlinefont\defaultfontsize}{\thesubsection}{1em}{}
\titleformat{\subsubsection}[block]{\headlinefont\defaultfontsize}{\thesubsubsection}{1em}{}

% --- セクション番号フォーマット ---
\renewcommand{\thesection}{\arabic{section}.}
\renewcommand{\thesubsection}{\thesection\arabic{subsection}.}
\renewcommand{\thesubsubsection}{\thesubsection\arabic{subsubsection}.}

% --- URL のスタイル ---
\urlstyle{same}

% --- 図の挿入マクロ ---
\newcommand{\addfigure}[2]{
    \begin{figure}[H]
        \centering
        \includegraphics[width=\linewidth]{#1}
        \caption{\headlinefont #2}
    \end{figure}
}
