# 构建核验

测试日期：2026-10-03；环境：macOS、TeX Live 2026、XeLaTeX、BibTeX 0.99e、Biber 2.21。

| 入口 | 页数 | 最终日志 |
| --- | ---: | --- |
| `main.tex` | 17 | 无错误、警告、缺字、未定义引用及排版溢出 |
| `blind.tex` | 13 | 同上 |
| `print.tex` | 19 | 同上 |
| `spine.tex` | 1 | 同上 |
| `biber.tex` | 17 | 同上 |

已检查所有示例页的封面、页眉页脚、分页、图表、目录与声明页。隐名版的作者字段为空，身份信息与签名页已隐藏；打印版的两个封面背面为空白。所有输出字体均嵌入 PDF。

学校字体模式另行编译通过。BibTeX 与 Biber 的 103 条文献测试验证了首次引用排序、连续上标压缩、指定页码及一至三位序号的续行缩进；续行距正文左边界为 21 bp，即五号字的两字符宽度。

在空构建目录中，本机正式版完整编译约 **9.0 秒**，Biber 版约 **15.2 秒**；无改动时 `latexmk` 复查约 0.1 秒。实际用时随运行环境、正文长度、图像大小和文献数量变化。

GitHub Actions 使用 TeX Live 2026 编译同一组入口。可在 [Actions](https://github.com/eggpig/TongjiEnvThesis/actions/workflows/build.yml) 查看每次提交的构建记录。
