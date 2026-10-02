#!/usr/bin/env python3
"""Fail CI on unresolved references, missing glyphs, and layout overflow."""
from pathlib import Path
import argparse
import re
import sys

TARGETS = ['main', 'blind', 'print', 'spine', 'biber']
BAD_LOG = re.compile(
    r'^!|(?:LaTeX|Package [\w-]+|Class [\w-]+) Warning:|'
    r'Missing character:|Overfull \\[hv]box|Underfull \\[hv]box|'
    r'undefined references|undefined citations', re.MULTILINE)
BAD_BIB = re.compile(r'Warning--|(?:^|\s)WARN\s*-|I couldn.t open|ERROR\s*-')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('build', nargs='?', default='build', type=Path)
    args = parser.parse_args()
    issues = []
    for name in TARGETS:
        log = args.build / f'{name}.log'
        pdf = args.build / f'{name}.pdf'
        if not log.exists() or not pdf.exists():
            issues.append(f'{name}: missing final log or PDF')
            continue
        text = log.read_text(errors='replace')
        if 'Output written on ' not in text:
            issues.append(f'{name}: no successful XeLaTeX output')
        for line in text.splitlines():
            if BAD_LOG.search(line):
                issues.append(f'{name}: {line.strip()}')
        blg = args.build / f'{name}.blg'
        if blg.exists():
            for line in blg.read_text(errors='replace').splitlines():
                if BAD_BIB.search(line):
                    issues.append(f'{name}: {line.strip()}')
    if issues:
        print('\n'.join(issues), file=sys.stderr)
        raise SystemExit(1)
    print('All 5 examples: no build warnings, missing glyphs, unresolved references or overflow.')


if __name__ == '__main__':
    main()
