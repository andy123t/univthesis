# UNIV-Thesis

一个通用的研究生毕业论文 LaTeX 模板

LaTeX Thesis Template for University

本模板为通用的研究生 (硕士/博士) 毕业论文 LaTeX 模板。用户可通过替换封面和声明页的 PDF 文件，以满足不同的格式规范。封面及声明页建议先使用 Word 编辑，再导出为 PDF 插入。若正文排版格式存在差异，可对模板中的类文件进行相应修改。

本模板的文档类为 **univthesis.cls**，示例文件 **example.tex** 给出了使用的指南和要求，也展示了论文排版中常用的例子，包括公式、定理、表格、插图、参考文献等。

**注意：** 本模板推荐安装 **texlive** 发行版，并且需要 **XeLaTeX** 编译运行！

```tex
\documentclass[master]{univthesis}
```

univthesis 文档类可指定的选项包括
- master 硕士学位论文, 默认可省略
- doctor 博士学位论文, 不能省略
- print 用于打印, 封面等生成空白页

本地测试环境：Windows 10 安装 texlive 发行版。

在线 LaTeX 编辑可以使用 [TeXPage](https://www.texpage.com/)，设置字体 (`fontset=windows`)，使用 XeLaTeX 编译，推荐使用。

如果在线使用 [Overleaf](https://www.overleaf.com/)，设置字体 (`fontset=ubuntu`) 后可运行，不推荐使用。

如有不足之处，欢迎提出意见或建议。
