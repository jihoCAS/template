#!/bin/bash

echo "======================================================"
echo "Použití:"
echo "\$ book zdrojový_soubor_A5.pdf název_cíle_bez_přípony [r]"
echo "r - parametr pro ruční duplex"
echo "======================================================"
echo " "
pdftops $1 /tmp/book.a.ps
psbook /tmp/book.a.ps | psnup -pA4 -PA5 -s1 -2 >/tmp/book.ps
case $3 in
r) psselect -o /tmp/book.ps>/tmp/book.1.ps;psselect -e /tmp/book.ps>/tmp/book.2.ps;ps2pdf /tmp/book.1.ps $2.1.pdf;ps2pdf /tmp/book.2.ps $2.2.pdf;;
*) ps2pdf -dPDFSETTINGS=/prepress /tmp/book.ps $2.pdf;;
esac
rm /tmp/book.*
