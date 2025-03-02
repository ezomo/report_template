\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myreport}[2025/02/28 Custom LuaTeX-ja Report Class]

% ベースクラスは jlreq を使用
\LoadClass[a4paper]{jlreq}

% 必要なパッケージ
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}  % セクションフォーマットを調整するパッケージ
\RequirePackage{luatexja-fontspec}  % フォントの設定
\RequirePackage{enumerate}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{url}

% ページレイアウトの設定
\geometry{top=1.5cm, bottom=1.5cm, left=1.5cm, right=1.5cm}

% フォントの設定 
\newjfontfamily\YuGothic{YuGothic-Medium}[
    BoldFont=YuGothic-Bold % 太字用にYuGothic-Boldを指定
]
\newjfontfamily\YuMincho{YuMincho}
\newfontfamily\TimesNewRoman{Times New Roman}
\newfontfamily\Arial{Arial}

\newcommand{\headlinefont}{\Arial\YuGothic}
\newcommand{\bodyfont}{\TimesNewRoman\YuMincho}
\newcommand{\defaultfontsize}{\fontsize{10.5pt}{14pt}\selectfont}

% % 本文のフォントを設定
\setmainjfont{YuMincho}
\setmainfont{Times New Roman}

% % 文書開始時にフォントサイズを適用し、段落字下げも確実に設定
\AtBeginDocument{
    \defaultfontsize
}

% % セクション・サブセクションのタイトルに適用するフォントサイズ
\titleformat{\section}[block]{\headlinefont\defaultfontsize}{\thesection}{1em}{}
\titleformat{\subsection}[block]{\headlinefont\defaultfontsize}{\thesubsection}{1em}{}
\titleformat{\subsubsection}[block]{\headlinefont\defaultfontsize}{\thesubsubsection}{1em}{}

% % セクション番号のフォーマットを変更 
\renewcommand{\thesection}{\arabic{section}.}
\renewcommand{\thesubsection}{\thesection\arabic{subsection}.}
\renewcommand{\thesubsubsection}{\thesubsection\arabic{subsubsection}.}

% % url パッケージの設定
\urlstyle{same}

% % その他便利マクロ一覧
\newcommand{\addfigure}[2]{  % 2つの引数を定義
    \begin{figure}[H]
        \centering
        \includegraphics[width=\linewidth]{#1}  % 画像を表示
        \caption{\headlinefont #2}  % 画像の下にキャプションを表示
    \end{figure}
}