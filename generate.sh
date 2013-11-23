#!/bin/sh
PATH=$PATH:~/.cabal/bin/
rm -f output.*
~/.cabal/bin/pandoc --filter pandoc-citeproc --biblatex --bibliography=biblio.bib --csl=ieee.csl --toc -H style.css -t html5 --smart --mathml --template=template -o output.html *.md
~/.cabal/bin/pandoc --filter pandoc-citeproc --bibliography=biblio.bib --csl=ieee.csl --template=template --toc -o output.tex *.md
pdflatex output.tex > /dev/null
rm -f output.aux output.log output.out output.toc

echo "<?php
echo '<!DOCTYPE html><html><head><meta charset=\'UTF-8\' /></head><body><h2>Source(s)</h2>';
\$e = '';
if (\$handle = opendir('.')) {
    while (false !== (\$entry = readdir(\$handle))) {
        if (strpos(\$entry, '~') === false && (strpos(\$entry, '.md') || strpos(\$entry, '.bib') !== false)) {
            echo '<a href='.\$entry.'>'.\$entry.'</a><br>\n';
        }
    }
    closedir(\$handle);
}
echo '<!DOCTYPE html><html><head><meta charset=\'UTF-8\' /></head><body><h2>Output documents</h2>';
if (\$handle = opendir('.')) {
    while (false !== (\$entry = readdir(\$handle))) {
        if (strpos(\$entry, '~') === false && strpos(\$entry, 'output') !== false) {
            echo '<a href='.\$entry.'>'.\$entry.'</a><br>\n';
        }
    }
    closedir(\$handle);
}
echo '<h2>Markdown source</h2><pre>';?>
" > index.php
cat *.md >> index.php
echo "</pre></body></html>" >> index.php

# CONFIGURE HERE
scp -r $PWD user@server.org:~/path/to/publication/directory/

rm -f index.php
