// ============================================================
// template.typ — 数学讲义笔记通用模板
// 使用方法：在新笔记文件顶部复制"文档设置"和"环境定义"两节，
//           然后按示例写内容即可。
// ============================================================

// ── 1. 依赖包 ────────────────────────────────────────────────
#import "@preview/ctheorems:1.1.3": *
#show: thmrules.with(qed-symbol: $square$)

// ── 2. 定理类环境（复制这一块到新文件） ─────────────────────
#let theorem     = thmbox("theorem",     "定理", fill: rgb("#eeffee"), base_level: 0)
#let lemma       = thmbox("lemma",       "引理", fill: rgb("#efe6ff"), base_level: 0)
#let definition  = thmbox("definition",  "定义", fill: rgb("#caf6ff"), base_level: 0)
#let corollary   = thmbox("corollary",   "推论", fill: rgb("#fff6b0"), base_level: 0)
#let proposition = thmbox("proposition", "命题", fill: rgb("#f8e8e8"), base_level: 0)
#let example     = thmbox("example",     "例",   stroke: rgb("#63d9f1"), base_level: 0)
#let proof       = thmproof("proof", text("证明", weight: "bold"))

// ── 3. 辅助环境 ──────────────────────────────────────────────
// 注记：左缩进灰色竖线块
#let remark(body) = block(inset: (left: 10pt))[*注：* #body]

// 公式引用补丁：自动在公式引用前加"式"字
#set ref(supplement: it => {
  if it.func() == math.equation { [式] } else { it.supplement }
})

// ── 4. 页面与字体 ────────────────────────────────────────────
#set page(margin: 2.5cm, numbering: "1")
#set text(font: ("Source Han Serif SC", "Zhuque Fangsong (technical preview)"), size: 11pt)
#set par(justify: true, leading: 0.65em)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")

// ── 5. 封面（修改标题、副标题即可） ─────────────────────────
#align(center)[
  #v(0.8cm)
  #text(size: 18pt, weight: "bold")[BSDE 讲义笔记]
  #v(0.3cm)
  #text(size: 13pt)[第 X 章 §X.X　章节标题]
  #v(0.2cm)
  #text(size: 10pt, fill: gray)[胡瑛老师讲义 · 学习笔记]
  #v(0.8cm)
]

// ============================================================
// 以下为使用示例，实际写笔记时删掉这段注释，直接开始写内容
// ============================================================

= 示例：各环境的写法

== 定义、定理、证明

#definition(
  "（示例定义）"
)[
  设 $X$ 是一个集合，若满足……则称 $X$ 为……
]

#theorem(
  "（示例定理）"
)[
  在假设 (L) 下，BSDE
  $ Y_t = xi + integral_t^T f(r, Y_r, Z_r) dif r - integral_t^T Z_r dif W_r $ <bsde-main>
  存在唯一解 $(Y, Z) in S^2 times Lambda^2$。
]
#proof[
  第一步……第二步……
]

#lemma[某个辅助引理的陈述。]
#proof[引理的证明。]

#corollary[由定理立即得到的推论。]

#proposition[介于定理与引理之间的命题。]

#example[一个具体的例子。]

#remark[注意这里……]

== 引用公式

如 @bsde-main 所示，BSDE 的终端条件为 $Y_T = xi$。

== 常用 Typst 数学语法速查

// 【行内公式】$...$，【独立公式】$ ... $（两侧留空格）
//
// 上下标：x^(2n)   a_(i j)
// 分数：  a/b  或  frac(a, b)
// 求和：  sum_(i=1)^n
// 积分：  integral_0^T
// 微分：  dif t（正体 d）
// 希腊字母（无反斜杠）：alpha beta gamma delta xi Omega Sigma
// 花体：  cal(F)  cal(N)  cal(B)
// 黑板粗体：RR ZZ NN QQ CC  或  bb(E) bb(P)
// 期望：  EE  （等同于 bb(E)）
// 绝对值：abs(x)
// 范数：  norm(x)
// 条件期望竖线：mid(|)，如 EE[X mid(|) cal(F)_t]
// 集合：  {x mid(|) x > 0}
// 逻辑或/与：or  and（不是 lor / land）
// 趋近箭头（↗）：arrow.tr
// 笛卡尔积（⊗）：times.o（不是 times.circle，已废弃）
// 多行对齐：
//   $ a + b &= c \
//         d &= e + f $
