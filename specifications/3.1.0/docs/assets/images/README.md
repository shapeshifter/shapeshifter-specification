<!--
SPDX-FileCopyrightText: Contributors to the Shapeshifter project

SPDX-License-Identifier: Apache-2.0
-->

# Images

This folder contains images used in the documentation.

## EMF files

Many images originate from the original USEF specification created in Microsoft Word.
During the migration to Markdown based documentation these images have been exported to EMF (Enhanced Windows Metafile) files.
To convert these images to open standards, they have been opened in LibreOffice Draw and saved as ODG files, as well as being exported to SVG files.
Although SVG files work well for the web-based documentation, some show up with wrong fonts and black elements in the PDF export.
Therefore the SVG files have been exported to rendered PNG files for final use.

### Rendering PNG files

The PNG files have been generated from the SVG files using Inkscape on the Bash commandline:

```
# for IMG in $(ls *.svg); do inkscape ${IMG} -o ${IMG}.png --export-dpi=150; done
```
