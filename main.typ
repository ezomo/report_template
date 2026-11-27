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

= let's start


#references(read("参考文献.bib"))
