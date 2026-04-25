# LaTeX GDUPT学报模板指北

[![Licence](https://img.shields.io/github/license/Ileriayo/markdown-badges?style=for-the-badge)](./LICENSE)
![LaTeX](https://img.shields.io/badge/latex-%23008080.svg?style=for-the-badge&logo=latex&logoColor=white)
![Documentation](https://img.shields.io/badge/documentation-yes-brightgreen)

本项目基于《计算机学报》(CjC) 的 XeLaTeX 模板进行二次开发。大致符合GDUPT学报的格式要求  

参考文献遵循GB/T 7741-2015标准

如需更改请参考以下目录结构及修改指南进行调整。


[常见问题](#常见问题) | [📂 文件目录结构](#target-section1) | [🛠 关键修改参数与函数说明](#target-section2)


# 快速开始
## 我是小白，如何使用？

1.  **下载模板**：点击右上角的绿色按钮 "Code" -> "Download ZIP"

2.  **打开模板**：使用支持 LaTeX 的编辑器（如 TeXstudio、Overleaf/推荐）

3.  **编译模板**：选择 XeLaTeX 编译器，点击编译按钮，即可生成符合学报格式的 PDF 文件。  

**以下以Overleaf在线编辑器为例，说明如何快速使用：**
[Overleaf官网](https://www.overleaf.com/)

- 1. Overleaf注册需要邮箱验证，建议使用常用邮箱注册。(国内访问Overleaf稍慢，建议自行 准备加速工具)

- 2. 下载项目.zip文件后，进入Overleaf，点击 "New Project" -> "Upload Project"，选择zip文件上传。

- 3. 编译器选择 "XeLaTeX"，点击 "Recompile" 即可生成PDF预览。

- 4. 参考文献请在 "ref.bib" 文件中添加 BibTeX 格式的文献条目，编译时会自动生成参考文献列表。

> 引用示例：在正文中使用 `\cite{key}` 引用文献，其中 `key` 是你在 `ref.bib` 中定义的文献条目的唯一标识符。 

- 5. 替换 `main_templete.tex` 中的示例内容，编写自己的论文正文。

> 如出现编译错误，请检查是否选择了XeLaTeX编译器，并确保浏览器是否存在插件干扰，如AdBlock等。如无法解决，请清除Cookie后再试。

- 更多使用细节请参考后续章节的二次开发指南，也可以在使用过程中逐步学习LaTeX的相关知识。

[常见问题快速处理](#常见问题)

如仍无法解决，请在项目的 "Issues" 页面提交问题，我们会尽快回复。



<h2 id="target-section1"> 📂 文件目录结构</h2>

```markdown
.
├── main_templete.tex       # [主文件] 论文正文编写处，定义标题、作者、摘要及正文逻辑
├── CjC.cls                 # [核心类文件] 定义全局格式（页边距、预设字号、章节样式、行间距）
├── captionhack.sty         # [标题样式] 专门控制图（Fig.）与表（Table）的字体、字号及间距
├── ref.bib                 # [参考文献] BibTeX 格式的文献数据库
├── gbt7714.sty / .bst      # [引用规范] 遵循 GB/T 7714 国标的参考文献格式控制文件
├── picins.sty              # [排版插件] 支持图文混排的宏包
├── mtpro2.sty              # [字体插件] 数学字体支持宏包
└── ctex.sty                # [中文支持] XeLaTeX 环境下处理中文的基础宏包
```

---


<h2 id="target-section2"> 🛠 关键修改参数与函数说明</h2>

若需根据学校要求调整格式，请重点关注以下参数：

## 字体函数（XeLaTeX/CTEX 支持）
- `\songti`：宋体
- `\heiti`：黑体
- `\fangsong`：仿宋
- `\kaishu`：楷体
- `\fontspec{字体名}`：指定任意字体（如 `\fontspec{Calibri}`）
- `\bfseries`：粗体（与 `\heiti` 类似）
- `\itshape`：斜体

## 中文字号对应值（\zihao{字号}）

> 1 pt＝0.35146mm 约等于0.35mm
> 1mm约等于2.83pt
> 1英寸＝72pt
> 字高1厘米的字符，其磅数值大约为28.3Pt
> 3pt : 4px=1

- 0: 42pt （初号）
- 1: 26pt
- 1-: 24pt
- 2: 22pt
- 2-: 18pt
- 3: 16pt
- 3-: 15pt
- 4: 14pt
- 4-: 12pt
- 5: 10.5pt （五号）
- 5-: 9pt （小五）
- 5--: 10pt
- 6: 7.5pt
- 6-: 6.5pt
- 7: 5.5pt
- 8: 5pt 

使用示例：`{\zihao{5}\songti 文本}` (小五宋体)。

### 1. 修改全局字号 (Global Font Size)
在 **`CjC.cls`** 文件中修改基础类的加载参数：
* **定位：** 第 3 行 `\LoadClass[...]`
* **说明：** `10.5pt` 对应“五号字”。若学校要求“小四”，请改为 `12pt`。
    ```latex
    \LoadClass[a4paper, 12pt, twoside, journal]{article}
    ```

### 2. 修改中西文字体 (Fonts)
建议在 **`main_templete.tex`** 的导言区（`\begin{document}` 之前）直接指定，以覆盖默认设置：
* **函数：** `\setCJKmainfont{...}` (中文) / `\setmainfont{...}` (西文)
* **示例：**
    ```latex
    \setCJKmainfont{SimSun}      % 设置正文为宋体
    \setmainfont{Times New Roman} % 设置西文为 Times New Roman
    ```

### 3. 修改行间距 (Line Spacing)
行间距的调整通常在 **`CjC.cls`** 的导言区或 **`main_templete.tex`** 中全局设置：
* **参数：** `\linespread{<倍率>}`
* **修改：**
    ```latex
    \linespread{1.3} % LaTeX 默认 1.0 约等于单倍行距，1.3 约对应 1.5 倍行距
    ```

### 4. 修改图表标题格式 (Caption Size)
由于该模板使用了 **`captionhack.sty`** 劫持了默认格式，需在该文件中修改：
* **修改位置：** 搜索 `\zihao` 关键字。
* **示例：**
    ```latex
    % 将 -5 (小五号) 修改为你需要的字号
    \renewcommand{\fnum@figure}{{\zihao{-5}\textbf{Fig.~\thefigure}}}
    \renewcommand{\caption}[2][]{\ocaption[#1]{{\zihao{-5}\textbf{#2}}}}
    ```

### 5. 修改页边距 (Margins)
若需修改版心大小，请在 **`CjC.cls`** 中寻找 `\setlength` 相关语句：
* `\setlength{\topmargin}{28pt}` (上边距相关)
* `\setlength{\oddsidemargin}{-7mm}` (奇数页左边距偏移)

---

## 编译建议
1.  **编译器：** 必须使用 **XeLaTeX** 引擎（否则无法调用系统字体）。
2.  **参考文献：** 使用 **BibTeX** 处理 `.bib` 文件。
3.  **编译顺序：** `XeLaTeX` -> `BibTeX` -> `XeLaTeX` -> `XeLaTeX`。


## 常见问题
- **Overleaf预览PDF不显示** 请检查是否选择了XeLaTeX编译器，并确保浏览器是否存在插件干扰，如AdBlock等。如无法解决，请清除Cookie后再试。