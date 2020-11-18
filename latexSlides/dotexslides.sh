#!/bin/bash
{
count=$(ls -1 crop* 2>/dev/null | wc -l)
if [ "$count" != "0" ]
then
   for cropfile in crop*.png; 
   do
    rm "$(basename "$cropfile")"
   done
fi

for file in *.png; do
    convert "$(basename "$file")" -crop 1910x1060+0+150 "$(basename "crop $file")"
done

filename='begin'
while IFS= read -r line; do
	printf "%s\n" "$line"
done < $filename

find . -type f -name "* *.png" -exec bash -c 'mv "$0" "${0// /_}"' {} \;

for files in crop*; do
	echo '\\begin{frame}{RNA-Seq Data Analysis with Galaxy}'
	echo "\includegraphics[height=5.8cm]{"$files"}"
	echo '\\centering'
	echo '\\end{frame}'
	echo ""
done

filename='end'
while IFS= read -r line; do
        printf "%s\n" "$line"
done < $filename
} > slides.tex
