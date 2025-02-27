\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myreport}[2025/02/28 Custom LuaTeX-ja Report Class]

% ベースクラスは ltjreport を使用
\LoadClass[a5paper]{ltjreport}

% 必要なパッケージ
\RequirePackage[top=1.5cm, bottom=1.5cm, left=1.5cm, right=1.5cm]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}  % セクションフォーマットを調整するパッケージ
\RequirePackage{luatexja}  % 日本語対応
\RequirePackage{luatexja-fontspec}  % フォント設定
\RequirePackage{fontspec}  % 半角フォント設定

% カスタムフォントサイズ定義
\newcommand{\defaultfontsize}{\fontsize{10.5pt}{15.75pt}\selectfont}

% ヘッダーとフッターの設定
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}  % ヘッダーの線を消す

% 日本語のフォント設定
\newfontface\mainjfont{YuMincho}[Contextuals={WordInitial,WordFinal}]
\newfontface\headingjfont{YuGothic Medium}[Contextuals={WordInitial,WordFinal}]

% 英字のフォント設定
\newfontface\mainfont{Times New Roman}
\newfontface\headingfont{Arial}[BoldFont={Arial Bold}]

% 本文フォントサイズを10.5ptに設定
\renewcommand{\normalsize}{\defaultfontsize}

% 日本語フォント設定（全体）
\AtBeginDocument{
    \setmainjfont{YuMincho}        % 日本語の本文フォントを游明朝に設定
    \setmainfont{Times New Roman}  % 英文の本文フォントをTimes New Romanに設定
    \normalsize  % 本文フォントサイズを適用
}

% 見出しのフォント設定
% chapter（章）の設定
% \titleformat{\chapter}[display]
% {\headingjfont\headingfont\fontsize{14pt}{18pt}\selectfont\bfseries}
% {\chaptertitlename\thechapter}{1em}{}

% section（節）の設定
\titleformat{\section}[block]
{\headingjfont\headingfont\fontsize{12pt}{16pt}\selectfont\bfseries}
{\thesection}{1em}{}

% % subsection（項）の設定
% \titleformat{\subsection}[block]
% {\headingjfont\headingfont\fontsize{11pt}{15pt}\selectfont\bfseries}
% {\thesubsection}{1em}{}

% % subsubsection（小項）の設定
% \titleformat{\subsubsection}[block]
% {\headingjfont\headingfont\fontsize{10.5pt}{15pt}\selectfont\bfseries}
% {\thesubsubsection}{1em}{}

% 見出し前後の余白調整
\titlespacing*{\chapter}{0pt}{50pt}{40pt}
\titlespacing*{\section}{0pt}{20pt}{10pt}
\titlespacing*{\subsection}{0pt}{15pt}{7pt}
\titlespacing*{\subsubsection}{0pt}{10pt}{5pt}

% 日本語と英字の両方に対応する見出しフォント指定
\ltjsetparameter{jacharrange={-1}}  % 日本語文字の処理を有効化

% フォントの組み合わせコマンド（見出し用・本文用）
\newcommand{\headingstyle}{\headingjfont\headingfont}
\newcommand{\customtextstyle}{\mainjfont\mainfont}