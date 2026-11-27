#import "@preview/cjk-unbreak:0.1.0": remove-cjk-break-space
#import "font.typ": *
// ---------- サイズ ----------
#let font_sizes = (h1: 18pt, h2: 16pt, h3: 14pt, h4: 12pt, normal: 10.5pt, math: 12pt)
#let leading_size = 1.0em
#let spacing_size = 1.2em

#let style(body) = {
  // ===== レイアウト =====
  set page(
    paper: "a4",
    columns: 1,
    margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm),
    footer: context [#align(center)[#counter(page).display()]],
  )
  set par(
    first-line-indent: (all: true, amount: 1em),
    leading: leading_size,
    spacing: spacing_size,
    justify: true,
  )

  // ===== 見出し・数式番号 =====
  set heading(numbering: "1.")
  set math.equation(supplement: "式", numbering: numbering.with("(1.1)"))

  // ===== 基本フォント =====
  set text(font: serif_fonts, size: font_sizes.normal)
  show math.equation: set text(font: math_fonts, size: font_sizes.math)
  show raw: set text(font: code_fonts, size: font_sizes.normal)
  show heading: set text(font: sans_fonts, size: font_sizes.normal, weight: "medium")

  // ===== 見出し体裁 =====
  let last-was-heading = state("last-was-heading", false)
  show heading: it => {
    context {
      let gap = if last-was-heading.get() { 0.5em } else { 2em }

      block(
        width: 100%,
        above: gap,
        below: 1em,
      )[
        #h(-1em)
        #if it.numbering != none {
          let num = counter(heading).display(it.numbering)
          [#num#h(1.0em)#it.body]
        } else {
          [#it#h(3.0em)]
        }
      ]
    }

    last-was-heading.update(true)
  }
  show par: it => {
    last-was-heading.update(false)
    it
  }

  // ===== 図・表・参考文献 =====
  show figure.where(kind: image): set figure(supplement: "図")
  show figure.where(kind: table): set figure(supplement: "表")
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: raw): set figure(supplement: "コード")

  show figure.where(kind: image): set text(font: sans_fonts, size: font_sizes.normal)
  show figure.where(kind: table): set text(font: sans_fonts, size: font_sizes.normal)
  show figure.where(kind: "bib"): set text(font: serif_fonts, size: font_sizes.normal)
  show table: set text(font: sans_fonts, size: font_sizes.normal)

  // ===== CJK禁則処理 =====
  show: remove-cjk-break-space // from @preview/cjk-unbreak

  body
}
