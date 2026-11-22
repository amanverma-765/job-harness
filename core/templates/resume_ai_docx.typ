#set page(
  paper: "us-letter",
  margin: (top: 0.35in, bottom: 0.35in, left: 0.45in, right: 0.45in)
)
#import "resume_docx_base.typ": resume_doc
#let resume_data = yaml("resume_ai.yaml")
#resume_doc(resume_data)
