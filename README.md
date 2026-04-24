
# LaTeX 学报模板自定义指南

本项目基于《计算机学报》(CjC) 的 XeLaTeX 模板进行二次开发。为了符合GDUPT学报的格式要求，请参考以下目录结构及修改指南进行调整。

## 📂 文件目录结构

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

## 🛠 关键修改参数与函数说明

若需根据学校要求调整格式，请重点关注以下参数：

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

## 🚀 编译建议
1.  **编译器：** 必须使用 **XeLaTeX** 引擎（否则无法调用系统字体）。
2.  **参考文献：** 使用 **BibTeX** 处理 `.bib` 文件。
3.  **编译顺序：** `XeLaTeX` -> `BibTeX` -> `XeLaTeX` -> `XeLaTeX`。