PandocPublish
=============

Small tool feeding Pandoc with Markdown, and generating HTML, TeX and PDF, and
uploading everything online.

This is a really early version of something bigger. I mean, totally different,
it's currently for playing with Pandoc power for personnal reports.

Requirements
============

I'm using Pandoc with Pandoc-citeproc for processing data. In Ubuntu 12.04 LTS,
the versions in the repositories are too old, so you will need some time to do:

1. `sudo apt-get install haskell-platform`
2. `cabal install pandoc pandoc-citeproc`
3. Drink some tea, it's good for you

In case you upload online, you will need PHP for having the index of the files,
but you could manually create an index.html file aside if you want or don't
want PHP.

Configuration
=============

Currently, there is not much to configure. Just look for `# CONFIGURE HERE` in
the `generate.sh` file. If you do not need upload on a server, you can remove
everything from `echo "<?php` to the end.

Usgae
=====

Just open a terminal to the working directory and run the script 
`./generate.sh SourceFile.md`. That's all.

TODO
====

1. Check script parameters
2. Move all that to a nice web interface
3. Let people change templates and stuff
4. Upload images
