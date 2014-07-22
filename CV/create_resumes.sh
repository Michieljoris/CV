echo "*******************Creating html resume:"
json_resume convert resume.json
echo "*******************Creating html-pdf resume:"
json_resume convert --out=html_pdf resume.json
mv resume.pdf resume_html.pdf
echo "*******************Creating tex-html resume:"
json_resume convert --out=tex_pdf resume.json
mv resume.pdf resume_tex.pdf
echo "*******************Creating markdown resume:"
json_resume convert --out=md resume.json

