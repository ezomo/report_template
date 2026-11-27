// apply関数版（importで使用）
#let replace_rule(content) = {
  show "、": text("，")
  show "。": text("．")
  content
}
