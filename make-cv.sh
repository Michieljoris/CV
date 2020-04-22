sed '1,32d' cover-letter-body.tex | sed '$d' > content.tex

source personal-info
mkdir -p tmp
cp personal-data.tex tmp/personal-data.tex
sed -i "s/PHONE/$PHONE/g" tmp/personal-data.tex
sed -i "s/STREET/$STREET/g" tmp/personal-data.tex
sed -i "s/CITY/$CITY/g" tmp/personal-data.tex
sed -i "s/COUNTRY/$COUNTRY/g" tmp/personal-data.tex

cat cover-letter-top1.tex tmp/personal-data.tex cover-letter-top2.tex \
content.tex cover-letter-bottom.tex > cover-letter.tex

cat resume1.tex tmp/personal-data.tex resume2.tex > resume.tex

rm content.tex

echo "Copying resume.tex and cover-letter.tex to ./moderncv.."
mv resume.tex cover-letter.tex ./moderncv
echo "Creating resume.pdf and cover-letter.pdf and merging them.."
(cd ./moderncv && pdflatex resume.tex && pdflatex cover-letter.tex)
echo "Merging pdfs and copying to ./cv.pdf"
pdfunite moderncv/cover-letter.pdf moderncv/resume.pdf cv.pdf
echo "Copying to proper name"
cp cv.pdf michiel_van_oosten_cv.pdf
echo "Opening cv.pdf"
okular cv.pdf

echo "Done."
