#import "lib/cover.typ": cover
#import "lib/convert.typ": replace_rule
#import "lib/functions.typ": *
#import "lib/style.typ": *
#import "@preview/codelst:2.0.2": sourcefile
#import "lib/bibliography.typ": bib-init, references
#show: style
#show: replace_rule
#show: bib-init

#cover(
  course: "授業名",
  title: "レポートタイトル",
  submit_date: today-ja(),
  exp_dates: (
    ("2026年1月1日", "温度27度 湿度70%"),
    ("2026年1月1日", ""),
  ),
  submitter_items: (
    ("通し番号", "00"),
    ("学籍番号", "00000"),
    ("氏名", "氏名"),
  ),

  group: "3",
  partners: ("山田 太郎", "鈴木 花子", "鈴木 花子", "鈴木 花子", "鈴木 花子", "鈴木 花子", "鈴木 花子", "鈴木 花子"),
)

= 基本的な書き方
#text(fill: red)[本文を書く。改行を2個入れると段落が分かれる。] ああああああああああああああああああああああああああああああああああああああああああああああ

2つ目の段落。

== 図・表・ソースコード
図を @fig-sample に示す。
表を @tbl-sample に示す。
プログラムを @code-sample に示す。

#figure(
  caption: "画像の例",
  kind: image,
  image("assets/sea.jpg", width: 50%),
) <fig-sample>

#figure(
  caption: "表の例",
  kind: table,
  image("assets/table.png", width: 50%),
) <tbl-sample>

#figure(
  kind: raw,
  // file には言語の拡張子を指定する(シンタックスハイライトに使われる)
  sourcefile(read("assets/test.c"), file: ".c"),
  caption: "test.c",
) <code-sample>

#pagebreak() // 改ページ

== 数式
文章中に数式を入れる場合は $1/2 n (n+1) = sum_(k=1)^n k$ のように書く。
独立した行に置くこともできる。
$
  1/2 n (n+1) & = sum_(k=1)^n k \
              & = 1/2 n^2 + 1/2 n
$ // & で揃える位置、\ で改行

== 参考文献
この文章は @linux_command_rm を参考にしている。
`@` に続けて、bibファイルの `@online{linux_command_rm,` のキー部分を書くと参照できる。

#figure(
  kind: raw,
  sourcefile(read("参考文献.bib"), file: ".bib"),
  caption: "bibファイルの例",
)

#references(read("参考文献.bib"))
