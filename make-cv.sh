sed '1,28d' cover-letter-body.tex | sed '$d' > content.tex

cat cover-letter-top.tex content.tex cover-letter-bottom.tex > cover-letter.tex

rm content.tex

echo "Copying resume.tex and cover-letter.tex to ./moderncv.."
cp resume.tex cover-letter.tex ./moderncv
echo "Creating resume.pdf and cover-letter.pdf and merging them.."
(cd ./moderncv && pdflatex resume.tex && pdflatex cover-letter.tex)
echo "Merging pdfs and copying to ./cv.pdf"
pdfunite moderncv/cover-letter.pdf moderncv/resume.pdf cv.pdf
echo "Opening cv.pdf"
okular cv.pdf

echo "Done."
