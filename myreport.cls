\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myreport}[2025/02/26 Custom LuaTeX-ja Report Class]

% ベースクラスは ltjreport
\LoadClass[a4paper]{ltjreport}

% 必要なパッケージ
\RequirePackage{luatexja}  % 日本語対応
\RequirePackage[top=1.5cm, bottom=1.5cm, left=1.5cm, right=1.5cm]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}  % セクションフォーマットを調整するパッケージ
\RequirePackage{luatexja-fontspec}  % フォントの設定

% フォントの設定 
\newjfontfamily\YuGothic{YuGothic-Medium}[
    BoldFont=YuGothic-Bold % 太字用にYuGothic-Boldを指定
]
\newjfontfamily\YuMincho{YuMincho}
\newfontfamily\TimesNewRoman{Times New Roman}
\newfontfamily\Arial{Arial}

\newcommand{\headlinefont}{\Arial\YuGothic}
\newcommand{\bodyfont}{\Arial\YuGothic}
\newcommand{\defaultfontsize}{\fontsize{10.5pt}{14pt}\selectfont}

% 本文のフォントを設定
\setmainjfont{YuMincho}
\setmainfont{Times New Roman}

% 文書開始時にフォントサイズを適用
\AtBeginDocument{\defaultfontsize}

% セクション・サブセクションのタイトルに適用するフォントサイズ
\titleformat{\section}[block]{\headlinefont\defaultfontsize}{\thesection}{1em}{}
\titleformat{\subsection}[block]{\headlinefont\defaultfontsize}{\thesubsection}{1em}{}
\titleformat{\subsubsection}[block]{\headlinefont\defaultfontsize}{\thesubsubsection}{1em}{}

% セクション番号のフォーマットを変更 
\renewcommand{\thesection}{\arabic{section}.}
\renewcommand{\thesubsection}{\thesection\arabic{subsection}.}
\renewcommand{\thesubsubsection}{\thesubsection\arabic{subsubsection}.}

% ヘッダーとフッターの設定
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}  % ヘッダーの線を消す