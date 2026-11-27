#let today-ja() = {
  let d = datetime.today()
  return str(d.year()) + "年" + str(d.month()) + "月" + str(d.day()) + "日"
}
