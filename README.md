# 数学讲义精读助教

一个面向数学讲义精读的 skill。它不像普通 PDF 摘要工具那样只给结论，而是像严谨而耐心的大学数学老师一样，陪你**逐章逐定理**学习，并把“显然”“易知”“注意到”背后的推理一步步补全。

适合分析、代数、拓扑、概率、随机分析等课程的 lecture notes、教材 PDF，以及任何“这份讲义我想认真学懂”的场景。

## 目录

- [Features](#features)
- [Best For](#best-for)
- [Quick Start](#quick-start)
- [How It Works](#how-it-works)
- [Example Interactions](#example-interactions)
- [Output Files](#output-files)
- [Typst Notes](#typst-notes)
- [Requirements](#requirements)
- [Install](#install)
- [Why This Skill](#why-this-skill)

## Features

- **逐章逐定理精读**：按章节推进，一次只讲一个定理和它的证明。
- **补全证明跳步**：把讲义里省略的推理、引用的前提、关键构造都讲清楚。
- **自动建立索引**：生成章节大纲和定理索引，方便快速定位。
- **续学与复习**：维护学习记录，下次可以直接 `继续学`。
- **沉淀正式笔记**：把确认无误的内容整理成 Typst 笔记，适合长期保存。
- **交互式学习**：随时追问某一步为什么成立，而不是一次性看完整章输出。

## Best For

- 想从头学一份数学讲义
- 某一章会看但某个定理或证明卡住了
- 想系统复习一门课的 lecture notes
- 想把学过的内容整理成可继续迭代的正式笔记

如果你只需要抽取 PDF 文本或快速摘要，通常不需要这个 skill。

## Quick Start

不用专门提 skill 名，直接像和老师说话一样使用。

### 从头开始学

```text
帮我学这份讲义：D:\path\to\lecture-notes.pdf
```

### 精讲某个定理

```text
讲讲第 3 章这个收敛定理的证明
```

### 继续上次进度

```text
继续学
```

### 复习已学内容

```text
先带我复习一下上次讲到的内容
```

## How It Works

1. 扫描目录和章节结构，生成 `讲义大纲.md`
2. 扫描全文定理、引理、命题、定义，生成 `定理索引.md`
3. 让你选择从哪一章开始
4. 一次只精讲一个定理
5. 讲完停下，等你确认是否听懂、是否继续
6. 更新 `学习记录.md`
7. 把确认无误的内容写入 `Typst笔记/`

## Example Interactions

- `这一步为什么显然？帮我展开讲`
- `先别继续，解释一下这个条件为什么必要`
- `这个结论和前面的哪个定义有关？`
- `我懂了，继续下一个`
- `把这个定理整理进笔记里`

## Output Files

所有文件都放在讲义 PDF 所在目录下：

| 文件 | 作用 |
|---|---|
| `讲义大纲.md` | 章节结构和已精读章节的详细大纲 |
| `定理索引.md` | 定理/引理/命题/定义的编号、关键词、页码 |
| `学习记录.md` | 当前进度、学习历史、提问记录 |
| `Typst笔记/` | 按章节、按小节整理的 `.typ` 笔记 |

## Typst Notes

当某个定理被讲清楚并得到确认后，skill 会把内容整理成正式的 Typst 笔记，通常包括：

- 定理陈述
- 关键条件及其作用
- 补全跳步后的完整证明
- 证明思路小结

笔记模板位于 `assets/template.typ`。如果你想调整字体、封面、配色、定理框样式，可以直接修改它。

## Requirements

如果你希望笔记自动做渲染检查，请安装 [Typst](https://github.com/typst/typst)，并确保终端中可以运行：

```powershell
typst --version
```

没有 Typst 也能正常使用大纲、索引、精讲、复习和学习记录；只是 `.typ` 笔记的自动编译检查会跳过或失败。

## Install

把 `math-lecture-tutor` 文件夹放进你的 skills 目录即可：

```text
<你的技能目录>\math-lecture-tutor\
```

## Why This Skill

普通 PDF 工具擅长“提取”和“总结”。

这个 skill 擅长的是“陪你学懂”：

- 它不会默认你已经会补中间步骤
- 它会跟着你的节奏停下来
- 它会把学习过程沉淀成可续学、可复习、可保存的笔记
