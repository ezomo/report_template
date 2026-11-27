#import "@preview/enja-bib:0.1.0": *
#import "functions.typ": today-ja
#import bib-setting-plain: *
#import "@preview/enja-bib:0.1.0": *
#import bib-setting-plain: *

#let today-ja_wap(biblist, name) = {
  today-ja()
}



#let bibtex-book-ja = (
  ("author", (none, "", author-set3, "", ", ", (), ".")),
  ("title", (none, "「", all-return, "」", ", ", (), ".")),
  ("editor", (none, "", all-return, "", ", ", (), ".")),
  ("page", (none, "p.", all-return, "", ", ", (), ".")),
  ("pages", (none, "pp.", all-return, "", ", ", (), ".")),
  ("publisher", (none, "", all-return, "", ", ", (), ".")),
  ("year", (none, "", all-return, "", ", ", (), ".")),
)

#let bibtex-online-ja = (
  ("author", (none, "", author-set3, "", ", ", (), ".")),
  ("title", (none, "「", all-return, "」", ", ", (), ".")),
  ("publisher", (none, "", all-return, "", ", ", (), ".")),
  ("url", (none, "", all-return, "", ", ", (), ".")),
  ("access", (none, "", today-ja_wap, "", ", ", (), "参照.")),
)


#let references(content) = {
  bibliography-list(
    title: [参考文献],
    ..bib-file(
      content,
      bibtex-book-ja: bibtex-book-ja,
      bibtex-online-ja: bibtex-online-ja,
      bibtex-online-en: bibtex-online-ja,
    ),
  )
}
