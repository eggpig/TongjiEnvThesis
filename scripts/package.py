#!/usr/bin/env python3
"""Build a small, deterministic ZIP for Overleaf's source importer."""
from pathlib import Path
from zipfile import ZipFile, ZipInfo, ZIP_DEFLATED
import argparse
import hashlib

ROOT = Path(__file__).resolve().parents[1]
FILES = [
    'main.tex', 'blind.tex', 'print.tex', 'spine.tex', 'biber.tex',
    'metadata.tex', 'tongji-env-master.cls', 'latexmkrc', 'README.md',
    'LICENSE', 'NOTICE.md', 'fonts/README.md', 'signed/README.md',
    'figures/tongji-mark.png',
    'frontmatter/abstract-cn.tex', 'frontmatter/abstract-en.tex',
    'frontmatter/symbols.tex', 'chapters/01-introduction.tex',
    'chapters/02-materials-methods.tex', 'chapters/03-results-discussion.tex',
    'chapters/04-engineering-application.tex', 'chapters/05-conclusions.tex',
    'backmatter/appendix.tex', 'backmatter/acknowledgements.tex',
    'backmatter/resume.tex', 'backmatter/statements.tex',
    'references/references.bib', 'docs/format.md', 'docs/validation.md',
    'docs/assets/banner.svg', 'docs/assets/preview.png', 'Makefile',
    'scripts/package.py', 'scripts/check_build.py',
]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path,
                        default=ROOT / 'dist/TongjiEnvThesis-Overleaf.zip')
    args = parser.parse_args()
    args.output.parent.mkdir(parents=True, exist_ok=True)
    with ZipFile(args.output, 'w', compression=ZIP_DEFLATED) as archive:
        for name in sorted(FILES):
            data = (ROOT / name).read_bytes()
            entry = ZipInfo(name, date_time=(2026, 10, 3, 0, 0, 0))
            entry.compress_type = ZIP_DEFLATED
            entry.external_attr = 0o100644 << 16
            archive.writestr(entry, data)
    with ZipFile(args.output) as archive:
        assert archive.testzip() is None, 'Corrupt ZIP member'
        assert set(archive.namelist()) == set(FILES), 'Unexpected ZIP content'
    digest = hashlib.sha256(args.output.read_bytes()).hexdigest()
    print(f'{args.output.name}: {len(FILES)} files, {args.output.stat().st_size:,} bytes')
    print(f'SHA256 {digest}')


if __name__ == '__main__':
    main()
