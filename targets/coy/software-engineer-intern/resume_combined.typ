#import "/core/templates/yml.typ": yml_resume

#let resume_ai = yaml("/core/templates/resume_ai.yaml")
#let resume_android = yaml("/core/templates/resume_android.yaml")

#yml_resume(resume_ai)
#pagebreak()
#yml_resume(resume_android)
