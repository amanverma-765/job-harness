#import "../../../core/templates/yml.typ": yml_resume

#let resume_data = yaml("resume.yaml")
#yml_resume(
  resume_data,
  line_gap: 0.74em,
  section_gap: 0.90em,
  header_gap: 1.20em
)
