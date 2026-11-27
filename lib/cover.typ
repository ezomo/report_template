#import "font.typ": sans_fonts, serif_fonts


#let cover(
  course: "",
  title: "",
  exp_dates: (),
  submit_date: "",
  submitter_items: (),
  group: "",
  partners: (),
) = {
  set page(
    margin: (top: 3cm, bottom: 3cm, left: 3cm, right: 3cm),
    footer: none,
  )
  set text(font: sans_fonts)
  set underline(offset: 3pt, stroke: 0.7pt + black)
  set align(center)
  // 中央のコンテンツ
  v(6.0em)
  text(course, size: 18pt)
  v(5.0em)
  grid(
    columns: (auto, 1fr),
    column-gutter: 20pt,
    text("題目", size: 20pt),
    box(
      width: 100%,
      stroke: (bottom: 1pt),
      inset: (bottom: 5pt),
      text(title, size: 20pt),
    ),
  )
  v(5.5em)
  set text(font: sans_fonts)

  // 1桁なら透明な "0" を前に足して2桁幅にする
  let num2(s) = if s.len() == 1 {
    text(fill: rgb(0, 0, 0, 0), "0") + s
  } else { s }

  // "2026年4月8日" 形式の月・日を2桁幅に揃える
  let fmt-date(s) = {
    let m = s.match(regex("^(.*?)(\\d+)月\\s*(\\d+)日(.*)$"))
    if m == none {
      s
    } else {
      let c = m.captures
      [#c.at(0)#num2(c.at(1))月#num2(c.at(2))日#c.at(3)]
    }
  }

  // 実施年月日・提出年月日を1つのグリッドにまとめて列を揃える
  let n = exp_dates.len()
  let cells = ()
  for i in range(n) {
    cells += (
      text(if i == 0 { "実施年月日" } else { "" }, size: 14pt),
      underline(text(fmt-date(exp_dates.at(i).at(0)), size: 14pt)),
      text(exp_dates.at(i).at(1), size: 14pt),
    )
  }
  cells += (
    text("提出年月日", size: 14pt),
    underline(text(fmt-date(submit_date), size: 14pt)),
    [],
  )
  // 実施の各行の間は14pt、提出年月日の前だけ28pt
  let gutters = if n > 0 { (14pt,) * (n - 1) + (28pt,) } else { () }

  set align(left)

  // 実施年月日・提出年月日(ラベル左端を他の項目と揃える)
  block(inset: (left: 2em), grid(
    columns: (70pt, auto, auto), // 70pt = 14pt × 5文字
    column-gutter: 14pt,
    row-gutter: gutters,
    align: left + horizon,
    ..cells,
  ))

  // 共同実験者がいる場合のみ表示
  if partners.len() > 0 {
    v(4.0em)
    block(inset: (left: 1em))[
      #box(width: 70pt, text("共同実験者", size: 14pt))
      #h(14pt)
      #if group != "" [
        #underline(text(group, size: 14pt))#text("班", size: 14pt)
      ]
      #v(1.0em)
      #block(inset: (left: 84pt))[
        #for name in partners [
          #box[#underline(text(name, size: 14pt))]
          #h(14pt)
        ]
      ]
    ]
    v(4.0em)
  } else {
    v(10.0em)
  }

  block(inset: (left: 1em))[
    #text("提出者", size: 14pt)
    #v(1.0em)
    #block(inset: (left: 15%))[
      #for (label, value) in submitter_items [
        #box[
          #text(label, size: 14pt)
          #h(14pt)
          #underline(text(value, size: 14pt))
        ]
        #h(14pt)
      ]
    ]
  ]

  pagebreak()
  counter(page).update(1)
}
