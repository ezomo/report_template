\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myreport}[2025/02/26 Custom LuaTeX-ja Report Class]

% ベースクラスは ltjreport
\LoadClass[a4paper]{ltjreport}

% 必要なパッケージ
\RequirePackage{luatexja}  % 日本語対応
\RequirePackage[top=1.5cm, bottom=1.5cm, left=1.5cm, right=1.5cm]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}  % セクションフォーマットを調整するパッケージ

% カスタムフォントサイズ定義
\newcommand{\defaultfontsize}{\fontsize{10.5pt}{14pt}\selectfont}

% 文書開始時にフォントサイズを適用
\AtBeginDocument{\defaultfontsize}

% セクション・サブセクションのタイトルに適用するフォントサイズ
\titleformat{\section}[block]{\normalfont\fontsize{10.5pt}{14pt}\selectfont}{\thesection}{1em}{}
\titleformat{\subsection}[block]{\normalfont\fontsize{10.5pt}{14pt}\selectfont}{\thesubsection}{1em}{}
\titleformat{\subsubsection}[block]{\normalfont\fontsize{10.5pt}{14pt}\selectfont}{\thesubsubsection}{1em}{}

% ヘッダーとフッターの設定
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}  % ヘッダーの線を消す