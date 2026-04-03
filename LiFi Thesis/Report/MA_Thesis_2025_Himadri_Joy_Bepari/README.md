# Smart Sensors Thesis Template ([SAMPLE](https://collaborating.tuhh.de/e-exk3/templates/thesis/-/jobs/artifacts/master/raw/thesis.pdf?job=build))
#### Copyright © 2018 by Fin Hendrik Bahnsen, Hamburg University of Technology, 21073 Hamburg, Germany

## Configuration

Set up the document with your personal information in `document.tex`.

There you can also set the document language (for chapter titles, etc.) to
English or German with the following line:

``` latex
\usepackage[english]{babel} % english or ngerman (not a typo!)
```

Write the actual text of the document in the `sec/*.tex` files.

## Building

To build on Linux, you have multiple options.

Install [nix](https://nixos.org/download/) and enable
[flakes](https://nixos.wiki/wiki/Flakes). You can then simply build the report
pdf with `nix build`. The output pdf will appear as a `result` symlink.

** OR **

With nix installed and configured, launch a development shell, which will fetch
all dependencies for you and create an environment where you can build the
slides:

```sh
$ nix develop
nix$ make
```

** OR **

Install the appropriate texlive packages for your distribution, then run `make`.

## Disclaimer

Die Verwendung des Headers ist freibleibend. Die Weitergabe darf nur mit Hinweis auf das Copyright und der zugehörigen Lizenz erfolgen. Es wird keine Haftung für die Richtigkeit und Vollständigkeit der Vorlage übernommen.
