PandocPublish
=============

Small tool feeding Pandoc with Markdown, and generating HTML, TeX and PDF, and
uploading everything online.

Requirements
============

I'm using Pandoc with Pandoc-citeproc for processing data. In Ubuntu 12.04 LTS,
the versions in the repositories are too old, so you will need some time to do:

1. `sudo apt-get install haskell-platform`
2. `cabal install pandoc pandoc-citeproc`
3. Drink some tea, it's good for you

Configuration
=============

Currently, there is not much to configure. Just look for `# CONFIGURE HERE` in
the `generate.sh` file. If you do not need upload on a server, you can remove
everything from `echo "<?php` to the end.

Usgae
=====

Just open a terminal to the working directory and run the script `./generate.sh`.
That's all.