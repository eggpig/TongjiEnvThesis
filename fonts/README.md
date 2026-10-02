# 字体

默认 `fontset=auto`：有完整的学校字体文件时自动启用；否则使用 TeX Live 自带的 Fandol 和 TeX Gyre。上传字体后，可在 `main.tex` 中改为：

```latex
\documentclass[fontset=school]{tongji-env-master}
```

学校指定字体对应的文件如下，文件名区分大小写：

| 字体 | 放入本目录的文件 |
| --- | --- |
| 宋体 | `SimSun.ttf` |
| 黑体 | `SimHei.ttf` |
| 仿宋 | `FangSong.ttf` |
| 隶书 | `LiShu.ttf` |
| Times New Roman | `times.ttf`、`timesbd.ttf`、`timesi.ttf`、`timesbi.ttf` |
| Arial | `arial.ttf`、`arialbd.ttf`、`ariali.ttf`、`arialbi.ttf` |

`fontset=school` 会检查全部文件，缺失时停止编译。`fontset=open` 始终使用开源字体。开源模式的封面隶书使用楷体替代；正式提交稿使用学校指定字体。

字体文件由使用者从拥有使用授权的来源提供，本仓库与发行包不包含这些字体。
